//
//  HomeController.m
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//
#import "HomeController.h"
#import "HBText1Controller.h"
#import "HBUser.h"
#import "HomeCollectionViewCell.h"
#import "HomeHeadView.h"

@interface HomeController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ImagePlayerViewDelegate>
{
    UICollectionView *mainCollectionView;
    NSMutableArray *listArr;
}
@property (nonatomic, strong)    NSArray      *imageURLs;
@property (nonatomic, strong)    ImagePlayerView *bannerView;

@end

@implementation HomeController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    self.navigationController.navigationBar.translucent =YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 10*KproW;
    layout.minimumLineSpacing      = 10*KproW;   //定义了每个item在水平方向上的最
    CGFloat itemWidth = (SCREENWIDTH - 10*KproW)/2;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth*1.35);
    
    //2.初始化collectionView
    mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-NavagationBarHeight-SafeAreaBottomHeightHeight) collectionViewLayout:layout];
    [self.view addSubview:mainCollectionView];
    mainCollectionView.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [mainCollectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"homeHeader"];
    
    //4.设置代理
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeCollectionViewCell *cell = (HomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    //    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    
    //    NSDictionary *dic = (NSDictionary *)[listArr objectAtIndex:indexPath.row];
    [cell setShowImgUrl:@""
               withName:@"Apple MacBook Air 13.3英寸笔记本电脑 银色(2017新款 Core i5 256固态硬盘)"
             withNmuber:@"￥6999.00"
              withState:@"193人已购买"];
    
    return cell;
}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREENWIDTH, SCREENWIDTH*0.35+80);
    
}

//设置每个item的UIEdgeInsets
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(10*KproW, 10*KproW, 10*KproW, 10*KproW);
//}

//设置每个item水平间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10*KproW;
//}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10*KproW;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"homeHeader" forIndexPath:indexPath];
    headerView.backgroundColor =[UIColor clearColor];
    
    HomeHeadView *homeHeadView = [[HomeHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENWIDTH*0.35+80)];
    
    [headerView addSubview:homeHeadView];
    //    self.imageURLs = @[@"banner1.png"];
    //
    //    //轮播图
    //    CGFloat banner_scale = 20*KproW;
    //    _bannerView = [[ImagePlayerView alloc] initWithFrame:CGRectMake(banner_scale, banner_scale, SCREENWIDTH-banner_scale*2, (SCREENWIDTH-banner_scale*2)*0.35)];
    //    _bannerView.layer.masksToBounds = YES;
    //    _bannerView.layer.cornerRadius = 8.0;
    //    _bannerView.backgroundColor = [UIColor grayColor];
    //    _bannerView.imagePlayerViewDelegate = self;
    //    _bannerView.scrollInterval = 10*KproW;
    //    _bannerView.pageControlPosition = ICPageControlPosition_BottomCenter;
    //    _bannerView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //    _bannerView.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //    _bannerView.pageControl.transform = CGAffineTransformMakeScale(0.8, 0.8);
    //    //    _shouldShowStudentNum = YES;
    //    [headerView addSubview:_bannerView];
    //    [_bannerView reloadData];
    
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}




#pragma mark ImagePlayerView代理方法
- (NSInteger)numberOfItems {
    return [self.imageURLs count];
}
//
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index {
    //    ESBannerData *banner = _bannersData[index];
    //        [imageView yy_setImageWithURL:[NSURL URLWithString:[self.imageURLs objectAtIndex:index]]
    //                              options:YYWebImageOptionSetImageWithFadeAnimation];
    //    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[self.imageURLs objectAtIndex:index]]];
    imageView.image = [UIImage imageNamed:[self.imageURLs objectAtIndex:index]];
    
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"点击了：%ld",(long)index);
    
}



- (void)setNavgationBar
{
    self.title  = @"首页";
    
    //    UIBarButtonItem *leftButton            = [[UIBarButtonItem alloc] initWithCustomView:self.meBtn];
    //    self.navigationItem.leftBarButtonItem  = leftButton;
    //
    //    UIBarButtonItem *rightButton           = [[UIBarButtonItem alloc] initWithCustomView:self.moneyBtn];
    //    self.navigationItem.rightBarButtonItem = rightButton;
    
    
}





- (void)push
{
    HBText1Controller *text1Vc = [[HBText1Controller alloc] init];
    text1Vc.name = @"你好";
    text1Vc.title = @"标题";
    [self.navigationController pushViewController:text1Vc animated:YES];
}

@end


