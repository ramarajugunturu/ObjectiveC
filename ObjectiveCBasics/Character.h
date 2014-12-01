//
//  Character.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 28/10/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject
{
    NSString *Name;
    NSInteger Rating;
    
    NSString *designation;
    NSString *qualification;
}
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, assign) NSInteger Rating;
@property (nonatomic, strong) NSString *designation;
@property (nonatomic, copy) NSString *qualification;


@end
