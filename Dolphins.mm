//
//  Dolphins.m
//  Dolphins
//
//  Created by XBK on 2022/4/24.
//




#import <Foundation/Foundation.h>

#import "FloatView.h"

#import "OverlayView.h"

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

//OffsetSet currentOffsetSet = GL;



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
    //    long gWorldaddr;
    //    long gWorldData;
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
    //    long gNameaddr;
    //    long gNameData;
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

bool _write(kaddr addr, void *buffer, int len)
{
if (!IsValidAddress(addr)) return false;
kern_return_t error = vm_write(mach_task_self(), (vm_address_t)addr, (vm_offset_t)buffer, (mach_msg_type_number_t)len);
if(error != KERN_SUCCESS)
{
return false;
}
return true;
}

template<typename T> void Write(kaddr address, T data) {
_write(address, reinterpret_cast<void *>(&data), sizeof(T));
}

struct {
    //ue4入口
    uintptr_t libAddr = 0;
    //矩阵地址
    uintptr_t gwlordAddr;
    //Name地址
    uintptr_t gnameAddr;
    //玩家控制器
    uintptr_t playerController;
    //玩家控制器类名
    string playerControllerClassName;
    //相机管理器
    uintptr_t cameraManager;
    //相机管理器类名
    string cameraManagerClassName;
    //自己指针
    uintptr_t selfAddr;
    //静态数据列表
    vector<StaticPlayerData> playerDataList;
    vector<StaticMaterialData> materialDataList;
    //可视烟雾弹列表
    vector<StaticMaterialData> smokeList;
} staticData;

//UI入口函数
static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //Esp绘制
    mao* drawWindow = [[mao alloc] initWithFrame:&moduleControl];
    //菜单
    mi* menuWindow = [[mi alloc] initWithFrame:&moduleControl];
    //覆盖图层
    OverlayView* overlayView = [[OverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds:&moduleControl:drawWindow:menuWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:overlayView];
    //小按钮
    FloatView* floatView = [[FloatView alloc] initWithFrame:CGRectMake(489, 58, 45, 45):&moduleControl];
    [[UIApplication sharedApplication].keyWindow addSubview:floatView];

         });

     }


                   

//库入口函数
__attribute__((constructor)) static void initialize() {
    //加载视图
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
    //加载hook
    //loadHook();
    //静态数据线程
    pthread_t staticDataThread;
    pthread_create(&staticDataThread, nullptr, readStaticData, nullptr);
    //自瞄线程
    pthread_t silenceAimbotThread;
    pthread_create(&silenceAimbotThread, nullptr, silenceAimbot, nullptr);
    pthread_t skeletonThread;
    pthread_create(&skeletonThread, nullptr, readSkeleton, nullptr);
}


// 固定数据函数
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
            //角色控制器
            staticData.playerController = memoryTools.readPtr(memoryTools.readPtr(memoryTools.readPtr(staticData.gwlordAddr + PubgOffset::PlayerControllerOffset[0]) + PubgOffset::PlayerControllerOffset[1]) + PubgOffset::PlayerControllerOffset[2]);
            //掩体判断
            LineOfSightTo = (bool (*)(void *, void *, ImVec3, bool)) (memoryTools.readPtr(memoryTools.readPtr(staticData.playerController + 0x0) + PubgOffset::PlayerControllerParam::ControllerFunction::LineOfSightToOffset));//0x780
            //自己指针
            staticData.selfAddr = memoryTools.readPtr(staticData.playerController + PubgOffset::PlayerControllerParam::SelfOffset);
            //自瞄函数
            uintptr_t selfFunction = memoryTools.readPtr(staticData.selfAddr + 0);
            AddControllerYawInput = (void (*)(void *, float)) (memoryTools.readPtr(selfFunction + PubgOffset::ObjectParam::PlayerFunction::AddControllerYawInputOffset));//0x780
            AddControllerRollInput = (void (*)(void *, float)) (memoryTools.readPtr(selfFunction + PubgOffset::ObjectParam::PlayerFunction::AddControllerRollInputOffset));//0x780
            AddControllerPitchInput = (void (*)(void *, float)) (memoryTools.readPtr(selfFunction + PubgOffset::ObjectParam::PlayerFunction::AddControllerPitchInputOffset));//0x780
            //相机管理器
            staticData.cameraManager = memoryTools.readPtr(staticData.playerController + PubgOffset::PlayerControllerParam::CameraManagerOffset);
            
            //清空列表
            vector<StaticPlayerData> tmpPlayerDataList;
            vector<StaticMaterialData> tmpMaterialDataList;
            vector<StaticMaterialData> tmpSmokeList;
            //遍历地址
            uintptr_t uLevel = memoryTools.readPtr(staticData.gwlordAddr + PubgOffset::ULevelOffset);
            //数组
            uintptr_t obectArray = memoryTools.readPtr(uLevel + PubgOffset::ULevelParam::ObjectArrayOffset);
            //成员数量
            int objectCount = memoryTools.readInt(uLevel + PubgOffset::ULevelParam::ObjectCountOffset);
            //开始寻找
            for (int index = 0; index < objectCount; ++index) {
                //对象指针
                uintptr_t objectAddr = memoryTools.readPtr(obectArray + index * 8);
                if (objectAddr <= 0x100000000 || objectAddr >= 0x2000000000 || objectAddr % 8 != 0) {
                    continue;
                }
                
                //对象坐标指针
                uintptr_t coordAddr = memoryTools.readPtr(objectAddr + PubgOffset::ObjectParam::CoordOffset);
                
                string className = getClassName(memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::ClassIdOffset));
                //人
                if (strstr(className.c_str(), "PlayerPawn") || (strstr(className.c_str(), "PlayerCharacter") || (strstr(className.c_str(), "PlayerControllertSl") || (strstr(className.c_str(), "_PlayerPawn_TPlanAI_C")|| (strstr(className.c_str(), "$&**$@$&*@@$*")|| (strstr(className.c_str(), "FakePlayer_AIPawn")!= 0 && moduleControl.mainSwitch.playerStatus)) )))) {
                    //队伍ID
                    int team = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::TeamOffset);
                    int TeamID = memoryTools.readInt(staticData.selfAddr + PubgOffset::ObjectParam::TeamOffset);
                    if (team == TeamID) continue;
                    StaticPlayerData tmpPlayerData;
                    //对象指针地址
                    tmpPlayerData.addr = objectAddr;
                    //坐标地址
                    tmpPlayerData.coordAddr = coordAddr;
                    //队伍ID
                    tmpPlayerData.team = team;
                    
                    
                                        
                    int bdead = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::isDead);
                if (bdead)
                continue;
                    //名字
                    tmpPlayerData.name = getPlayerName(memoryTools.readPtr(objectAddr + PubgOffset::ObjectParam::NameOffset));
                    //人机
                    tmpPlayerData.robot = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::RobotOffset);
                    
                    tmpPlayerData.status = memoryTools.readInt(objectAddr + PubgOffset::ObjectParam::StatusOffset);
                    
                    tmpPlayerDataList.push_back(tmpPlayerData);
                    
                } else if (strstr(className.c_str(), "BP_Grenade_Smoke_C)") != 0) {
                    StaticMaterialData tmpMaterialData;
                    //物资类型
                    tmpMaterialData.type = Warning;
                    //物资ID
                    tmpMaterialData.id = 4;
                    //物资名称
                    tmpMaterialData.name = "[预警]烟雾弹";
                    //对象指针地址
                    tmpMaterialData.addr = objectAddr;
                    //坐标地址
                    tmpMaterialData.coordAddr = coordAddr;
                    
                    tmpSmokeList.push_back(tmpMaterialData);
                } else if (moduleControl.mainSwitch.materialStatus) {
                    MaterialStruct material = isMaterial(className.c_str());
                    if (material.type > -1) {
                        /*if (strstr(material.name, "[狙击枪]M24") != 0) {
                         LOGE("%s 物品Id：%d", material.name, memoryTools.readInt(objectAddr + 0x7D0));
                         }*/
                        StaticMaterialData tmpMaterialData;
                        //物资类型
                        tmpMaterialData.type = material.type;
                        //物资ID
                        tmpMaterialData.id = material.id;
                        //物资名称
                        tmpMaterialData.name = material.name;
                        //对象指针地址
                        tmpMaterialData.addr = objectAddr;
                        //坐标地址
                        tmpMaterialData.coordAddr = coordAddr;
                        
                        if ((material.type == Rifle || material.type == Sniper || material.type == Missile) && memoryTools.readPtr(objectAddr + PubgOffset::ObjectParam::WeaponParam::MasterOffset) != 0) {
                            continue;
                        }
                        tmpMaterialDataList.push_back(tmpMaterialData);
                    }
                }
            }
            //将临时列表赋值给全局列表
            staticData.playerDataList.swap(tmpPlayerDataList);
            staticData.materialDataList.swap(tmpMaterialDataList);
            staticData.smokeList.swap(tmpSmokeList);
        }
    }
    return nullptr;
}





//获取帧数据
void readFrameData(ImVec2 screenSize,vector<PlayerData> &playerDataList, vector<MaterialData> &materialDataList) {
    playerDataList.clear();
    materialDataList.clear();
    if (moduleControl.systemStatus == TransmissionNormal) {
        //相机管理器类名
        staticData.cameraManagerClassName = getClassName(memoryTools.readInt(staticData.cameraManager + PubgOffset::ObjectParam::ClassIdOffset));
        //取玩家控制器类名
        staticData.playerControllerClassName = getClassName(memoryTools.readInt(staticData.playerController + PubgOffset::ObjectParam::ClassIdOffset));
        //取Pov
        MinimalViewInfo pov;
        memoryTools.readMemory(staticData.cameraManager + PubgOffset::PlayerControllerParam::CameraManagerParam::PovOffset, sizeof(pov), &pov);
        //自身坐标
        ImVec3 selfCoord = pov.location;
        //读视角角度
        float lateralAngleView = memoryTools.readFloat(staticData.playerController + PubgOffset::PlayerControllerParam::MouseOffset + 0x4) - 90;
        //读取矩阵
        if (moduleControl.mainSwitch.playerStatus) {
            for (auto staticPlayerData: staticData.playerDataList) {

                //坐标
                ImVec3 objectCoord;
                memoryTools.readMemory(staticPlayerData.coordAddr + PubgOffset::ObjectParam::CoordParam::CoordOffset, sizeof(ImVec3), &objectCoord);
                //计算自己到对象的距离
                float objectDistance = get3dDistance(objectCoord, selfCoord, 100);
                if (objectDistance < 0 || objectDistance > 450) {
                    continue;
                }
                //获取对象高度
                float objectHeight = memoryTools.readFloat(staticPlayerData.coordAddr + PubgOffset::ObjectParam::CoordParam::HeightOffset);
                if (objectHeight < 20) {
                    continue;
                }
                PlayerData playerData;
                //角度
                playerData.angle = lateralAngleView - rotateAngle(selfCoord, objectCoord) - 180;
                //雷达坐标
                playerData.radar = rotateCoord(lateralAngleView, ImVec2((selfCoord.x - objectCoord.x) / 200, (selfCoord.y - objectCoord.y) / 200));
                //距离
                playerData.distance = objectDistance;
                //人机
                playerData.robot = staticPlayerData.robot;
                //掩体判断
                
                uintptr_t meshAddr = memoryTools.readPtr(staticPlayerData.addr + PubgOffset::ObjectParam::MeshOffset);
                uintptr_t humanAddr = meshAddr + PubgOffset::ObjectParam::MeshParam::HumanOffset;
                uintptr_t boneAddr = memoryTools.readPtr(meshAddr + PubgOffset::ObjectParam::MeshParam::BonesOffset) + 48;
                
                Visdata visdata;
                
                auto headv = getBone(humanAddr, boneAddr, 5);
                auto pitv = getBone(humanAddr, boneAddr, 4);
                auto relbowv = getBone(humanAddr, boneAddr, 33);
                auto rwristv = getBone(humanAddr, boneAddr, 62);
                auto ranklev = getBone(humanAddr, boneAddr, 58);
                auto lelbowv = getBone(humanAddr, boneAddr, 57);
                auto lwristv = getBone(humanAddr, boneAddr, 63);
                auto lanklev = getBone(humanAddr, boneAddr, 53);
                auto lkneev = getBone(humanAddr, boneAddr, 54);
                auto rkneev = getBone(humanAddr, boneAddr, 57);
                
                auto rcollar = getBone(humanAddr, boneAddr, 32);
                auto lcollar = getBone(humanAddr, boneAddr, 11);
                auto rthigh = getBone(humanAddr, boneAddr, 52);
                auto lthigh = getBone(humanAddr, boneAddr, 56);
                
                visdata.isheadv = isCoordVisibility(headv);
                visdata.ispitv = isCoordVisibility(pitv);
                
                visdata.isrelbowv = isCoordVisibility(relbowv);
                visdata.isrwristv = isCoordVisibility(rwristv);
                visdata.isranklev = isCoordVisibility(ranklev);
                visdata.isrkneev = isCoordVisibility(rkneev);
                
                visdata.islelbowv = isCoordVisibility(lelbowv);
                visdata.islwristv = isCoordVisibility(lwristv);
                visdata.islanklev = isCoordVisibility(lanklev);
                visdata.islkneev = isCoordVisibility(lkneev);
                
                visdata.islthigh = isCoordVisibility(lthigh);
                visdata.isrthigh = isCoordVisibility(rthigh);
                visdata.isrcollar = isCoordVisibility(rcollar);
                visdata.islcollar = isCoordVisibility(lcollar);
                
                playerData.visibility = isCoordVisibility(objectCoord);
                if (playerData.visibility && isOnSmoke(objectCoord)) {
                    playerData.visibility = false;
                }
                
                //判断一下高度
                if (objectHeight < 50) {
                    objectHeight -= 18;
                } else if (objectHeight > 80) {
                    objectHeight += 12;
                }
                //队伍ID
                playerData.team = staticPlayerData.team;
                //血量
                playerData.hp = memoryTools.readFloat(staticPlayerData.addr + PubgOffset::ObjectParam::HpOffset);
                //取敌人动作
             //   NSLog(@"****： %id",statusName);
                uintptr_t statusAddr = memoryTools.readPtr(staticPlayerData.addr + PubgOffset::ObjectParam::StatusOffset);
                
                if (statusAddr == 2097168) {
                playerData.statusName = "开车";
                }
                if (statusAddr == 262208) {
                playerData.statusName = "打药";
                }
                if (statusAddr == 33554449) {
                playerData.statusName = "跳伞";
                }
                if (statusAddr == 262160) {
                playerData.statusName = "站立";
                }
                if (statusAddr == 16) {
                playerData.statusName = "站立";
                }
                if (statusAddr == 524288) {
                playerData.statusName = "击倒";
                }
                if (statusAddr == 147) {
                playerData.statusName = "跳跃";
                }
                if (statusAddr == 529) {
                playerData.statusName = "走路换弹";
                }
                if (statusAddr == 35) {
                playerData.statusName = "蹲跑";
                }
                if (statusAddr == 8205) {
                playerData.statusName = "开火";
                }
                if (statusAddr == 33) {
                playerData.statusName = "蹲走";
                }
                if (statusAddr == 65568) {
                playerData.statusName = "蹲下丢雷";
                }
                if (statusAddr == 65600) {
                playerData.statusName = "趴下丢雷";
                }
                if (statusAddr == 1088) {
                playerData.statusName = "趴下开镜";
                }
                if (statusAddr == 1056) {
                playerData.statusName = "蹲下开镜";
                }
                if (statusAddr == 18) {
                playerData.statusName = "站立";
                }
                if (statusAddr == 32784) {
                playerData.statusName = "挥拳";
                }
                if (statusAddr == 23) {
                playerData.statusName = "拿枪";
              
