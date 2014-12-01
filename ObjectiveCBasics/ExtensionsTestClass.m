//
//  ExtensionsTestClass.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 15/08/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "ExtensionsTestClass.h"

@interface ExtensionsTestClass()
{
    NSString *internalID;
}

@end


@implementation ExtensionsTestClass


- (void)setInternalID{
    internalID = [NSString stringWithFormat:
                  @"UNIQUEINTERNALKEY%dUNIQUEINTERNALKEY",arc4random()%100];
}

- (NSString *)getExternalID{
    return [internalID stringByReplacingOccurrencesOfString:
            @"UNIQUEINTERNALKEY" withString:@""];
}


@end
