
#include "module_tools.h"
#import "视图.h"
#include "image_base64.h"
#import "OverlayView.h"

#import "Icon.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenWidth [UIScreen mainScreen].bounds.size.width


float asize=1.f;
float test1 =0;
float test2 =0;
float test3 =0;
float test4 =0;
float test5 =0;
float test6 =0;
float test7 =0;


@implementation mao
ImDrawList *imDrawList;

CGSize screenSize;

std::vector<PlayerData> playerDataList;
std::vector<MaterialData> materialDataList;
extern ImFont* arial;
extern ImFont* roboto;
extern ImFont* countfont;
extern ImFont* bold2;
extern ImFont* icon;;

int xWidth =50;
int xtWidth =10;
int hpWidth = 50;
int hpHeight = 8;
int scWidth = 220;
int scHeight = 110;
int qtWidth = 220;
int qtHeight = 50;

id<MTLTexture> leizhaTexture;
id<MTLTexture> hongzhaTexture;
id<MTLTexture> shouleiTexture;
id<MTLTexture> sldTexture;
id<MTLTexture> ywdTexture;
id<MTLTexture> rspTexture;

id<MTLTexture> countTexture;
id<MTLTexture> count1Texture;
id<MTLTexture> count2Texture;
id<MTLTexture> count3Texture;
id<MTLTexture> count4Texture;
id<MTLTexture> count5Texture;
id<MTLTexture> quanTexture;
id<MTLTexture> playerTexture;
id<MTLTexture> robotTexture;

id<MTLTexture> M416Texture;
id<MTLTexture> Ace32Texture;
id<MTLTexture> M16Texture;
id<MTLTexture> GrozaTexture;
id<MTLTexture> AkmTexture;
id<MTLTexture> SCARTexture;
id<MTLTexture> MK47Texture;
id<MTLTexture> AUGTexture;
id<MTLTexture> M762Texture;
id<MTLTexture> QBZTexture;
id<MTLTexture> leiTexture;
id<MTLTexture> huoTexture;
id<MTLTexture> yanTexture;
id<MTLTexture> shanTexture;
id<MTLTexture> R1895Texture;
id<MTLTexture> P92Texture;
id<MTLTexture> P1911Texture;
id<MTLTexture> P18CTexture;
id<MTLTexture> R45Texture;
id<MTLTexture> SKSTexture;
id<MTLTexture> MINITexture;
id<MTLTexture> MK14Texture;
id<MTLTexture> VSSTexture;
id<MTLTexture> QBUTexture;
id<MTLTexture> SLRTexture;
id<MTLTexture> AWMTexture;
id<MTLTexture> M24Texture;
id<MTLTexture> K98Texture;
id<MTLTexture> MOTexture;
id<MTLTexture> LIANTexture;
id<MTLTexture> GUNTexture;
id<MTLTexture> DAOTexture;
id<MTLTexture> GUOTexture;
id<MTLTexture> UZITexture;
id<MTLTexture> TANGTexture;
id<MTLTexture> VKTTexture;
id<MTLTexture> MP5KTexture;
id<MTLTexture> UMP9Texture;
id<MTLTexture> YNTexture;
id<MTLTexture> DP28Texture;
id<MTLTexture> MG3Texture;
id<MTLTexture> M249Texture;
id<MTLTexture> DBSTexture;
id<MTLTexture> S686Texture;
id<MTLTexture> S12KTexture;

id<MTLTexture> JPTexture;
id<MTLTexture> BBTexture;
id<MTLTexture> jcTexture;
id<MTLTexture> mttTexture;
id<MTLTexture> mtTexture;
id<MTLTexture> myTexture;
id<MTLTexture> R8Texture;
id<MTLTexture> mt3Texture;

id<MTLTexture> m416Texture;
id<MTLTexture> akmTexture;
id<MTLTexture> augTexture;
id<MTLTexture> grozaTexture;
id<MTLTexture> m16Texture;
id<MTLTexture> m24Texture;
id<MTLTexture> m249Texture;
id<MTLTexture> m762Texture;
id<MTLTexture> mg3Texture;
id<MTLTexture> miniTexture;
id<MTLTexture> mk14Texture;
id<MTLTexture> mk47Texture;
id<MTLTexture> scarTexture;
id<MTLTexture> slrTexture;
id<MTLTexture> awmTexture;
id<MTLTexture> dp28Texture;
id<MTLTexture> k98Texture;
id<MTLTexture> vssTexture;
id<MTLTexture> sksTexture;
id<MTLTexture> hzTexture;

id<MTLTexture> ylTexture;
id<MTLTexture> jjbTexture;
id<MTLTexture> ztyTexture;
id<MTLTexture> ylxTexture;
id<MTLTexture> zhenTexture;

id<MTLTexture> b4Texture;
id<MTLTexture> b3Texture;
id<MTLTexture> b6Texture;
id<MTLTexture> b8Texture;

id<MTLTexture> ktTexture;
id<MTLTexture> t3Texture;
id<MTLTexture> j3Texture;
id<MTLTexture> bb3Texture;

id<MTLTexture> tleiTexture;
id<MTLTexture> tyanTexture;
id<MTLTexture> thuoTexture;

- (instancetype)initWithFrame:(ModuleControl*)control {
    self = [super init];
    
    self.moduleControl = control;
    
    
    screenSize = [UIScreen mainScreen].bounds.size;
    screenSize.width *= [UIScreen mainScreen].nativeScale;
    screenSize.height *= [UIScreen mainScreen].nativeScale;
    
    return self;
}






void Draw3DBox(ImDrawList* drawList, ImVec2 min, ImVec2 max, ImU32 color) {
    drawList->AddLine(min, ImVec2(min.x, max.y), color);
    drawList->AddLine(ImVec2(min.x, max.y), max, color);
    drawList->AddLine(max, ImVec2(max.x, min.y), color);
    drawList->AddLine(ImVec2(max.x, min.y), min, color);

    drawList->AddLine(min, ImVec2(min.x + (max.x - min.x) / 4, min.y - (max.y - min.y) / 4), color);
    drawList->AddLine(ImVec2(min.x + (max.x - min.x) / 4, min.y - (max.y - min.y) / 4), ImVec2(min.x + 3 * (max.x - min.x) / 4, min.y - (max.y - min.y) / 4), color);
    drawList->AddLine(ImVec2(min.x + 3 * (max.x - min.x) / 4, min.y - (max.y - min.y) / 4), ImVec2(max.x, min.y), color);
}

void DrawHealthBar(ImDrawList* imDrawList, const PlayerData& playerData, bool isRobot, ImU32 color) {
}

void DrawBoneLine(ImDrawList* imDrawList, const ImVec2& from, const ImVec2& to, const ImColor& color, float thickness) {
    imDrawList->AddLine(from, to, color, thickness);
}
void DrawCountText(ImDrawList* imDrawList, float x, float y, int count, ImColor textColor) {
    imDrawList->AddTextX(ImVec2(x, y), ImColor(0, 0, 0, 255), 45, std::to_string(count).c_str());
    imDrawList->AddTextX(ImVec2(x - 1, y - 1), textColor, 45, std::to_string(count).c_str());
}
void DrawLine(ImDrawList* imDrawList, ImVec2 start, ImVec2 end, ImU32 color) {
    ImColor lineColor(color);
    imDrawList->AddLine(start, end, color, 2.0f);
}
void Box4Line(ImDrawList *draw, float thicc, int x, int y, int w, int h, int color) {
    int iw = w / 4;
    int ih = h / 4;
    // top
    imDrawList->AddRect(ImVec2(x, y),ImVec2(x + iw, y), color, thicc);
    imDrawList->AddRect(ImVec2(x + w - iw, y),ImVec2(x + w, y), color, thicc);
    imDrawList->AddRect(ImVec2(x, y),ImVec2(x, y + ih), color, thicc);
    imDrawList->AddRect(ImVec2(x + w - 1, y),ImVec2(x + w - 1, y + ih), color, thicc);;
    // bottom
    imDrawList->AddRect(ImVec2(x, y + h),ImVec2(x + iw, y + h), color, thicc);
    imDrawList->AddRect(ImVec2(x + w - iw, y + h),ImVec2(x + w, y + h), color, thicc);
    imDrawList->AddRect(ImVec2(x, y + h - ih), ImVec2(x, y + h), color, thicc);
    imDrawList->AddRect(ImVec2(x + w - 1, y + h - ih), ImVec2(x + w - 1, y + h), color, thicc);
}
-(void)drawDrawWindow {
    ImGui::SetNextWindowSize(ImVec2(screenSize.width,screenSize.height));
    ImGui::SetNextWindowPos(ImVec2(0, 0));
    ImGui::Begin("alpha", nullptr, ImGuiWindowFlags_NoBackground | ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoInputs | ImGuiWindowFlags_NoMove);
    
    imDrawList = ImGui::GetWindowDrawList();
    
    
    //拉取一帧的数
    readFrameData(ImVec2(screenSize.width / 2,screenSize.height / 2),playerDataList, materialDataList);
    
    
    
  
    
    for (MaterialData materialData:materialDataList) {
            //判断是否在屏幕内
        if (self.moduleControl->playerSwitch.WZWZStatus) {
            if (materialData.name=="[预警]小心手雷") {//警告贴图
                imDrawList->AddImage((__bridge ImTextureID) leizhaTexture, ImVec2(screenSize.width / 2 - leizhaTexture.width / 2, 230), ImVec2(screenSize.width / 2 + leizhaTexture.width / 2, 230 + leizhaTexture.height), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
            }
            if (materialData.name=="[轰炸预警]小心轰炸区") {
                imDrawList->AddImage((__bridge ImTextureID) hongzhaTexture, ImVec2(screenSize.width / 2 - hongzhaTexture.width / 2, 180), ImVec2(screenSize.width / 2 + hongzhaTexture.width / 2, 180 + hongzhaTexture.height), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
            }
            if (materialData.name=="[预警]小心手雷") {
                imDrawList->AddImage((__bridge ImTextureID) sldTexture, ImVec2(materialData.screen.x+190 - qtWidth+1, materialData.screen.y-5 -  qtHeight+1), ImVec2(materialData.screen.x+190 - qtWidth+1 + qtHeight-2 , materialData.screen.y-5 - qtHeight + qtHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
            }
            if (materialData.name=="[预警]烟雾弹") {
                imDrawList->AddImage((__bridge ImTextureID) ywdTexture, ImVec2(materialData.screen.x+190 - qtWidth+1, materialData.screen.y-5 -  qtHeight+1), ImVec2(materialData.screen.x+190 - qtWidth+1 + qtHeight-2 , materialData.screen.y-5 - qtHeight + qtHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
            }
            if (materialData.name=="[预警]燃烧瓶") {
                imDrawList->AddImage((__bridge ImTextureID) rspTexture, ImVec2(materialData.screen.x+190 - qtWidth+1, materialData.screen.y-5 -  qtHeight+1), ImVec2(materialData.screen.x+190 - qtWidth+1 + qtHeight-2 , materialData.screen.y-5 - qtHeight + qtHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
            }
            
            //物品文字
            if (materialData.distance != -100){
                //载具
            if (materialData.name=="摩托车") {
                std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
                imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
             }
            if (materialData.name=="三轮摩托") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
               imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="小绵羊") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
               imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="蹦蹦") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
               imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="跑车") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="轿车") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="吉普") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="大船") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="摩托艇") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="宝宝巴士") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="装甲车") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="吉普车") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="雪地摩托") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="雪地重型摩托") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="皮卡") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            if (materialData.name=="CoupeRB") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 206, 209), 21, str.c_str());
            }
            //空投盒子
            if (materialData.name=="[盒子]") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 255, 0), 21, str.c_str());
            }
            if (materialData.name=="盒子") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 255, 0), 21, str.c_str());
            }
            if (materialData.name=="[空投]") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 20, 147), 21, str.c_str());
            }
            if (materialData.name=="空投") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 20, 147), 21, str.c_str());
            }
            if (materialData.name=="信号枪") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 20, 147), 21, str.c_str());
            }
            //狙击枪
            if (materialData.name=="QBU") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="SLR") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="SKS") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="Mini14") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="M24") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="Kar98k") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="Mk14") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="莫辛纳甘") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="MK12") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="AMR") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="AWM") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            //步枪
            if (materialData.name=="M762") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="SCAR-L") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="Ace32") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="M416") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="M16A4") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="Mk47") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="G36C") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="QBZ") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="Groza") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="AUG") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="AKM") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="大盘鸡") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="大菠萝") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="MG3") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="手雷") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 127, 80), 21, str.c_str());
            }
            if (materialData.name=="烟雾弹") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 127, 80), 21, str.c_str());
            }
            if (materialData.name=="燃烧瓶") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 127, 80), 21, str.c_str());
            }
            if (materialData.name=="三级甲") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="三级包") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="三级头") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="止痛药") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
            }
            if (materialData.name=="肾上腺素") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
            }
            if (materialData.name=="饮料") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
            }
            if (materialData.name=="急救包") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
            }
            if (materialData.name=="医疗箱") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
            }
            if (materialData.name=="油桶") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
            }
            if (materialData.name=="红点") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
               imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="全息") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="3X") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="4X") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="6X") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="8X") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="[预警]燃烧瓶") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(178, 34, 34), 21, str.c_str());
            }
            if (materialData.name=="[预警]烟雾弹") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(178, 34, 34), 21, str.c_str());
            }
            if (materialData.name=="[预警]小心手雷") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(178, 34, 34), 21, str.c_str());
            }
            if (materialData.name=="[轰炸预警]小心轰炸区") {
               std::string str =  "["+ materialData.name +":" + std::to_string(materialData.distance) + "M]";
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(178, 34, 34), 21, str.c_str());
            }
            } else {
                if (materialData.name=="[药]止痛药") {
                   std::string str = materialData.name;
                    imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
                   imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
                }
                if (materialData.name=="[药]肾上腺素") {
                   std::string str = materialData.name;
                    imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
                   imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
                }
                if (materialData.name=="[药]饮料") {
                   std::string str = materialData.name;
                    imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
                   imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
                }
                if (materialData.name=="[药]急救包") {
                   std::string str = materialData.name;
                    imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
                   imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
                }
                if (materialData.name=="[药]医疗箱") {
                   std::string str = materialData.name;
                    imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
                   imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 210, 0), 21, str.c_str());
                }
            if (materialData.name=="[防]三级甲") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[包]三级包") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[头]三级头") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[防]二级甲") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[包]二级包") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[头]二级头") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            
            if (materialData.name=="[狙]QBU") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]SLR") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]SKS") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]Mini14") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]M24") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]Kar98k") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]Mk14") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]莫辛纳甘") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]MK12") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]AMR") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[狙]AWM") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 0, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]M762") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]SCAR-L") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]M416") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]M16A4") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]Mk47") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]G36C") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]QBZ") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]Groza") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]AUG") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[枪]AKM") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[机]大盘鸡") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[机]大菠萝") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[机]MG3") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 69, 0), 21, str.c_str());
            }
            if (materialData.name=="[弹]5.56mm") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 255, 0), 21, str.c_str());
            }
            if (materialData.name=="[弹]7.62mm") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 255, 0), 21, str.c_str());
            }
            if (materialData.name=="[弹]马格南") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 255, 0), 21, str.c_str());
            }
            if (materialData.name=="[弹]信号弹") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(0, 255, 0), 21, str.c_str());
            }
            if (materialData.name=="[镜]红点") {
               std::string str = materialData.name;
               imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="[镜]全息") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="[镜]3X") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="[镜]4X") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="[镜]6X") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="[镜]8X") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(70, 130, 180), 21, str.c_str());
            }
            if (materialData.name=="[投]手雷") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 127, 80), 21, str.c_str());
            }
            if (materialData.name=="[投]烟雾弹") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 127, 80), 21, str.c_str());
            }
            if (materialData.name=="[投]燃烧瓶") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 127, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]托腮板") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]子弹袋") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]子弹袋") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]消焰器") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]枪口补偿") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]消音器") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]快速扩容") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[狙配件]扩容") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[握]拇指握把") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[握]垂直握把") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[握]半截式握把") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[配件]枪口补偿") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[配件]战术枪托") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[配件]消焰器") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[配件]消音器") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[配件]快速扩容") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
            if (materialData.name=="[配件]扩容") {
               std::string str = materialData.name;
                imDrawList->AddTextX(ImVec2(materialData.screen.x+1 - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y+1), ImColor(0, 0, 0, 255), 21, str.c_str());
               imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(str.c_str(), 21) / 2, materialData.screen.y), ImColor(255, 255, 80), 21, str.c_str());
            }
                
            }
        }
        //物品贴图
        if (self.moduleControl->playerSwitch.WZStatus) {
        if (materialData.name=="Grenade") {
                imDrawList->AddImage((__bridge ImTextureID) shouleiTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
            }
        if (materialData.name=="吉普") {
                imDrawList->AddImage((__bridge ImTextureID) JPTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
           }
        if (materialData.name=="蹦蹦") {
                imDrawList->AddImage((__bridge ImTextureID) BBTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
            }
        if (materialData.name=="轿车") {
            imDrawList->AddImage((__bridge ImTextureID) jcTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="摩托艇") {
            imDrawList->AddImage((__bridge ImTextureID) mttTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="摩托车") {
            imDrawList->AddImage((__bridge ImTextureID) mtTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="小绵羊") {
            imDrawList->AddImage((__bridge ImTextureID) myTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="CoupeRB") {
            imDrawList->AddImage((__bridge ImTextureID) R8Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="三轮摩托") {
            imDrawList->AddImage((__bridge ImTextureID) mt3Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        
        if (materialData.name=="M416") {
            imDrawList->AddImage((__bridge ImTextureID) m416Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="AKM") {
            imDrawList->AddImage((__bridge ImTextureID) akmTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="AUG") {
            imDrawList->AddImage((__bridge ImTextureID) augTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="Groza") {
            imDrawList->AddImage((__bridge ImTextureID) grozaTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="M16A4") {
            imDrawList->AddImage((__bridge ImTextureID) m16Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="M24") {
            imDrawList->AddImage((__bridge ImTextureID) m24Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="M249") {
            imDrawList->AddImage((__bridge ImTextureID) m249Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="M762") {
            imDrawList->AddImage((__bridge ImTextureID) m762Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="MG3") {
            imDrawList->AddImage((__bridge ImTextureID) mg3Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="Mini14") {
            imDrawList->AddImage((__bridge ImTextureID) miniTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="Mk14") {
            imDrawList->AddImage((__bridge ImTextureID) mk14Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="Mk47") {
            imDrawList->AddImage((__bridge ImTextureID) mk47Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="SCAR-L") {
            imDrawList->AddImage((__bridge ImTextureID) scarTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="SLR") {
            imDrawList->AddImage((__bridge ImTextureID) slrTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="AWM") {
            imDrawList->AddImage((__bridge ImTextureID) awmTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="DP28") {
            imDrawList->AddImage((__bridge ImTextureID) dp28Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="Kar98k") {
            imDrawList->AddImage((__bridge ImTextureID) k98Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="SKS") {
            imDrawList->AddImage((__bridge ImTextureID) sksTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="[盒子]") {
            imDrawList->AddImage((__bridge ImTextureID) hzTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="盒子") {
            imDrawList->AddImage((__bridge ImTextureID) ktTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+17 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+17 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        
        if (materialData.name=="饮料") {
            imDrawList->AddImage((__bridge ImTextureID) ylTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="止痛药") {
            imDrawList->AddImage((__bridge ImTextureID) ztyTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="急救包") {
            imDrawList->AddImage((__bridge ImTextureID) jjbTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="医疗箱") {
            imDrawList->AddImage((__bridge ImTextureID) ylxTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="肾上腺素") {
            imDrawList->AddImage((__bridge ImTextureID) zhenTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        
        if (materialData.name=="4X") {
            imDrawList->AddImage((__bridge ImTextureID) b4Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="3X") {
            imDrawList->AddImage((__bridge ImTextureID) b3Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="6X") {
            imDrawList->AddImage((__bridge ImTextureID) b6Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="8X") {
            imDrawList->AddImage((__bridge ImTextureID) b8Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="[空投]") {
            imDrawList->AddImage((__bridge ImTextureID) ktTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="空投") {
            imDrawList->AddImage((__bridge ImTextureID) ktTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="三级头") {
            imDrawList->AddImage((__bridge ImTextureID) t3Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="三级甲") {
            imDrawList->AddImage((__bridge ImTextureID) j3Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="三级包") {
            imDrawList->AddImage((__bridge ImTextureID) bb3Texture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="手雷") {
            imDrawList->AddImage((__bridge ImTextureID) tleiTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="烟雾弹") {
            imDrawList->AddImage((__bridge ImTextureID) tyanTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        if (materialData.name=="燃烧瓶") {
            imDrawList->AddImage((__bridge ImTextureID) thuoTexture, ImVec2(materialData.screen.x+165 - scWidth+1, materialData.screen.y+10 -  scHeight+1), ImVec2(materialData.screen.x+165 - scWidth+1 + scHeight-2 , materialData.screen.y+10 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
        }
        //物品距离——贴图
        if (materialData.distance != -100) {
                 std::string str = std::to_string(materialData.distance) + "M";
                imDrawList->AddTextX(ImVec2(materialData.screen.x-14 - calcTextSize(std::to_string(materialData.distance).c_str(), 22) / 2, materialData.screen.y-4 ), ImColor(255, 255,0), 22, str.c_str());
            } else {
                 std::string str = materialData.name + ":";//盒子内物资
                imDrawList->AddRectFilled({materialData.screen.x - calcTextSize(materialData.name.c_str(), 22) / 2, materialData.screen.y }, {materialData.screen.x + calcTextSize(materialData.name.c_str(), 22) / 2, materialData.screen.y + 22}, ImColor(0, 0, 0, 80), 10.0f);
                imDrawList->AddTextX(ImVec2(materialData.screen.x - calcTextSize(materialData.name.c_str(), 22) / 2, materialData.screen.y + (22 / 2 - 22 / 2)), ImColor(255, 255, 255), 22, materialData.name.c_str());
            }
        }
    }
    if (self.moduleControl->mainSwitch.playerStatus) {
        //雷达UI
       
        //清空人数
        int playerCount = 0, robotCount = 0;
        for (PlayerData playerData:playerDataList) {
            //人机数量和真人数量
            ImColor color, color150;
            if (playerData.robot) { // 만약 플레이어가 로봇이라면
                if (playerData.visibility) {
                  
                    color = ImColor(0, 255, 0); // Player is visible, set color to plum with lower alpha (150)
                    } else {
                        color = ImColor(255,0,0); // Player is not visible, set color to aqua with lower alpha (150)
                    }
                if (playerData.visibility) {
                    // 추가적인 작업 수행 가능
                }
                robotCount += 1; // 로봇 카운트 증가
            } else {
                if (playerData.visibility) {
                  
                    color = ImColor(0, 255, 0); // Player is visible, set color to plum with lower alpha (150)
                    } else {
                        color = ImColor(255, 0, 0, 255); // Player is not visible, set color to aqua with lower alpha (150)
                    }

                    playerCount += 1; // Increment player count
                }
           
            long TeamID_Color;
            long TeamID_Color2;
        
            int alpha1 =255;
            int alpha2 = 130;
        
            if (playerData.screen.x - hpWidth < screenSize.width && playerData.screen.x + hpWidth > 0 && playerData.screen.y > 0 && playerData.screen.y < screenSize.height) {
                if (self.moduleControl->playerSwitch.infoStatus) {
                    switch (playerData.team) {
                            /*case NULL:
                             TeamID_Color =IM_COL32(0, 0, 0, alpha1);
                             break;*/
                        case NULL:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 1:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 2:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 3:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 4:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 5:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 6:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 7:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 8:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 9:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 10:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 11:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 12:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 13:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 14:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 15:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 16:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 17:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 18:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 19:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 20:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 21:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 22:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 23:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 24:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 25:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 26:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 27:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 28:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 29:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 30:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 31:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 32:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 33:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 34:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 35:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 36:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 37:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 38:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 39:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 40:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 41:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 42:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 43:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 44:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 45:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 46:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 47:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 48:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 49:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 50:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 51:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 52:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 53:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 54:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 55:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 56:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 57:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 58:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 59:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 60:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 61:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 62:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 63:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 64:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 65:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 66:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 67:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 68:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 69:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 70:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 71:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 72:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 73:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 74:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 75:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 76:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 77:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 78:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 79:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 80:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 81:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 82:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 83:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 84:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 85:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 86:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 87:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 88:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 89:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 90:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 91:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 92:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 93:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 94:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 95:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 96:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 97:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 98:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 99:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 100:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 101:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 102:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 103:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 104:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 105:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 106:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 107:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 108:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 109:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 110:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 111:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 112:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 113:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 114:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 115:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 116:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 117:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 118:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 119:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 120:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 121:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 122:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 123:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 124:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 125:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 126:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 127:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 128:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 129:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 130:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 131:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 132:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 133:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 134:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 135:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 136:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 137:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 138:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 139:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 140:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            //red(140)
                            
                        case 141:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 142:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 143:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 144:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 145:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 146:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 147:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 148:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 149:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 150:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 151:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 152:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 153:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 154:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 155:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 156:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 157:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 158:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 159:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 160:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 161:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 162:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 163:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 164:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 165:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 166:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 167:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 168:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 169:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 170:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 171:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 172:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 173:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 174:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 175:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 176:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 177:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 178:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 179:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 180:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 181:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 182:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 183:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 184:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 185:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 186:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 187:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 188:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 189:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 190:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 191:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 192:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 193:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 194:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 195:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 196:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 197:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 198:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 199:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 200:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 201:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 202:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 203:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 204:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 205:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 206:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 207:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 208:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 209:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 210:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 211:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 212:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 213:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 214:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 215:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 216:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 217:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 218:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 219:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 220:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 221:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 222:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 223:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 224:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 225:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 226:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 227:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 228:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 229:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 230:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 231:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 232:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 233:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 234:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 235:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 236:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 237:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 238:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 239:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 240:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 241:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 242:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 243:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 244:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 245:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                            
                        case 246:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 247:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 248:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 249:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 250:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 251:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 252:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                            
                        case 253:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 254:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 255:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 256:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 257:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 258:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 259:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 260:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 261:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 262:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 263:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 264:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 265:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 266:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 267:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 268:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 269:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 270:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 271:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 272:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 273:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 274:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 275:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 276:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 277:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 278:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 279:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 280:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 281:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 282:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 283:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 284:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 285:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 286:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 287:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 288:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 289:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 290:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 291:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 292:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 293:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 294:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 295:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 296:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 297:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 298:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 299:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 300:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 301:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 302:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 303:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 304:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 305:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 306:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 307:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 308:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 309:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 310:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 311:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 312:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 313:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 314:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 315:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 316:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 317:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 318:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 319:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 320:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 321:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 322:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 323:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 324:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 325:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 326:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 327:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 328:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 329:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 330:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 331:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 332:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 333:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 334:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 335:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 336:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                            /////
                        case 337:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 338:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 339:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 340:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 341:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 342:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 343:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 345:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 346:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 347:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 348:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case  349:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 350:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 351:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 352:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 353:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 354:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 355:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 356:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 357:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 358:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 359:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 360:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 361:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 362:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 363:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 364:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 365:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 366:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 367:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 368:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 369:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 370:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 371:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 372:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 373:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 374:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 375:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 376:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 377:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 378:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 379:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 380:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 381:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 382:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 383:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 384:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 385:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 386:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 387:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 388:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 389:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 390:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 391:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 392:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 393:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 394:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 395:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 396:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 397:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 398:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 399:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            //TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 400:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color =IM_COL32(test1, test2, test3, alpha1);
                            //TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            //    TeamID_Color2 =IM_COL32(test4, test5, test6, alpha2);
                            break;
                            
                        case 401:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            //TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 402:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 403:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 404:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            //TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 405:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            //TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 993:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 994:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                            
                        case 995:
                            TeamID_Color =IM_COL32(200, 185, 40, alpha1);
                            TeamID_Color2 =IM_COL32(185, 180, 70, alpha2);
                            break;
                            
                        case 996:
                            TeamID_Color =IM_COL32(100, 150, 70, alpha1);
                            TeamID_Color2 =IM_COL32(100, 190, 80, alpha2);
                            break;
                            
                        case 997:
                            TeamID_Color =IM_COL32(60, 165, 105, alpha1);
                            TeamID_Color2 =IM_COL32(70, 160, 100, alpha2);
                            break;
                            
                        case 998:
                            TeamID_Color =IM_COL32(75, 110, 150, alpha1);
                            TeamID_Color2 =IM_COL32(150, 190, 225, alpha2);
                            break;
                            
                        case 999:
                            TeamID_Color =IM_COL32(80, 60, 140, alpha1);
                            TeamID_Color2 =IM_COL32(150, 100, 220, alpha2);
                            break;
                            
                        case 1000:
                            TeamID_Color =IM_COL32(135, 60, 130, alpha1);
                            TeamID_Color2 =IM_COL32(150, 50, 160, alpha2);
                            break;
                            
                        case 1001:
                            TeamID_Color =IM_COL32(140, 70, 60, alpha1);
                            TeamID_Color2 =IM_COL32(200, 80, 80, alpha2);
                            break;
                    }
                    imDrawList->AddRectFilled({playerData.bonesData.head.x - 95 * asize, playerData.bonesData.head.y - 58 *asize+test2}, {playerData.bonesData.head.x + 95*asize+test3, playerData.bonesData.head.y - 29*asize},  TeamID_Color2, 1, 0);
                    imDrawList->AddRectFilled({playerData.bonesData.head.x - 95 * asize, playerData.bonesData.head.y - 58*asize+test2}, {playerData.bonesData.head.x - 45*asize+test3, playerData.bonesData.head.y - 29*asize}, TeamID_Color, 1, 0);
                    imDrawList->AddTriangleFilled(ImVec2(playerData.bonesData.head.x + 20 * asize / 2, playerData.bonesData.head.y - 28.5 *asize+test5 ), ImVec2(playerData.bonesData.head.x - 20 * asize / 2 , playerData.bonesData.head.y - 28.5 * asize+test6), ImVec2(playerData.bonesData.head.x + 0 / 2, playerData.bonesData.head.y - 11 * asize+test7), TeamID_Color2);
                    
                    
                    std::string s;
                    auto textSize = ImGui::CalcTextSize(s.c_str(), 0,30);
                    float fontsize= test4;
                    if(playerData.team== 0){
                        s += std::to_string(playerData.team);
                        
                        imDrawList->AddText(roboto, fontsize, ImVec2(playerData.bonesData.head.x - 93 * asize  - (playerData.bonesData.head.x / 2), (playerData.bonesData.head.y - 57 )* asize ), IM_COL32(0, 0, 0, 60),s.c_str());
                        //      draw->AddText(roboto_bold ,30,ImVec2(HeadPosSC.x - 92  - (textSize.x / 2), HeadPosSC.y - 58), IM_COL32(255, 255, 255, 255),s.c_str());
                        
                    }
                    else if(playerData.team < 10 ){
                        s +=" 0";
                        s += std::to_string(playerData.team);
                        //draw->AddText(roboto_bold ,28 ,ImVec2(HeadPosSC.x - 91  - (textSize.x / 2), HeadPosSC.y - 58 ), IM_COL32(0, 0, 0, 60),s.c_str());
                        imDrawList->AddText(roboto, fontsize,ImVec2(playerData.bonesData.head.x - 90.5  * asize - (textSize.x / 2), (playerData.bonesData.head.y - 57)* asize), IM_COL32(255, 255, 255, 255),s.c_str());
                        
                    }
                    else if(playerData.team < 100){
                        s+=" ";
                        s += std::to_string(playerData.team);
                        //draw->AddText(roboto_bold ,30 ,ImVec2(HeadPosSC.x - 91- (textSize.x / 2), HeadPosSC.y - 58), IM_COL32(0, 0, 0, 60),s.c_str());
                        imDrawList->AddText(roboto, fontsize,ImVec2(playerData.bonesData.head.x - 90.5 * asize - (textSize.x / 2), (playerData.bonesData.head.y - 57) * asize), IM_COL32(255, 255, 255, 255),s.c_str());
                        
                        
                    }    else {
                        s += std::to_string(playerData.team);
                        //draw->AddText(roboto_bold ,30 ,ImVec2(HeadPosSC.x - 91 - (textSize.x / 2), HeadPosSC.y - 58), IM_COL32(0, 0, 0, 60),s.c_str());
                        imDrawList->AddText(roboto, fontsize,ImVec2(playerData.bonesData.head.x - 90.5 * asize  - 1 - (textSize.x / 2), (playerData.bonesData.head.y - 57)* asize), IM_COL32(255, 255, 255, 255),s.c_str());
                        
                        
                    }
                    
                    std::string sw;
                    s +="";
                    s += std::to_string((int)playerData.distance);
                    s += " m";
                    
                    imDrawList->AddText({playerData.bonesData.head.x - (textSize.x / 2) , playerData.bonesData.head.y - test1}, IM_COL32(255, 0, 0, 255), sw.c_str());
                    
                    
                    
                    
                    std::string name;
                    if (playerData.robot) {
                        
                        name += " Bot";
                        
                    } else {
                        
                        name+= playerData.name;
                        
                        
                    }
                    
                    
                    
                    
                    
                    imDrawList->AddText(arial, fontsize,ImVec2(playerData.bonesData.head.x - 43 * asize + 1, (playerData.bonesData.head.y - 58)* asize+1 ), IM_COL32(0, 0, 0, 180),name.c_str());
                    
                    imDrawList->AddText(arial, fontsize,ImVec2(playerData.bonesData.head.x - 43 * asize, (playerData.bonesData.head.y - 58) * asize), IM_COL32(255, 255, 255, 255),name.c_str());
                    
                    int CurHP = (int) std::max(0, std::min((int) playerData.hp,100));
                int MaxHP = 100;
                long HpColor, HPBordersColor;
                long 血条颜色 = IM_COL32(255, 255, 255, 200);
                imDrawList->AddRectFilled({playerData.bonesData.head.x - 95 * asize, playerData.bonesData.head.y - 29 * asize }, {static_cast<float>(playerData.bonesData.head.x - 95 * asize  + (1.9 * CurHP * asize))  , playerData.bonesData.head.y - 29.1f * asize},血条颜色, 1, 0);
            
                imDrawList->AddRectFilled({playerData.bonesData.head.x - 95 * asize, playerData.bonesData.head.y - 29 * asize}, {static_cast<float>(playerData.bonesData.head.x - 95 *asize  + (1.9 * CurHP * asize)), playerData.bonesData.head.y - 30 * asize},血条颜色, 1, 0);
                    //end Health

                }
                                                                     

            if (self.moduleControl->playerSwitch.SCStatus) {
                  if (playerData.weaponName=="[预警]小心手雷") {
                      imDrawList->AddImage((__bridge ImTextureID) shouleiTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1 + test3), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1 + test3), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                  }
                  if (playerData.weaponName=="[机枪]大盘鸡") {
                      imDrawList->AddImage((__bridge ImTextureID) DP28Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1 + test3), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1 + test3), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                  }
                if (playerData.weaponName=="[机枪]大菠萝") {
                   imDrawList->AddImage((__bridge ImTextureID) M249Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[机枪]MG3") {
                   imDrawList->AddImage((__bridge ImTextureID) MG3Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[霰弹枪]S686") {
                   imDrawList->AddImage((__bridge ImTextureID) S686Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="Ace32") {
                   imDrawList->AddImage((__bridge ImTextureID) Ace32Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[霰弹枪]DBS") {
                   imDrawList->AddImage((__bridge ImTextureID) DBSTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[霰弹枪]S12K") {
                   imDrawList->AddImage((__bridge ImTextureID) S12KTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                     }
                if (playerData.weaponName=="[冲锋枪]Bison") {
                   imDrawList->AddImage((__bridge ImTextureID) YNTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[步枪]QBZ") {
                   imDrawList->AddImage((__bridge ImTextureID) QBZTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[步枪]M416") {
                   imDrawList->AddImage((__bridge ImTextureID) M416Texture, ImVec2(playerData.screen.x+160 - scWidth+4, playerData.screen.y-11 - playerData.size.y -5 - scHeight+3), ImVec2(playerData.screen.x+163 - scWidth+4 + scHeight-5 , playerData.screen.y-11 - playerData.size.y -8 - scHeight + scHeight-3), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]QBU") {
                   imDrawList->AddImage((__bridge ImTextureID) QBUTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]SLR") {
                   imDrawList->AddImage((__bridge ImTextureID) SLRTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]SKS") {
                   imDrawList->AddImage((__bridge ImTextureID) SKSTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]Mini14") {
                   imDrawList->AddImage((__bridge ImTextureID) MINITexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]M24") {
                   imDrawList->AddImage((__bridge ImTextureID) M24Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]Kar98k") {
                   imDrawList->AddImage((__bridge ImTextureID) K98Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]AWM") {
                   imDrawList->AddImage((__bridge ImTextureID) AWMTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]Mk14") {
                   imDrawList->AddImage((__bridge ImTextureID) MK14Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]莫辛纳甘") {
                   imDrawList->AddImage((__bridge ImTextureID) MOTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="[狙击枪]VSS") {
                   imDrawList->AddImage((__bridge ImTextureID) VSSTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                if (playerData.weaponName=="M762") {
                   imDrawList->AddImage((__bridge ImTextureID) M762Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="SCAR-L") {
                   imDrawList->AddImage((__bridge ImTextureID) SCARTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="M16A4") {
                   imDrawList->AddImage((__bridge ImTextureID) M16Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="Mk47") {
                   imDrawList->AddImage((__bridge ImTextureID) MK47Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y+15 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="Groza") {
                   imDrawList->AddImage((__bridge ImTextureID) GrozaTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y+15 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="AUG") {
                   imDrawList->AddImage((__bridge ImTextureID) AUGTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y+15 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="AKM") {
                   imDrawList->AddImage((__bridge ImTextureID) AkmTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                if (playerData.weaponName=="[投掷物]手雷") {
                   imDrawList->AddImage((__bridge ImTextureID) leiTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="yan") {
                   imDrawList->AddImage((__bridge ImTextureID) yanTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="Huo") {
                   imDrawList->AddImage((__bridge ImTextureID) huoTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                if (playerData.weaponName=="GUO") {
                   imDrawList->AddImage((__bridge ImTextureID) GUOTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                if (playerData.weaponName=="LIAN") {
                   imDrawList->AddImage((__bridge ImTextureID) LIANTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                if (playerData.weaponName=="DAO") {
                   imDrawList->AddImage((__bridge ImTextureID) DAOTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="GUN") {
                   imDrawList->AddImage((__bridge ImTextureID) GUNTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="MP5K") {
                   imDrawList->AddImage((__bridge ImTextureID) MP5KTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="TommyGun") {
                   imDrawList->AddImage((__bridge ImTextureID) TANGTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="UMP9") {
                   imDrawList->AddImage((__bridge ImTextureID) UMP9Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                if (playerData.weaponName=="Uzi") {
                   imDrawList->AddImage((__bridge ImTextureID) UZITexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="Vector") {
                   imDrawList->AddImage((__bridge ImTextureID) VKTTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                if (playerData.weaponName=="P92") {
                   imDrawList->AddImage((__bridge ImTextureID) P92Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="P1911") {
                   imDrawList->AddImage((__bridge ImTextureID) P1911Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="R1895") {
                   imDrawList->AddImage((__bridge ImTextureID) R1895Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="P18C") {
                   imDrawList->AddImage((__bridge ImTextureID) P18CTexture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                if (playerData.weaponName=="R45") {
                   imDrawList->AddImage((__bridge ImTextureID) R45Texture, ImVec2(playerData.screen.x+160 - scWidth+1, playerData.screen.y-11 - playerData.size.y -5 - scHeight+1), ImVec2(playerData.screen.x+160 - scWidth+1 + scHeight-2 , playerData.screen.y-11 - playerData.size.y -5 - scHeight + scHeight-1), ImVec2(0.0f, 0.0f), ImVec2(1.0f, 1.0f));
                }
                
                }
              
                }
            
            if (self.moduleControl->playerSwitch.boxStatus) {
float boxHeight = abs(playerData.bonesData.head.y - playerData.bonesData.lankle.y);
float boxWidth = boxHeight * 0.65f;
Box4Line(imDrawList, 0.5f, playerData.bonesData.head.x - (boxWidth / 2), playerData.bonesData.head.y, boxWidth, boxHeight, color);
}
        
            
                //绘制射线
                if (self.moduleControl->playerSwitch.lineStatus) {
                    if (playerData.hp<=1){
                    imDrawList->AddLine(ImVec2(screenSize.width / 2, 120), ImVec2(playerData.screen.x, playerData.screen.y - playerData.size.y-90), ImColor(255,255,255), 2.0f);
                }else{
                    imDrawList->AddLine(ImVec2(screenSize.width / 2, 120), ImVec2(playerData.screen.x, playerData.screen.y - playerData.size.y-90), color, 2.0f);
                }
                }
               
                if (self.moduleControl->playerSwitch.boneStatus) {
                    imDrawList->AddLine({playerData.bonesData.head.x, playerData.bonesData.head.y}, {playerData.bonesData.pit.x, playerData.bonesData.pit.y}, color, 2.0f);
                    imDrawList->AddLine({playerData.bonesData.pit.x, playerData.bonesData.pit.y}, {playerData.bonesData.pelvis.x, playerData.bonesData.pelvis.y}, color, 2.0f);
                    
                    imDrawList->AddLine({playerData.bonesData.pit.x, playerData.bonesData.pit.y}, {playerData.bonesData.lcollar.x, playerData.bonesData.lcollar.y}, color, 2.0f);
                    imDrawList->AddLine({playerData.bonesData.lcollar.x, playerData.bonesData.lcollar.y}, {playerData.bonesData.lelbow.x, playerData.bonesData.lelbow.y}, color,2.0f);
                    imDrawList->AddLine({playerData.bonesData.lelbow.x, playerData.bonesData.lelbow.y}, {playerData.bonesData.lwrist.x, playerData.bonesData.lwrist.y}, color, 2.0f);
                    
                    imDrawList->AddLine({playerData.bonesData.pit.x, playerData.bonesData.pit.y}, {playerData.bonesData.rcollar.x, playerData.bonesData.rcollar.y}, color, 2.0f);
                    imDrawList->AddLine({playerData.bonesData.rcollar.x, playerData.bonesData.rcollar.y}, {playerData.bonesData.relbow.x, playerData.bonesData.relbow.y}, color, 2.0f);
                    imDrawList->AddLine({playerData.bonesData.relbow.x, playerData.bonesData.relbow.y}, {playerData.bonesData.rwrist.x, playerData.bonesData.rwrist.y}, color,2.0f);
                    
                    imDrawList->AddLine({playerData.bonesData.pelvis.x, playerData.bonesData.pelvis.y}, {playerData.bonesData.lthigh.x, playerData.bonesData.lthigh.y}, color,2.0f);
                    imDrawList->AddLine({playerData.bonesData.lthigh.x, playerData.bonesData.lthigh.y}, {playerData.bonesData.lknee.x, playerData.bonesData.lknee.y}, color, 2.0f);
                    imDrawList->AddLine({playerData.bonesData.lknee.x, playerData.bonesData.lknee.y}, {playerData.bonesData.lankle.x, playerData.bonesData.lankle.y}, color, 2.0f);
                    
                    imDrawList->AddLine({playerData.bonesData.pelvis.x, playerData.bonesData.pelvis.y}, {playerData.bonesData.rthigh.x, playerData.bonesData.rthigh.y}, color, 2.0f);
                    imDrawList->AddLine({playerData.bonesData.rthigh.x, playerData.bonesData.rthigh.y}, {playerData.bonesData.rknee.x, playerData.bonesData.rknee.y}, color, 2.0f);
                    imDrawList->AddLine({playerData.bonesData.rknee.x, playerData.bonesData.rknee.y}, {playerData.bonesData.rankle.x, playerData.bonesData.rankle.y}, color, 2.0f);
                }
            
            
              if (self.moduleControl->playerSwitch.backStatus) {//背敌预警
                ImVec2 backAngle = rotateCoord(playerData.angle,ImVec2(300, 0));
                
                ImVec2 backAngle1 = rotateCoord(playerData.angle, ImVec2(305, 0));
                
                ImVec2 triangle1;
                triangle1 = rotateCoord(playerData.angle - 130, ImVec2(30, 0));
                triangle1.x += screenSize.width / 2 + backAngle.x;
                triangle1.y += screenSize.height / 2 + backAngle.y;

                ImVec2 triangle;
                triangle = rotateCoord(playerData.angle, ImVec2(40, 0));
                triangle.x += screenSize.width / 2 + backAngle.x;
                triangle.y += screenSize.height / 2 + backAngle.y;

                ImVec2 triangle2;
                triangle2 = rotateCoord(playerData.angle + 130, ImVec2(30, 0));
                triangle2.x += screenSize.width / 2 + backAngle.x;
                triangle2.y += screenSize.height / 2 + backAngle.y;
                    
                if(playerData.hp<=1){
                imDrawList->AddTriangleFilled(triangle1, triangle, triangle2, ImColor(143,143,143));//三角形
              //  imDrawList->AddTriangle(triangle1, triangle, triangle2, ImColor(0, 0, 0, 255),2);
                }else{
                imDrawList->AddTriangleFilled(triangle1, triangle, triangle2, color);//三角形
               // imDrawList->AddTriangle(triangle1, triangle, triangle2, ImColor(0, 0, 0, 255),2);
                }
                std::string str = std::to_string(playerData.distance);
            }
        }
        
        //绘制人数
      
        ImGui::SetWindowFontScale(1.6f);

        if (!self.moduleControl->aimbotController.fallNotAim) {
            std::string coun1;
            coun1+="Aimknockdown : On";

            ImVec2 textSize = ImGui::CalcTextSize(coun1.c_str());
             float CenterX =  (screenSize.width / 2)-130;
             float TextY = 3.0 + countTexture.height / 2;
            
            float font_size=35;

            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY + 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY - 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY - 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY + 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY ), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY + 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY - 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY), ImColor(255, 255, 255), coun1.c_str(), NULL, 0.0f, NULL);
        }
      
        if(playerCount + robotCount >0){
            std::string coun1;
            coun1+="  ";
            coun1+=std::to_string((int)playerCount + robotCount);
            coun1+="Players in ";
            coun1+=std::to_string((int)self.moduleControl->aimbotController.distance);
            coun1+=" m";
            
            ImVec2 textSize = ImGui::CalcTextSize(coun1.c_str());
             float CenterX =  (screenSize.width / 2)-200;
             float TextY = 30.0 + countTexture.height / 2;
            
            float font_size=48;
            CenterX+=test6;
           font_size+=test5;

            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY + 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY - 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY - 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY + 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY ), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY + 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX , TextY - 1), IM_COL32(0, 0, 0, 255), coun1.c_str());
            imDrawList->AddText(bold2, font_size, ImVec2(CenterX, TextY), ImColor(224, 166, 66), coun1.c_str(), NULL, 0.0f, NULL);

            std::string ss = ICON_FA_EXCLAMATION_TRIANGLE;
            imDrawList->AddText(icon, font_size, ImVec2(CenterX-30, TextY+1), ImColor(0, 0, 0, 255), ss.c_str());
            imDrawList->AddText(icon, font_size, ImVec2(CenterX-30, TextY-1), ImColor(0, 0, 0, 255), ss.c_str());
            imDrawList->AddText(icon, font_size, ImVec2(CenterX-30, TextY-1), ImColor(0, 0, 0, 255), ss.c_str());
            imDrawList->AddText(icon, font_size, ImVec2(CenterX-30, TextY+1), ImColor(0, 0, 0, 255), ss.c_str());
            imDrawList->AddText(icon, font_size, ImVec2(CenterX-30, TextY), ImColor(224, 166, 66, 255), ss.c_str());

            
        }
       
    }

   
if (self.moduleControl->mainSwitch.aimbotStatus) {
        if (self.moduleControl->aimbotController.showAimbotRadius) {
   imDrawList->AddCircle(ImVec2(screenSize.width / 2, screenSize.height / 2), self.moduleControl->aimbotController.aimbotRadius, IM_COL32(250, 100, 100,210), 0, 1.3f);
        }
    }
    
         ImGui::End();
}




-(void)initImageTexture: (id<MTLDevice>)device {
    NSData *countData = [[NSData alloc] initWithBase64EncodedString:countDataBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    countTexture = [self loadImageTexture : device : (void*)[countData bytes] : [countData length]];
    
    NSData *countData1 = [[NSData alloc] initWithBase64EncodedString:countData1Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    count1Texture = [self loadImageTexture : device : (void*)[countData1 bytes] : [countData1 length]];
    
    NSData *countData2 = [[NSData alloc] initWithBase64EncodedString:countData2Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    count2Texture = [self loadImageTexture : device : (void*)[countData2 bytes] : [countData2 length]];
    
    NSData *countData3 = [[NSData alloc] initWithBase64EncodedString:countData3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    count3Texture = [self loadImageTexture : device : (void*)[countData3 bytes] : [countData3 length]];
    
    NSData *countData4 = [[NSData alloc] initWithBase64EncodedString:countData4Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    count4Texture = [self loadImageTexture : device : (void*)[countData4 bytes] : [countData4 length]];
    
    NSData *countData5 = [[NSData alloc] initWithBase64EncodedString:countData5Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    count5Texture = [self loadImageTexture : device : (void*)[countData5 bytes] : [countData5 length]];
    
    NSData *quan = [[NSData alloc] initWithBase64EncodedString:quanBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    quanTexture = [self loadImageTexture : device : (void*)[quan bytes] : [quan length]];
    
    NSData *shoulei = [[NSData alloc] initWithBase64EncodedString:shouleiBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    shouleiTexture = [self loadImageTexture : device : (void*)[shoulei bytes] : [shoulei length]];
    
    NSData *playerData = [[NSData alloc] initWithBase64EncodedString:playerDataBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    playerTexture = [self loadImageTexture : device : (void*)[playerData bytes] : [playerData length]];
    
    NSData *robotData = [[NSData alloc] initWithBase64EncodedString:robotDataBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    robotTexture = [self loadImageTexture : device : (void*)[robotData bytes] : [robotData length]];
    //手持武器
    NSData *M416 = [[NSData alloc] initWithBase64EncodedString:M416Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    M416Texture = [self loadImageTexture : device : (void*)[M416 bytes] : [M416 length]];

    NSData *Ace32 = [[NSData alloc] initWithBase64EncodedString:Ace32Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    Ace32Texture = [self loadImageTexture : device : (void*)[Ace32 bytes] : [Ace32 length]];
    
    NSData *M16 = [[NSData alloc] initWithBase64EncodedString:M16Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    M16Texture = [self loadImageTexture : device : (void*)[M16 bytes] : [M16 length]];

    NSData *Groza = [[NSData alloc] initWithBase64EncodedString:GrozaBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    GrozaTexture = [self loadImageTexture : device : (void*)[Groza bytes] : [Groza length]];

    NSData *Akm = [[NSData alloc] initWithBase64EncodedString:AkmBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    AkmTexture = [self loadImageTexture : device : (void*)[Akm bytes] : [Akm length]];

    NSData *SCAR = [[NSData alloc] initWithBase64EncodedString:SCARBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    SCARTexture = [self loadImageTexture : device : (void*)[SCAR bytes] : [SCAR length]];

    NSData *MK47 = [[NSData alloc] initWithBase64EncodedString:MK47Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    MK47Texture = [self loadImageTexture : device : (void*)[MK47 bytes] : [MK47 length]];

    NSData *AUG = [[NSData alloc] initWithBase64EncodedString:AUGBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    AUGTexture = [self loadImageTexture : device : (void*)[AUG bytes] : [AUG length]];

    NSData *M762 = [[NSData alloc] initWithBase64EncodedString:M762Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    M762Texture = [self loadImageTexture : device : (void*)[M762 bytes] : [M762 length]];
    
    NSData *QBZ = [[NSData alloc] initWithBase64EncodedString:QBZBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    QBZTexture = [self loadImageTexture : device : (void*)[QBZ bytes] : [QBZ length]];
    
    NSData *lei = [[NSData alloc] initWithBase64EncodedString:leiBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    leiTexture = [self loadImageTexture : device : (void*)[lei bytes] : [lei length]];
  
    NSData *huo = [[NSData alloc] initWithBase64EncodedString:huoBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    huoTexture = [self loadImageTexture : device : (void*)[huo bytes] : [huo length]];

    NSData *yan = [[NSData alloc] initWithBase64EncodedString:yanBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    yanTexture = [self loadImageTexture : device : (void*)[yan bytes] : [yan length]];

    NSData *shan = [[NSData alloc] initWithBase64EncodedString:shanBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    shanTexture = [self loadImageTexture : device : (void*)[shan bytes] : [shan length]];

    NSData *R1895 = [[NSData alloc] initWithBase64EncodedString:R1895Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    R1895Texture = [self loadImageTexture : device : (void*)[R1895 bytes] : [R1895 length]];

    NSData *P92 = [[NSData alloc] initWithBase64EncodedString:P92Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    P92Texture = [self loadImageTexture : device : (void*)[P92 bytes] : [P92 length]];

    NSData *P1911 = [[NSData alloc] initWithBase64EncodedString:P1911Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    P1911Texture = [self loadImageTexture : device : (void*)[P1911 bytes] : [P1911 length]];

    NSData *P18C = [[NSData alloc] initWithBase64EncodedString:P18CBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    P18CTexture = [self loadImageTexture : device : (void*)[P18C bytes] : [P18C length]];

    NSData *R45 = [[NSData alloc] initWithBase64EncodedString:R45Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    R45Texture = [self loadImageTexture : device : (void*)[R45 bytes] : [R45 length]];
 
    NSData *SKS = [[NSData alloc] initWithBase64EncodedString:SKSBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    SKSTexture = [self loadImageTexture : device : (void*)[SKS bytes] : [SKS length]];

    NSData *MINI = [[NSData alloc] initWithBase64EncodedString:MINIBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    MINITexture = [self loadImageTexture : device : (void*)[MINI bytes] : [MINI length]];

    NSData *MK14 = [[NSData alloc] initWithBase64EncodedString:MK14Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    MK14Texture = [self loadImageTexture : device : (void*)[MK14 bytes] : [MK14 length]];

    NSData *VSS = [[NSData alloc] initWithBase64EncodedString:VSSBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    VSSTexture = [self loadImageTexture : device : (void*)[VSS bytes] : [VSS length]];

    NSData *QBU = [[NSData alloc] initWithBase64EncodedString:QBUBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    QBUTexture = [self loadImageTexture : device : (void*)[QBU bytes] : [QBU length]];

    NSData *SLR = [[NSData alloc] initWithBase64EncodedString:SLRBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    SLRTexture = [self loadImageTexture : device : (void*)[SLR bytes] : [SLR length]];

    NSData *AWM = [[NSData alloc] initWithBase64EncodedString:AWMBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    AWMTexture = [self loadImageTexture : device : (void*)[AWM bytes] : [AWM length]];

    NSData *K98 = [[NSData alloc] initWithBase64EncodedString:K98Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    K98Texture = [self loadImageTexture : device : (void*)[K98 bytes] : [K98 length]];

    NSData *MO = [[NSData alloc] initWithBase64EncodedString:MOBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    MOTexture = [self loadImageTexture : device : (void*)[MO bytes] : [MO length]];

    NSData *LIAN = [[NSData alloc] initWithBase64EncodedString:LIANBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    LIANTexture = [self loadImageTexture : device : (void*)[LIAN bytes] : [LIAN length]];

    NSData *GUN = [[NSData alloc] initWithBase64EncodedString:GUNBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    GUNTexture = [self loadImageTexture : device : (void*)[GUN bytes] : [GUN length]];
 
    NSData *DAO = [[NSData alloc] initWithBase64EncodedString:DAOBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    DAOTexture = [self loadImageTexture : device : (void*)[DAO bytes] : [DAO length]];

    NSData *GUO = [[NSData alloc] initWithBase64EncodedString:GUOBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    GUOTexture = [self loadImageTexture : device : (void*)[GUO bytes] : [GUO length]];

    NSData *UZI = [[NSData alloc] initWithBase64EncodedString:UZIBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UZITexture = [self loadImageTexture : device : (void*)[UZI bytes] : [UZI length]];

    NSData *TANG = [[NSData alloc] initWithBase64EncodedString:TANGBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    TANGTexture = [self loadImageTexture : device : (void*)[TANG bytes] : [TANG length]];

    NSData *VKT = [[NSData alloc] initWithBase64EncodedString:VKTBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    VKTTexture = [self loadImageTexture : device : (void*)[VKT bytes] : [VKT length]];

    NSData *MP5K = [[NSData alloc] initWithBase64EncodedString:MP5KBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    MP5KTexture = [self loadImageTexture : device : (void*)[MP5K bytes] : [MP5K length]];

    NSData *UMP9 = [[NSData alloc] initWithBase64EncodedString:UMP9Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UMP9Texture = [self loadImageTexture : device : (void*)[UMP9 bytes] : [UMP9 length]];

    NSData *YN = [[NSData alloc] initWithBase64EncodedString:YNBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    YNTexture = [self loadImageTexture : device : (void*)[YN bytes] : [YN length]];
    
    NSData *M24 = [[NSData alloc] initWithBase64EncodedString:M24Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    M24Texture = [self loadImageTexture : device : (void*)[M24 bytes] : [M24 length]];

    NSData *DP28 = [[NSData alloc] initWithBase64EncodedString:DP28Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    DP28Texture = [self loadImageTexture : device : (void*)[DP28 bytes] : [DP28 length]];

    NSData *MG3 = [[NSData alloc] initWithBase64EncodedString:MG3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    MG3Texture = [self loadImageTexture : device : (void*)[MG3 bytes] : [MG3 length]];

    NSData *M249 = [[NSData alloc] initWithBase64EncodedString:M249Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    M249Texture = [self loadImageTexture : device : (void*)[M249 bytes] : [M249 length]];

    NSData *DBS = [[NSData alloc] initWithBase64EncodedString:DBSBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    DBSTexture = [self loadImageTexture : device : (void*)[DBS bytes] : [DBS length]];

    NSData *S686 = [[NSData alloc] initWithBase64EncodedString:S686Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    S686Texture = [self loadImageTexture : device : (void*)[S686 bytes] : [S686 length]];

    NSData *S12K = [[NSData alloc] initWithBase64EncodedString:S12KBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    S12KTexture = [self loadImageTexture : device : (void*)[S12K bytes] : [S12K length]];

    //载具
    NSData *JP = [[NSData alloc] initWithBase64EncodedString:JPBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    JPTexture = [self loadImageTexture : device : (void*)[JP bytes] : [JP length]];

    NSData *BB = [[NSData alloc] initWithBase64EncodedString:BBBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    BBTexture = [self loadImageTexture : device : (void*)[BB bytes] : [BB length]];

    NSData *jc = [[NSData alloc] initWithBase64EncodedString:jcBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    jcTexture = [self loadImageTexture : device : (void*)[jc bytes] : [jc length]];
    
    NSData *mtt = [[NSData alloc] initWithBase64EncodedString:mttBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    mttTexture = [self loadImageTexture : device : (void*)[mtt bytes] : [mtt length]];
    
    NSData *mt = [[NSData alloc] initWithBase64EncodedString:mtBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    mtTexture = [self loadImageTexture : device : (void*)[mt bytes] : [mt length]];
    
    NSData *my = [[NSData alloc] initWithBase64EncodedString:myBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    myTexture = [self loadImageTexture : device : (void*)[my bytes] : [my length]];
    
    NSData *R8 = [[NSData alloc] initWithBase64EncodedString:R8Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    R8Texture = [self loadImageTexture : device : (void*)[R8 bytes] : [R8 length]];
    
    NSData *mt3 = [[NSData alloc] initWithBase64EncodedString:mt3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    mt3Texture = [self loadImageTexture : device : (void*)[mt3 bytes] : [mt3 length]];
    
    NSData *m416 = [[NSData alloc] initWithBase64EncodedString:m416Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    m416Texture = [self loadImageTexture : device : (void*)[m416 bytes] : [m416 length]];

    NSData *akm = [[NSData alloc] initWithBase64EncodedString:akmBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    akmTexture = [self loadImageTexture : device : (void*)[akm bytes] : [akm length]];
    
    NSData *aug = [[NSData alloc] initWithBase64EncodedString:augBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    augTexture = [self loadImageTexture : device : (void*)[aug bytes] : [aug length]];
    
    NSData *groza = [[NSData alloc] initWithBase64EncodedString:grozaBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    grozaTexture = [self loadImageTexture : device : (void*)[groza bytes] : [groza length]];
    
    NSData *m16 = [[NSData alloc] initWithBase64EncodedString:m16Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    m16Texture = [self loadImageTexture : device : (void*)[m16 bytes] : [m16 length]];
    
    NSData *m24 = [[NSData alloc] initWithBase64EncodedString:m24Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    m24Texture = [self loadImageTexture : device : (void*)[m24 bytes] : [m24 length]];
    
    NSData *m249 = [[NSData alloc] initWithBase64EncodedString:m249Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    m249Texture = [self loadImageTexture : device : (void*)[m249 bytes] : [m249 length]];
    
    NSData *m762 = [[NSData alloc] initWithBase64EncodedString:m762Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    m762Texture = [self loadImageTexture : device : (void*)[m762 bytes] : [m762 length]];
    
    NSData *mg3 = [[NSData alloc] initWithBase64EncodedString:mg3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    mg3Texture = [self loadImageTexture : device : (void*)[mg3 bytes] : [mg3 length]];
    
    NSData *mini = [[NSData alloc] initWithBase64EncodedString:miniBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    miniTexture = [self loadImageTexture : device : (void*)[mini bytes] : [mini length]];
    
    NSData *mk14 = [[NSData alloc] initWithBase64EncodedString:mk14Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    mk14Texture = [self loadImageTexture : device : (void*)[mk14 bytes] : [mk14 length]];
    
    NSData *mk47 = [[NSData alloc] initWithBase64EncodedString:mk47Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    mk47Texture = [self loadImageTexture : device : (void*)[mk47 bytes] : [mk47 length]];
    
    NSData *scar = [[NSData alloc] initWithBase64EncodedString:scarBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    scarTexture = [self loadImageTexture : device : (void*)[scar bytes] : [scar length]];
    
    NSData *slr = [[NSData alloc] initWithBase64EncodedString:slrBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    slrTexture = [self loadImageTexture : device : (void*)[slr bytes] : [slr length]];
    
    NSData *awm = [[NSData alloc] initWithBase64EncodedString:awmBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    awmTexture = [self loadImageTexture : device : (void*)[awm bytes] : [awm length]];
    
    NSData *dp28 = [[NSData alloc] initWithBase64EncodedString:dp28Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    dp28Texture = [self loadImageTexture : device : (void*)[dp28 bytes] : [dp28 length]];
    
    NSData *k98 = [[NSData alloc] initWithBase64EncodedString:k98Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    k98Texture = [self loadImageTexture : device : (void*)[k98 bytes] : [k98 length]];
    
    NSData *vss = [[NSData alloc] initWithBase64EncodedString:vssBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    vssTexture = [self loadImageTexture : device : (void*)[vss bytes] : [vss length]];
    
    NSData *sks = [[NSData alloc] initWithBase64EncodedString:sksBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    sksTexture = [self loadImageTexture : device : (void*)[sks bytes] : [sks length]];
    
    NSData *hz = [[NSData alloc] initWithBase64EncodedString:hzBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    hzTexture = [self loadImageTexture : device : (void*)[hz bytes] : [hz length]];
    
    
    NSData *yl = [[NSData alloc] initWithBase64EncodedString:ylBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    ylTexture = [self loadImageTexture : device : (void*)[yl bytes] : [yl length]];

    NSData *jjb = [[NSData alloc] initWithBase64EncodedString:jjbBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    jjbTexture = [self loadImageTexture : device : (void*)[jjb bytes] : [jjb length]];
    
    NSData *zty = [[NSData alloc] initWithBase64EncodedString:ztyBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    ztyTexture = [self loadImageTexture : device : (void*)[zty bytes] : [zty length]];
    
    NSData *zhen = [[NSData alloc] initWithBase64EncodedString:zhenBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    zhenTexture = [self loadImageTexture : device : (void*)[zhen bytes] : [zhen length]];
    
    NSData *ylx = [[NSData alloc] initWithBase64EncodedString:ylxBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    ylxTexture = [self loadImageTexture : device : (void*)[ylx bytes] : [ylx length]];
    
    NSData *b4 = [[NSData alloc] initWithBase64EncodedString:b4Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    b4Texture = [self loadImageTexture : device : (void*)[b4 bytes] : [b4 length]];

    NSData *b3 = [[NSData alloc] initWithBase64EncodedString:b3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    b3Texture = [self loadImageTexture : device : (void*)[b3 bytes] : [b3 length]];

    NSData *b6 = [[NSData alloc] initWithBase64EncodedString:b6Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    b6Texture = [self loadImageTexture : device : (void*)[b6 bytes] : [b6 length]];

    NSData *b8 = [[NSData alloc] initWithBase64EncodedString:b8Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    b8Texture = [self loadImageTexture : device : (void*)[b8 bytes] : [b8 length]];

    NSData *kt = [[NSData alloc] initWithBase64EncodedString:ktBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    ktTexture = [self loadImageTexture : device : (void*)[kt bytes] : [kt length]];

    NSData *t3 = [[NSData alloc] initWithBase64EncodedString:t3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    t3Texture = [self loadImageTexture : device : (void*)[t3 bytes] : [t3 length]];

    NSData *j3 = [[NSData alloc] initWithBase64EncodedString:j3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    j3Texture = [self loadImageTexture : device : (void*)[j3 bytes] : [j3 length]];

    NSData *bb3 = [[NSData alloc] initWithBase64EncodedString:bb3Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    bb3Texture = [self loadImageTexture : device : (void*)[bb3 bytes] : [bb3 length]];

    NSData *tlei = [[NSData alloc] initWithBase64EncodedString:tleiBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    tleiTexture = [self loadImageTexture : device : (void*)[tlei bytes] : [tlei length]];

    NSData *tyan = [[NSData alloc] initWithBase64EncodedString:tyanBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    tyanTexture = [self loadImageTexture : device : (void*)[tyan bytes] : [tyan length]];

    NSData *thuo = [[NSData alloc] initWithBase64EncodedString:thuoBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    thuoTexture = [self loadImageTexture : device : (void*)[thuo bytes] : [thuo length]];

    NSData *leizha = [[NSData alloc] initWithBase64EncodedString:leizhaBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    leizhaTexture = [self loadImageTexture : device : (void*)[leizha bytes] : [leizha length]];

    NSData *hongzha = [[NSData alloc] initWithBase64EncodedString:hongzhaBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    hongzhaTexture = [self loadImageTexture : device : (void*)[hongzha bytes] : [hongzha length]];

    NSData *sld = [[NSData alloc] initWithBase64EncodedString:sldBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    sldTexture = [self loadImageTexture : device : (void*)[sld bytes] : [sld length]];

    NSData *ywd = [[NSData alloc] initWithBase64EncodedString:ywdBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    ywdTexture = [self loadImageTexture : device : (void*)[ywd bytes] : [ywd length]];

    NSData *rsp = [[NSData alloc] initWithBase64EncodedString:rspBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    rspTexture = [self loadImageTexture : device : (void*)[rsp bytes] : [rsp length]];


}

-(id<MTLTexture>)loadImageTexture:(id<MTLDevice>)device :(void*) imageData :(size_t) fileDataSize {
    int width, height;
    unsigned char *pixels = stbi_load_from_memory((stbi_uc const *)imageData, (int)fileDataSize, &width, &height, NULL, 4);

    MTLTextureDescriptor *textureDescriptor = [MTLTextureDescriptor texture2DDescriptorWithPixelFormat:MTLPixelFormatRGBA8Unorm
                                                                                                 width:(NSUInteger)width
                                                                                                height:(NSUInteger)height
                                                                                             mipmapped:NO];
    textureDescriptor.usage = MTLTextureUsageShaderRead;
    textureDescriptor.storageMode = MTLStorageModeShared;
    id<MTLTexture> texture = [device newTextureWithDescriptor:textureDescriptor];
    [texture replaceRegion:MTLRegionMake2D(0, 0, (NSUInteger)width, (NSUInteger)height) mipmapLevel:0 withBytes:pixels bytesPerRow:(NSUInteger)width * 4];
    
    return texture;
}


@end
