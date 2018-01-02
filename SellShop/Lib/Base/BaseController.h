//
//  BaseController.h
//  SellShop
//
//  Created by 云媒 on 2017/12/25.
//  Copyright © 2017年 云筹电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

#pragma mark 导航栏标题
-(void)setNavTitle:(NSString *)title;
/**
 title 标题
 */

#pragma mark 导航栏右边按钮（带图片、一个）
-(void)addtarget:(id)target OneBtn:(UIImage *)image with:(SEL)clic;
/**
 target 执行对象
 image 显示图片
 clic 触发方法
 */

#pragma mark 导航栏右边按钮（带图片、多个）
-(void)addtarget:(id)target with:(NSArray *)array;
/**
 target 执行对象
 array 存放图片和点击方法的数组
 */

#pragma mark 返回上一页
-(void)popVc;
#pragma mark dismis回上一页-
-(void)dissmissVc;

#pragma mark 导航栏右边按钮（文字、一个）
//-(void)popwithTitle:(NSString *)title;
/**
 此处的两个方法全部都是定制方法
 */
-(void)addtarget:(id)target witiTItle:(NSString *)title with:(SEL)sel;
//-(void)addtarget:(id)target witishopTItle:(NSString *)title with:(SEL)sel;
/**
 target 执行对象
 titile 显示文字
 clic 触发方法
 */

#pragma mark 导航栏右边按钮（图片带角标、一个）
-(void)addtarget:(id)target OneBtn:(UIImage *)image with:(SEL)clic withmessagecount:(NSInteger)count;
/**
 target 执行对象
 image 显示图片
 clic 触发方法
 count 角标数字
 */

#pragma mark 通用按钮
- (void)addtarget:(id)target withTitile:(NSString *)title sel:(SEL)sel orignPointY:(CGFloat)pointY toVC:(UIViewController *)vc;
/**
 taget 执行对象
 title 按钮标题
 sel 触发方法
 pointY 起始高度
 vc 目标控制器
 */

#pragma mark 可修改文字的按钮
-(void)addtarget:(id)target withNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitel with:(SEL)clic;
@end
