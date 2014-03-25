//
//  NSDate+KKDateCreator.h
//  test
//
//  Created by Kohei on 2014/02/07.
//  Copyright (c) 2014年 KoheiKanagu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^KKDayEndFromBeginDate)(NSDate *dayBeginDate, NSDate *dayEndDate);
typedef void(^KKDayEndFromBeginString)(NSString *dayBeginString, NSString *dayEndString);


@interface NSDate (KKDateCreator)

+(void)KKGetEndFromBeginOfBeforeDays:(NSInteger )days date:(KKDayEndFromBeginDate )block string:(KKDayEndFromBeginString)stringBlock;
+(void)KKGetEndFromBeginOfAfterDays:(NSInteger )days date:(KKDayEndFromBeginDate )block string:(KKDayEndFromBeginString)stringBlock;

+(void)KKGetEndFromBeginOfLastWeek:(KKDayEndFromBeginDate )block;
+(void)KKGetEndFromBeginOfThisWeek:(KKDayEndFromBeginDate )block;

+(NSDate *)KKGetEndOneWeekWith:(NSDate *)sourceWeek;
+(NSDate *)KKGetStartOneWeekWith:(NSDate *)sourceWeek;

+(NSInteger )KKGetPassageDaysFrom:(NSDate *)sourceDate;


@end
