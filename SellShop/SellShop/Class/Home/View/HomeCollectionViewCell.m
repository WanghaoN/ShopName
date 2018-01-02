//
//  HomeCollectionViewCell.m
//  GameLive
//
//  Created by 问鼎教育科技河北有限公司 on 2017/12/6.
//  Copyright © 2017年 赵潇林. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell ()
{
    
    UILabel     *describeLabel;
    UILabel     *priceLabel;
    UILabel     *buyLabel;

}

@property (nonatomic,strong)UIImageView   *showImageView;
@property (nonatomic,strong)UIView        *downBackgroudview;

@end

@implementation HomeCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        self.layer.masksToBounds = YES;
//        self.layer.cornerRadius = 8.0;
        NSLog(@"width:%f  height:%f",frame.size.width,frame.size.height);
       
        self.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:0.5];
        [self.contentView addSubview:self.showImageView];
        [self.contentView addSubview:self.downBackgroudview];
       
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    CGFloat allWidth = self.width;
    CGFloat showImgHeight = self.height-80-10;
   
    self.showImageView.frame = CGRectMake(0, 0, allWidth, showImgHeight);
    
    self.downBackgroudview.frame = CGRectMake(10, self.showImageView.bottom+10, allWidth-10*2, 80);
    describeLabel.frame = CGRectMake(0, 0, self.downBackgroudview.width, 40);
    priceLabel.frame = CGRectMake(0, describeLabel.bottom+10, (self.downBackgroudview.width-10)/2, 20);
    buyLabel.frame = CGRectMake(priceLabel.right+10, describeLabel.bottom+10, (self.downBackgroudview.width-10)/2, 20);
    
}

- (void)setShowImgUrl:(NSString *)imgUrl withName:(NSString *)nameStr withNmuber:(NSString *)numberStr withState:(NSString *)stateStr
{

    describeLabel.text = nameStr;
    priceLabel.text = numberStr;
    buyLabel.text = stateStr;
    
}

- (UIImageView *)showImageView
{
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc] init];
        _showImageView.backgroundColor = [UIColor redColor];
    }
    return _showImageView;
}

- (UIView *)downBackgroudview
{
    if (!_downBackgroudview) {
        _downBackgroudview = [[UIView alloc] init];
        
        describeLabel = [[UILabel alloc] init];
        describeLabel.font = [UIFont systemFontOfSize:14.0];
        describeLabel.textAlignment = NSTextAlignmentLeft;
        describeLabel.numberOfLines = 2;
        [_downBackgroudview addSubview:describeLabel];
        
        priceLabel = [[UILabel alloc] init];
        priceLabel.font = [UIFont systemFontOfSize:15.0];
        priceLabel.textAlignment = NSTextAlignmentLeft;
        priceLabel.textColor = [UIColor orangeColor];
        [_downBackgroudview addSubview:priceLabel];
        
        buyLabel = [[UILabel alloc] init];
        buyLabel.font = [UIFont systemFontOfSize:12.0];
        buyLabel.textAlignment = NSTextAlignmentRight;
        buyLabel.textColor = [UIColor grayColor];
        [_downBackgroudview addSubview:buyLabel];
        
    }
    return _downBackgroudview;
}

@end
