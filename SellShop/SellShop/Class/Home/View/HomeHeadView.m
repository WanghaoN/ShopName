//
//  HomeHeadView.m
//  SellShop
//
//  Created by 携手科技 on 2018/1/2.
//  Copyright © 2018年 云筹电子商务有限公司. All rights reserved.
//

#import "HomeHeadView.h"
#import "SXButton.h"

@implementation HomeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        imgArr = @[@"index_icon1",@"index_icon2",@"index_icon3",@"index_icon4"];
        titleArr = @[@"精选",@"新品",@"拼团",@"信用卡"];
        
        [self addSubview:self.bannerView];
        [self addSubview:self.centerBackGroundView];
    }
    return self;
}

- (ImagePlayerView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[ImagePlayerView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width*0.35)];
        _bannerView.backgroundColor = [UIColor grayColor];
//        _bannerView.imagePlayerViewDelegate = self;
        _bannerView.scrollInterval = 10;
        _bannerView.pageControlPosition = ICPageControlPosition_BottomCenter;
        _bannerView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _bannerView.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _bannerView.pageControl.transform = CGAffineTransformMakeScale(0.8, 0.8);
        //    _shouldShowStudentNum = YES;
    }
    return _bannerView;
}

- (UIView *)centerBackGroundView
{
    if (!_centerBackGroundView) {
        _centerBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bannerView.bottom, self.width, 80)];
        
        CGFloat button_scale = 40;
        CGFloat button_width = (_centerBackGroundView.width-40*5)/4;
        
        for (int i=0; i<imgArr.count; i++) {
            SXButton *button = [SXButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(button_scale+(button_width+button_scale)*i, 10, button_width, (_centerBackGroundView.height-10*2));
            button.tag = 200+i;
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            [button setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
//            [button setBackgroundImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [_centerBackGroundView addSubview:button];
        }
    }
    return _centerBackGroundView;
}


@end
