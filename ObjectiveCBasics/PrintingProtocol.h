//
//  PrintingProtocol.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 16/11/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//


//1. Create the protocol.
//Note:Interfaces in objective­c are called protocols. Here’s a protocol for printing.

//2. Implement the protocol.
//We’re going to implement this protocol two ways. One with a fraction and another with a complex number.

#import <Foundation/Foundation.h>

@protocol PrintingProtocol <NSObject>

@required
//@optional
-(void) print;

@end
