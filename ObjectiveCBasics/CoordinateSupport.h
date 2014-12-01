//
//  CoordinateSupport.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 16/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

/*Note1:Of course, instead of the @interface directive, it uses @protocol , followed by the protocol name. The <NSObject> syntax lets us incorporate another protocol into
 CoordinateSupport . In this case, we're saying that CoordinateSupport also includes all of the methods declared in the NSObject protocol (not to be confused with the
 NSObject class).*/
@protocol CoordinateSupport <NSObject>

/*Note2:Next, let's add a few methods and properties to the protocol. This works the same way
 as declaring methods and properties in an interface:*/
@property double x;
@property double y;
@property double z;

- (NSArray *)arrayFromPosition;
- (double)magnitude;
//----------------------------

@end
