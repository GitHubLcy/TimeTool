//
//  NSString+SSLFormatTimeExtension.h
//  JiaZhuangTong
//
//  Created by 李春阳 on 17/2/9.
//  Copyright © 2017年 ronglei. All rights reserved.
//

#import <Foundation/Foundation.h>

//时间转换工具类

typedef enum {
    YQTimeTypeMdSlash,                              //M/d
    YQTimeTypeYMdLine,                              //yyyy-MM-dd
    YQTimeTypeYMdHmLine,                            //yyyy-MM-dd HH:mm
    YQTimeTypeYMdHmsLine,                           //yyyy-MM-dd HH:mm:ss
    YQTimeTypeMonthDay,                             //M月d日
    YQTimeTypeYearMonthDay,                         //yyyy年MM月dd日
    YQTimeTypeHourMinutesSecond,                    //HH时mm分ss秒
    YQTimeTypeYearMonthDayHourMinutesSecond,        //yyyy年MM月dd日 HH时mm分ss秒
}YQTimeType;                                        //时间格式

@interface NSString (TimeExtension)

/**
 *  将时间戳转换为时间
 *
 *  @param timeStamp 时间戳
 *
 *  @return “刚刚”、“1小时前”等 类似时间
 */
+ (NSString *)timeChangedWithTimeStamp:(NSTimeInterval)timeStamp;

/**
 *  将日期转换为时间
 *
 *  @param date 日期
 *  @param timeType 时间格式
 *
 *  @return 指定格式的时间
 */
+ (NSString *)timeWithDate:(NSDate *)date timeType:(YQTimeType)timeType;

/**
 *  将日期转换为时间戳
 *
 *  @param date 日期
 *
 *  @return 时间戳
 */
+ (NSString *)timeStampStrWithDate:(NSDate *)date;

/**
 *  将日期转换为时间戳
 *
 *  @param date 日期
 *
 *  @return 时间戳
 */
+ (NSTimeInterval)timeStampWithDate:(NSDate *)date;

/**
 *  将时间转换为时间戳
 *
 *  @param time 时间
 *  @param timeType 时间格式
 *
 *  @return 时间戳
 */
+ (NSString *)timeStampStrWithTime:(NSString *)time timeType:(YQTimeType)timeType;

/**
 *  将时间转换为时间戳
 *
 *  @param time 时间
 *  @param timeType 时间格式
 *
 *  @return 时间戳
 */
+ (NSTimeInterval)timeStampWithTime:(NSString *)time timeType:(YQTimeType)timeType;

/**
 *  将时间戳转换为时间
 *
 *  @param timeStampStr 字符串格式的时间
 *  @param timeType 时间格式
 *
 *  @return 时间
 */
+ (NSString *)timeWithTimeStampStr:(NSString *)timeStampStr timeType:(YQTimeType)timeType;
/**
 *  将时间戳转换为时间
 *
 *  @param timeStamp NSTimeInterval格式的时间
 *  @param timeType 时间格式
 *
 *  @return 时间
 */
+ (NSString *)timeWithTimeStamp:(NSTimeInterval)timeStamp timeType:(YQTimeType)timeType;

//-------时间转化为时间戳
//时间转化为时间戳 M/d
- (NSString *)timeStampFromMdSlashTime;

//时间转化为时间戳 yyyy-MM-dd
- (NSString *)timeStampFromYMdLineTime;

//时间转化为时间戳 yyyy-MM-dd HH:mm
- (NSString *)timeStampFromYMdHmLineTime;

//时间转化为时间戳 yyyy-MM-dd HH:mm:ss
- (NSString *)timeStampFromYMdHmsLineTime;

//时间转化为时间戳 M月d日
- (NSString *)timeStampFromMonthDayTime;

//时间转化为时间戳 yyyy年MM月dd日
- (NSString *)timeStampFromYearMonthDayTime;

//时间转化为时间戳 HH时mm分ss秒
- (NSString *)timeStampFromHourMinutesSecondTime;

//时间转化为时间戳 yyyy年MM月dd日 HH时mm分ss秒
- (NSString *)timeStampFromYearMonthDayHourMinutesSecondTime;

//-------时间戳转化为时间
//时间戳转化为时间 M/d
- (NSString *)MdSlashTimeFromTimeStamp;

//时间戳转化为时间 yyyy-MM-dd
- (NSString *)ymdLineTimeFromTimeStamp;

//时间戳转化为时间 yyyy-MM-dd HH:mm
- (NSString *)ymdHmLineTimeFromTimeStamp;

//时间戳转化为时间 yyyy-MM-dd HH:mm:ss
- (NSString *)ymdHmsLineTimeFromTimeStamp;

//时间戳转化为时间 M月d日
- (NSString *)monthDayTimeFromTimeStamp;

//时间戳转化为时间 yyyy年MM月dd日
- (NSString *)yearMonthDayTimeFromTimeStamp;

//时间戳转化为时间 HH时mm分ss秒
- (NSString *)hourMinutesSecondTimeFromTimeStamp;

//时间戳转化为时间 yyyy年MM月dd日 HH时mm分ss秒
- (NSString *)yearMonthDayHourMinutesSecondTimeFromTimeStamp;

@end
