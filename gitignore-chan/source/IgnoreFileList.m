//
//  IgnoreFileList.m
//  gitignore-chan
//
//  Created by Yuta Amano on 2014/01/30.
//  Copyright (c) 2014年 yuta.amano. All rights reserved.
//

#import "IgnoreFileList.h"

@interface IgnoreFileList()

@property NSMutableArray *ignoreFiles;

@end


@implementation IgnoreFileList


- (id)init {
    if (self = [super init]) {
        NSString *bundleDir = [[NSBundle mainBundle] bundlePath];
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSError *err = nil;
        NSArray *resourceList = [fileMgr contentsOfDirectoryAtPath:bundleDir error:&err];
        if (err != nil) {
            NSLog(@"failed getting resource files. error:%@", err);
            return nil;
        }
        _ignoreFiles = [NSMutableArray array];
        for (NSString *filename in resourceList) {
            NSString *ext = @".gitignore";
            NSString *name = [filename substringWithRange:NSMakeRange(0, filename.length - ext.length)];
            IgnoreFile *file = [[IgnoreFile alloc] initWithFilename:name];
            [_ignoreFiles addObject:file];
        }
    }
    return self;
}

- (NSArray *)searchFilesWithString:(NSString *)searchString {
    NSMutableArray *result = [NSMutableArray array];
    for (IgnoreFile *file in _ignoreFiles) {
        NSRange range = [file.filename rangeOfString:searchString];
        if (range.location != NSNotFound) {
            [result addObject:file];
        }
    }
    return [result copy];
}

- (IgnoreFile *)getIgnoreFileAt:(int)index {
    return _ignoreFiles[index];
}

- (NSArray *)getListAll {
    return _ignoreFiles;
}

@end
