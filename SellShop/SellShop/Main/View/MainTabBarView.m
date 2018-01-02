//
//  MainTabBarView.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import "MainTabBarView.h"

@interface MainTabBarView()


@end

@implementation MainTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i < self.subviews.count; i ++) {
        UIView *view = self.subviews[i];
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            view.y = 3;
        }
    }
}

- (void)addClick
{
    if ([self.tabbarDelegate respondsToSelector:@selector(mainTabBarViewDidClick:)]) {
        [self.tabbarDelegate mainTabBarViewDidClick:self];
    }
}

@end
