# SSLTimeTool

NSDate *date = [NSDate date];

##日期转换为时间
//M/d  
NSString *mdSlashTime = [NSString timeWithDate:date timeType:YQTimeTypeMdSlash];  
NSLog(@"M/d:%@",mdSlashTime);  
    
##日期转换为时间戳  
NSString *timeStamp = [NSString timeStampStrWithDate:date];  
NSLog(@"时间戳:%@",timeStamp);  

##时间戳转换为 “刚刚”、“1小时前”等 类似时间
NSString *changedTime = [NSString timeChangedWithTimeStamp:timeStamp.doubleValue];  
NSLog(@"变化的时间显示:%@",changedTime);  

##时间戳转换为时间
//yyyy-MM-dd  
NSString *ymdLineTime = timeStamp.ymdLineTimeFromTimeStamp;  
//yyyy-MM-dd HH:mm  
NSString *ymdhmLineTime = timeStamp.ymdHmLineTimeFromTimeStamp;  
//yyyy-MM-dd HH:mm:ss  
NSString *ymdHmsLineTime = timeStamp.ymdHmsLineTimeFromTimeStamp;  

NSLog(@"yyyy-MM-dd:%@",ymdLineTime);  
NSLog(@"yyyy-MM-dd HH:mm:%@",ymdhmLineTime);  
NSLog(@"yyyy-MM-dd HH:mm:ss:%@",ymdHmsLineTime);  

##时间转换为时间戳
//yyyy-MM-dd  
NSString *ymdLineTimeStamp = ymdLineTime.timeStampFromYMdLineTime;  
NSLog(@"yyyy-MM-dd类型 时间戳:%@",ymdLineTimeStamp);  
