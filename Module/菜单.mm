#import "菜单.h"
#import "OverlayView.h"
#import "HeeeNoScreenShotView.h"
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

extern float asize;
extern float test1;
extern float test2;
extern float test3;
extern float test4;
extern float test5;
extern float test6;
extern float test7;
@implementation mi
extern int IsLang;
 bool IsEnglish =false;
 bool IsKorean = true;
INI* config;


//const char *optionItemName[] = {"Home", "ESP", "ITEM", "AIMBOT"};
//int optionItemCurrent = 0;
//自瞄部位文本
int aimbotIntensity;
const char *aimbotIntensityText[] = {"Micro","Low", "Mid", "High", "Over", "Strong", "Lock Up"};
//自瞄部位文本
const char *aimbotModeText[] = {"Scope", "Fire", "Scope & Fire"};
//自瞄部位文本
const char *aimbotPartsText[] = {"Head", "Body", "Auto"};

OverlayView *overlayView;

- (instancetype)initWithFrame:(ModuleControl*)control {
    self.moduleControl = control;
    //获取Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //初始化文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //拼接文件路径
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"dolphins.ini"];
    //文件不存在
    if(![fileManager fileExistsAtPath:filePath]){
        //创建文件
        [fileManager createFileAtPath:filePath contents:[NSData data] attributes:nil];
    }
    //获取ini文件数据
    config = ini_load((char*)filePath.UTF8String);
    
    return [super init];
    
}

-(void)setOverlayView:(OverlayView*)ov{
    overlayView = ov;
}

HeeeNoScreenShotView *hide1;
static bool hidehackeractive;
-(void)drawMenuWindow {
    //设置下一个窗口的大小
    ImGui::SetNextWindowSize({1800, 1400}, ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowPos({172, 172}, ImGuiCond_FirstUseEver);
    
    ImGui::Begin(("Zenin Leak"),&self.moduleControl->menuStatus, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize);

    if (ImGui::CollapsingHeader("Basic")) {

        if (IsEnglish) {
        if (ImGui::Button("Reset Data"))
                            {
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents/ano_tmp",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Library",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/tmp",NSHomeDirectory()] error:nil];
                                
                                
                                UIAlertController *WrongKey = [UIAlertController alertControllerWithTitle:@"Data Reset Done @PJO9039" message:nil  preferredStyle:UIAlertControllerStyleAlert];
                                
                                
                                
                                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:WrongKey animated:true completion:nil];
                                
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    exit(0);
                                    
                                });
                            }
        }
        else
        {
            if (ImGui::Button("데이터 리셋"))
                            {
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents/ano_tmp",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Library",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/tmp",NSHomeDirectory()] error:nil];
                                
                                
                                UIAlertController *WrongKey = [UIAlertController alertControllerWithTitle:@"Data Reset Done @PJO9039" message:nil  preferredStyle:UIAlertControllerStyleAlert];
                                
                                
                                
                                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:WrongKey animated:true completion:nil];
                                
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    exit(0);
                                    
                                });
                            }
        }
        ImGui::SameLine();
        ImGui::Text("                                                                                                                                                            ");
        ImGui::SameLine();

        if (IsEnglish) {

        if (ImGui::Button("Reset Guest"))
                          {

                      NSArray *secItemClasses = @[(__bridge id)kSecClassGenericPassword,
                      (__bridge id)kSecClassInternetPassword,
                      (__bridge id)kSecClassCertificate,
                      (__bridge id)kSecClassKey,
                      (__bridge id)kSecClassIdentity];
                      for (id secItemClass in secItemClasses) {
                      NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
                      SecItemDelete((__bridge CFDictionaryRef)spec);
                              }
                              }
        }
        else
        {
            if (ImGui::Button("게스트 리셋"))
                          {

                      NSArray *secItemClasses = @[(__bridge id)kSecClassGenericPassword,
                      (__bridge id)kSecClassInternetPassword,
                      (__bridge id)kSecClassCertificate,
                      (__bridge id)kSecClassKey,
                      (__bridge id)kSecClassIdentity];
                      for (id secItemClass in secItemClasses) {
                      NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
                      SecItemDelete((__bridge CFDictionaryRef)spec);
                              }
                              }
        }

            static int IsLang = 0;
                    if (ImGui::Combo(" ", &IsLang, "English\0Korean\0"))
                    {
                        switch (IsLang)
                        {
                            case 0:
                                IsEnglish =true;
                                IsKorean =false;
                                
                                break;
                            case 1:
                                IsEnglish =false;
                                IsKorean =true;
                    }
                    }

if (IsEnglish) {
                ImGui::Text("LoginState: Success");
}
else 
{
    ImGui::Text("로그인 상태: 성공");
}

if (IsEnglish) {
                            ImGui::Text("            Expire at: 2080-12-30 21:24:23");
}
else
{
    ImGui::Text("             만료 될 것이다: 2080/12/30 21:24:23");
}
                            ImGui::Separator();

                            if (IsEnglish) {
                ImGui::Text("Announcement: HELLO WORLD");
                            }
                            else{
                                ImGui::Text("발행: HELLO WORLD");
                            }

                        if (IsEnglish) {
                            if(ImGui::SliderFloat("Menu Size", &self.moduleControl->mainSwitch.MenuSizeStatus, 2.0f, 20.0f,"%.2f%")){
ImGui::SetWindowFontScale(self.moduleControl->mainSwitch.MenuSizeStatus);
}
                        }
                        else
                        {
                             if(ImGui::SliderFloat("메뉴 크기", &self.moduleControl->mainSwitch.MenuSizeStatus, 2.0f, 20.0f,"%.2f%")){
ImGui::SetWindowFontScale(self.moduleControl->mainSwitch.MenuSizeStatus);
}
                        }
            if (ImGui::BeginTable("split", 2));
        {
            ImGui::TableNextColumn();
            
            if(IsEnglish){
            ImGui::Checkbox("Esp", &self.moduleControl->mainSwitch.playerStatus);
            ImGui::Checkbox("PlayerLine", &self.moduleControl->playerSwitch.lineStatus);
            ImGui::Checkbox("Bones", &self.moduleControl->playerSwitch.boneStatus);
            ImGui::Checkbox("PlayerDistance", &self.moduleControl->playerSwitch.boxStatus);
            }
            else
            {
            ImGui::Checkbox("위치", &self.moduleControl->mainSwitch.playerStatus);
            ImGui::Checkbox("플레이어 라인", &self.moduleControl->playerSwitch.lineStatus);
            ImGui::Checkbox("뼈", &self.moduleControl->playerSwitch.boneStatus);
            ImGui::Checkbox("플레이어 거리", &self.moduleControl->playerSwitch.boxStatus);
            }

            ImGui::TableNextColumn();
            
            if(IsEnglish){
            ImGui::Checkbox("PlayerInfo", &self.moduleControl->playerSwitch.infoStatus);
            ImGui::Checkbox("EnemyWeapon", &self.moduleControl->playerSwitch.SCStatus);
            ImGui::Checkbox("PlayerAround", &self.moduleControl->playerSwitch.backStatus);
            }
         else
         {
            ImGui::Checkbox("플레이어 정보", &self.moduleControl->playerSwitch.infoStatus);
            ImGui::Checkbox("적의 총기", &self.moduleControl->playerSwitch.SCStatus);
            ImGui::Checkbox("근접한 플레이어", &self.moduleControl->playerSwitch.backStatus);
         }
            ImGui::Text("      ");
            ImGui::Separator();
            ImGui::TableNextColumn();
            
            if (IsEnglish) {
            ImGui::Text("Render FPS(Frame Per Second)");
            }
            else
            {
                ImGui::Text("FPS 형성(초당 프레임)");
            }
            if (ImGui::RadioButton("30", &self.moduleControl->fps, 0)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 60;
            }
            ImGui::SameLine();
            ImGui::Text("                       ");
            ImGui::SameLine();
            if (ImGui::RadioButton("60", &self.moduleControl->fps, 1)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 90;
            }
            ImGui::SameLine();
            ImGui::Text("                       ");
            ImGui::SameLine();
            if (IsEnglish) {
            if (ImGui::RadioButton("Unlimited", &self.moduleControl->fps, 2)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 120;
            }
            }
            else
            {
                if (ImGui::RadioButton("무제한", &self.moduleControl->fps, 2)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 120;
            }
            }
        }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("Aimbot")) {
            if (ImGui::BeginTable("split", 2));
            {  
                ImGui::TableNextColumn();
                if (IsEnglish) {
                ImGui::Checkbox("Switch", &self.moduleControl->mainSwitch.aimbotStatus);
                }
                else
                {
                    ImGui::Checkbox("스위치", &self.moduleControl->mainSwitch.aimbotStatus);
                }
                ImGui::TableNextColumn();

                if (IsEnglish) {
                ImGui::Checkbox("Aimknockdown", &self.moduleControl->aimbotController.fallNotAim);
                }
                else
                {
                    ImGui::Checkbox("에임 넉다운", &self.moduleControl->aimbotController.fallNotAim);
                }
ImGui::TableNextColumn();

if(IsEnglish) {
if (ImGui::Combo("Aim Speed", &aimbotIntensity, aimbotIntensityText, IM_ARRAYSIZE(aimbotIntensityText))) {
        configManager::putInteger(config,"aimbotControl", "intensity",aimbotIntensity);
        switch (aimbotIntensity) {
            case 0:
                self.moduleControl->aimbotController.aimbotIntensity = 0.1f;
                break;
            case 1:
                self.moduleControl->aimbotController.aimbotIntensity = 0.2f;
                break;
            case 2:
                self.moduleControl->aimbotController.aimbotIntensity = 0.3f;
                break;
            case 3:
                self.moduleControl->aimbotController.aimbotIntensity = 0.4f;
                break;
            case 4:
                self.moduleControl->aimbotController.aimbotIntensity = 0.5f;
                break;
            case 5:
                self.moduleControl->aimbotController.aimbotIntensity = 1.0f;
                break;
            case 6:
                self.moduleControl->aimbotController.aimbotIntensity = 1.2f;
                break;
        }
    }
}
else
{
    if (ImGui::Combo("에임 속도", &aimbotIntensity, aimbotIntensityText, IM_ARRAYSIZE(aimbotIntensityText))) {
        configManager::putInteger(config,"aimbotControl", "intensity",aimbotIntensity);
        switch (aimbotIntensity) {
            case 0:
                self.moduleControl->aimbotController.aimbotIntensity = 0.1f;
                break;
            case 1:
                self.moduleControl->aimbotController.aimbotIntensity = 0.2f;
                break;
            case 2:
                self.moduleControl->aimbotController.aimbotIntensity = 0.3f;
                break;
            case 3:
                self.moduleControl->aimbotController.aimbotIntensity = 0.4f;
                break;
            case 4:
                self.moduleControl->aimbotController.aimbotIntensity = 0.5f;
                break;
            case 5:
                self.moduleControl->aimbotController.aimbotIntensity = 1.0f;
                break;
            case 6:
                self.moduleControl->aimbotController.aimbotIntensity = 1.2f;
                break;
        }
    }
}

if (IsEnglish) {
     if (ImGui::Combo("Aimbot Mode", &self.moduleControl->aimbotController.aimbotMode, aimbotModeText, IM_ARRAYSIZE(aimbotModeText))) {
        configManager::putInteger(config,"aimbotControl", "mode", self.moduleControl->aimbotController.aimbotMode);
    }
}
else
{
     if (ImGui::Combo("에임봇 설정", &self.moduleControl->aimbotController.aimbotMode, aimbotModeText, IM_ARRAYSIZE(aimbotModeText))) {
        configManager::putInteger(config,"aimbotControl", "mode", self.moduleControl->aimbotController.aimbotMode);
    }
}

if (IsEnglish) {
    if (ImGui::Combo("Aim Part", &self.moduleControl->aimbotController.aimbotParts, aimbotPartsText, IM_ARRAYSIZE(aimbotPartsText))) {
        configManager::putBoolean(config,"aimbotControl", "parts", self.moduleControl->aimbotController.aimbotParts);
    }
            }
            else
            {
    if (ImGui::Combo("에임 부위", &self.moduleControl->aimbotController.aimbotParts, aimbotPartsText, IM_ARRAYSIZE(aimbotPartsText))) {
        configManager::putBoolean(config,"aimbotControl", "parts", self.moduleControl->aimbotController.aimbotParts);
    }
            }

    if (IsEnglish) {
                ImGui::Checkbox("ShowFov", &self.moduleControl->aimbotController.showAimbotRadius);
    }
    else
    {
         ImGui::Checkbox("에임 범위", &self.moduleControl->aimbotController.showAimbotRadius);
    }

    if (IsEnglish) {
                ImGui::Checkbox("Igrone Bot", &self.moduleControl->aimbotController.smoke);
    }
    else
    {
        ImGui::Checkbox("봇무시", &self.moduleControl->aimbotController.smoke);
    }

    if (IsEnglish) {
                ImGui::SliderFloat("Fov", &self.moduleControl->aimbotController.aimbotRadius, 0.0f, ([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].nativeScale) / 2, "%.0f%");
    }
    else
    {
        ImGui::SliderFloat("범위", &self.moduleControl->aimbotController.aimbotRadius, 0.0f, ([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].nativeScale) / 2, "%.0f%");
    }

    if (IsEnglish) {
                ImGui::SliderFloat("Distance", &self.moduleControl->aimbotController.distance, 0.0f, 80.0f, "%.0fM");
    }
    else
    {
        ImGui::SliderFloat("에임 거리", &self.moduleControl->aimbotController.distance, 0.0f, 80.0f, "%.0fM");
    }
                }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("Equipment")) {
            if (ImGui::BeginTable("split", 2));
            {               
                ImGui::TableNextColumn();

                if (IsEnglish) {
                ImGui::Checkbox("iTem Switch", &self.moduleControl->mainSwitch.materialStatus);
                
                if (ImGui::Checkbox("Rifle", &self.moduleControl->materialSwitch[Rifle])) {
                    std::string str = "materialSwitch_" + std::to_string(Rifle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Rifle]);
                }
                
                if (ImGui::Checkbox("Armor", &self.moduleControl->materialSwitch[Armor])) {
                    std::string str = "materialSwitch_" + std::to_string(Armor);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Armor]);
                }
                
                if (ImGui::Checkbox("SniperPart", &self.moduleControl->materialSwitch[SniperParts])) {
                    std::string str = "materialSwitch_" + std::to_string(SniperParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[SniperParts]);
                }
                
                if (ImGui::Checkbox("RiflePart", &self.moduleControl->materialSwitch[RifleParts])) {
                    std::string str = "materialSwitch_" + std::to_string(RifleParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[RifleParts]);
                }
                
                if (ImGui::Checkbox("Bullet", &self.moduleControl->materialSwitch[Bullet])) {
                    std::string str = "materialSwitch_" + std::to_string(Bullet);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Bullet]);
                }
                
                if (ImGui::Checkbox("Grip", &self.moduleControl->materialSwitch[Grip])) {
                    std::string str = "materialSwitch_" + std::to_string(Grip);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Grip]);
                }
                
                if (ImGui::Checkbox("Sniper", &self.moduleControl->materialSwitch[Sniper])) {
                    std::string str = "materialSwitch_" + std::to_string(Sniper);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sniper]);
                }
                
                if (ImGui::Checkbox("Sight", &self.moduleControl->materialSwitch[Sight])) {
                    std::string str = "materialSwitch_" + std::to_string(Sight);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sight]);
                }
                }
                else
                {
                    ImGui::Checkbox("아이템 스위치", &self.moduleControl->mainSwitch.materialStatus);
                
                if (ImGui::Checkbox("소총", &self.moduleControl->materialSwitch[Rifle])) {
                    std::string str = "materialSwitch_" + std::to_string(Rifle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Rifle]);
                }
                
                if (ImGui::Checkbox("갑옷", &self.moduleControl->materialSwitch[Armor])) {
                    std::string str = "materialSwitch_" + std::to_string(Armor);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Armor]);
                }
                
                if (ImGui::Checkbox("저격총 부분", &self.moduleControl->materialSwitch[SniperParts])) {
                    std::string str = "materialSwitch_" + std::to_string(SniperParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[SniperParts]);
                }
                
                if (ImGui::Checkbox("소총 부분", &self.moduleControl->materialSwitch[RifleParts])) {
                    std::string str = "materialSwitch_" + std::to_string(RifleParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[RifleParts]);
                }
                
                if (ImGui::Checkbox("몸", &self.moduleControl->materialSwitch[Bullet])) {
                    std::string str = "materialSwitch_" + std::to_string(Bullet);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Bullet]);
                }
                
                if (ImGui::Checkbox("그립", &self.moduleControl->materialSwitch[Grip])) {
                    std::string str = "materialSwitch_" + std::to_string(Grip);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Grip]);
                }
                
                if (ImGui::Checkbox("저격총", &self.moduleControl->materialSwitch[Sniper])) {
                    std::string str = "materialSwitch_" + std::to_string(Sniper);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sniper]);
                }
                
                if (ImGui::Checkbox("시력", &self.moduleControl->materialSwitch[Sight])) {
                    std::string str = "materialSwitch_" + std::to_string(Sight);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sight]);
                }
                }
            }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("Medical")) {
            if (ImGui::BeginTable("split", 2));
            {
                ImGui::TableNextColumn();
                if (IsEnglish) {
                if (ImGui::Checkbox("Drug", &self.moduleControl->materialSwitch[Drug])) {
                    std::string str = "materialSwitch_" + std::to_string(Drug);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Drug]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("약품", &self.moduleControl->materialSwitch[Drug])) {
                    std::string str = "materialSwitch_" + std::to_string(Drug);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Drug]);
                }
                }
            }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("Vehicle")) {
            if (ImGui::BeginTable("split", 2));
            {
                ImGui::TableNextColumn();
                if (IsEnglish) {
                if (ImGui::Checkbox("Vichle", &self.moduleControl->materialSwitch[Vehicle])) {
                    std::string str = "materialSwitch_" + std::to_string(Vehicle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Vehicle]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("차량", &self.moduleControl->materialSwitch[Vehicle])) {
                    std::string str = "materialSwitch_" + std::to_string(Vehicle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Vehicle]);
                }
                }
            }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("Misc")) {
            if (ImGui::BeginTable("split", 2));
            {
                ImGui::TableNextColumn();
                
                if (IsEnglish) {
                if (ImGui::Checkbox("Airdrop", &self.moduleControl->materialSwitch[Airdrop])) {
                    std::string str = "materialSwitch_" + std::to_string(Airdrop);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Airdrop]);
                }
            }
            else
            {
                if (ImGui::Checkbox("에어드랍", &self.moduleControl->materialSwitch[Airdrop])) {
                    std::string str = "materialSwitch_" + std::to_string(Airdrop);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Airdrop]);
                }
            }
                ImGui::TableNextColumn();
                if (IsEnglish) {
                if (ImGui::Checkbox("FlareGun", &self.moduleControl->materialSwitch[FlareGun])) {
                    std::string str = "materialSwitch_" + std::to_string(FlareGun);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[FlareGun]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("플레어건", &self.moduleControl->materialSwitch[FlareGun])) {
                    std::string str = "materialSwitch_" + std::to_string(FlareGun);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[FlareGun]);
                }
                }
                ImGui::TableNextColumn();
                if(IsEnglish) {
                if (ImGui::Checkbox("Grenader", &self.moduleControl->materialSwitch[Missile])) {
                    std::string str = "materialSwitch_" + std::to_string(Missile);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Missile]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("폭탄", &self.moduleControl->materialSwitch[Missile])) {
                    std::string str = "materialSwitch_" + std::to_string(Missile);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Missile]);
                }
                }
            }
            ImGui::EndTable();
        }
        ImGui::End();
    }
    
-(void)readIniConfig{
    self.moduleControl->fps = configManager::readInteger(config,"mainSwitch", "fps", 0);
    switch(self.moduleControl->fps){
        case 0:
            overlayView.preferredFramesPerSecond = 60;
            break;
        case 1:
            overlayView.preferredFramesPerSecond = 90;
            break;
        case 2:
            overlayView.preferredFramesPerSecond = 120;
            break;
        default:
            overlayView.preferredFramesPerSecond = 60;
            break;
    }
    
    //自瞄模式
    self.moduleControl->aimbotController.aimbotMode = configManager::readInteger(config,"aimbotControl", "mode", 0);
    //自瞄部位
    self.moduleControl->aimbotController.aimbotParts = configManager::readInteger(config,"aimbotControl", "parts", 0);
    //自瞄强度
    aimbotIntensity = configManager::readInteger(config,"aimbotControl", "intensity", 2);
    switch (aimbotIntensity) {
        case 0:
            self.moduleControl->aimbotController.aimbotIntensity = 0.1f;
            break;
        case 1:
            self.moduleControl->aimbotController.aimbotIntensity = 0.2f;
            break;
        case 2:
            self.moduleControl->aimbotController.aimbotIntensity = 0.3f;
            break;
        case 3:
            self.moduleControl->aimbotController.aimbotIntensity = 0.4f;
            break;
        case 4:
            self.moduleControl->aimbotController.aimbotIntensity = 0.5f;
            break;
        case 5:
            self.moduleControl->aimbotController.aimbotIntensity = 1.0f;
            break;
        case 6:
            self.moduleControl->aimbotController.aimbotIntensity = 1.2f;
            break;
    }

     self.moduleControl->aimbotController.distance = configManager::readFloat(config,"aimbotControl", "distance", 450);
}

@end
