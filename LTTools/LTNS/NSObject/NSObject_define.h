//
//  NSObject_define.h
//  YLkit
//
//  Created by yelon on 15-4-1.
//  Copyright (c) 2015年 yelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef OBJC_ARC_ENABLED
#ifdef __has_feature
#define OBJC_ARC_ENABLED __has_feature(objc_arc)
#else
#define OBJC_ARC_ENABLED 0
#endif
#endif

#if OBJC_ARC_ENABLED
#define LT_Release(obj) obj
#define LT_AutoRelease(obj) obj
#define LT_SuperDealloc nil;
#else
#define LT_Release(obj) [(obj) release]
#define LT_AutoRelease(obj) [(obj) autorelease]
#define LT_SuperDealloc [super dealloc]
#endif

#define LT_SUPPORT_ARM64 (__LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64)


#ifdef DEBUG
#define LTLog(fmt, ...) NSLog(fmt, ...)
#else
#define LTLog(fmt, ...) nil
#endif

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(fmt, ...) nil
#endif

#define ClassAndMethod [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]

//#define DeviceScreen [UIScreen mainScreen]
//#define ScreenBounds [DeviceScreen bounds]

#define LT_ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define LT_ScreenHeight    [UIScreen mainScreen].bounds.size.height

#pragma mark LT_IOS_VERSION
#define LT_IOS_VERSION [[[UIDevice currentDevice]systemVersion] doubleValue]
//6.0
#define LT_IOS_Foundation_Before_6 LT_IOS_Foundation_Before(NSFoundationVersionNumber_iOS_5_1)
#define LT_IOS_Foundation_Later_6  LT_IOS_Foundation_Later(NSFoundationVersionNumber_iOS_5_1)
//7.0
#define LT_IOS_Foundation_Before_7 LT_IOS_Foundation_Before(NSFoundationVersionNumber_iOS_6_1)
#define LT_IOS_Foundation_Later_7  LT_IOS_Foundation_Later(NSFoundationVersionNumber_iOS_6_1)
//8.0
#define LT_IOS_Foundation_Before_8 LT_IOS_Foundation_Before(NSFoundationVersionNumber_iOS_7_1)
#define LT_IOS_Foundation_Later_8  LT_IOS_Foundation_Later(NSFoundationVersionNumber_iOS_7_1)
//9.0
#define LT_IOS_Foundation_Before_9 LT_IOS_Foundation_Before(NSFoundationVersionNumber_iOS_8_4)
#define LT_IOS_Foundation_Later_9  LT_IOS_Foundation_Later(NSFoundationVersionNumber_iOS_8_4)

#define LT_IOS_Foundation_Before(VersionNumber) floor(NSFoundationVersionNumber) <= VersionNumber
#define LT_IOS_Foundation_Later(VersionNumber)  floor(NSFoundationVersionNumber) > VersionNumber

