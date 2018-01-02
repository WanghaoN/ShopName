//
//  CreatControls.h
//  UIButton
//
//  Created by  on 16/5/6.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CreatControls : NSObject
#pragma mark --创建Label
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(float)font Text:(NSString*)text BackgroundColor:(UIColor *)color ;
#pragma mark --创建View
+(UIView*)viewWithFrame:(CGRect)frame UserInteractionEnabled:(BOOL)UserInteractionEnabled  BackgroundColor:(UIColor *)color;
#pragma mark --创建imageView
+(UIImageView*)createImageViewWithFrame:(CGRect)frame ImageName:(NSString*)imageName    UserInteractionEnabled:(BOOL)UserInteractionEnabled;
#pragma mark --创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame ImageName:(NSString*)imageName Target:(id)target Action:(SEL)action Title:(NSString*)title;
+(UIButton*)createButtonWithFrame:(CGRect)frame ImageName:(NSString*)imageName andHightImageName:(NSString *)hightImageName Target:(id)target Action:(SEL)action Title:(NSString*)title;
+(UIButton*)createButtonWithFrame:(CGRect)frame Target:(id)target Action:(SEL)action Title:(NSString*)title;
#pragma mark --创建UITextField
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font  TextColor:(UIColor *)textcolor;


//适配器的方法  扩展性方法
//现有方法，已经在工程里面存在，如果修改工程内所有方法，工作量巨大，就需要使用适配器的方法
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName  clearButtonMode:clearButtonMode TextColor:(UIColor *)color;


#pragma mark 创建UIScrollView
+(UIScrollView*)makeScrollViewWithFrame:(CGRect)frame andSize:(CGSize)size pagingEnabled:(BOOL)pagingEnabled showsHorizontalScrollIndicator:(BOOL)HorizontalScrollIndicator showsVerticalScrollIndicator:(BOOL)VerticalScrollIndicator;

#pragma mark 创建UIPageControl
+(UIPageControl*)makePageControlWithFram:(CGRect)frame numberOfPages:(NSInteger )numberOfPages currentPage:(NSInteger )currentPage;
#pragma mark 创建UISlider
+(UISlider*)makeSliderWithFrame:(CGRect)frame AndImage:(NSString*)image minimumValue:(float)minimumValue maximumValue:(float)maximumValue;
#pragma mark 创建时间转换字符串
+(NSString *)stringFromDateWithHourAndMinute:(NSDate *)date;
#pragma mark --判断导航的高度64or44
+(float)isIOS7;
+ (CGFloat)textHeightWithString:(NSString *)text width:(CGFloat)width fontSize:(NSInteger)fontSize;
+ (float)TextHeight:(NSString*)text font:(UIFont*)font width:(float)width withLineSpacing:(float)lineSpacing;
+(float)CalculationTextHeight:(NSString*)text font:(UIFont*)font width:(float)width;
//URLEncode
+(NSString*)encodeString:(NSString*)unencodedString;
@end
