//
//  Utility.h
//  ErpApp2.0
//
//  Created by Eric on 14-3-17.
//
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject
#pragma  mark  --- 判断字符串是否为空
+(BOOL)isBlankString:(NSString *)string;
#pragma  mark  --- 去除空格
+(NSString*)getString:(NSString *)string;
#pragma  mark  --- 隐藏uitableview多余的cell
+(void)setExtraCellLineHidden: (UITableView *)tableView;
#pragma  mark  --- 处理空字符串
+(NSString *)doEmptyString:(NSString*)str;
#pragma  mark  --- 日期格式化
+(NSString*)DateFromater:(NSDate*)current strDateFromater:(NSString *)str;
+(NSString *)getMonthBeginAndEndWith:(NSDate *)newDate type:(NSInteger)type;
#pragma  mark  --- 空字符串替换
+(NSString*)GetStrByNull:(NSString*)str returnStr:(NSString*)returnStr;
#pragma  mark  --- 弹出动画
+(void) shakeToShow:(UIView*)aView;
+(NSString *)md5:(NSString*)str;
#pragma  mark  --- SIGN 排序
+ (NSString*)SignWithKeys:(NSArray *)keyArr withValues:(NSMutableDictionary*)dic ;
#pragma  mark  --- 获取设备当前网络IP地址
+ (NSString *)getIPAddress:(BOOL)preferIPv4;
#pragma  mark  --- 旋转动画
+ (UIImageView *)rotate360DegreeWithImageView:(UIImageView *)imageView;
#pragma  mark  --- 网络要不要在plist文件中加载
+(BOOL)checkOutNet;
#pragma  mark  ---  二进制色值
+ (UIColor*) colorWithHex:(NSString*)hexStr;
#pragma  mark  ---  label 宽自适应
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font ;
#pragma  mark  ---  label 高自适应
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;
#pragma  mark   --- 字符串转换时间戳
+(NSString *)timestamp:(NSString *)timeString;
#pragma  mark   ---   获取 MAC 地址
+ (NSString *)getMacAddress ;
@end
