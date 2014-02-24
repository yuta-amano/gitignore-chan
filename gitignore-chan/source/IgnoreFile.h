//
//  IgnoreFile.h
//  gitignore-chan
//
//  Created by Yuta Amano on 2014/01/30.
//  Copyright (c) 2014年 yuta.amano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IgnoreFile : NSObject

@property (readonly) NSString *filename;

typedef enum {
    IGNORE_COPY_OK = 0,
    IGNORE_COPY_ALREADY_EXISTS,
    IGNORE_COPY_NOT_FOUND,
    IGNORE_COPY_NG,
} IgnoreCopyResult;

- (id)initWithFilename:(NSString *)name;
- (IgnoreCopyResult)copyTo:(NSString *)dirpath;
- (IgnoreCopyResult)overwriteTo:(NSString *)dirpath;

@end
