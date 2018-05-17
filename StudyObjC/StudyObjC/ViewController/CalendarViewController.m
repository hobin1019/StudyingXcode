//
//  CalendarViewController.m
//  StudyObjC
//
//  Created by WISEfn on 2018. 5. 15..
//  Copyright © 2018년 WISEfn. All rights reserved.
//

#import "CalendarViewController.h"
#import "DiaryViewController.h"

@interface CalendarViewController ()
@property (strong, nonatomic) IBOutlet UILabel *calendarLbl;
@property (strong, nonatomic) IBOutlet UIView *weekView;
@property (strong, nonatomic) IBOutlet UIView *dateView;
@end

@implementation CalendarViewController

NSArray *weekNameArray;
DateInfo *today;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    weekNameArray = [NSArray arrayWithObjects:@"일", @"월", @"화", @"수", @"목", @"금", @"토", nil];
    
    [self initCalendar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initCalendar{
    today = [[DateInfo alloc] initToday];
    self.calendarLbl.text = [[NSString alloc] initWithFormat:@"%ld년 %ld월", today.comp.year, today.comp.month];
    
    [self setCalendarWithWeek];
    [self setCalendarWithDate:[today nsDateInfo]];
}

- (void)setCalendarWithWeek{
    float width = self.weekView.bounds.size.width/[weekNameArray count];
    float height = self.weekView.bounds.size.height;
    float x = self.weekView.frame.origin.x;
    float y = self.weekView.frame.origin.y;
    for(int i=0; i<[weekNameArray count];i++){
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(x + width * i, y, width, height)];
        lbl.text = [weekNameArray objectAtIndex:i];
        lbl.clipsToBounds = YES; // 테두리
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor blackColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:lbl];
    }
}
- (void)setCalendarWithDate:(NSDate *)date {
    int firstDayInMonth = [today firstWeekNameByIntInTheMonth];
    int numInMonth = [today numOfTheDayInTheMonth];
    NSLog(@"firstWeekName : %@", [weekNameArray objectAtIndex:firstDayInMonth]);//test
    NSLog(@"numOfTheDayInTheMonth : %d", numInMonth);//test
    
    float width = self.dateView.bounds.size.width/[weekNameArray count];
    float height = self.dateView.bounds.size.height/6;
    float startX = self.dateView.frame.origin.x;
    float startY = self.dateView.frame.origin.y;
    
    int num = 0; float x = startX + width * firstDayInMonth, y = startY;
    for(int i = 0 ; i <  numInMonth ; i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self
                   action:@selector(dateClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[NSString stringWithFormat:@"%d", ++num] forState:UIControlStateNormal];
        btn.frame = CGRectMake(x, y, width, height);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        //set Label position
        x += width;
        if(x >= self.dateView.bounds.size.width){
            x = startX;
            y += height;
        }
    }
}

-(void) dateClicked:(UIButton*)sender{
    int clickedNum = (int)[sender.titleLabel.text integerValue];
    
    DiaryViewController *dvc = (DiaryViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"DiaryViewController"];
    [self.navigationController pushViewController:dvc animated:true];
    NSDateComponents *tmp = [NSDateComponents new];
    tmp.year = today.comp.year;
    tmp.month = today.comp.month;
    tmp.day = clickedNum;
    [dvc setDateInfo:tmp];
}


@end
