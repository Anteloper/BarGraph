//
//  BarGraphView.m
//  BarGraph
//
//  Created by ohill on 5/11/15.
//  Copyright (c) 2015 ohill. All rights reserved.
//

#import "BarGraphView.h"

@implementation BarGraphView


- (void)drawRect:(CGRect)rect {
 CGRect rectangle = CGRectMake(100, 100, 320, 100);
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.5);
 CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
 CGContextFillRect(context, rectangle);
}


@end
