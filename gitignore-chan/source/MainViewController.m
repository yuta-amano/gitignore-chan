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
@property NSMutableArray *showingFiles;

- (void)updateTableBySearchString:(NSString*)searchStr;

@end

@implementation MainViewController

- (void)loadView {
    [super loadView];
    _ignoreFileList = [[IgnoreFileList alloc] init];
    _showingFiles = [NSMutableArray arrayWithCapacity:[_ignoreFileList count]];
    [self updateTableBySearchString:@""];
}

- (void)controlTextDidChange:(NSNotification *)obj {
    [_ignoreFileArrayController removeObjects:_showingFiles];
    [_showingFiles removeAllObjects];
    NSTextField *textField = [obj object];
    [self updateTableBySearchString:textField.stringValue];
}

- (void)updateTableBySearchString:(NSString *)searchStr {
    NSArray *searchedList = [_ignoreFileList searchFilesWithString:searchStr];
    for (int i = 0; i < [searchedList count]; ++i) {
        IgnoreFile *file = searchedList[i];
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:file.filename, @"typename", nil];
        [_showingFiles addObject:dict];
    }
    [_ignoreFileArrayController addObjects:_showingFiles];
}

@end
