//
//  IgnoreFile.m
//  gitignore-chan
//
//  Created by Yuta Amano on 2014/01/30.
//  Copyright (c) 2014年 yuta.amano. All rights reserved.
//

#import "IgnoreFile.h"

@implementation IgnoreFile

@synthesize filename;

- (id)initWithFilename:(NSString *)name {
    if (self = [super init]) {
        filename = name;
    }
    return self;
}

- (BOOL)copyTo:(NSString *)dirpath {
    NSString *ignorePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"gitignore"];
    if ([ignorePath length]) {
        NSLog(@"%@.gitignore is not found in bundle", filename);
        return NO;
    }
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *copyDst = [ignorePath stringByAppendingString:@".gitignore"];
    NSError *err = nil;
    if ([fileMgr copyItemAtPath:ignorePath toPath:copyDst error:&err]) {
        NSLog(@"file copy failure. msg:%@", err);
        return NO;
    }
    return YES;
}

- (id)copyWithZone:(NSZone *)zone
{
    IgnoreFile *file = [[[self class] allocWithZone:zone] initWithFilename:[filename copyWithZone:zone]];
    return file;
}

@end