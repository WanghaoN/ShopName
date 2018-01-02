//
//  OrderButton.m
//  SellShop
//
//  Created by 云媒 on 2018/1/2.
//  Copyright © 2018年 云筹电子商务有限公司. All rights reserved.
//

#import "OrderButton.h"

@implementation OrderButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat inteval = CGRectGetWidth(contentRect)/16.0;
    inteval = MIN(inteval, 6);
    
    //设置图片的宽高为button宽度的1/2;
    CGFloat imageW = CGRectGetWidth(contentRect) - 8 * inteval;
    
    CGRect rect = CGRectMake(0, inteval*2 + imageW, CGRectGetWidth(contentRect) , CGRectGetHeight(contentRect) - 2*inteval - imageW);
    
    return rect;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    
    CGFloat inteval = CGRectGetWidth(contentRect)/16.0;
    inteval = MIN(inteval, 6);
    
    //设置图片的宽高为button宽度的7/8;
    CGFloat imageW = CGRectGetWidth(contentRect) - 8 * inteval;
    
    CGRect rect = CGRectMake(inteval*4, inteval, imageW, imageW);
    
    return rect;
    
}


@end
