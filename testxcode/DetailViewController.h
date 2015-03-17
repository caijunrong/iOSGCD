//
//  DetailViewController.h
//  testxcode
//
//  Created by biyabi on 15/3/17.
//  Copyright (c) 2015年 biyabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

