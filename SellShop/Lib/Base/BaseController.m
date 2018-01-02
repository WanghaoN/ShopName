//
//  BaseController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import "BaseController.h"
//导航栏标题颜色
#define kNavTitleColor kcolor(255,255,255,1)

@interface BaseController ()

@end

@implementation BaseController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //去除导航栏下方的横线
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barTintColor =[Utility colorWithHex:@"#FAFAFF"];

    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[Utility colorWithHex:@"#4A4A4A"],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Light" size:36/2]}];
    self.automaticallyAdjustsScrollViewInsets =NO;
    
    
    int index = (int)[[self.navigationController viewControllers]indexOfObject:self];
    
    if (index==0) {
    }else
    {
        [self popVc];
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
}
-(UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setNavTitle:(NSString *)title
{
    self.navigationItem.title = title;
}
-(void)addtarget:(id)target with:(NSArray *)array

{
    NSMutableArray *mutablearray = [NSMutableArray array];
    
    for (NSInteger i=0; i<array.count; i++) {
        UIButton *butten = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        [butten setImage:[UIImage imageNamed:array[i][0]] forState:UIControlStateNormal];
        butten.adjustsImageWhenHighlighted =NO;
        
        [butten addTarget:target action:NSSelectorFromString(array[i][1]) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barbtnitem  = [[UIBarButtonItem alloc]initWithCustomView:butten];
        [mutablearray addObject:barbtnitem];
        
    }
    self.navigationItem.rightBarButtonItems =mutablearray;
    
    
}
//设置单个
-(void)addtarget:(id)target OneBtn:(UIImage *)image with:(SEL)clic;
{
    UIButton *butten = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=11.0) {
        butten.imageEdgeInsets =UIEdgeInsetsMake(7.5,43,7.5,0);
    }else
    {
        butten.imageEdgeInsets =UIEdgeInsetsMake(0, 1, 0, 1);
    }
    [butten setImage:image forState:UIControlStateNormal];
    butten.adjustsImageWhenHighlighted =NO;
    
    butten.contentEdgeInsets = UIEdgeInsetsMake(0, 10*KproW, 0, -10*KproW);
    [butten addTarget:target action:clic forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butten];
}

-(void)addtarget:(id)target OneBtn:(UIImage *)image with:(SEL)clic withmessagecount:(NSInteger)count;
{
    UIButton *butten = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=11.0) {
        butten.imageEdgeInsets =UIEdgeInsetsMake(10, -5, 10, 25);
    }
    [butten setImage:image forState:UIControlStateNormal];
    butten.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [butten addTarget:target action:clic forControlEvents:UIControlEventTouchUpInside];
    butten.adjustsImageWhenHighlighted =NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butten];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(35, 10, 12, 12)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:8];
    lable.backgroundColor = [UIColor greenColor];
    lable.layer.masksToBounds = YES;
    lable.layer.cornerRadius = 6;
    [butten addSubview:lable];
    
    if (count||count>0) {
        lable.hidden = NO;
        lable.text = [NSString stringWithFormat:@"%ld",(long)count];
        
    }else
    {
        lable.hidden = YES;
    }
}

-(void)addtarget:(id)target witiTItle:(NSString *)title with:(SEL)sel
{
    UIButton *butten = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [butten setTitle:title forState:UIControlStateNormal];
    [butten addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    butten.adjustsImageWhenHighlighted =NO;
    if ([[UIDevice currentDevice].systemVersion floatValue]>=11.0) {
        butten.imageEdgeInsets =UIEdgeInsetsMake(10, -5, 10, 25);
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butten];
}



-(void)popVc
{
    
    UIButton *butten = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 15*KproW, 20*KproH)];
//    if ([[UIDevice currentDevice].systemVersion floatValue]>=11.0) {
//        butten.imageEdgeInsets =UIEdgeInsetsMake(10, -5, 10, 25);
//    }
    [butten setImage:[UIImage imageNamed:@"arrow_left"] forState:UIControlStateNormal];
    
    [butten addTarget:self action:@selector(popvcto) forControlEvents:UIControlEventTouchUpInside];
    butten.adjustsImageWhenHighlighted =NO;
    
    UIBarButtonItem *leftBarButtonItems = [[UIBarButtonItem alloc]initWithCustomView:butten];
    UIBarButtonItem *nagetiveSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:nil action:nil];
    nagetiveSpacer.width = -5;//这个值可以根据自己需要自己调整
    self.navigationItem.leftBarButtonItems = @[nagetiveSpacer, leftBarButtonItems];
    
}
-(void)dissmissVc
{
    UIButton *butten = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=11.0) {
        butten.imageEdgeInsets =UIEdgeInsetsMake(10, -5, 10, 25);
    }
    [butten setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    butten.adjustsImageWhenHighlighted =NO;
    
    butten.contentEdgeInsets = UIEdgeInsetsMake(0,-10, 0, 0);
    [butten addTarget:self action:@selector(dissVc) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butten];
}



-(void)popvcto
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)dissVc
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addtarget:(id)target withTitile:(NSString *)title sel:(SEL)sel orignPointY:(CGFloat)pointY toVC:(UIViewController *)vc
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10*KproW, pointY, 355*KproW, 44*KproW);
    button.backgroundColor = [Utility colorWithHex:@"#FAFAFF"];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.adjustsImageWhenHighlighted =NO;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    [vc.view addSubview:button];
}
-(void)addtarget:(id)target withNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitel with:(SEL)clic
{
    UIButton *butten = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [butten setTitle:normalTitle forState:UIControlStateNormal];
    [butten setTitle:selectedTitel forState:UIControlStateSelected];
    [butten setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [butten setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [butten addTarget:target action:clic forControlEvents:UIControlEventTouchUpInside];
    butten.adjustsImageWhenHighlighted =NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butten];
}


@end
