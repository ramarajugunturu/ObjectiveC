//
//  Complex.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 16/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrintingProtocol.h"

@interface Complex : NSObject <PrintingProtocol>

@property (nonatomic) double real;
@property (nonatomic) double imaginary;

-(Complex *)initWithReal:(double)r andImaginary:(double)i;

@end