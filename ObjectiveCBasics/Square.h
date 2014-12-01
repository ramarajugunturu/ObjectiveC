//
//  Square.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 08/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Square : NSObject
{
    float area;
}
- (void)calculateAreaOfSide:(CGFloat)side;
- (void)printArea;
@end
