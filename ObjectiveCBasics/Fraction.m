//
//  Fraction.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 16/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator=_numerator;
@synthesize denominator=_denominator;

-(Fraction *)initWithNumerator:(int)n denominator:(int)d
{
    self =[super init];
    if (self)
    {
        self .numerator=n;
        self .denominator=d;
    }
    return self ;
}

-(void)print
{
    printf( "%i/%i" , self .numerator, self .denominator );
}

@end
