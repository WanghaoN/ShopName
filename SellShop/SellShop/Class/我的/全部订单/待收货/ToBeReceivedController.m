//
//  ToBeReceivedController.m
//  SellShop
//
//  Created by 云媒 on 2018/1/2.
//  Copyright © 2018年 云筹电子商务有限公司. All rights reserved.
//待收货

#import "ToBeReceivedController.h"

@interface ToBeReceivedController ()

@end

@implementation ToBeReceivedController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"待收货";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
