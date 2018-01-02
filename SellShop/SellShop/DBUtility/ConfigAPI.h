//
//  ConfigAPI.h
//  ErpApp
//
//  Created by Eric on 13-12-31.
//
//

#ifndef ErpApp_ConfigAPI_h
#define ErpApp_ConfigAPI_h

#pragma mark - 系统默认颜色
#define System_RedColor [UIColor colorWithRed:230/255.0 green:45/255.0 blue:45/255.0 alpha:1.0]
#define System_GrayColor [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]
#define System_FontBlack  [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]
#define System_FontBlack1  [UIColor colorWithRed:77/255.0 green:77/255.0 blue:77/255.0 alpha:1.0]

#define System_FontGray  [UIColor colorWithRed:146/255.0 green:146/255.0 blue:146/255.0 alpha:1.0]
#define System_BgGray    [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0]
#define System_DetailBgGray    [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0]

#define CreateColor(r, g, b)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]



#define  Defaults  [NSUserDefaults standardUserDefaults]

#pragma mark - 判断是否是IOS7
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending)

#define isiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


#pragma mark - 设备尺寸

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

#define SCREENHEIGHT (isiPhoneX?[UIScreen mainScreen].bounds.size.height-22:[UIScreen mainScreen].bounds.size.height)

#define isXNav (isiPhoneX?44:20)
#define isXTab (isiPhoneX?33:0)
#define NavagationBarHeight (SCREENHEIGHT == 812.0 ? 88 : 64)
#define SafeAreaBottomHeightHeight (SCREENHEIGHT == 812.0 ? 34 : 0)

//我的缩放
#define KproW SCREENWIDTH/375
#define KproH (isiPhoneX? 667.0/667.0 : SCREENHEIGHT/667.0)

#define kcolor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]



#define HBRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HBRandomColor HBRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256)) //随机色

#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]
#define GRAYTEXTCOLOR RGBCOLOR_HEX(0x7b7b7b)
#define ButtonNormalColor RGBCOLOR_HEX(0x67d2ca)

#ifdef DEBUG // 处于开发阶段
#define SLog(...) NSLog(__VA_ARGS__)
#else // 出去发布阶段
#define SLog(...)
#endif


//导航栏的颜色
#define knavcolor kcolor(254,45,74,0.99)

#pragma mark - api请求方式
#define API_HttpMethod      @"POST"

#pragma mark ---- api 地址
//测试
#define API_HOSTNAME         @""

//线上
//#define API_HOSTNAME     @""


#endif
