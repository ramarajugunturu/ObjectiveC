//
//  Employee.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 28/10/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize required;

-(id)init
{
    self = [super init];
    if(self)
    {
        required = 1;
    }
    return self;
}

@end
