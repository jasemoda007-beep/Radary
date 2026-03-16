//
//  Dolphins.m
//  Dolphins
//
//  Created by XBK on 2022/4/24.
//

#import <Foundation/Foundation.h>

// تم تعطيل هذه الملفات لأنها تسبب خطأ في البناء بجيت هاب (غير مرفوعة)
// #import "FloatView.h"
// #import "OverlayView.h"

#include "dolphins.h"
#import <mach-o/dyld.h>
#import <mach/mach.h>
#include <stdio.h>
#include <vector>
#include <iostream>
#include "module_tools.h"
#include "pubg_offset.h"
#include "memory_tools.h"

//#include "dobby.h"
#include "log.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
using namespace std;

//模块功能控制器
ModuleControl moduleControl;
//内存读写
MemoryTools memoryTools;

//掩体判断函数原型
bool (*LineOfSightTo)(void *controller, void *actor, ImVec3 bone_point, bool ischeck);

//移动X轴
void (*AddControllerYawInput)(void *actot, float val);

//移动Y轴
void (*AddControllerRollInput)(void *actot, float val);

//旋转
void (*AddControllerPitchInput)(void *actot, float val);

static long gWorldaddr;
static long gWorldData;

static long gNameaddr;
static long gNameData;

static long gWorld(){
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    if ([BundID containsString:@"ig"]) {
        gWorldaddr = 0x102A62208;
        gWorldData = 0x10A566E00;
    } if ([BundID containsString:@"kr"]) {
        gWorldaddr = 0x102b4f0b4;
        gWorldData = 0x1094f0ff8;
    }if ([BundID containsString:@"rekoo"]) {
        gWorldaddr = 0x102B6BCB4;
        gWorldData = 0x1095266F8;
    }if ([BundID containsString:@"vn"]) {
        gWorldaddr = 0x1029364F4;
        gWorldData = 0x109240C78;
    }if ([BundID containsString:@"imobile"]) {
        gWorldaddr = 0x102050A28;
        gWorldData = 0x108409728;
    }
    return reinterpret_cast<long(__fastcall*)(long)>((long)_dyld_get_image_vmaddr_slide(0) + gWorldaddr)((long)_dyld_get_image_vmaddr_slide(0) + gWorldData);
}

static long gName(){
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    if ([BundID containsString:@"ig"]) {
        gNameaddr = 0x104bd8740;
        gNameData = 0x10A0557E0;
    } if ([BundID containsString:@"kr"]) {
        gNameaddr = 0x1045ecd20;
        gNameData = 0x10913c3d0;
    }if ([BundID containsString:@"rekoo"]) {
        gNameaddr = 0x104609920;
        gNameData = 0x109171AD0;
    }if ([BundID containsString:@"vn"]) {
        gNameaddr = 0x1043D4160;
        gNameData = 0x108E8C350;
    }if ([BundID containsString:@"imobile"]) {
        gNameaddr = 0x1039D9AF8;
        gNameData = 0x10804C670;
    }
    return  reinterpret_cast<long(__fastcall*)(long)>((long)_dyld_get_image_vmaddr_slide(0) + gNameaddr)((long)_dyld_get_image_vmaddr_slide(0) + gNameData);
}

typedef long kaddr;
bool IsValidAddress(kaddr addr) {
    return addr > 0x100000000 && addr < 0x2000000000;
}

bool _write(kaddr addr, void *buffer, int len) {
    if (!IsValidAddress(addr)) return false;
    kern_return_t error = vm_write(mach_task_self(), (vm_address_t)addr, (vm_offset_t)buffer, (mach_msg_type_number_t)len);
    if(error != KERN_SUCCESS) return false;
    return true;
}

template<typename T> void Write(kaddr address, T data) {
    _write(address, reinterpret_cast<void *>(&data), sizeof(T));
}

struct {
    uintptr_t libAddr = 0;
    uintptr_t gwlordAddr;
    uintptr_t gnameAddr;
    uintptr_t playerController;
    string playerControllerClassName;
    uintptr_t cameraManager;
    string cameraManagerClassName;
    uintptr_t selfAddr;
    vector<StaticPlayerData> playerDataList;
    vector<StaticMaterialData> materialDataList;
    vector<StaticMaterialData> smokeList;
} staticData;

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // تم تعطيل استدعاء الواجهات القديمة لمنع الخطأ في GitHub
        /*
        mao* drawWindow = [[mao alloc] initWithFrame:&moduleControl];
        mi* menuWindow = [[mi alloc] initWithFrame:&moduleControl];
        OverlayView* overlayView = [[OverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds:&moduleControl:drawWindow:menuWindow];
        [[UIApplication sharedApplication].keyWindow addSubview:overlayView];
        FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(489, 58, 45, 45):&moduleControl];
        [[UIApplication sharedApplication].keyWindow addSubview:floatView];
        */
    });
}

__attribute__((constructor)) static void initialize() {
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
    
    pthread_t staticDataThread;
    pthread_create(&staticDataThread, nullptr, readStaticData, nullptr);
    
    pthread_t silenceAimbotThread;
    pthread_create(&silenceAimbotThread, nullptr, silenceAimbot, nullptr);
    
    pthread_t skeletonThread;
    pthread_create(&skeletonThread, nullptr, readSkeleton, nullptr);
}

void *readStaticData(void *) {
    while (true) {
        sleep(1);
        if(moduleControl.systemStatus != TransmissionNormal){
            staticData.libAddr = (uintptr_t)_dyld_get_image_vmaddr_slide(0);
            if(staticData.libAddr != 0){
                moduleControl.systemStatus = TransmissionNormal;
            }
        }else if (moduleControl.systemStatus == TransmissionNormal) {
            staticData.gwlordAddr = gWorld();
            staticData.gnameAddr = gName();
            staticData.playerController = memoryTools.readPtr(memoryTools.readPtr(memoryTools.readPtr(staticData.gwlordAddr + PubgOffset::PlayerControllerOffset[0]) + PubgOffset::PlayerControllerOffset[1]) + PubgOffset::PlayerControllerOffset[2]);
            LineOfSightTo = (bool (*)(void *, void *, ImVec3, bool)) (memoryTools.readPtr(memoryTools.readPtr(staticData.playerController + 0x0) + PubgOffset::PlayerControllerParam::ControllerFunction::LineOfSightToOffset));
            staticData.selfAddr = memoryTools.readPtr(staticData.playerController + PubgOffset::PlayerControllerParam::SelfOffset);
            uintptr_t selfFunction = memoryTools.readPtr(staticData.selfAddr + 0);
            AddControllerYawInput = (void (*)(void *, float)) (memoryTools.readPtr(selfFunction + PubgOffset::ObjectParam::PlayerFunction::AddControllerYawInputOffset));
            AddControllerRollInput = (void (*)(void *, float)) (memoryTools.readPtr(selfFunction + PubgOffset::ObjectParam::PlayerFunction::AddControllerRollInputOffset));
            AddControllerPitchInput = (void (*)(void *, float)) (memoryTools.readPtr(selfFunction + PubgOffset::ObjectParam::PlayerFunction::AddControllerPitchInputOffset));
            staticData.cameraManager = memoryTools.readPtr(staticData.playerController + PubgOffset::PlayerControllerParam::CameraManagerOffset);
            
            vector<StaticPlayerData> tmpPlayerDataList;
            vector<StaticMaterialData> tmpMaterialDataList;
            vector<StaticMaterialData> tmpSmokeList;
            uintptr_t uLevel = memoryTools.readPtr(staticData.gwlordAddr + PubgOffset::ULevelOffset);
            uintptr_t obectArray = memoryTools.readPtr(uLevel + PubgOffset::ULevelParam::ObjectArrayOffset);
            int objectCount = memoryTools.readInt(uLevel + PubgOffset::ULevelParam::ObjectCountOffset);
            for (int index = 0; index < objectCount; ++index) {
                uintptr_t objectAddr = memoryTools.readPtr(obectArray + index * 8);
                if (objectAddr <= 0x100000000 || objectAddr >= 0x2000000000 || objectAddr % 8 != 0) continue;
                uintptr_t coordAddr = memoryTools.readPtr(objectAddr + PubgOffset::ObjectParam::CoordOffset);
                string className = getClassName(memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::ClassIdOffset));
                if (strstr(className.c_str(), "PlayerPawn") || (strstr(className.c_str(), "PlayerCharacter") || (strstr(className.c_str(), "PlayerControllertSl") || (strstr(className.c_str(), "_PlayerPawn_TPlanAI_C")|| (strstr(className.c_str(), "$&**$@$&*@@$*")|| (strstr(className.c_str(), "FakePlayer_AIPawn")!= 0 && moduleControl.mainSwitch.playerStatus)) )))) {
                    int team = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::TeamOffset);
                    int TeamID = memoryTools.readInt(staticData.selfAddr + PubgOffset::ObjectParam::TeamOffset);
                    if (team == TeamID) continue;
                    StaticPlayerData tmpPlayerData;
                    tmpPlayerData.addr = objectAddr;
                    tmpPlayerData.coordAddr = coordAddr;
                    tmpPlayerData.team = team;
                    int bdead = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::isDead);
                    if (bdead) continue;
                    tmpPlayerData.name = getPlayerName(memoryTools.readPtr(objectAddr + PubgOffset::ObjectParam::NameOffset));
                    tmpPlayerData.robot = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::RobotOffset);
                    tmpPlayerData.status = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::StatusOffset);
                    tmpPlayerDataList.push_back(tmpPlayerData);
                } else if (strstr(className.c_str(), "BP_Grenade_Smoke_C)") != 0) {
                    StaticMaterialData tmpMaterialData;
                    tmpMaterialData.type = Warning;
                    tmpMaterialData.id = 4;
                    tmpMaterialData.name = "[预警]烟雾弹";
                    tmpMaterialData.addr = objectAddr;
                    tmpMaterialData.coordAddr = coordAddr;
                    tmpSmokeList.push_back(tmpMaterialData);
                } else if (moduleControl.mainSwitch.materialStatus) {
                    MaterialStruct material = isMaterial(className.c_str());
                    if (material.type > -1) {
                        StaticMaterialData tmpMaterialData;
                        tmpMaterialData.type = material.type;
                        tmpMaterialData.id = material.id;
                        tmpMaterialData.name = material.name;
                        tmpMaterialData.addr = objectAddr;
                        tmpMaterialData.coordAddr = coordAddr;
                        if ((material.type == Rifle || material.type == Sniper || material.type == Missile) && memoryTools.readPtr(objectAddr + PubgOffset::ObjectParam::WeaponParam::MasterOffset) != 0) continue;
                        tmpMaterialDataList.push_back(tmpMaterialData);
                    }
                }
            }
            staticData.playerDataList.swap(tmpPlayerDataList);
            staticData.materialDataList.swap(tmpMaterialDataList);
            staticData.smokeList.swap(tmpSmokeList);
        }
    }
    return nullptr;
}

void readFrameData(ImVec2 screenSize,vector<PlayerData> &playerDataList, vector<MaterialData> &materialDataList) {
    playerDataList.clear();
    materialDataList.clear();
    if (moduleControl.systemStatus == TransmissionNormal) {
        staticData.cameraManagerClassName = getClassName(memoryTools.readInt(staticData.cameraManager + PubgOffset::ObjectParam::ClassIdOffset));
        staticData.playerControllerClassName = getClassName(memoryTools.readInt(staticData.playerController + PubgOffset::ObjectParam::ClassIdOffset));
        MinimalViewInfo pov;
        memoryTools.readMemory(staticData.cameraManager + PubgOffset::PlayerControllerParam::CameraManagerParam::PovOffset, sizeof(pov), &pov);
        ImVec3 selfCoord = pov.location;
        float lateralAngleView = memoryTools.readFloat(staticData.playerController + PubgOffset::PlayerControllerParam::MouseOffset + 0x4) - 90;
        if (moduleControl.mainSwitch.playerStatus) {
            for (auto staticPlayerData: staticData.playerDataList) {
                ImVec3 objectCoord;
                memoryTools.readMemory(staticPlayerData.coordAddr + PubgOffset::ObjectParam::CoordParam::CoordOffset, sizeof(ImVec3), &objectCoord);
                float objectDistance = get3dDistance(objectCoord, selfCoord, 100);
                if (objectDistance < 0 || objectDistance > 450) continue;
                float objectHeight = memoryTools.readFloat(staticPlayerData.coordAddr + PubgOffset::ObjectParam::CoordParam::HeightOffset);
                if (objectHeight < 20) continue;
                PlayerData playerData;
                playerData.angle = lateralAngleView - rotateAngle(selfCoord, objectCoord) - 180;
                playerData.radar = rotateCoord(lateralAngleView, ImVec2((selfCoord.x - objectCoord.x) / 200, (selfCoord.y - objectCoord.y) / 200));
                playerData.distance = objectDistance;
                playerData.robot = staticPlayerData.robot;
                uintptr_t meshAddr = memoryTools.readPtr(staticPlayerData.addr + PubgOffset::ObjectParam::MeshOffset);
                uintptr_t humanAddr = meshAddr + PubgOffset::ObjectParam::MeshParam::HumanOffset;
                uintptr_t boneAddr = memoryTools.readPtr(meshAddr + PubgOffset::ObjectParam::MeshParam::BonesOffset) + 48;
                Visdata visdata;
                auto headv = getBone(humanAddr, boneAddr, 5);
                visdata.isheadv = isCoordVisibility(headv);
                playerData.visibility = isCoordVisibility(objectCoord);
                if (playerData.visibility && isOnSmoke(objectCoord)) playerData.visibility = false;
                if (objectHeight < 50) objectHeight -= 18; else if (objectHeight > 80) objectHeight += 12;
                playerData.team = staticPlayerData.team;
                playerData.hp = memoryTools.readFloat(staticPlayerData.addr + PubgOffset::ObjectParam::HpOffset);
                uintptr_t statusAddr = memoryTools.readPtr(staticPlayerData.addr + PubgOffset::ObjectParam::StatusOffset);
                if (statusAddr == 16) playerData.statusName = "站立";
                uintptr_t weaponAddr = memoryTools.readPtr(staticPlayerData.addr + PubgOffset::ObjectParam::WeaponOneOffset);
                if (weaponAddr == 0) playerData.weaponName = "拳头"; else {
                    string className = getClassName(memoryTools.readInt(weaponAddr + PubgOffset::ObjectParam::ClassIdOffset));
                    MaterialStruct weaponName = isWeapon(className.c_str());
                    playerData.weaponName = weaponName.id != 0 ? weaponName.name : "[步枪]M762";
                }
                playerData.name = staticPlayerData.name;
                playerData.screen = worldToScreen(objectCoord, pov, screenSize);
                ImVec2 width = worldToScreen(ImVec3(objectCoord.x,objectCoord.y,objectCoord.z + 100), pov,screenSize);
                ImVec2 height = worldToScreen(ImVec3(objectCoord.x,objectCoord.y,objectCoord.z + objectHeight), pov,screenSize);
                playerData.size.x = (playerData.screen.y - width.y) / 2;
                playerData.size.y = playerData.screen.y - height.y;
                playerDataList.push_back(playerData);
            }
        }
    }
}

void *silenceAimbot(void *) {
    ImVec2 screenSize = ImVec2([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    while (true) {
        usleep(16666);
        if (moduleControl.systemStatus == TransmissionNormal && moduleControl.mainSwitch.aimbotStatus) {
            uintptr_t weaponAddr = memoryTools.readPtr(staticData.selfAddr + PubgOffset::ObjectParam::WeaponOneOffset);
            bool enabledAimbot = memoryTools.readInt(staticData.selfAddr + PubgOffset::ObjectParam::OpenTheSightOffset) == 257 || memoryTools.readInt(staticData.selfAddr + PubgOffset::ObjectParam::OpenFireOffset) == 1;
            if (enabledAimbot) {
                MinimalViewInfo pov;
                memoryTools.readMemory(staticData.cameraManager + PubgOffset::PlayerControllerParam::CameraManagerParam::PovOffset, sizeof(pov), &pov);
                ImVec3 selfCoord = pov.location;
                float aimbotRadius = moduleControl.aimbotController.aimbotRadius;
                StaticPlayerData aimbotPlayerData; aimbotPlayerData.addr = 0;
                ImVec3 aimbotCoord = ImVec3(0,0,0);
                for (auto staticPlayerData: staticData.playerDataList) {
                    ImVec3 objectCoord;
                    memoryTools.readMemory(staticPlayerData.coordAddr + PubgOffset::ObjectParam::CoordParam::CoordOffset, sizeof(ImVec3), &objectCoord);
                    float objectDistance = get3dDistance(objectCoord, selfCoord, 100);
                    if (objectDistance < 0 || objectDistance > 450) continue;
                    ImVec2 playerScreen = worldToScreen(objectCoord, pov, screenSize);
                    float screenDistance;
                    if ((screenDistance = get2dDistance(screenSize,playerScreen)) < aimbotRadius) {
                        uintptr_t meshAddr = memoryTools.readPtr(staticPlayerData.addr + PubgOffset::ObjectParam::MeshOffset);
                        uintptr_t humanAddr = meshAddr + PubgOffset::ObjectParam::MeshParam::HumanOffset;
                        uintptr_t boneAddr = memoryTools.readPtr(meshAddr + PubgOffset::ObjectParam::MeshParam::BonesOffset) + 48;
                        aimbotCoord = getBone(humanAddr, boneAddr, 5);
                        if (isCoordVisibility(aimbotCoord)) {
                            aimbotPlayerData = staticPlayerData;
                            aimbotRadius = screenDistance;
                        }
                    }
                }
                if (aimbotPlayerData.addr != 0 && aimbotCoord.x != 0) {
                    uintptr_t weaponAttrAddr = memoryTools.readPtr(weaponAddr + PubgOffset::ObjectParam::WeaponParam::WeaponAttrOffset);
                    float bulletSpeed = memoryTools.readFloat(weaponAttrAddr + PubgOffset::ObjectParam::WeaponParam::WeaponAttrParam::BulletSpeedOffset);
                    float bulletFlyTime = get3dDistance(selfCoord, aimbotCoord, bulletSpeed) * 1.2;
                    ImVec3 moveCoord;
                    memoryTools.readMemory(aimbotPlayerData.addr + PubgOffset::ObjectParam::MoveCoordOffset, 12, &moveCoord);
                    aimbotCoord.x += moveCoord.x * bulletFlyTime;
                    aimbotCoord.y += moveCoord.y * bulletFlyTime;
                    aimbotCoord.z += moveCoord.z * bulletFlyTime;
                    ImVec2 aimbotMouse = rotateAngleView(selfCoord, aimbotCoord);
                    ImVec2 aimbotMouseMove;
                    aimbotMouseMove.x = change(getAngleDifference(aimbotMouse.x, memoryTools.readFloat(staticData.playerController + PubgOffset::PlayerControllerParam::MouseOffset + 0x4)) * moduleControl.aimbotController.aimbotIntensity);
                    aimbotMouseMove.y = change(getAngleDifference(aimbotMouse.y, memoryTools.readFloat(staticData.playerController + PubgOffset::PlayerControllerParam::MouseOffset)) * moduleControl.aimbotController.aimbotIntensity);
                    if (AddControllerYawInput != NULL) AddControllerYawInput(reinterpret_cast<void *>(staticData.selfAddr), aimbotMouseMove.x);
                    if (AddControllerRollInput != NULL) AddControllerRollInput(reinterpret_cast<void *>(staticData.selfAddr), aimbotMouseMove.y);
                }
            }
        }
    }
}

bool isCoordVisibility(ImVec3 coord) {
    if (LineOfSightTo == nullptr || !isfinite(coord.x)) return false;
    return LineOfSightTo(reinterpret_cast<void *>(staticData.playerController), reinterpret_cast<void *>(staticData.cameraManager), coord, false);
}

void *readSkeleton(void *) { return nullptr; }

bool isOnSmoke(ImVec3 coord) {
    for (StaticMaterialData smoke: staticData.smokeList) {
        ImVec3 smokeCoord;
        memoryTools.readMemory(smoke.coordAddr + PubgOffset::ObjectParam::CoordPar
