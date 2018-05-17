//
//  DiaryViewController.m
//  StudyObjC
//
//  Created by WISEfn on 2018. 5. 17..
//  Copyright © 2018년 WISEfn. All rights reserved.
//

#import "DiaryViewController.h"
//#import "DateInfo.h"

@implementation DiaryViewController
@synthesize dateInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.dateInfoLbl.text = [NSString stringWithFormat:@"%d년 %d월 %d일", (int)dateInfo.year, (int)dateInfo.month, (int)dateInfo.day];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
