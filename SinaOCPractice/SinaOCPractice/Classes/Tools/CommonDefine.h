//
//  CommonDefine.h
//  QuickCure1
//
//  Created by maoge on 16/10/30.
//  Copyright © 2016年 maoge. All rights reserved.
//


//通知
extern NSString *const kChangeRootViewControllerNotification;


// LeftVC 偏移距离
#define kLeftOffsetPadding (SCREEN_WIDTH*0.2)//左划控制器得偏移

//判断手机型号
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//weakSelf

#define WEAKSELF __weak typeof(self) weakSelf = self;

//网络不佳
#define kNetWorkFailureStatus @"当前网络不佳，请检查网络"
#define kUnKnownFailureStatus @"未知错误信息"

//主题颜色
#define kThemeColor [UIColor colorWithRed:24/255.0 green:188/255.0 blue:187/255.0 alpha:1]

//**************************************************************

///AppDelegate
#define MLAppDelegate  (AppDelegate *)[UIApplication sharedApplication].delegate

#define MLDefaults (NSUserDefaults *)[NSUserDefaults standardUserDefaults]

///屏幕宽高
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)
#define SCREEN_SIZE ([UIScreen mainScreen].bounds.size)
#define SCREEN_LEFT_WIDTH ([UIScreen mainScreen].bounds.size.width*0.8)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define kProportion   SCREEN_WIDTH/320 // 5 ok
#define kProportion6  SCREEN_WIDTH/375
#define kProportion6P SCREEN_WIDTH/375
#define kProportion7  SCREEN_WIDTH/414
#define kProportion7P SCREEN_WIDTH/414

///颜色
#define RANDOMCOLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGBHexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0] //RGBHexColor(0xefefef)

#define CLEAR_COLOR [UIColor clearColor]//无色
#define DEEPBLUE_COLOR RGBHexColor(0x44b2f0)//深蓝色
#define BLUE_COLOR RGBHexColor(0x23a7f1)//蓝色
#define WHITE_COLOR RGBHexColor(0xffffff)//白色
#define LIGHTBLUE_COLOR RGBHexColor(0xa8c7e0)//亮蓝色
#define GRAY_COLOR RGBHexColor(0xf6f8fa)//灰色
#define ORANGE_COLOR RGBHexColor(0xf39800)//橘色
#define RED_COLOR RGBHexColor(0xf0311d)//红色
#define DEEPBLACK_COLOR RGBHexColor(0x252525)//深黑色
#define LIGHTBLACK_COLOR RGBHexColor(0x333333)//淡黑色
#define LIGHTBLACK_COLOR666 RGBHexColor(0x666666)//淡黑色
#define LIGHTBLACK_COLOR999 RGBHexColor(0x999999)//淡黑色

//字体
#define BOLDFONT(F) [UIFont boldSystemFontOfSize:F]//粗体
#define FONT(F)     [UIFont systemFontOfSize:F]//普通字体

//打印Frame
#define LogFrame(frame) NSLog(@"frame[X=%.1f,Y=%.1f,W=%.1f,H=%.1f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
//打印Point
#define LogPoint(point) NSLog(@"Point[X=%.1f,Y=%.1f]",point.x,point.y);

///系统版本号
#define iOS_SYSTEM   [[[UIDevice currentDevice] systemName] doubleValue]

#define kUsersInfoPath [@"usersInfo.plist" jq_appendDocumentDir]




