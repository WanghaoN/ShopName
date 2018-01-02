//
//  UIBarButtonItem+Extension.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)setNavigationBarBackGroundImgName:(NSString*)imageName target : (UIViewController *)target selector: (SEL)selector
{
    UIButton * rightButton= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    rightButton.size = rightButton.imageView.image.size;
    [rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    return rightBarBtnItem;
}

@end
