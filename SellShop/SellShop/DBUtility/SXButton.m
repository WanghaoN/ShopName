//
//  SXButton.m
//  PrizeClaw
//
//  Created by 问鼎教育科技河北有限公司 on 2017/12/22.
//  Copyright © 2017年 赵潇林. All rights reserved.
//

#import "SXButton.h"

@implementation SXButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat bH = contentRect.size.height-20*KproW-8*KproW;
    
    return CGRectMake((imageW-bH)/2.0, 0, bH, bH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height;
    
    return CGRectMake(0, titleH-20*KproW, titleW, 20*KproW);
}

@end
