//
//  ViewController.h
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

#import <UIKit/UIKit.h>
#import "CustomUITextFieldPlaceholderAppearance.h"
#import "NSString+NSString_ReverseString.h"
#include <stdlib.h>
@class AppDelegate;

//////Data Encapsulation
#import "BankAccount.h"

/////Runtime
#import "ClassA_Runtime.h"
#import "ClassB_Runtime.h"
#import "ClassC_Runtime.h"


//Extensions
#import "ExtensionsTestClass.h"

//////Dynamic Binding//////
#import "Square.h"
#import "Rectangle.h"

////////KVC/////////
#import "Character.h"

////////KVO////////
#import "Employee.h"
#import "Manager.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    AppDelegate *appDelegate;
    CustomUITextFieldPlaceholderAppearance *userNameTxtField;
    IBOutlet UILabel *reversedTxtLbl;
    IBOutlet UIButton *loginButton;
}
@property (nonatomic, strong) IBOutlet UIButton *loginButton;



- (IBAction)reverseStr:(id)sender;

@end
