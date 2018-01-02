//
//  MainTabBarView.h
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainTabBarView;

@protocol MainTabBarViewDelegate <NSObject>

- (void) mainTabBarViewDidClick : (MainTabBarView *)hBTabBarView;


@end

@interface MainTabBarView : UITabBar

@property(nonatomic,weak) id<MainTabBarViewDelegate> tabbarDelegate;

@end
