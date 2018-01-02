//
//  HomeController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//
#import "HomeController.h"
#import "HBText1Controller.h"
#import "AFNetworking.h"
#import "HBUser.h"
#import "MBProgressHUD+MJ.h"
#import "MJExtension.h"

@interface HomeController ()

@end

@implementation HomeController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    self.navigationController.navigationBar.translucent =YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.title=@"首页";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
}

- (void)push
{
    HBText1Controller *text1Vc = [[HBText1Controller alloc] init];
    text1Vc.name = @"你好";
    text1Vc.title = @"标题";
    [self.navigationController pushViewController:text1Vc animated:YES];
}

@end
