//
//  Manager.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 28/10/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//

#import "Manager.h"

@implementation Manager


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"required"])
    {
        NSLog(@"%@",[object valueForKeyPath:keyPath]);
        NSLog(@"~~~~>>.%@",[change  objectForKey:NSKeyValueChangeNewKey]);
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Changed" message:@"Required value has changed By Employee" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
