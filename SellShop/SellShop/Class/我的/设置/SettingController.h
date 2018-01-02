//
//  SettingController.h
//  SellShop
//
//  Created by 云媒 on 2017/12/26.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
@interface SettingController : BaseController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView*set_tableView;
@property(nonatomic, strong) NSArray *dataSource;
@end
