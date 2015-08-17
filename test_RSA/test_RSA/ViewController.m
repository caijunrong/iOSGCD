//
//  ViewController.m
//  test_RSA
//
//  Created by biyabi on 15/5/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "BDRSACryptor.h"
#import "BDRSACryptorKeyPair.h"
#import "BDError.h"
#import "BDLog.h"
#import "RSA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self generateKeysExample];
//    [self importKeysExample];
    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDmQd0BTJQmHwX0YEJqSV7FajkHr+zInGlPvId71eNPhRdG6v/lVFkzruXL/XMY8TT6aYtRVwYphMBAfROhGTlovvHJwci9c/90VDF4Jpxr52yfx0mRSMl1KoPAdZX3YnO31Bbjjyak/YFwjoyMEvXGdhVbTsClT8rCHgtWCrf5gQIDAQAB\n-----END PUBLIC KEY-----";
    
    NSString *ret = [RSA encryptString:@"haha" publicKey:pubkey];
    NSLog(@"encrypted: %@", ret);
}

- (void)generateKeysExample
{
    BDError *error = [[BDError alloc] init];
    BDRSACryptor *RSACryptor = [[BDRSACryptor alloc] init];
    
    BDRSACryptorKeyPair *RSAKeyPair = [RSACryptor generateKeyPairWithKeyIdentifier:@"haha"
                                                                             error:error];
    
    BDDebugLog(@"Private Key:\n%@\n\nPublic Key:\n%@", RSAKeyPair.privateKey, RSAKeyPair.publicKey);
    
    [self encryptionCycleWithRSACryptor:RSACryptor
                                keyPair:RSAKeyPair
                                  error:error];
}


- (void)importKeysExample
{
    BDError *error = [[BDError alloc] init];
    BDRSACryptor *RSACryptor = [[BDRSACryptor alloc] init];
    
    NSString *privateKey = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rsa_private_key" ofType:@"txt"]
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    
    NSString *publicKey = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rsa_public_key" ofType:@"txt"]
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    
    BDRSACryptorKeyPair *RSAKeyPair = [[BDRSACryptorKeyPair alloc] initWithPublicKey:publicKey
                                                                          privateKey:privateKey];
    
    [self encryptionCycleWithRSACryptor:RSACryptor
                                keyPair:RSAKeyPair
                                  error:error];
}


- (void)encryptionCycleWithRSACryptor:(BDRSACryptor *)RSACryptor
                              keyPair:(BDRSACryptorKeyPair *)RSAKeyPair
                                error:(BDError *)error
{
    NSString *cipherText =
    [RSACryptor encrypt:@"haha"
                    key:RSAKeyPair.publicKey
                  error:error];
    
    BDDebugLog(@"Cipher Text:\n%@", cipherText);
    
    NSString *recoveredText =
    [RSACryptor decrypt:cipherText
                    key:RSAKeyPair.privateKey
                  error:error];
    
    BDDebugLog(@"Recovered Text:\n%@", recoveredText);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
