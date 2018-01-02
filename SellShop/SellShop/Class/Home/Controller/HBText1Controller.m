//
//  HBText1Controller.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//
#import "HBText1Controller.h"

@interface HBText1Controller ()

@end

@implementation HBText1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = self.name;
    [self.view addSubview:nameLabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"弹出" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
