//UPDATE BY B69
//PUBG 4.3
//There are three of them with this (///) mean need update;

// The sub-digit means that it may be the correct offset;

#include <stdio.h>
#include <string>
namespace PubgOffset {

int UpdateVolleyShootParametersOffset = 0x4E0;///
int dw_Rotation = 0x18;///
int dw_Location = 0x0;///
int dw_FOV = 0x24;///
int dw_MinimalViewInfo = 0x10;///
int dw_CameraCacheEntry = 0x470;///
int MaxDistFromMainChar = 0xf2c;///

int PlayerControllerOffset[3] = {0x38, 0x78, 0x30};
namespace PlayerControllerParam {
int SelfOffset = 0x28d0; 
int MouseOffset = 0x4e0;
int CameraManagerOffset = 0x548;
int AngleOffset = 0x560;
namespace CameraManagerParam{
int PovOffset = 0x10a0+ 0x10;
}
namespace ControllerFunction {

int LineOfSightToOffset = 0x7B0;
}
}
int ULevelOffset = 0x30;
namespace ULevelParam {
int ObjectArrayOffset = 0xA0;
int ObjectCountOffset = 0xA8;
}

namespace ObjectParam {
int ClassIdOffset = 0x18;
int ClassNameOffset = 0xC;

namespace PlayerFunction {
int AddControllerYawInputOffset = 0x890;
int AddControllerRollInputOffset = 0x898;
int AddControllerPitchInputOffset = 0x888;
}

int StatusOffset = 0x1058;
int TeamOffset = 0x998;
int NameOffset = 0x960;
int RobotOffset = 0xa40;
int HpOffset = 0xe60;
int HPMaxOffset = 0xe64;
int bDeadOffset = 0xe7c;
int isDead=0xdd4;//

int VehicleCommonComponentOffset = 0xbd8;///
int VehicleHPOffset = 0x33c;///
int VehicleHPMaxOffset= 0x2a0;///
int VehicleFuelOffset = 0x3fc;///
int VehicleFuelMaxOffset = 0x3f8;///

int judian1 = 0xc58;///
int judian2 = 0xc74;///
int judian3 = 0xba0;///
int BulletFireSpeed = 0x4f8;///
int HitEffect = 0xc5c;///
int ipadView = 0x1A28;///
int ipadView1 = 0x32C;///

int MoveCoordOffset = 0x2c0;
int MeshOffset = 0x510;
int boneCountOffset = 0x838;//
namespace MeshParam{
int HumanOffset = 0x208;
int BonesOffset = 0x990;
}
int OpenFireOffset = 0x1788;
int OpenTheSightOffset = 0x10e1;
int BulletTrackOffset = 0x498;///
int WeaponOneOffset = 0x2a30;
namespace WeaponParam{
int MasterOffset = 0xB0;///
int ShootModeOffset = 0x1089;
int WeaponAttrOffset = 0x12c0;
int ShootWeaponComponentOffset = 0xf30;
namespace WeaponAttrParam{
int BulletSpeedOffset = 0x560;
int RecoilOffset = 0xcf0;
}
}
int GoodsListOffset = 0x940;
namespace GoodsListParam {
int DataBase = 0x38;
}
int CoordOffset = 0x208;
namespace CoordParam {
int HeightOffset = 0x1dc;
int CoordOffset = 0x208;
}
}
}
