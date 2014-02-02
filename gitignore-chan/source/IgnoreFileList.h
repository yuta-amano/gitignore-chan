//
//  IgnoreFileList.h
//  gitignore-chan
//
//  Created by Yuta Amano on 2014/01/30.
//  Copyright (c) 2014年 yuta.amano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IgnoreFile.h"

@interface IgnoreFileList : NSObject

- (id)init;
- (NSArray *)searchFilesWithString:(NSString *)searchString;
- (IgnoreFile *)getIgnoreFileAt:(int)index;
- (NSArray *)getListAll;

@end
