#ifndef CustomStrcut_h
#define CustomStrcut_h

#include "imgui.h"

#include <string>

// 系统状态枚举
enum SystemStatus {
    WaitingResponse,    // 等待响应
    SystemError,        // 系统错误
    NeedUpdate,         // 需要更新
    LoginFailure,       // 登录失败
    CheckFailure,       // 服务器校验失败
    TransmissionNormal, // 状态正常
};

// 物资类型枚举
enum MaterialType {
    Null = -1,
    Vehicle = 0,
    Airdrop = 1,
    FlareGun = 2,
    Sniper = 3,
    Rifle = 4,
    Missile = 5,
    Armor = 6,
    SniperParts = 7,
    RifleParts = 8,
    Drug = 9,
    Bullet = 10,
    Grip = 11,
    Sight = 12,
    Warning = 13,
    All = 14,
    WEP = 15,
    MachineGun = 16,
    Pistol = 17,
    ShotGun = 18
};


// 主开关结构体
struct MainSwitch {
    bool playerStatus;
    bool hideStatus;
    bool materialStatus;
    bool aimbotStatus;
    float MenuSizeStatus;
};

// 玩家开关结构体
struct PlayerSwitch {
    bool TDMStatus;
    bool boxStatus;         // 方框
    bool boneStatus;        // 骨骼
    bool lineStatus;        // 天线
    bool infoStatus;        // 信息
    bool radarStatus;       // 雷达
    bool backStatus;        // 背敌
    bool SCStatus;          // 手持贴图
    bool DrawHealthBarStatus;
    bool SCWZStatus;        // 手持文字
    bool WZStatus;          // 物资贴图
    bool WZWZStatus;        // 物资文字
    bool jdStatus;          // 经典
    bool jjStatus;          // 简洁
    float radarSize;        // 雷达大小
    ImVec2 radarCoord;      // 雷达坐标
};

// 自瞄控制器结构体
struct AimbotController {
    bool fallNotAim;        // 倒地不瞄
    int aimbotMode;         // 自瞄启动类型
    int aimbotParts;        // 自瞄部位
    float aimbotRadius;     // 自瞄半径
    bool showAimbotRadius;  // 显示自瞄半径
    float aimbotIntensity;  // 自瞄强度
    float distance;
    bool smoke;
};

// 模块控制结构体
struct ModuleControl {
    bool menuStatus;
    int fps;
    SystemStatus systemStatus;
    MainSwitch mainSwitch;
    PlayerSwitch playerSwitch;
    bool materialSwitch[All];
    AimbotController aimbotController;
};

// 骨骼数据结构体
struct BonesData {
    ImVec2 head;
    ImVec2 pit;
    ImVec2 pelvis;
    ImVec2 lcollar;
    ImVec2 rcollar;
    ImVec2 lelbow;
    ImVec2 relbow;
    ImVec2 lwrist;
    ImVec2 rwrist;
    ImVec2 lthigh;
    ImVec2 rthigh;
    ImVec2 lknee;
    ImVec2 rknee;
    ImVec2 lankle;
    ImVec2 rankle;
};
struct Visdata {
    bool isheadv;
    bool ispitv;
    
    bool isrelbowv;
    bool isrwristv;
    bool isranklev;
    bool isrkneev;
    
    bool islelbowv;
    bool islwristv;
    bool islanklev;
    bool islkneev;
    bool islthigh;
    bool isrthigh;
    bool islcollar;
    bool isrcollar;
};

// 玩家数据结构体
struct PlayerData {
    std::string name;
    ImVec2 screen;
    ImVec2 size;
    ImVec2 radar;
    float angle;
    int team;
    float Vehiclehp;
    float Vehiclefuel;
    float hp;
    std::string weaponName;
    std::string statusName;
    int distance;
    int robot;
    int status;
    Visdata visdata;
    BonesData bonesData;
    bool visibility;
};

// 物资数据结构体
struct MaterialData {
    int type;
    int id;
    std::string name;
    int distance;
    float Vehiclehp;
    float Vehiclefuel;
    ImVec2 screen;
};

// 静态玩家数据结构体
struct StaticPlayerData {
    uintptr_t addr;
    uintptr_t coordAddr;
    std::string name;
    int team;
    int status;
    bool robot;
};

// 静态物资数据结构体
struct StaticMaterialData {
    std::string name;
    int type;
    int id;
    uintptr_t addr;
    uintptr_t coordAddr;
};

// UE4变换结构体
struct Ue4Transform {
    ImVec4 rotation;
    ImVec3 translation;
    ImVec3 scale3d;
};

// UE4矩阵结构体
struct Ue4Matrix {
    float matrix[4][4];

    float* operator[](int index) {
        return matrix[index];
    }
};

// UE4旋转结构体
struct Ue4Rotator {
    float pitch;
    float yaw;
    float roll;
};

// 最小视图信息结构体
struct MinimalViewInfo {
    ImVec3 location;
    ImVec3 locationLocalSpace;
    Ue4Rotator rotation;
    float fov;
};

// 物资结构体
struct MaterialStruct {
    int type;
    int id;
    char name[64];
};

// 将矩阵转换为向量
ImVec3 matrixToVector(Ue4Matrix matrix);

// 矩阵相乘
Ue4Matrix matrixMulti(Ue4Matrix m1, Ue4Matrix m2);

// 将变换转换为矩阵
Ue4Matrix transformToMatrix(Ue4Transform transform);

// 将旋转转换为矩阵
Ue4Matrix rotatorToMatrix(ImVec3 rotation);

// 将世界坐标转换为屏幕坐标
ImVec2 worldToScreen(ImVec3 worldLocation, MinimalViewInfo camViewInfo, ImVec2 screenCenter);

// 计算角度差异（0-360）
float getAngleDifference(float angle1, float angle2);

// 正数和负数互转
float change(float num);

// 计算2D距离
float get2dDistance(ImVec2 self, ImVec2 object);

// 计算3D距离
float get3dDistance(ImVec3 self, ImVec3 object, float divice);

// 旋转指定角度的2D坐标
ImVec2 rotateCoord(float angle, ImVec2 coord);

// 计算3D坐标之间的2D角度
float rotateAngle(ImVec3 selfCoord, ImVec3 targetCoord);

// 计算3D坐标之间的3D角度
ImVec2 rotateAngleView(ImVec3 selfCoord, ImVec3 targetCoord);

// 判断物资是否被摄取
bool isRecycled(const char* name);

// 判断是否为武器
MaterialStruct isWeapon(const char* name);

// 判断是否为物资
MaterialStruct isMaterial(const char* name);

// 判断是否为物资（盒子）
MaterialStruct isBoxMaterial(int box_goods_id);

#endif /* CustomStrcut_h */

