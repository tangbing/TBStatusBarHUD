
//
//  TBStatusBarHUD.m
//  TBStatusBarHUD
//
//  Created by tangbing on 16/3/27.
//  Copyright © 2016年 tangbing. All rights reserved.
//
#import "TBStatusBarHUD.h"

#define TBMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const TBMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const TBAnimationDuration = 0.25;
/**窗口的高度*/
static int const statusBarHeight = 20;

@implementation TBStatusBarHUD

static UIWindow *window_;
static NSTimer *timer;
/**
 *  初始化窗口
 */
+ (void)setupWindow
{
    CGFloat windowY = - statusBarHeight;
    CGRect frame = CGRectMake(0, windowY, [UIScreen mainScreen].bounds.size.width, statusBarHeight);
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:TBAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //销毁定时器
    [timer invalidate];
    
    [self setupWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = TBMessageFont;
    if (image) {// 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, statusBarHeight * 0.5, 0, 0);
    }
    
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:TBMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}


/**
 *  成功
 */
+ (void)showSucces:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"TBStatusBarHUD.bundle/success"]];
}

/**
 *  失败
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"TBStatusBarHUD.bundle/error"]];
}

/**
 *  正在加载
 */
+ (void)loading:(NSString *)msg
{
    
    // 停止定时器
    [timer invalidate];
    timer = nil;
    
    // 显示窗口
    [self setupWindow];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.font = TBMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [ UIColor whiteColor];
    [window_ addSubview:label];

     // 显示圆圈
    UIActivityIndicatorView *indicatior = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
     [indicatior startAnimating];
    //算出文字的宽度
   CGFloat textWidth = [msg sizeWithAttributes:@{NSFontAttributeName:TBMessageFont}].width;
    CGFloat centerX = ([UIScreen mainScreen].bounds.size.width - textWidth) * 0.5 - statusBarHeight;
    CGFloat centerY = window_.frame.size.height * 0.5;
    indicatior.center = CGPointMake(centerX, centerY);
    [window_ addSubview:indicatior];

}


/**
 *  显示文字
 */
+ (void)showMessage:(NSString *)msg;
{
    [self showMessage:msg image:nil];
}

/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:TBAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer = nil;
    }];
 
}

@end
