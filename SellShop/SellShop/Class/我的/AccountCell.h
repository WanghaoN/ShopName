//
//  AccountCell.h
//  SellShop
//
//  Created by 云媒 on 2017/12/26.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountCell : UITableViewCell
@property(nonatomic,strong) UILabel *title_label;
@property(nonatomic,strong) UILabel *number_label;

-(void)setData:(NSString *)name  withNum:(NSString*)num;

@end
