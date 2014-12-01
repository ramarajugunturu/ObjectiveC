//
//  Rectangle.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 08/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (void)calculateAreaOfLength:(CGFloat)length andBreadth:(CGFloat)breadth
{
    area = length * breadth;
}
- (void)printArea
{
    NSLog(@"The area of Rectangle is %f",area);
}

@end
