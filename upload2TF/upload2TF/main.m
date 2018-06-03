//
//  main.m
//  upload2TF
//
//  Created by 易礼明 on 2018/5/30.
//  Copyright © 2018年 lemon. All rights reserved.
//
//参数1：ipa包的绝对路径
//参数2：产品名称：faceu，beauty（不区分大小写）

#import <Foundation/Foundation.h>
#import "nstask.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        if (argc < 3) {
            printf("Please specify the trace file!\n");
            exit(1);
        }
        NSString *ipapath = [[NSString stringWithUTF8String:argv[1]] stringByExpandingTildeInPath];
        NSString *product = [[NSString stringWithUTF8String:argv[2]] stringByExpandingTildeInPath];
        NScommand *command = [NScommand new];
        NSLog(@"%@",[command cmd:ipapath product:product]);
    }
    return 0;
}
