//
//  NSDate+KKDateCreator.m
//  test
//
//  Created by Kohei on 2014/02/07.
//  Copyright (c) 2014年 KoheiKanagu. All rights reserved.
//

#import "NSDate+KKDateCreator.h"



@implementation NSDate (KKDateCreator)


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


+(void)KKGetEndFromBeginOfAfterDays:(NSInteger )days date:(KKDayEndFromBeginDate )block string:(KKDayEndFromBeginString)stringBlock
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:
                                    NSYearCalendarUnit|
                                    NSMonthCalendarUnit|
                                    NSDayCalendarUnit
                                               fromDate:[NSDate date]];
    
    [components setDay:components.day+days];
    NSDate *beginDate = [calendar dateFromComponents:components];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    NSDate *endDate = [calendar dateFromComponents:components];
    
    NSString *beginString = [self convertNSDateToString:beginDate];
    NSString *endString = [self convertNSDateToString:endDate];
    
    return block(beginDate, endDate), stringBlock(beginString, endString);
}


+(void)KKGetEndFromBeginOfLastWeek:(KKDayEndFromBeginDate )block
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:
                                    NSYearCalendarUnit|
                                    NSMonthCalendarUnit|
                                    NSDayCalendarUnit
                                               fromDate:[NSDate date]];
    [components setDay:components.day-8];
    NSDate *beginDate = [calendar dateFromComponents:components];
    
    [components setDay:components.day+7];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    NSDate *endDate = [calendar dateFromComponents:components];
    
    return block(beginDate, endDate);
}

+(void)KKGetEndFromBeginOfThisWeek:(KKDayEndFromBeginDate )block
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:
                                    NSYearCalendarUnit|
                                    NSMonthCalendarUnit|
                                    NSDayCalendarUnit
                                               fromDate:[NSDate date]];
    NSDate *beginDate = [calendar dateFromComponents:components];
    
    [components setDay:components.day+7];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    NSDate *endDate = [calendar dateFromComponents:components];
    
    return block(beginDate, endDate);
}


+(NSDate *)KKGetEndOneWeekWith:(NSDate *)sourceWeek
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:
                                    NSYearCalendarUnit|
                                    NSMonthCalendarUnit|
                                    NSDayCalendarUnit
                                               fromDate:sourceWeek];
    
    [components setDay:components.day+7];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    NSDate *endDate = [calendar dateFromComponents:components];
    
    return endDate;
}

+(NSDate *)KKGetStartOneWeekWith:(NSDate *)sourceWeek
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:
                                    NSYearCalendarUnit|
                                    NSMonthCalendarUnit|
                                    NSDayCalendarUnit
                                               fromDate:sourceWeek];
    
    [components setDay:components.day-7];
    NSDate *startDate = [calendar dateFromComponents:components];
    
    return startDate;
}


+(NSInteger )KKGetPassageDaysFrom:(NSDate *)sourceDate
{
    if(sourceDate){
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                                   fromDate:sourceDate
                                                     toDate:[NSDate date]
                                                    options:0];
        return components.day;
    }
    return 0;
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
