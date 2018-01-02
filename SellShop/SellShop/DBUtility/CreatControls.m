//
//  CreatControls.m
//  UIButton
//
//  Created by  on 16/5/6.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CreatControls.h"

@implementation CreatControls
#pragma mark --创建Label
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(float)font Text:(NSString*)text  BackgroundColor:(UIColor *)color 
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
//    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = color;
    //单词折行
    label.lineBreakMode = NSLineBreakByCharWrapping;
    //自适应
    label.adjustsFontSizeToFitWidth = YES;
    
    return label;
}
#pragma mark --创建View
+(UIView*)viewWithFrame:(CGRect)frame UserInteractionEnabled:(BOOL)UserInteractionEnabled  BackgroundColor:(UIColor *)color
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.userInteractionEnabled = UserInteractionEnabled;
    view.backgroundColor = color;
    
    return view;
}
#pragma mark --创建imageView
+(UIImageView*)createImageViewWithFrame:(CGRect)frame ImageName:(NSString*)imageName
UserInteractionEnabled:(BOOL)UserInteractionEnabled
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    NSLog(@"crartcontrols==%@",imageName);
    imageView.userInteractionEnabled = UserInteractionEnabled;
    
    return imageView;
    
}
#pragma mark --创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame ImageName:(NSString*)imageName Target:(id)target Action:(SEL)action Title:(NSString*)title
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    //设置背景图片，可以使文字与图片共存
//    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    //图片与文字如果需要同时存在，就需要图片足够小 详见人人项目按钮设置
     [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    NSLog(@"crartcontrols==%@",imageName);

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return button;
    
}
#pragma mark --创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame Target:(id)target Action:(SEL)action Title:(NSString*)title
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    //设置背景图片，可以使文字与图片共存
    [button setTitle:title forState:UIControlStateNormal];
    //图片与文字如果需要同时存在，就需要图片足够小 详见人人项目按钮设置
    // [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return button;
    
}
+(UIButton*)createButtonWithFrame:(CGRect)frame ImageName:(NSString*)imageName andHightImageName:(NSString *)hightImageName Target:(id)target Action:(SEL)action Title:(NSString*)title
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    //设置背景图片，可以使文字与图片共存
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //设置背景图片，可以使文字与图片共存
    [button setImage:[UIImage imageNamed:hightImageName] forState:UIControlStateHighlighted];
    NSLog(@"crartcontrols==%@",imageName);
    NSLog(@"crartcontrols==%@",hightImageName);

    [button setTitle:title forState:UIControlStateNormal];
    //点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return button;

}
#pragma mark --创建UITextField
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font   TextColor:(UIColor *)textcolor
{
    
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    //文字对齐方式
    textField.textAlignment=NSTextAlignmentLeft;
    textField.secureTextEntry=YESorNO;
    //边框
    //textField.borderStyle=UITextBorderStyleLine;
    //键盘类型
    textField.keyboardType=UIKeyboardTypeEmailAddress;
    //关闭首字母大写
    textField.autocapitalizationType=NO;
    //清除按钮
    //左图片
    textField.leftView = imageView;
    
    textField.leftViewMode = UITextFieldViewModeAlways;
    //右图片
    textField.rightView = rightImageView;
    //编辑状态下一直存在
    textField.rightViewMode = UITextFieldViewModeWhileEditing;
    //自定义键盘
    //textField.inputView
    //字体
    textField.font = [UIFont systemFontOfSize:font];
    //字体颜色
    textField.textColor = textcolor;
    
    
    return textField;
}


//适配器的方法  扩展性方法
//现有方法，已经在工程里面存在，如果修改工程内所有方法，工作量巨大，就需要使用适配器的方法
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName  clearButtonMode:clearButtonMode TextColor:(UIColor *)color
{
    UITextField*textfield= [self createTextFieldWithFrame:frame placeholder:placeholder passWord:YESorNO leftImageView:imageView rightImageView:rightImageView Font:font  TextColor:color];
    
    textfield.background=[UIImage imageNamed:imageName];
    NSLog(@"crartcontrols==%@",imageName);

    return textfield;
    
}
#pragma mark 创建UIScrollView
+(UIScrollView*)makeScrollViewWithFrame:(CGRect)frame andSize:(CGSize)size pagingEnabled:(BOOL)pagingEnabled showsHorizontalScrollIndicator:(BOOL)HorizontalScrollIndicator showsVerticalScrollIndicator:(BOOL)VerticalScrollIndicator
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    
    scrollView.pagingEnabled = pagingEnabled;
    scrollView.contentSize = size;
    scrollView.showsHorizontalScrollIndicator = HorizontalScrollIndicator;
    scrollView.showsVerticalScrollIndicator = VerticalScrollIndicator;
    scrollView.scrollsToTop = NO;
    
    
    return scrollView;
    
}
#pragma mark 创建UIPageControl
+(UIPageControl*)makePageControlWithFram:(CGRect)frame numberOfPages:(NSInteger )numberOfPages currentPage:(NSInteger )currentPage
{
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:frame];
    pageControl.numberOfPages = numberOfPages;
    pageControl.currentPage = currentPage;
    
    return pageControl;
}
#pragma mark 创建UISlider
+(UISlider*)makeSliderWithFrame:(CGRect)frame AndImage:(NSString*)image minimumValue:(float)minimumValue maximumValue:(float)maximumValue
{
    UISlider *slider = [[UISlider alloc]initWithFrame:frame];
    
    slider.minimumValue = minimumValue;
    slider.maximumValue = maximumValue;
    [slider setThumbImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    slider.maximumTrackTintColor = [UIColor grayColor];
    slider.minimumTrackTintColor = [UIColor yellowColor];
    slider.continuous = YES;
    slider.enabled = YES;
    NSLog(@"crartcontrols==%@",image);

    return slider;
}
#pragma mark 创建时间转换字符串
+(NSString *)stringFromDateWithHourAndMinute:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}
#pragma mark --判断导航的高度64or44
+(float)isIOS7
{
    float height;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        height = 64.0;
    }else
    {
        height = 44.0;
    }
    return height;
}
+ (CGFloat)textHeightWithString:(NSString *)text width:(CGFloat)width fontSize:(NSInteger)fontSize
{
    NSDictionary *dict = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    // 根据第一个参数的文本内容，使用280*float最大值的大小，使用系统14号字，返回一个真实的frame size : (280*xxx)!!
    CGRect frame = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.height + 10;
}



+ (float)TextHeight:(NSString*)text font:(UIFont*)font width:(float)width withLineSpacing:(float)lineSpacing
{
    
    //获取当前文本的属性
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];  //创建设置行间距的对象
    
    [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
    
    CGSize titleSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;   //计算高度
    
    return titleSize.height+25;
}

+(float)CalculationTextHeight:(NSString*)text font:(UIFont*)font width:(float)width
{
    
    //获取当前文本的属性
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];  //创建设置行间距的对象
    
    [paragraphStyle setLineSpacing:3.0];//调整行间距
    
    CGSize titleSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;   //计算高度
    
    return titleSize.height;
}



//URLEncode
+(NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    return encodedString;
}

@end
