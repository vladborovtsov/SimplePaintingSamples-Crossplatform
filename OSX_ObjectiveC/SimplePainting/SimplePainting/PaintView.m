//
//  PaintView.m
//  SimplePainting
//
//  Created by Vlad Borovtsov on 23.02.17.
//  Copyright © 2017 Vlad Borovtsov. All rights reserved.
//

#import "PaintView.h"
#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180.0)

@interface PaintView()
@property (nonatomic, assign) CGFloat pointOnCircleAngle;
@end

@implementation PaintView

- (void) awakeFromNib {
  [super awakeFromNib];
  self.pointOnCircleAngle = 0.0f;
}

- (void) tick {
  self.pointOnCircleAngle+=1.0;
  [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
  [super drawRect:dirtyRect];
  
  
  NSRect bounds = self.bounds;
  NSPoint center = NSMakePoint(bounds.size.width/2.0, bounds.size.height/2.0);
  CGFloat circleRadius = bounds.size.height/3.0;
  
  [[NSColor blueColor] setStroke];
  NSBezierPath *circle = [NSBezierPath bezierPath];
  [circle appendBezierPathWithArcWithCenter:center radius:circleRadius startAngle:0.0 endAngle:360.0];
  [circle setLineWidth:2.0f];
  [circle stroke];
  
  [[NSColor redColor] setFill];
  NSBezierPath *pointOnCircle = [NSBezierPath bezierPath];
  NSPoint pointOnCircleCenter = NSMakePoint(
                                            center.x + circleRadius * sin(DEGREES_TO_RADIANS(self.pointOnCircleAngle)),
                                            center.y + circleRadius * cos(DEGREES_TO_RADIANS(self.pointOnCircleAngle))
                                            );
  [pointOnCircle appendBezierPathWithArcWithCenter:pointOnCircleCenter radius:10.0 startAngle:0.0 endAngle:360.0];
  [pointOnCircle fill];
}

@end
