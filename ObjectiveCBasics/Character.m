//
//  Character.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 28/10/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "Character.h"

@implementation Character


@synthesize Name;
@synthesize Rating;
@synthesize designation,qualification;

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"required"])
    {
        //NSLog(@"%@",[object valueForKeyPath:keyPath]);
        NSLog(@"--->>%@",[change  objectForKey:NSKeyValueChangeOldKey]);
    }
}



@end
