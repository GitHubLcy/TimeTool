//
//  NSString+SSLFormatTimeExtension.m
//  JiaZhuangTong
//
//  Created by 李春阳 on 17/2/9.
//  Copyright © 2017年 ronglei. All rights reserved.
//

#import "NSString+SSLFormatTimeExtension.h"

@implementation NSString (TimeExtension)

+ (NSString *)timeChangedWithTimeStamp:(NSTimeInterval)timeStamp
{
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",timeStamp];
    if (timeStr.length == 13) {
        timeStamp = timeStamp / 1000;//毫秒级别
    }
    
    NSDate *todayDate = [NSDate date];
    int distance = [todayDate timeIntervalSince1970] - timeStamp;
    NSString *string;
    if (distance < 1){//avoid 0 seconds
        string = @"刚刚";
    } else if (distance < 60) {
        string = [NSString stringWithFormat:@"%d秒前", (distance)];
    } else if (distance < 3600) {//60 * 60
        distance = distance / 60;
        string = [NSString stringWithFormat:@"%d分钟前", (distance)];
    }  else if (distance < 86400) {//60 * 60 * 24
        distance = distance / 3600;
        string = [NSString stringWithFormat:@"%d小时前", (distance)];
    } else if (distance < 604800) {//60 * 60 * 24 * 7
        distance = distance / 86400;
        string = [NSString stringWithFormat:@"%d天前", (distance)];
    } else if (distance < 2419200) {//60 * 60 * 24 * 7 * 4
        distance = distance / 604800;
        string = [NSString stringWithFormat:@"%d周前", (distance)];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        string = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(timeStamp)]];
        
        // 如果是今年
        NSString *thisYear = [[dateFormatter stringFromDate:todayDate] substringToIndex:4];;
        NSRange range = [string rangeOfString:thisYear];
        if (range.location != NSNotFound) {
            [dateFormatter setDateFormat:@"MM-dd"];
            string = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(timeStamp)]];
        }
    }
    return string;
}

+ (NSString *)timeWithDate:(NSDate *)date timeType:(YQTimeType)timeType
{
    if (!date) return @"";
    
    NSDateFormatter *dateFormatter = [[self class] dateFormatWithTimeType:timeType];
    
    NSString *timeString = [dateFormatter stringFromDate:date];
    return timeString;
}

+ (NSString *)timeStampStrWithDate:(NSDate *)date
{
    NSTimeInterval timeStamp = [[self class] timeStampWithDate:date];
    return [NSString stringWithFormat:@"%.0f",timeStamp];
}

+ (NSTimeInterval)timeStampWithDate:(NSDate *)date
{
    if (!date) return 0;
    
    NSTimeInterval timeStamp = [date timeIntervalSince1970];
    return timeStamp;
}

+ (NSString *)timeStampStrWithTime:(NSString *)time timeType:(YQTimeType)timeType
{
    if (!time) return @"";
    
    return [NSString stringWithFormat:@"%.0f",[[self class] timeStampWithTime:time timeType:timeType]];
}

+ (NSTimeInterval)timeStampWithTime:(NSString *)time timeType:(YQTimeType)timeType
{
    if (!time) return 0;
    
    NSString *string = time;
    
    NSDateFormatter *dateFormatter = [[self class] dateFormatWithTimeType:timeType];
    
    NSDate *date = [[NSDate alloc] init];
    // voila!
    date = [dateFormatter dateFromString:string];
    
    //date to timestamp
    //NSTimeInterval timeInterval = [date timeIntervalSince1970] * 1000;
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

+ (NSString *)timeWithTimeStampStr:(NSString *)timeStampStr timeType:(YQTimeType)timeType
{
    if (!timeStampStr) return @"";
    
    return [[self class] timeWithTimeStamp:timeStampStr.doubleValue timeType:timeType];
}

//时间戳转化字符串
+ (NSString *)timeWithTimeStamp:(NSTimeInterval)timeStamp timeType:(YQTimeType)timeType
{
    if (timeStamp < 0) return @"";
    
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",timeStamp];
    if (timeStr.length == 13) {
        timeStamp = timeStamp / 1000;//毫秒级别
    }
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter *dateFormatter = [[self class] dateFormatWithTimeType:timeType];
    NSString *timeString = [dateFormatter stringFromDate:date];
    
    return timeString;
}

+ (NSDateFormatter *)dateFormatWithTimeType:(YQTimeType)timeType
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (timeType == YQTimeTypeYMdHmLine) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    } else if (timeType == YQTimeTypeMonthDay) {
        [dateFormatter setDateFormat:@"M月d日"];
    } else if (timeType == YQTimeTypeMdSlash) {
        [dateFormatter setDateFormat:@"M/d"];
    } else if (timeType == YQTimeTypeYMdLine) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    } else if (timeType == YQTimeTypeYMdHmsLine) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    } else if (timeType == YQTimeTypeYearMonthDay) {
        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    }  else if (timeType == YQTimeTypeHourMinutesSecond) {
        [dateFormatter setDateFormat:@"HH时mm分ss秒"];
    }  else if (timeType == YQTimeTypeYearMonthDayHourMinutesSecond) {
        [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    }
    else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    return dateFormatter;
}

//----
- (NSString *)timeStampFromMdSlashTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeMdSlash];
}

- (NSString *)timeStampFromYMdLineTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeYMdLine];
}

- (NSString *)timeStampFromYMdHmLineTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeYMdHmLine];
}

- (NSString *)timeStampFromYMdHmsLineTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeYMdHmsLine];
}

- (NSString *)timeStampFromMonthDayTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeMonthDay];
}

- (NSString *)timeStampFromYearMonthDayTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeYearMonthDay];
}

- (NSString *)timeStampFromHourMinutesSecondTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeHourMinutesSecond];
}

- (NSString *)timeStampFromYearMonthDayHourMinutesSecondTime
{
    return [NSString timeStampStrWithTime:self timeType:YQTimeTypeYearMonthDayHourMinutesSecond];
}

//----

- (NSString *)MdSlashTimeFromTimeStamp
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeMdSlash];
}

- (NSString *)ymdLineTimeFromTimeStamp
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeYMdLine];
}

- (NSString *)ymdHmLineTimeFromTimeStamp
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeYMdHmLine];
}

- (NSString *)ymdHmsLineTimeFromTimeStamp
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeYMdHmsLine];
}

- (NSString *)monthDayTimeFromTimeStamp
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeMonthDay];
}

- (NSString *)yearMonthDayTimeFromTimeStamp
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeYearMonthDay];
}

- (NSString *)hourMinutesSecondTimeFromTimeStamp;
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeHourMinutesSecond];
}

- (NSString *)yearMonthDayHourMinutesSecondTimeFromTimeStamp;
{
    return [NSString timeWithTimeStampStr:self timeType:YQTimeTypeYearMonthDayHourMinutesSecond];
}

@end
