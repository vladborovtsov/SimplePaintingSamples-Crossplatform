//
//  PaintView.h
//  SimplePainting
//
//  Created by Vlad Borovtsov on 23.02.17.
//  Copyright © 2017 Vlad Borovtsov. All rights reserved.
//

#import <Cocoa/Cocoa.h>
IB_DESIGNABLE

@interface PaintView : NSView

@property (nonatomic, assign) BOOL longPathTrack;
@property (nonatomic, assign) BOOL shortPathTrack;
@property (nonatomic, assign) BOOL longPathDisplay;
@property (nonatomic, assign) BOOL shortPathDisplay;


@property (nonatomic, assign) BOOL oppositePath;

- (void) tick;
- (void) reset;
- (void) clearShortPath;
- (void) clearLongPath;

@end
