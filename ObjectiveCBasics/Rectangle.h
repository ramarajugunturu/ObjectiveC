//
//  Rectangle.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 08/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject
{
    float area;
}
- (void)calculateAreaOfLength:(CGFloat)length andBreadth:(CGFloat)breadth;
- (void)printArea;
@end
