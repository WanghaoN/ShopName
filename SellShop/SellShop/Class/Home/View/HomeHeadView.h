//
//  HomeHeadView.h
//  SellShop
//
//  Created by 携手科技 on 2018/1/2.
//  Copyright © 2018年 云筹电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePlayerView.h"

@interface HomeHeadView : UIView
{
    NSArray *imgArr;
    NSArray *titleArr;
}
@property (nonatomic, strong)    ImagePlayerView *bannerView;
@property (nonatomic, strong)    UIView          *centerBackGroundView;
@end
