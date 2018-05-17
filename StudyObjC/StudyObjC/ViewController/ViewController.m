//
//  ViewController.m
//  StudyObjC
//
//  Created by WISEfn on 2018. 5. 15..
//  Copyright © 2018년 WISEfn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *sideMenuMovingDistance;

@end

@implementation ViewController

BOOL menuShowing = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _sideMenuMovingDistance.constant = -200;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuButton:(UIButton *)sender {
    if(menuShowing){
        _sideMenuMovingDistance.constant = -200;
    }else{
        _sideMenuMovingDistance.constant = 0;
    }
    
    //animate side bar
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    menuShowing = !menuShowing;
}


@end
