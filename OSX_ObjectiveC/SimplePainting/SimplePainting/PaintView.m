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
@property (nonatomic, assign) CGFloat line1Angle;
@end

@implementation PaintView

- (void) awakeFromNib {
  [super awakeFromNib];
  self.pointOnCircleAngle = 0.0f;
  self.line1Angle = 45.0f;
}

- (void) tick {
  self.pointOnCircleAngle+=1.0;
  self.line1Angle+=3.0;
  
  //Loop
  if (self.pointOnCircleAngle>=360.0){
    self.pointOnCircleAngle-=360.0;
  }
  if (self.line1Angle >= 360.0) {
    self.pointOnCircleAngle-=360.0;
  }
  [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
  [super drawRect:dirtyRect];
  
  
  NSRect bounds = self.bounds;
  NSPoint center = NSMakePoint(bounds.size.width/2.0, bounds.size.height/2.0);
  CGFloat circleRadius = bounds.size.height/5.0;
  
  //
  [[NSColor blueColor] setStroke];
  NSBezierPath *circle = [NSBezierPath bezierPath];
  [circle appendBezierPathWithArcWithCenter:center radius:circleRadius startAngle:0.0 endAngle:360.0];
  [circle setLineWidth:2.0f];
  [circle stroke];
  
  //
  [[NSColor redColor] setFill];
  NSBezierPath *pointOnCircle = [NSBezierPath bezierPath];
  NSPoint pointOnCircleCenter = NSMakePoint(
                                            center.x + circleRadius * sin(DEGREES_TO_RADIANS(self.pointOnCircleAngle)),
                                            center.y + circleRadius * cos(DEGREES_TO_RADIANS(self.pointOnCircleAngle))
                                            );
  [pointOnCircle appendBezierPathWithArcWithCenter:pointOnCircleCenter radius:10.0 startAngle:0.0 endAngle:360.0];
  [pointOnCircle fill];
  
  //Line1
  CGFloat line1Width = 2.0f;
  [[NSColor greenColor] setStroke];
  NSBezierPath *line1 = [NSBezierPath bezierPath];
  CGFloat line1Lenght = bounds.size.width/3.0; //actually its diameter. So in next calculations we should device by 2.
  
  NSPoint line1Part1End = NSMakePoint(
                                   pointOnCircleCenter.x + line1Lenght/2.0 * sin(DEGREES_TO_RADIANS(self.line1Angle)),
                                   pointOnCircleCenter.y + line1Lenght/2.0 * cos(DEGREES_TO_RADIANS(self.line1Angle))
                                   );
  [line1 moveToPoint:pointOnCircleCenter];
  [line1 lineToPoint:line1Part1End];
  [line1 setLineWidth:line1Width];
  [line1 stroke];
  
  NSBezierPath *line1_reversePart = [NSBezierPath bezierPath];
  CGFloat line1_reversePartLen = line1Lenght/2.0 / 3.0;
  
  NSPoint line1ReversePartEnd = NSMakePoint(
                                            pointOnCircleCenter.x + line1_reversePartLen * sin(DEGREES_TO_RADIANS(self.line1Angle + 190.*3.0)),
                                            pointOnCircleCenter.y + line1_reversePartLen * cos(DEGREES_TO_RADIANS(self.line1Angle + 190.*3.0))
  );
  [line1_reversePart moveToPoint:pointOnCircleCenter];
  [line1_reversePart lineToPoint:line1ReversePartEnd];
  [line1_reversePart setLineWidth:line1Width];
  [line1_reversePart stroke];
}

@end
