//
//  ViewController.m
//  TBStatusBarHUDExample
//
//  Created by tangbing on 16/4/10.
//  Copyright © 2016年 tangbing. All rights reserved.
//

#import "ViewController.h"
#import "TBStatusBarHUD.h"
@interface ViewController ()

/**显示成功信息*/
- (IBAction)successBtnClick:(id)sender;
/**显示正在加载信息*/
- (IBAction)loadingBtnClick:(id)sender;
/**显示出错信息*/
- (IBAction)errorBtnClick:(id)sender;
/**隐藏信息*/
- (IBAction)hiddeBtnClick:(id)sender;
/**显示普通文字信息*/
- (IBAction)textShowBtnClick:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
/**
 *  显示成功信息
 */
- (IBAction)successBtnClick:(id)sender
{
    [TBStatusBarHUD showSucces:@"加载数据成功!!!"];
}

/**
 *  显示正在加载信息
 */
- (IBAction)loadingBtnClick:(id)sender
{
    [TBStatusBarHUD loading:@"正在加载中!!!"];
}
/**
 *  显示出错信息
 */
- (IBAction)errorBtnClick:(id)sender
{
    [TBStatusBarHUD showError:@"登陆失败"];
}
/**
 *  隐藏信息
 */
- (IBAction)hiddeBtnClick:(id)sender
{
    [TBStatusBarHUD hide];
    
}
/**
 *  显示普通文字信息
 */
- (IBAction)textShowBtnClick:(id)sender
{
    [TBStatusBarHUD showMessage:@"come" image:[UIImage imageNamed:@"error"]];
}
@end
