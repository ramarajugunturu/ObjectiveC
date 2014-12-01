//
//  Fraction.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 16/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PrintingProtocol.h"

//Note:2.1 To say that we implement the protocol we put the protocol in after the objective-c interface definition.
@interface Fraction : NSObject <PrintingProtocol>

@property (nonatomic) int numerator;
@property (nonatomic) int denominator;

-(Fraction *)initWithNumerator:(int)n denominator:( int )d;

@end
