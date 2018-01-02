//
//  SettingController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/26.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//我的设置

#import "SettingController.h"
#import "SetCell.h"
#import "ChangePassWordController.h"//修改密码
#import "PersonalInformationController.h"//个人信息管理
#import "UserAgreementController.h"//用户协议
#import "AboutUsController.h"//关于我们
@interface SettingController ()

@end

@implementation SettingController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
     //标题设置
    self.navigationItem.title =@"我的设置";
    [self.view addSubview:self.set_tableView];
    [Utility setExtraCellLineHidden: self.set_tableView ];
}
-(NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[NSArray new];
        _dataSource =@[@[@"修改密码",@"个人信息管理"],@[@"关于我们",@"用户协议",@"去评分"]];
    }
    return _dataSource;
}
-(UITableView *)set_tableView
{
    if (!_set_tableView) {
        _set_tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44+isXNav, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _set_tableView.delegate=self;
        _set_tableView.dataSource=self;
        _set_tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        _set_tableView.rowHeight =50*KproH;
        _set_tableView.bounces=NO;
    }
    return _set_tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else
        return 3;
}
static NSString*identifier=@"SetCell";
- (SetCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SetCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell =[[SetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    [cell setData:self.dataSource[indexPath.section][indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0) {
        //修改密码
        ChangePassWordController*changeVC=[[ChangePassWordController alloc]init];
        [self.navigationController pushViewController:changeVC animated:YES];
        }else{
        //个人信息管理
        PersonalInformationController*changeVC=[[PersonalInformationController alloc]init];
        [self.navigationController pushViewController:changeVC animated:YES];
        }
    }else
    {
        if (indexPath.row==0) {
         //关于我们
        AboutUsController*changeVC=[[AboutUsController alloc]init];
        [self.navigationController pushViewController:changeVC animated:YES];
        }else if (indexPath.row==1) {
        //用户协议
        UserAgreementController*changeVC=[[UserAgreementController alloc]init];
        [self.navigationController pushViewController:changeVC animated:YES];
        }else{
         //去评价
//            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@""]];
        }
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView*view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 5*KproH)];
    view.backgroundColor =[Utility colorWithHex:@"#FAFAFF"];
    return view;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
        return 5*KproH;
    }else
        return 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
