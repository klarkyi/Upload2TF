//
//  cmd.m
//  upload2TF
//
//  Created by 易礼明 on 2018/5/31.
//  Copyright © 2018年 lemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "nstask.h"

@implementation NScommand
NSString *username=@"";
NSString *password=@"";

- (NSString *)cmd:(NSString *)path product:(NSString *)product
{
    NSString *ALTOOLPATH=@"/Applications/Xcode.app/Contents/Applications/Application\\ Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Versions/A/Support/altool";
    if ([[product lowercaseString] isEqualToString:@"faceu"]){
        username=@"47339448@qq.com";
        password=@"qrjs-sgel-ocuf-hbks";
    }else if ([[product lowercaseString] isEqualToString:@"beauty"]){
        username=@"appstore05@bytedance.com";
        password=@"8QlX\\\\6hYAm\\!F";
    }else{
        NSLog(@"产品名称无法匹配!");
    }
    

    NSString *cmd = [NSString stringWithFormat:@"%@ --upload-app -f %@ -u %@ -p %@ --output-format xml", ALTOOLPATH,path,username,password];
    // 初始化并设置shell路径
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/bash"];
    // -c 用来执行string-commands（命令字符串），也就说不管后面的字符串里是什么都会被当做shellcode来执行
    NSArray *arguments = [NSArray arrayWithObjects: @"-c",cmd, nil];
    [task setArguments: arguments];
    
    // 新建输出管道作为Task的输出
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    // 开始task
    NSFileHandle *file = [pipe fileHandleForReading];
    [task launch];
    
    // 获取运行结果
    NSData *data = [file readDataToEndOfFile];
    return [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
}
@end
