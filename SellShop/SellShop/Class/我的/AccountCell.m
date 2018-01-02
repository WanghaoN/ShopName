//
//  AccountCell.m
//  SellShop
//
//  Created by 云媒 on 2017/12/26.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import "AccountCell.h"

@implementation AccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatView];
    }
    return self;
}

-(void)creatView
{
    CALayer* line = [CALayer layer];
    [line setBackgroundColor:[Utility colorWithHex:@"#32435D"].CGColor];
    [line setOpacity:0.29];
    [line setBounds:CGRectMake(0, 0, SCREENWIDTH-40*KproW,.5*KproH)];
    [line setPosition:CGPointMake(SCREENWIDTH/2-2.5, 54)];
    [self.layer addSublayer:line];
    
    UIImageView *cell_go_imgView = [CreatControls createImageViewWithFrame:CGRectMake(SCREENWIDTH -31*KproW, 17*KproH, 14*KproW, 20*KproH) ImageName:@"arrow_more" UserInteractionEnabled:NO];
    [self addSubview:cell_go_imgView];
    
    self.title_label = [[UILabel alloc] initWithFrame:CGRectMake(25.5*KproW, 10*KproH, SCREENWIDTH-240, 34*KproH)];
    self.title_label.font = [UIFont fontWithName:@"PingFangSC-Light" size:18*KproH];
    self.title_label.backgroundColor = [UIColor clearColor];
    self.title_label.userInteractionEnabled=YES;
    self.title_label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.title_label];
    
    self.number_label = [[UILabel alloc] initWithFrame:CGRectMake(self.title_label.right+20*KproW, 10*KproH, cell_go_imgView.left -self.title_label.right-40*KproW, 34*KproH)];
    
    self.number_label.font = [UIFont fontWithName:@"PingFangSC-Light" size:18*KproH];
    self.number_label.backgroundColor = [UIColor clearColor];
    self.number_label.userInteractionEnabled=YES;
    self.number_label.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.number_label];
}
-(void)setData:(NSString *)name withNum:(NSString*)num{
    self.title_label.text =name;
    self.number_label.text =num;
    self.title_label.textColor = [Utility colorWithHex:@"#777777"];
    self.number_label.textColor = [Utility colorWithHex:@"#1E8CDF"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
