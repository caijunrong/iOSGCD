//
//  ViewController.m
//  App_Swift
//
//  Created by biyabi on 15/7/13.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "nextTVCTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100 )/2, 200, 100, 20)];
    [nextBtn setTitle:@"下一个" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:nextBtn];
    [nextBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)nextClick{
    nextTVCTableViewController *nextTVC = [[nextTVCTableViewController alloc]init];
    [self.view addSubview:nextTVC.view];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
