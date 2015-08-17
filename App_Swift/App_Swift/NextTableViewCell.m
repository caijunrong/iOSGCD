//
//  NextTableViewCell.m
//  App_Swift
//
//  Created by biyabi on 15/7/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "NextTableViewCell.h"

@interface NextTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *nextImage;

@end

@implementation NextTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [_nextImage setImage:[UIImage imageNamed:@"netError"]];
    [_nextImage setContentMode:UIViewContentModeScaleAspectFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
