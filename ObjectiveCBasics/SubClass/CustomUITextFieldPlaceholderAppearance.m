//
//  CustomUITextFieldPlaceholderAppearance.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 30/10/14.
//  Copyright (c) 2014 iApp Solutions. All rights reserved.
//
/*--
 
 THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED,INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 AN ACTION OF CONTRACT,TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 THE USE OF THIS CODE OR ANY OTHER DEALINGS RELATING TO THIS SOFTWARE.
 
 --*/

#import "CustomUITextFieldPlaceholderAppearance.h"

@implementation CustomUITextFieldPlaceholderAppearance

- (void)drawPlaceholderInRect:(CGRect)rect {
    // Set colour and font size and style of placeholder text
    [[UIColor magentaColor] setFill];
    [[self placeholder] drawInRect:rect withFont:[UIFont fontWithName:@"Helevitica" size:14.0]];
}

@end
