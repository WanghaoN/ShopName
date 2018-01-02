//
//  ProductCollectionController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/27.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//商品收藏

#import "ProductCollectionController.h"

@interface ProductCollectionController ()

@end

@implementation ProductCollectionController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"商品收藏";
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
