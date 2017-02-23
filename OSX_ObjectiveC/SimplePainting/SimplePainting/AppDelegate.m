//
//  AppDelegate.m
//  SimplePainting
//
//  Created by Vlad Borovtsov on 23.02.17.
//  Copyright © 2017 Vlad Borovtsov. All rights reserved.
//

#import "AppDelegate.h"
#import "PaintView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet PaintView *paintView;
@property (strong) NSTimer *timer;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  __weak typeof(self) weakSelf = self;
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 repeats:YES block:^(NSTimer *timer) {
    [weakSelf.paintView tick];
  }];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}


@end
