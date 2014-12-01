//
//  Square.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 08/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "Square.h"

@implementation Square


- (void)calculateAreaOfSide:(CGFloat)side
{
    area = side * side;
}
- (void)printArea
{
    NSLog(@"The area of square is %f",area);
}


@end
