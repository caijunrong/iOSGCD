//
//  ViewController.h
//  Biyabi_AliPay_Test
//
//  Created by biyabi on 15/5/20.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Product : NSObject{
@private
    float     _price;
    NSString *_subject;
    NSString *_body;
    NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *orderId;
@end


@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *productTableView;
@property(nonatomic, strong)NSMutableArray *productList;
- (IBAction)auth:(id)sender;

@end

