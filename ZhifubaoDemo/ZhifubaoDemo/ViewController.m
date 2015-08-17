//
//  ViewController.m
//  ZhifubaoDemo
//
//  Created by biyabi on 15/5/21.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

#import "APAuthV2Info.h"

@implementation Product


@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initUI{
    UIButton *payBtn01 = [[UIButton alloc]initWithFrame:CGRectMake(100, 60, 80, 25)];
    [payBtn01 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [payBtn01 setTitle:@"付钱0.01元" forState:UIControlStateNormal];
    payBtn01.tag = 0;
    [payBtn01 setBackgroundColor:[UIColor yellowColor]];
    [payBtn01 addTarget:self action:@selector(pay:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn01];
    
    UIButton *payBtn02 = [[UIButton alloc]initWithFrame:CGRectMake(100, 120, 80, 25)];
    [payBtn02 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [payBtn02 setTitle:@"付钱0.02元" forState:UIControlStateNormal];
    [payBtn02 setBackgroundColor:[UIColor yellowColor]];
    payBtn02.tag = 1;
    [payBtn02 addTarget:self action:@selector(pay:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn02];
    
}

-(void)pay:(UIButton *)sender{
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088911442552441";
    NSString *seller = @"bd@qu114.com";
    NSString *privateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMLZazoU4cjYEDSlhXo5+u5AvHFQ5Qa4fFmjHqPbPYyjR0R4ZQDQBHn2wXjsKHjy7+LcBA4A0XkHWd0zEruFjsswy+a9DFndEcYM3r4MXtBL6KT3MNcVgCH/WUYbhfkf4uubzPWL5WEkfa742I0xNABuEWadyl/KL3FuY4+x8mMhAgMBAAECgYA8fzznn6wqq8r8TZgPxwi+CKN5m2BAoe8Z9aeBwIRvshJik+7oPa3mIFMZtFkslGEe0qj/oAlpxnqET2M1jdYzfYcP1rqa/nykdA8o5kyCUP8YVuRAQJEZH4Y7+jjZcsiiQszFYELfTU4wrBRFLu0n6G1kF8JSjWEawzBwYUpDQQJBAOYUpFJu705iAkYRfAbcz9H0/rjSJsaOuKaf/yWLY4NemL/lcOij91G8nYPShl/1zEoSL7A78vPWAmN7B90nlV0CQQDYzLsSXZVRv5R2fS4GPrXgcdiX47TtjGOm75VcRyHE85PinBRmwzST7jwNpTysrZYNSMhADtLmGu3bNfw1rwSVAkEAhcZwuIFJ4OA5hDX8UB0pNGFnjVybMQ2grTkP5+uAw8xHsiOcn5deYIbzascIXFkVG+gxFB33J/FB2EebjenK/QJAXRoOfCSUKzcKmpfHXAcyM+CwEwpGeH0Bjn70tVwWtG2l5HsCh97shVqZj4KWO9GPzsSiul+jUg3ed3UHikZOwQJAWLVJXV6RVWv8INm/xUTpYT+Mm4i0v6pa3rEI6lyPB6iDLGX4lGPwsQYOb+WGNsjxvh5+EyKaQbrybADL153SYQ==";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.notifyURL =  @"http://www.xxx.com"; //回调URL
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkdemo";
    
    
    if (sender.tag == 0) {
        order.productName = @"商品名字01";
        order.productDescription = @"秒速01";
        order.amount = @"0.01";
        
    }else if (sender.tag == 1){
        order.productName = @"商品名字02";
        order.productDescription = @"秒速02";
        order.amount = @"0.02";
        
    }
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    NSLog(@"signedString:%@",signedString);
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
        
    }
    
    
}

- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
