//
//  SmallButton.m
//
//  SmallButton.m
//  PubgDolphins
//
//  Created by XBK on 2022/4/24.
//

#import "FloatView.h"


@implementation FloatView


+ (instancetype)sharedInstance :(ModuleControl*)control{
    static FloatView *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:CGRectMake(489, 58, 45, 45):control ];
    });
    return sharedInstance;
}//不知道什么。验证


- (instancetype)initWithFrame:(CGRect)frame :(ModuleControl*)control {
// 设置控制器对象
self.moduleControl = control;

// 初始化父类实例，并进行赋值操作
    if (self = [super initWithFrame:frame]) {
        // 设置视图的圆角半径为宽度的 0.3 倍，并启用剪切
        self.layer.cornerRadius = frame.size.width * 0.3;
        self.layer.masksToBounds = YES;
        
        // 设置背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
        
        // 创建图像视图对象，并设置其位置和大小为整个视图的位置和大小
       // self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        
     //   NSString *imageDataBase64 =  @"";
       // NSData *imageData = [[NSData alloc] initWithBase64EncodedString:imageDataBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        
     //   UIImage *image = [UIImage imageWithData:imageData];
       // self.iconImageView.image = image;

       // [self addSubview:self.iconImageView];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconOnClick)]];
        
        UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        tap.numberOfTapsRequired = 2;//点击次数
        tap.numberOfTouchesRequired = 3;//手指数
        [mainWindow addGestureRecognizer:tap];
        [tap addTarget:self action:@selector(iconOnClick)];
    }
    return self;
}



// 点击事件
- (void)iconOnClick {
    self.moduleControl->menuStatus = !self.moduleControl->menuStatus;
}

// 按下
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    CGPoint pt = [[touches anyObject] locationInView:self];
    _startLocation = pt;
    [[self superview] bringSubviewToFront:self];
}
// 移动
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    CGPoint pt = [[touches anyObject] locationInView:self];
    float dx = pt.x - _startLocation.x;
    float dy = pt.y - _startLocation.y;
    CGPoint newcenter = CGPointMake(self.center.x + dx, self.center.y + dy);
    
    float halfx = CGRectGetMidX(self.bounds);
    newcenter.x = MAX(halfx, newcenter.x);
    newcenter.x = MIN(self.superview.bounds.size.width - halfx, newcenter.x);
    
    float halfy = CGRectGetMidY(self.bounds);
    newcenter.y = MAX(halfy, newcenter.y);
    newcenter.y = MIN(self.superview.bounds.size.height - halfy, newcenter.y);
    
    CGFloat bottom = self.superview.height - newcenter.y - 0.5 * self.height;
    if (bottom < 0) {
        bottom = 0;
    }
    
    float height = [UIScreen mainScreen].bounds.size.height;
    if (bottom > height) {
        bottom = height;
    }
    
    newcenter.y = self.superview.height - bottom - 0.5 * self.height;
    
    self.center = newcenter;
    
    self.didMoveLocation = CGPointMake(self.left, self.superview.height - self.bottom);
}
// 抬起
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.didMoveLocation = CGPointMake(self.left, self.superview.height - self.bottom);
}


@end

