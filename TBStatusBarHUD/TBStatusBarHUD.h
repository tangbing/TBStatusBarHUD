//
//  TBStatusBarHUD.h
//  TBStatusBarHUD
//
//  Created by tangbing on 16/3/27.
//  Copyright © 2016年 tangbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBStatusBarHUD : NSObject

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 *  成功
 */
+ (void)showSucces:(NSString *)msg;

/**
 *  失败
 */
+ (void)showError:(NSString *)msg;

/**
 *  正在加载
 */
+ (void)loading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
