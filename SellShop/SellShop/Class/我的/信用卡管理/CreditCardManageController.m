//
//  CreditCardManageController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/27.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//信用卡管理

#import "CreditCardManageController.h"

@interface CreditCardManageController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSDictionary *BankDic;
    UIView*SinaCodeView;//绑定银行卡弹出输入验证码背景页面
    UIView *SinaBankView;//绑定银行卡弹出输入验证码页面
    UITextField *sinaBankCode;//新浪验证码
    //    UIButton *unbundling_button;//解绑按钮
    UIButton *management_button;//管理
    NSString *ticket;
    NSString *cid;
    
    UIView *footerView;
    NSInteger button_index;
    UIView *statusview;
}
@property (strong, nonatomic)  UITableView *myBankCard_tabelView;
@property (strong ,nonatomic)NSArray *mybank_cardArray;


@end

@implementation CreditCardManageController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"信用卡管理";
    button_index =0;
    [self creatFooterView];
    //设置返回按钮
    self.view.backgroundColor = System_BgGray;
    [self.view addSubview:self.myBankCard_tabelView];

    BankDic = [NSDictionary dictionaryWithObjectsAndKeys:
               @"中国工商银行",@"ICBC",
               @"中国农业银行",@"ABC",
               @"中国银行",@"BOC",
               @"中国建设银行",@"CCB",
               @"交通银行",@"COMM",
               @"中信银行",@"CITIC",
               @"中国光大银行",@"CEB",
               @"华夏银行",@"HXB",
               @"中国民生银行",@"CMBC",
               @"招商银行",@"CMB",
               @"上海浦东发展银行",@"SPDB",
               @"中国邮政储蓄银行",@"PSBC",
               @"兴业银行",@"CIB",
               @"北京银行",@"BCCB",
               @"上海银行",@"BOS",
               @"渤海银行",@"CBHB",
               @"浙商银行",@"CZB",
               @"恒丰银行",@"EGBANK",
               @"广发银行",@"GDB",
               @"上海农商银行",@"SHRCB",
               @"平安银行",@"SZPAB",
               @"中国银联",@"UPOP",
               nil];
    
}
-(UITableView *)myBankCard_tabelView{
    if (!_myBankCard_tabelView) {
        if ([[UIDevice currentDevice].systemVersion floatValue]<10.0) {
            _myBankCard_tabelView= [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENWIDTH-64) style:UITableViewStylePlain];
           
        }else
        {
            _myBankCard_tabelView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-isXTab) style:UITableViewStylePlain];
        }
        _myBankCard_tabelView.backgroundColor =[Utility colorWithHex:@"#FFFFFF"];
        
        _myBankCard_tabelView.rowHeight =130*KproH;
       _myBankCard_tabelView.dataSource = self;
       _myBankCard_tabelView.delegate = self;
        _myBankCard_tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _myBankCard_tabelView;
}

- (void)creatFooterView
{
    footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 75*KproH)];
    footerView.userInteractionEnabled = YES;
    UIButton *addBankCard = [UIButton buttonWithType:UIButtonTypeCustom];
    addBankCard.frame =CGRectMake((SCREENWIDTH-250*KproW)/2, 15*KproH, 250*KproW, 45*KproH);
    addBankCard.layer.cornerRadius=22.5*KproH;
    addBankCard.backgroundColor =[Utility colorWithHex:@"#1E8CDF"];
    [addBankCard setTitle:@"添加信用卡" forState:UIControlStateNormal];
    [addBankCard addTarget:self action:@selector(addBankCardAction:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:addBankCard];
    self.myBankCard_tabelView .tableFooterView =footerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.mybank_cardArray.count != 0) {
        return self.mybank_cardArray.count;
    }else
        return 1;
}
static NSString *identifier = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    UIImageView *bgimg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5*KproH, SCREENWIDTH-20, 120*KproH)];
    bgimg.image =[UIImage imageNamed:@"北京银行"];
    [cell.contentView addSubview:bgimg];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)addBankCardAction:(UIButton *)button
{
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
