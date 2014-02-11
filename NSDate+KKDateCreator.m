//
//  NSDate+KKDateCreator.m
//  test
//
//  Created by Kohei on 2014/02/07.
//  Copyright (c) 2014年 KoheiKanagu. All rights reserved.
//

#import "NSDate+KKDateCreator.h"



@implementation NSDate (KKDateCreator)


+(void)piyoipyo
{
    
    [self KKGetEndFromBeginOfBeforeDays:5
                                   date:^(NSDate *dayBeginDate, NSDate *dayEndDate) {
                                       
                                   }
                                 string:^(NSString *dayBeginString, NSString *dayEndString) {
                                     
                                 }];
}

+(void)KKGetEndFromBeginOfBeforeDays:(NSInteger )days date:(KKDayEndFromBeginDate )block string:(KKDayEndFromBeginString)stringBlock
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:
                                    NSYearCalendarUnit|
                                    NSMonthCalendarUnit|
                                    NSDayCalendarUnit
                                               fromDate:[NSDate date]];
    
    [components setDay:components.day-days];
    NSDate *beginDate = [calendar dateFromComponents:components];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    NSDate *endDate = [calendar dateFromComponents:components];
    
    NSString *beginString = [self convertNSDateToString:beginDate];
    NSString *endString = [self convertNSDateToString:endDate];

    return block(beginDate, endDate), stringBlock(beginString, endString);
}





+(NSString *)convertNSDateToString:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"yyyy/MM/dd HH:mm"
                                                             options:0
                                                              locale:[NSLocale currentLocale]]];
    return [formatter stringFromDate:date];
}


@end
