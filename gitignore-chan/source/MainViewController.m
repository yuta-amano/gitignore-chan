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
    [self._ignoreFileTableView reloadData];
}

- (void)controlTextDidChange:(NSNotification *)obj {
    [_showingFiles removeAllObjects];
    NSTextField *textField = [obj object];
    [self updateTableBySearchString:textField.stringValue];
    [self._ignoreFileTableView reloadData];
}

- (void)updateTableBySearchString:(NSString *)searchStr {
    NSArray *searchedList = [_ignoreFileList searchFilesWithString:searchStr];
    for (int i = 0; i < [searchedList count]; ++i) {
        IgnoreFile *file = searchedList[i];
        [_showingFiles addObject:file];
    }
}

// The only essential/required tableview dataSource method
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [_showingFiles count];
}

// This method is optional if you use bindings to provide the data
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = [tableColumn identifier];
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
    IgnoreFile *file = _showingFiles[row];
    cellView.textField.stringValue = file.filename;
    return cellView;
}

@end
