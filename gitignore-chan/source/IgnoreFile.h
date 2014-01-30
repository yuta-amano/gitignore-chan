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

- (id)initWithFilename:(NSString *)name;
- (BOOL)copyTo:(NSString *)dirpath;

@end
