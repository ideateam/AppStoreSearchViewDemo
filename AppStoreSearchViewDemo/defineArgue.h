//
//  defineArgue.h
//  AppStoreSearchViewDemo
//
//  Created by MacOS on 2019/2/20.
//  Copyright © 2019 MacOS. All rights reserved.
//

#import <Foundation/Foundation.h>

//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

//判断iPhone4系列
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone7系列
#define iPhone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone7p系列
#define iPhone7Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone8系列
#define iPhone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone8p系列
#define iPhone8Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//屏幕宽高
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

//iPhoneX iPhoneXs iPHoneXr iPhoneXs Max
#define IS_IPHONEX_LATER ((IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs || IS_IPHONE_Xs_Max) ? YES : NO)

// 适配刘海屏状态栏高度
#define StatusBarHeight (IS_IPHONEX_LATER ? 44.f : 20.f)
// 适配nav高度
#define NavigationBarHeight  44.f
// 适配iPhone X Tabbar距离底部的距离
#define TabbarSafeBottomMargin (IS_IPHONEX_LATER ? 34.f : 0.f)
// 适配iPhone X Tabbar高度
#define TabbarHeight (IS_IPHONEX_LATER ? (49.f + 34.f) : 49.f)

@interface defineArgue : NSObject

@end


