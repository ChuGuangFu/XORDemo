//
//  XORManager.m
//  XOR
//
//  Created by 梁羽 on 2017/7/27.
//  Copyright © 2017年 梁羽. All rights reserved.
//

#import "XORManager.h"

@implementation XORManager

+(NSString *)XORChangeWithString:(NSString *)string key:(NSString *)keyStr {
    if (!string || !keyStr) {
        return @"";
    }
    NSData *originalData = [string dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
    NSData *keyData = [keyStr dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
    char *dataP = (char *)[originalData bytes];
    char *dataK = (char *)[keyData bytes];
    char *tempP = dataK;
    NSInteger keyIndex = 0;
    for (int i = 0; i < originalData.length; i++) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunsequenced"
        *dataP = *(++dataP) ^ *(++tempP);
#pragma clang diagnostic pop
        if (keyIndex++ == keyStr.length) {
            keyIndex = 0, tempP = dataK;
        }
    }
    return [[NSString alloc] initWithData:originalData encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
}

@end
