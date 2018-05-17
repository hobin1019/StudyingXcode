//
//  DateInfo.m
//  StudyObjC
//
//  Created by WISEfn on 2018. 5. 17..
//  Copyright © 2018년 WISEfn. All rights reserved.
//
#import "DateInfo.h"

@implementation DateInfo
@synthesize comp;

// initializer...
-(id) initWithYear:(int)year month:(int)month day:(int)day{
    self = [super init];
    if(self!=nil){
        comp = [NSDateComponents new];
        [comp setYear:year];
        [comp setMonth:month];
        [comp setDay:day];
    }
    return self;
}
-(id) initToday{
    self = [super init];
    if(self!=nil){
        comp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    }
    return self;
}

// comp month에 있는 day 갯수 구하기
-(int)numOfTheDayInTheMonth{
    if(comp.year==-1 || comp.month==-1) return -1;
    
    NSRange daysRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self nsDateInfo]];
    NSInteger numOfDate = daysRange.length;
    //NSLog(@"Last Day : %ld", (long)numOfDate);
    
    return (int)numOfDate;
}

// comp month의 첫날 요일 정보 구하기
-(int)firstWeekNameByIntInTheMonth{
    // 일:1, 월:2, 화:3, 수:4, ..., 토:7
    if(comp.year==-1 || comp.month==-1) return -1;
    
    NSDateComponents *firstDay = [[NSDateComponents alloc]init];
    firstDay.year = comp.year;
    firstDay.month = comp.month;
    firstDay.day = 1;
    NSDate *theDay = [[NSCalendar currentCalendar] dateFromComponents:firstDay];
    NSDateComponents *weekdayComps = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:theDay];
    
    // [return] 일:0, 월:1, 화:2, 수:3, ..., 토:6
    return (int)[weekdayComps weekday]-1;
}

//
-(NSDate *)nsDateInfo{
    return [[NSCalendar currentCalendar] dateFromComponents:comp];
}
@end
