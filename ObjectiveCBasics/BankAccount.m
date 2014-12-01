//
//  BankAccount.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 25/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

@synthesize accountBalance, accountNumber;

-(void) displayAccountInfo
{
    NSLog (@"Account Number %ld has a balance of %f", accountNumber, accountBalance);
}

@end
