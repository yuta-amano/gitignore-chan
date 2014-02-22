//
//  AppDelegate.m
//  gitignore-chan
//
//  Created by Yuta Amano on 2014/01/30.
//  Copyright (c) 2014年 yuta.amano. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your applicationd
    [self.window setContentSize:_mainViewController.view.frame.size];
    [self.window.contentView addSubview:_mainViewController.view];
    [_mainViewController.view setFrame:[_window.contentView bounds]];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
