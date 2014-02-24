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

- (IgnoreCopyResult)copyTo:(NSString *)dirpath {
    return [self copyFile:dirpath overwrite:NO];
}

- (IgnoreCopyResult)overwriteTo:(NSString *)dirpath {
    return [self copyFile:dirpath overwrite:YES];
}

- (IgnoreCopyResult)copyFile:(NSString *)dirpath overwrite:(BOOL)overwrite {
    NSString *ignorePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"gitignore"];
    if ([ignorePath length] == 0) {
        NSLog(@"%@.gitignore is not found in bundle", filename);
        return IGNORE_COPY_NOT_FOUND;
    }
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *copyDst = [dirpath stringByAppendingString:@"/.gitignore"];
    NSError *err = nil;
    if ([fileMgr fileExistsAtPath:copyDst] == YES) {
        if (overwrite == NO) {
            return IGNORE_COPY_ALREADY_EXISTS;
        } else {
            [fileMgr removeItemAtPath:copyDst error:&err];
        }
    }
    if ([fileMgr copyItemAtPath:ignorePath toPath:copyDst error:&err] == NO) {
        NSLog(@"file copy failure. msg:%@", err);
        return IGNORE_COPY_NG;
    }
    return IGNORE_COPY_OK;
}

- (id)copyWithZone:(NSZone *)zone
{
    IgnoreFile *file = [[[self class] allocWithZone:zone] initWithFilename:[filename copyWithZone:zone]];
    return file;
}

@end