//
//  Person.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 17/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoordinateSupport.h"

@interface Person : NSObject <CoordinateSupport>

@property (copy) NSString *name;
@property (strong) NSMutableSet *friends;

- (void)sayHello;
- (void)sayGoodbye;

@end
