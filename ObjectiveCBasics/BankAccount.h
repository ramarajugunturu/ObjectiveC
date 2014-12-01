//
//  BankAccount.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 25/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject
{
    //default to protected access
    double accountBalance;
    //long accountNumber;
    
        //double accountBalance;
    @private
        long accountNumber;
        int accessCount;
    @public
        float interestRate;
    
}

@property double accountBalance;
@property long accountNumber;

-(void) displayAccountInfo;
@end
