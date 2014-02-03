//
//  SearchHandleObject.m
//  gitignore-chan
//
//  Created by Yuta Amano on 2014/02/03.
//  Copyright (c) 2014年 yuta.amano. All rights reserved.
//

#import "SearchHandleObject.h"

@implementation SearchHandleObject

- (void)controlTextDidChange:(NSNotification *)obj {
    NSTextField *textField = [obj object];
    NSLog(@"handle: %@", textField.stringValue);
}

@end
