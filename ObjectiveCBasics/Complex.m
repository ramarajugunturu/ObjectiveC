//
//  Complex.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 16/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "Complex.h"

@implementation Complex

@synthesize real=_real;
@synthesize imaginary=_imaginary;

-(Complex *)initWithReal:(double)r andImaginary:(double)i
{
    self =[super init];
    if (self)
    {
        self.real=r;
        self.imaginary=i;
    }
    return self ;
}

-(void)print
{
    printf( "%f+%f" , self.real, self.imaginary );
}

@end