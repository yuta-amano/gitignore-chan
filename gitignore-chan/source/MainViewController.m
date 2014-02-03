//
//  MainViewController.m
//  gitignore-chan
//
//  Created by Amano Yuta on 2/2/14.
//  Copyright (c) 2014 yuta.amano. All rights reserved.
//

#import "MainViewController.h"
#import "IgnoreFileList.h"

@interface MainViewController ()

@property IgnoreFileList *ignoreFileList;
@property IgnoreFile *selectedFile;

@end

@implementation MainViewController

- (void)loadView {
    [super loadView];
    _ignoreFileList = [[IgnoreFileList alloc] init];
    // table viewの初期化コード。全部表示。
    // TODO: モデルっぽいところにうつす
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[_ignoreFileList count]];
    NSLog(@"%lu", (unsigned long)[_ignoreFileList count]);
    for (NSUInteger i = 0; i < [_ignoreFileList count]; ++i) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[_ignoreFileList getIgnoreFileAt:i].filename, @"typename", nil];
        [array addObject:dict];
    }
    [_ignoreFileArrayController addObjects:array];
}

@end
