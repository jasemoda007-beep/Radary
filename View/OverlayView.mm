//
//  DrawView.m
//  PubgDolphins
//
//  Created by xbk on 2022/4/24.
//
#import "OverlayView.h"
#import "arial.h"
//#import "ZGScreenInfoz.h"
#import "Roboto_Bold.h"
#import "OPPOSans-H.h"
#import "Iconcpp.h"
//#import "API.h"
ImFont* arial;
ImFont* roboto;
ImFont* countfont;
ImFont* bold2;
ImFont* icon;
//#import "LLToastView.h"
@implementation OverlayView
- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control :(mao*)draw :(mi*)menu {
    
    self.moduleControl = control;
    
    self.mao = draw;
    self.mi = menu;
    
 
    
    if (self = [super initWithFrame:frame]) {
        //清空颜色
        self.backgroundColor = [UIColor clearColor];
        //设置帧率限制
        self.preferredFramesPerSecond = 120;
        
        
        self.device = MTLCreateSystemDefaultDevice();
        if (!self.device) {
            return NULL;
        }
        self.delegate = self;
        
        self.commandQueue = [self.device newCommandQueue];
        self.loader = [[MTKTextureLoader alloc] initWithDevice: self.device];

        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        //
        ImGuiIO& io = ImGui::GetIO();
        ImFontConfig config;
        config.FontDataOwnedByAtlas = false;
        ImFontConfig font_config;
                static const ImWchar icons_ranges[] = { 0xf000, 0xf3ff, 0 };
                static const ImWchar ranges[] =
{
    0x0020, static_cast<ImWchar>(0x10FFFF),//almost language of utf8 range
    0,
};
        
        ImFontConfig icons_config;

        ImFontConfig CustomFont;
        CustomFont.FontDataOwnedByAtlas = false;

        icons_config.MergeMode = true;
        icons_config.PixelSnapH = true;
        icons_config.OversampleH = 2.5;
        icons_config.OversampleV = 2.5;
        
        arial = io.Fonts->AddFontFromMemoryTTF((void *) arial_data, arial_size , 16.0f, &font_config, ranges);
        roboto = io.Fonts->AddFontFromMemoryTTF((void *) roboto_data,roboto_size , 16.0f, &font_config, io.Fonts->GetGlyphRangesKorean());
        bold2 = io.Fonts->AddFontFromMemoryTTF((void *) OPPOSans_H, OPPOSans_H_size , 35.0f, &font_config, io.Fonts->GetGlyphRangesCyrillic());
        icon = io.Fonts->AddFontFromMemoryCompressedTTF(font_awesome_data, font_awesome_size, 25.0f, &icons_config, icons_ranges);
        
        io.DisplaySize.x =  self.frame.size.width * UIScreen.mainScreen.nativeScale;
        io.DisplaySize.y =  self.frame.size.height * UIScreen.mainScreen.nativeScale;
        
        // Setup Dear ImGui style
        setDarkTheme();
        
        // Setup Renderer backend
        ImGui_ImplMetal_Init(self.device);
        
        [self.mao initImageTexture:self.device];
        [self.mi setOverlayView:self];
        
    }
    return self;
}

+ (void)load
{
    
    
    API *APIClient = [API sharedClient];
        [APIClient setToken:@"d41d8cd98f00b204e9800998ecf8427epum"];
        [APIClient paid:^{
           // Handle payment success
        }];
}

- (void)drawInMTKView:(MTKView *)view {
    
    //清除颜色
    view.clearColor = MTLClearColorMake(0.0f, 0.0f, 0.0f, 0.0f);
    //计算fps
    struct timespec current_timespec;
    static double g_Time = 0.0;
    clock_gettime(CLOCK_MONOTONIC, &current_timespec);
    double current_time = (double)(current_timespec.tv_sec) + (current_timespec.tv_nsec / 1000000000.0);
    ImGui::GetIO().DeltaTime = g_Time > 0.0 ? (float)(current_time - g_Time) : (float)(1.0f / 120.0f);
    g_Time = current_time;
    
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    
    MTLRenderPassDescriptor *renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil) {
        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
        ImGui::NewFrame();
        
        if(self.moduleControl->menuStatus){
            [self.mi drawMenuWindow];
        }
        [self.mao drawDrawWindow];
   
        
        //渲染
        ImGui::Render();
        ImDrawData *drawData = ImGui::GetDrawData();
        id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:@"SwiftGUI"];
        ImGui_ImplMetal_RenderDrawData(drawData, commandBuffer, renderEncoder);
        
        [renderEncoder popDebugGroup];
        [renderEncoder endEncoding];
        [commandBuffer presentDrawable:view.currentDrawable];
    }
    [commandBuffer commit];
}

-(void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size {
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    
    if (hitView == self && !self.moduleControl->menuStatus) {
        return nil; // 此处返回空即不相应任何事件
    }
    return hitView;
}

-(void)updateIOWithTouchEvent:(UIEvent *)event {
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self];
    ImGuiIO &io = ImGui::GetIO();
    io.AddMousePosEvent(touchLocation.x * UIScreen.mainScreen.nativeScale, touchLocation.y * UIScreen.mainScreen.nativeScale);
    
    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches) {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled) {
            hasActiveTouch = YES;
            break;
        }
    }
    io.AddMouseButtonEvent(0, hasActiveTouch);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self updateIOWithTouchEvent:event];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self updateIOWithTouchEvent:event];
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self updateIOWithTouchEvent:event];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self updateIOWithTouchEvent:event];
}

@end
