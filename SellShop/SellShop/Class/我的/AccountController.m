//
//  AccountController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//我的

#import "AccountController.h"
#import "AccountCell.h"
#import "SettingController.h"//我的设置
#import "PersonalView.h"//积分、金币、优惠券
#import "ProductCollectionController.h"//商品收藏
#import "ReceiveAddressController.h"//收货地址
#import "CreditCardManageController.h"//信用卡管理
#import "InviteFriendController.h"//邀请好友
#import "OnlineServiceController.h"//在线客服
#import "OrderButton.h"//订单按钮
#import "PendingPaymentController.h"//待付款
#import "CommentController.h"//待评价
#import "ToBeReceivedController.h"//待收货
#import "RefundController.h"//售后退款
#import "AllOrdersController.h"//全部订单

@interface AccountController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *headerView;
    NSArray *numArray;
    UIImageView*check_imgView;//头像上的 check 图标
    
}
@property(nonatomic,strong)UITableView*account_tableView;
@property(nonatomic,strong)PersonalView*personalView;
@property(nonatomic,strong)UIView*orderView;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)UILabel*name_label;//会员名称
@property(nonatomic,strong)UILabel*memberLevel_label;//会员等级
@property(nonatomic,strong)UIImageView*footer_imgView;//尾试图

@end

@implementation AccountController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent=YES;
    self.navigationController.navigationBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.account_tableView];
    [Utility setExtraCellLineHidden:self.account_tableView];
    [self creatHeaderView];
    numArray =@[@"1",@"3",@"",@"",@"",@""];
}
-(NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[NSArray new];
        _dataSource =@[@"商品收藏",@"收货地址",@"信用卡管理",@"邀请好友",@"在线客服"];
    }
    return _dataSource;
}
//个人积分余额等
-(PersonalView *)personalView
{
    if (!_personalView) {
        _personalView =[[PersonalView alloc]initWithFrame:CGRectMake(0, 100*KproH, SCREENWIDTH, 58.5*KproH)];
    }
    return _personalView;
}
//全部订单 view
-(UIView *)orderView{
    if (!_orderView) {
        _orderView =[[UIView alloc]initWithFrame:CGRectMake(0, self.personalView.bottom+5*KproH, SCREENWIDTH, 106*KproH)];
        _orderView.backgroundColor =[UIColor whiteColor];
    }
    return _orderView;
}
-(UITableView *)account_tableView
{
    if (!_account_tableView) {
        _account_tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, -isXNav, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _account_tableView.delegate=self;
        _account_tableView.dataSource=self;
        _account_tableView.rowHeight =54.5*KproH;
        _account_tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    return _account_tableView;
}
//用户名称
-(UILabel *)name_label{
    if (!_name_label) {
        _name_label =[[UILabel alloc]init];
        _name_label.font=[UIFont fontWithName:@"PingFangSC-Regular" size:18*KproH];
        _name_label.textColor =[Utility colorWithHex:@"#3E9ADF"];
        _name_label.textAlignment=NSTextAlignmentLeft;
    }
    return _name_label;
}
//用户会员等级
-(UILabel *)memberLevel_label{
    if (!_memberLevel_label) {
        _memberLevel_label =[[UILabel alloc]init];
        _memberLevel_label.textColor =[Utility colorWithHex:@"#9B9B9B"];
        _memberLevel_label.font=[UIFont fontWithName:@"PingFangSC-Regular" size:14*KproH];
        _memberLevel_label.textAlignment=NSTextAlignmentLeft;
    }
    return _memberLevel_label;
}
-(UIImageView *)footer_imgView{
    if (!_footer_imgView) {
        _footer_imgView =[[UIImageView alloc]initWithFrame:CGRectMake(10*KproW, 0, SCREENWIDTH-20*KproW, 100*KproH)];
        _footer_imgView.backgroundColor =[UIColor orangeColor];
        _footer_imgView.layer.cornerRadius=5;
    }
    return _footer_imgView;
}
-(void)creatHeaderView
{
    headerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 100*KproH+116*KproH+58.5*KproH)];
    headerView.backgroundColor =[Utility colorWithHex:@"#FAFAFF"];
    //头像
    UIImageView*headImgView =[CreatControls createImageViewWithFrame:CGRectMake(14*KproW, 32.5*KproH, 48*KproW, 48*KproW) ImageName:@"user_icon" UserInteractionEnabled:NO];
    headImgView.layer.cornerRadius = headImgView.height/2;
    headImgView.layer.masksToBounds =YES;
    [headerView addSubview:headImgView];
    //头像上的 check
    check_imgView =[CreatControls createImageViewWithFrame:CGRectMake(headImgView.width-18*KproW, headImgView.height-18*KproH, 12*KproW, 12*KproH) ImageName:@"avata_icon" UserInteractionEnabled:YES];
    [headImgView addSubview:check_imgView];
    [headImgView bringSubviewToFront:check_imgView];
    
    //设置按钮
    UIButton*settingButton =[CreatControls createButtonWithFrame:CGRectMake(SCREENWIDTH-35*KproW, 46.5*KproH, 20*KproW, 20*KproW) Target:self Action:@selector(SettingAction:) Title:nil];
    [settingButton setImage:[UIImage imageNamed:@"set_icon"] forState:UIControlStateNormal];
    [headerView addSubview:settingButton];
    //会员名称
    self.name_label.frame =CGRectMake(headImgView.right+10, headImgView.top, 150*KproW, 18*KproH);
    self.name_label.text =@"李潇潇";
    [headerView addSubview:self.name_label];
    //会员等级
    self.memberLevel_label.frame =CGRectMake(headImgView.right+10, self.name_label.bottom+10, 150*KproW, 18*KproH);
    self. memberLevel_label.text =@"白金会员";
    [headerView addSubview:self.memberLevel_label];
    
    self.account_tableView.tableHeaderView=headerView;
    [headerView addSubview:self.personalView];
    [headerView addSubview:self.orderView];
    [self creatOrderView];
    [self creatFooterView];
}
-(void)creatFooterView
{
    UIView*footerView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 100*KproH)];
    [footerView addSubview:self.footer_imgView];
    self.account_tableView.tableFooterView =footerView;
}
-(void)creatOrderView{
    UILabel*allLabel =[CreatControls createLabelWithFrame:CGRectMake(13*KproW, 5*KproH, 75*KproW, 18*KproH) Font:14*KproH Text:@"全部订单" BackgroundColor:nil];
    allLabel.textAlignment =NSTextAlignmentLeft;
    [self.orderView addSubview:allLabel];
    NSArray*titleArray =@[@"待付款",@"待评价",@"待收货",@"售后/退款"];
    NSArray*imageArray =@[@"待付款",@"待评价",@"待收货",@"售后"];
    
    for (int i =0; i<titleArray.count; i++) {
        OrderButton*orderButton =[[OrderButton alloc]initWithFrame:CGRectMake(10.5*KproW+i*14.3*KproW+75*KproW*i, allLabel.bottom+10*KproH, 75*KproW, 61.5*KproH)];
        orderButton.tag =1001+i;
        [orderButton setTitle:titleArray[i] forState:UIControlStateNormal];
        orderButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10*KproH];
        orderButton.titleLabel.textAlignment =NSTextAlignmentCenter;
        [orderButton setTitleColor:[Utility colorWithHex:@"#9B9B9B"] forState:UIControlStateNormal];
        [orderButton setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [orderButton addTarget:self action:@selector(orderAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.orderView addSubview:orderButton];
        
    }
    UIButton*all_ordersButton =[CreatControls createButtonWithFrame:CGRectMake(SCREENWIDTH-83*KproW, 10.5*KproH, 68*KproW, 18*KproH) Target:self Action:@selector(all_ordersAction:) Title:@"查看全部订单>"];
    //
    all_ordersButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10*KproH];
    all_ordersButton.titleLabel.textAlignment =NSTextAlignmentCenter;
    [all_ordersButton setTitleColor:[Utility colorWithHex:@"#9B9B9B"] forState:UIControlStateNormal];
    
    [self.orderView addSubview:all_ordersButton];
    
    
}
//查看全部订单
-(void)all_ordersAction:(UIButton*)button
{
    AllOrdersController *allOrdersVC=[[AllOrdersController alloc]init];
    [self.navigationController pushViewController:allOrdersVC animated:YES];
}
//待收货、待评价、待付款等跳转
-(void)orderAction:(UIButton*)button
{
    switch (button.tag) {
        case 1001:
        {
            //待付款
            PendingPaymentController *pendingPaymentVC=[[PendingPaymentController alloc]init];
            [self.navigationController pushViewController:pendingPaymentVC animated:YES];
        }
            break;
        case 1002:
        {
            //待评价
            CommentController *commentVC=[[CommentController alloc]init];
            [self.navigationController pushViewController:commentVC animated:YES];
        }
            break;
        case 1003:
        {
            //待收货
            ToBeReceivedController *  toBeReceivedVC=[[ToBeReceivedController alloc]init];
            [self.navigationController pushViewController:toBeReceivedVC animated:YES];
        }
            break;
        case 1004:
        {
            //售后退款
            RefundController *refundVC=[[RefundController alloc]init];
            [self.navigationController pushViewController:refundVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}
//我的设置
-(void)SettingAction:(UIButton*)button
{
    SettingController*setVC =[[SettingController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
static NSString*identifier =@"accountCell";
- (AccountCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AccountCell*cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[AccountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    [cell setData:self.dataSource[indexPath.row] withNum:numArray[indexPath.row]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            //商品收藏
            ProductCollectionController*product=[[ProductCollectionController alloc]init];
            [self.navigationController pushViewController:product animated:YES];
        }
            break;
        case 1: {
            //收货地址
            ReceiveAddressController*ReceiveAddress=[[ReceiveAddressController alloc]init];
            [self.navigationController pushViewController:ReceiveAddress animated:YES];
        }
            break;
            
        case 2: {
            //信用卡管理
            CreditCardManageController*CreditCardManage=[[CreditCardManageController alloc]init];
            [self.navigationController pushViewController:CreditCardManage animated:YES];
        }
            break;
        case 3: {
            //邀请好友
            InviteFriendController*InviteFriend=[[InviteFriendController alloc]init];
            [self.navigationController pushViewController:InviteFriend animated:NO];
        }
            break;
        case 4: {
            //在线客服
            OnlineServiceController*OnlineService=[[OnlineServiceController alloc]init];
            [self.navigationController pushViewController:OnlineService animated:YES];
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

