//
//  MainTabBarController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "HomeController.h"
#import "MainTabBarView.h"
#import "AccountController.h"
#import "CartController.h"
@interface MainTabBarController ()<MainTabBarViewDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];    
    HomeController *homeController = [[HomeController alloc] init];
    [self addChildController:homeController title:@"首页" iconNormal:@"home" iconSelected:@"home_on"];
    
    CartController * CartVc = [[CartController alloc] init];
    [self addChildController:CartVc title:@"购物车" iconNormal:@"cart" iconSelected:@"cart_on"];
    
    AccountController *mineVc = [[AccountController alloc] init];
    [self addChildController:mineVc title:@"我的" iconNormal:@"me" iconSelected:@"me_on"];
    
    int i = 1; //0系统tabbar  1自定义tabbar
    if (i == 1) {
        MainTabBarView *tabBar = [[MainTabBarView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 49)];
        tabBar.tabbarDelegate = self;
        [self setValue:tabBar forKeyPath:@"tabBar"]; //KVC直接修改系统tabbar
    }
}

- (void) addChildController : (UIViewController *) viewController title : (NSString *) title iconNormal : (NSString *) iconNormal iconSelected : (NSString *) iconSelected
{
    viewController.view.backgroundColor = RGBCOLOR_HEX(0xffffff);
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:iconNormal];
    UIImage *selectedImage = [UIImage imageNamed:iconSelected];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    [self addChildViewController:[[MainNavigationController alloc] initWithRootViewController:viewController]];
}

- (void)mainTabBarViewDidClick:(MainTabBarView *)hBTabBarView
{

}

@end
