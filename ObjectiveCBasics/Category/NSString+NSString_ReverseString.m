//
//  NSString+NSString_ReverseString.m
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 15/08/14.
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
#import "NSString+NSString_ReverseString.h"



@implementation NSString (NSString_ReverseString)

- (NSString *)reverseString:(NSString *)yourString
{
    NSMutableString *reversedStr = [NSMutableString stringWithCapacity:[yourString length]];
    
    [yourString enumerateSubstringsInRange:NSMakeRange(0,[yourString length])
                                 options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                  [reversedStr appendString:substring];
                              }];
    return reversedStr;
}

@end
