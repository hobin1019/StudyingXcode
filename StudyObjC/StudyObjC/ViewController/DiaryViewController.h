//
//  DiaryViewController.h
//  StudyObjC
//
//  Created by WISEfn on 2018. 5. 17..
//  Copyright © 2018년 WISEfn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiaryViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *dateInfoLbl;
@property (strong, nonatomic) IBOutlet UITextView *textFld;
@property(copy) NSDateComponents *dateInfo;

@end
