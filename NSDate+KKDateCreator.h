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


+(void)piyoipyo;

+(void)KKGetEndFromBeginOfBeforeDays:(NSInteger )days date:(KKDayEndFromBeginDate )block string:(KKDayEndFromBeginString)stringBlock;


@end
