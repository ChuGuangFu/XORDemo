//
//  ViewController.m
//  XOR
//
//  Created by 梁羽 on 2017/7/27.
//  Copyright © 2017年 梁羽. All rights reserved.
//

#import "ViewController.h"
#import "XORManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testFunction];
}

-(void)testFunction {
    NSString *originalString = @"锦涛傻";
    NSString *keyString = @"hfiasfh";
    
    NSLog(@"original：%@",originalString);
    NSString *codingStr = [XORManager XORChangeWithString:originalString key:keyString];
    NSLog(@"coding：%@",codingStr);
    NSString *unCodingStr = [XORManager XORChangeWithString:codingStr key:keyString];
    NSLog(@"unCoding：%@",unCodingStr);
}


@end
