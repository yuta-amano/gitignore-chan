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
        NSString *bundleDir = [[NSBundle mainBundle] resourcePath];
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSError *err = nil;
        NSArray *resourceList = [fileMgr contentsOfDirectoryAtPath:bundleDir error:&err];
        if (err != nil) {
            NSLog(@"failed getting resource files. error:%@", err);
            return nil;
        }
        NSPredicate *filter = [NSPredicate predicateWithFormat:@"self ENDSWITH '.gitignore'"];
        NSArray *ignoreResouces = [resourceList filteredArrayUsingPredicate:filter];
        _ignoreFiles = [NSMutableArray array];
        for (NSString *filename in ignoreResouces) {
            IgnoreFile *file = [[IgnoreFile alloc] initWithFilename:[self excludeExtension:filename]];
            [_ignoreFiles addObject:file];
        }
    }
    return self;
}

- (NSArray *)searchFilesWithString:(NSString *)searchString {
    if (searchString.length == 0) {
        return [self getListAll];
    }
    NSMutableArray *result = [NSMutableArray array];
    for (IgnoreFile *file in _ignoreFiles) {
        NSRange range = [file.filename rangeOfString:searchString];
        if (range.location != NSNotFound) {
            [result addObject:file];
        }
    }
    return [result copy];
}

- (IgnoreFile *)getIgnoreFileAt:(NSUInteger)index {
    return _ignoreFiles[index];
}

- (NSArray *)getListAll {
    return _ignoreFiles;
}

- (NSUInteger)count {
    return [_ignoreFiles count];
}

- (NSString *)excludeExtension:(NSString *)filename {
    NSString *extension = @".gitignore";
    NSUInteger last = filename.length - extension.length;
    return [filename substringWithRange:NSMakeRange(0, last)];
}

@end
