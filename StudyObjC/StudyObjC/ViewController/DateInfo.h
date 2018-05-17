//
//  DateInfo.h
//  StudyObjC
//
//  Created by WISEfn on 2018. 5. 17..
//  Copyright © 2018년 WISEfn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DateInfo: NSObject
@property(copy) NSDateComponents *comp;
-(id)initWithYear:(int)year month:(int)month day:(int)day;
-(id)initToday;
-(int)numOfTheDayInTheMonth;
-(int)firstWeekNameByIntInTheMonth;
-(NSDate *)nsDateInfo;
@end
