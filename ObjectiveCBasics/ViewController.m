//
//  ViewController.m
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

#import "ViewController.h"
#import "AppDelegate.h"


//Typedef
typedef unsigned char ColorComponent;

//Structs
typedef struct {
    unsigned char red; unsigned char green; unsigned char blue;
} Color;

//Enums
typedef enum { FORD, HONDA, NISSAN, PORSCHE
} CarModel;

//-----------------
//extension example
@interface ViewController ()
-(void)printName:(NSString *)name;//extension method(Private)
@end
//-----------------

//-----------------
//ProtocolTest
#import "Fraction.h"
#import "Complex.h"

//-----------------

@implementation ViewController

@synthesize loginButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
     appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
	// Do any additional setup after loading the view, typically from a nib.
    userNameTxtField = [[CustomUITextFieldPlaceholderAppearance alloc] init];//creating subclassed UITextField object
    userNameTxtField.frame = CGRectMake(20.0, 30.0, 280.0, 30.0);
    userNameTxtField.placeholder = @"Enter String to reverse";
    userNameTxtField.borderStyle = UITextBorderStyleRoundedRect;
    userNameTxtField.delegate = self;
    [self.view addSubview:userNameTxtField];
    
    
    //Data Encapsulation
    //[self dataEncapsulation];
    
    //------------------
    //Obj C RunTime
    //[self objCRunTime];
    //------------------
    
    //---------------------------------------
    ////////////ProtocolTest/////////////////
    //---------------------------------------
    [self protocolTest];
    //---------------------------------------
    
    
    /////////Plist////////
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"RWDataPlist.plist"]; //3
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"RWDataPlist" ofType:@"plist"]; //5
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    //Write data:-
    //-----------
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    //here add elements to data file and write data to file
    int value = 77;
    [data setObject:@"Rama Raju Gunturi" forKey:@"name"];
    [data setObject:[NSNumber numberWithInt:value] forKey:@"value"];
    [data setObject:@"Vallapuram Village, Vizianagaram Dist, AP, India" forKey:@"adress"];
    [data writeToFile: path atomically:YES];
    //[data release]
    
    //Read data:-
    //----------
    NSLog(@"------------Plist:-----------");
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    //load from savedStock example int value
    NSLog(@"Name from plist:%@",[savedStock objectForKey:@"name"]);
    int value1;
    value1 = [[savedStock objectForKey:@"value"] intValue];
    NSLog(@"H No. list:%d",value1);
    NSLog(@"Adress from plist:%@",[savedStock objectForKey:@"adress"]);
    NSLog(@"------------::::::-----------");
    //[savedStock release];
    ////////=======----------=========////////////
    
    //----calling an extension method
    [self printName:@"Rama Raju Gunturi"];
    
    //---App path
    NSLog(@"App path:%@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
    
    //==-->KVO &KVC
    [self KVC];
    [self KVO];
    
    
    //////////////deep-copy-and-shallow-copy/////////////////
    [self shallowCopy];
    //[self deepCopy];
    
    ////////////Typedef//////////
    /*The typedef keyword lets you create new data types or redefine existing ones.*/
    ColorComponent red = 255;
    ColorComponent green = 160;
    ColorComponent blue = 0;
    NSLog(@"Your paint job is (R: %hhu, G: %hhu, B: %hhu)",red, green, blue) ;
    
    ///////Structs/////////
    
    /*A struct is like a simple, primitive C object. It lets you aggregate
     several variables into a more complex data structure, but doesn’t
     provide any OOP features (e.g., methods).*/
    
    Color carColor = {255, 160, 0} ;
    NSLog(@"Your paint job is (R: %hhu, G: %hhu, B: %hhu)",carColor. red, carColor. green, carColor. blue) ;
    
    ///////Enums/////////
    NSLog(@"------------:Enums:-----------");
    CarModel myCar = NISSAN;
    switch (myCar) {
        case FORD:
        case PORSCHE:
            NSLog( @"You like Western cars?");
            break;
        case HONDA:
        case NISSAN:
            NSLog( @"You like Japanese cars?");
            break;
        default: break;
    }
    NSLog(@"------------:---:-----------");
    ///////Fast Enumeration////////
    /*
    Collections in Objective-C
    Collections are fundamental constructs. It is used to hold and manage other objects. The whole purpose of a collection is that it provides a common way to store and retrieve objects efficiently.
    
    There are several different types of collections. While they all fulfil the same purpose of being able to hold other objects, they differ mostly in the way objects are retrieved. The most common collections used in Objective-C are:
    
    NSSet
    
    NSArray
    
    NSDictionary
    
    NSMutableSet
    
    NSMutableArray
    
    NSMutableDictionary
    
     */
    //Fast Enumeration Forwards
    NSArray *array = [[NSArray alloc]
                      initWithObjects:@"Murali", @"RamaG",@"Suresh",nil];
    NSLog(@"------------:Fast Enumeration Forwards:-----------");
    for(NSString *aString in array)
    {
        NSLog(@"Value--->: %@",aString);
    }
    NSLog(@"------------:Fast Enumeration Backwards:-----------");
    //Fast Enumeration Backwards
    for(NSString *aString in [array reverseObjectEnumerator])
    {
        NSLog(@"Value<---: %@",aString);
    }
    NSLog(@"------------:###:-----------");
    //////////////////////////////////////////////////
    
    //=======Dynamic Binding
    [self dynamicBinding];
    int years[ 4] = { 1968, 1970, 1989, 1999} ;
    years[ 0] = 1967;
    for (int i=0; i<4; i++) {
        NSLog( @"The year at index %d is: %d", i , years[ i ] ) ;
    }
    
    //////////////////////Extensions//////////////
    /*
     A class extension bears some similarity to a category, but it can only be added to a class for which you have the source code at compile time (the class is compiled at the same time as the class extension).
     
     The methods declared by a class extension are implemented in the implementation block for the original class, so you can't, for example, declare a class extension on a framework class, such as a Cocoa or Cocoa Touch class like NSString..
     
     Extensions are actually categories without the category name. It's often referred as anonymous categories.
     
     The syntax to declare a extension uses the @interface keyword, just like a standard Objective-C class description, but does not indicate any inheritance from a subclass. Instead, it just adds parentheses, as shown below
     
     @interface ClassName ()
     
     @end
     
     Characteristics of extensions
     An extension cannot be declared for any class, only for the classes that we have original implementation of source code.
     
     An extension is adding private methods and private variables that are only specific to the class.
     
     Any method or variable declared inside the extensions is not accessible even to the inherited classes.
     
     Extensions Example
     Let's create a class SampleClass that has an extension. In the extension, let's have a private variable internalID.
     
     Then, let's have a method getExternalID that returns the externalID after processing the internalID.
     
     The example is shown below and this wont work on online compiler.
     */
    
    ExtensionsTestClass *sampleClass = [[ExtensionsTestClass alloc]init];
    //sampleClass.internalID = 12345;
    [sampleClass setInternalID];
    NSLog(@"ExternalID: %@",[sampleClass getExternalID]);
    
    ////////////////////////////Typedef
    /*
     The Objective-C programming language provides a keyword called typedef, which you can use to give a type a new name. Following is an example to define a term BYTE for one-byte numbers:
     
     typedef unsigned char BYTE;
     After this type definition, the identifier BYTE can be used as an abbreviation for the type unsigned char, for example:.
     
     BYTE  b1, b2;
     By convention, uppercase letters are used for these definitions to remind the user that the type name is really a symbolic abbreviation, but you can use lowercase, as follows:
     
     typedef unsigned char byte;
     You can use typedef to give a name to user-defined data type as well. For example, you can use typedef with structure to define a new data type and then use that data type to define structure variables directly as follows:
     
     #import <Foundation/Foundation.h>
     
     typedef struct Books
     {
     NSString *title;
     NSString *author;
     NSString *subject;
     int book_id;
     
     } Book;
     
     int main( )
     {
     
     Book book;
     book.title = @"Objective-C Programming";
     book.author = @"TutorialsPoint";
     book.subject = @"Programming tutorial";
     book.book_id = 100;
     NSLog( @"Book title : %@\n", book.title);
     NSLog( @"Book author : %@\n", book.author);
     NSLog( @"Book subject : %@\n", book.subject);
     NSLog( @"Book Id : %d\n", book.book_id);
     
     return 0;
     }
     When the above code is compiled and executed, it produces the following result:
     
     2013-09-12 12:21:53.745 demo[31183] Book title : Objective-C Programming
     2013-09-12 12:21:53.745 demo[31183] Book author : TutorialsPoint
     2013-09-12 12:21:53.745 demo[31183] Book subject : Programming tutorial
     2013-09-12 12:21:53.745 demo[31183] Book Id : 100
     typedef vs #define
     The #define is a Objective-C directive, which is also used to define the aliases for various data types similar to typedef but with following differences:
     
     The typedef is limited to giving symbolic names to types only whereas #define can be used to define alias for values as well, like you can define 1 as ONE, etc.
     
     The typedef interpretation is performed by the compiler where as #define statements are processed by the pre-processor.
     
     Following is a simplest usage of #define:
     
     #import <Foundation/Foundation.h>
     
     #define TRUE  1
     #define FALSE 0
     
     int main( )
     {
     NSLog( @"Value of TRUE : %d\n", TRUE);
     NSLog( @"Value of FALSE : %d\n", FALSE);
     
     return 0;
     }
     */
    
    
    //////////Preprocessors//////////
    /**/
    
    /*
     
     If you want some slightly smarter dispatch than a long list of conditionals you can use a dictionary of blocks:
     
     NSString *key = @"foo";
     
     void (^selectedCase)() = @{
     @"foo" : ^{
     NSLog(@"foo");
     },
     @"bar" : ^{
     NSLog(@"bar");
     },
     @"baz" : ^{
     NSLog(@"baz");
     },
     }[key];
     
     if (selectedCase != nil)
     selectedCase();
     If you have a really long list of cases and you do this often, there might be a tiny performance advantage in this. You should cache the dictionary, then (and don't forget to copy the blocks).
     
     Sacrificing legibility for convenience and brevity here's a version that fits everything into a single statement and adds a default case:
     
     ((void (^)())@{
     @"foo" : ^{
     NSLog(@"foo");
     },
     @"bar" : ^{
     NSLog(@"bar");
     },
     @"baz" : ^{
     NSLog(@"baz");
     },
     }[key] ?: ^{
     NSLog(@"default");
     })();
     I prefer the former.
     
     */
    
    
    
}
#pragma mark -

#pragma mark - Data Encapsulation
-(void)dataEncapsulation
{
    /*
    BankAccount *account1;
    
    account1 = [BankAccount alloc];
    
    account1 = [account1 init];
    
    [account1 setAccountBalance: 1500.53];
    [account1 setAccountNumber: 34543212];
    
    //Note:Direct Access to Encapsulated Data
    //Data encapsulation encourages the use of methods to get and set the values of instance variables in a class.
    //example:- therefore, we could get the value of our accountNumber instance variable and assign it to a variable named balance1 as follows:
    double balance1 = [account1 accountBalance];
    
    //Note:-Objective-C and Dot Notation
    //Dot notation involves accessing an instance variable by specifying a class instance followed by a dot followed in turn by the name of the instance variable or property to be accessed:
    //Ex:classinstance.property
    double balance2 = account1.accountBalance;
    
    //Dot notation can also be used to set values of instance properties:
    account1.accountBalance = 6789.98;
    
    //-------------
    //Note:-A key point to understand about dot notation is that it only works for instance variables for which synthesized accessor methods have been declared.
     //If you attempt to use dot notation to access an instance variable for which no synthesized accessor is available the code will fail to compile with an error similar to:
    //error: request for member 'accountBalance' in something not a structure or union
    
    //-----------------------------------------------------
    //======Controlling Access to Instance Variables======
    //Note:-By default, instance variables in a class can be accessed by the methods of that class. This is the default for instance variables and is called protected access.
    
    //1)protected - Access is allowed only by methods of the class and any subclasses.
    //2)private - Access is restricted to methods of the class. Access is not available to subclasses.
    //3)public - Direct access available to methods of the class, subclasses and code in other module files and classes.
    
    //****
    //Note:-When accessing a public instance variable from another class or any other code in a methods or function, the -> pointer operator notation is used.
    
    account1->accountBalance = 12345.67;//Protected
    account1->accountNumber = 12345.67;//private
    account1->interestRate = 12345.67;//Public
    */
    
    //An attempt to access a non-public instance variable using pointer notation will result in a compiler warning similar to the following:
    //warning: instance variable 'accountNumber' is @protected; this will be a hard error in the future
    
}


#pragma mark - Deep-copy-and-Shallow-copy
-(void)deepCopy
{
    NSArray *myArray1;
    NSArray *myArray2;
    NSMutableString *tmpStr;
    
    NSMutableString *string1;
    NSMutableString *string2;
    NSMutableString *string3;
    
    NSData *buffer;
    
    string1 = [NSMutableString stringWithString: @"Red"];
    string2 = [NSMutableString stringWithString: @"Green"];
    string3 = [NSMutableString stringWithString: @"Blue"];
    myArray1 = [NSMutableArray arrayWithObjects: string1, string2, string3, nil];
    
    buffer = [NSKeyedArchiver archivedDataWithRootObject: myArray1];
    myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData: buffer];
    tmpStr = [myArray1 objectAtIndex: 0];
    [tmpStr setString: @"Yellow"];
    NSLog (@"First element of myArray1 = %@", [myArray1 objectAtIndex: 0]);
    NSLog (@"First element of myArray2 = %@", [myArray2 objectAtIndex: 0]);
    //When executed, the following output will be displayed clearly indicating that the objects referenced in myArray2 are entirely different to those referenced by myArray1. We have, therefore performed a deep copy.
    //First element of myArray1 = Yellow
    //First element of myArray2 = Red

    
}

-(void)shallowCopy
{
    /*
    NSMutableArray  * oldArray = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",nil];
    NSMutableArray  * newArray = [NSMutableArray arrayWithObjects:@"X",@"Y",@"Z",nil];
    NSLog(@"newArray:%@",newArray);
    //    newArray = oldArray;//sn't a copy at all. You end up with two pointers pointing to the exact same array.
    //    NSLog(@"shallow-copy:%@",newArray);
    //
    //    [newArray removeLastObject];
    //    NSLog(@" narray removed --after changes oldArray:%@",oldArray);
    //    NSLog(@" narray removed --after changes newArray:%@",newArray);
    //
    //    [oldArray removeLastObject];
    //    NSLog(@"after changes oldArray:%@",oldArray);
    //    NSLog(@"after changes newArray:%@",newArray);
    
    newArray = [NSMutableArray arrayWithArray:oldArray];// is a shallow copy. You end up with two distinct arrays, so if you were to remove or add items from one array, it wouldn't affect the other array.
    NSLog(@"shallow-copy:%@",newArray);
    
    //If B is a shallow copy of A, then it is like B = [A assign];
    //B and A point to the same memory location
    //If B is a deep copy of A, then it is like B = [A copy];
    //B and A point to different memory locations
    //B memory size is same as A's
    //B has same contents as A's
    */
    
    //////////========-------=======//////////
    NSArray *myArray1;
    NSArray *myArray2;
    NSMutableString *tmpStr;
    
    NSMutableString *string1;
    NSMutableString *string2;
    NSMutableString *string3;
    
    string1 = [NSMutableString stringWithString: @"Red"];
    string2 = [NSMutableString stringWithString: @"Green"];
    string3 = [NSMutableString stringWithString: @"Blue"];
    
    myArray1 = [NSMutableArray arrayWithObjects: string1, string2, string3, nil];
    
    //We now have an array name myArray1 that contains as elements three variables that each point to a string object. We could now create a copy of that array and assign it to variable pointer myArray2:
    
    myArray2 = [myArray1 copy];
    
    //The myArray2 object is a separate object, but the elements it contains still point to the same three string objects. We can prove this by modifying the string contained in element 0 of myArray1 from “Red” to “Yellow” and then displaying the contents of the object referenced by the first element of myArray2:
    
   tmpStr = [myArray1 objectAtIndex: 0];
   [tmpStr setString: @"Yellow"];
    NSLog (@"First element of myArray2 = %@", [myArray2 objectAtIndex: 0]);
    NSLog (@"First element of myArray1 = %@", [myArray1 objectAtIndex: 0]);
    //When compiled and executed, the NSLog call will display the following output:
    //First element of myArray2 = Yellow
    //Clearly when we change the object pointed to by element 0 of myArray1 we were also changing the object pointed to by element 0 or myArray2. This proves that even though we created a copy ofmyArray1 to create myArray2 the pointers contained in the array stayed the same.
    
}

#pragma mark - Dynamic Binding

-(void)dynamicBinding
{
    /*Dynamic binding is determining the method to invoke at runtime instead of at compile time. Dynamic binding is also referred to as late binding.
     
     In Objective-C, all methods are resolved dynamically at runtime. The exact code executed is determined by both the method name (the selector) and the receiving object.
     
     Dynamic binding enables polymorphism. For example, consider a collection of objects including Rectangle and Square. Each object has its own implementation of a printArea method.
     
     In the following code fragment, the actual code that should be executed by the expression [anObject printArea] is determined at runtime. The runtime system uses the selector for the method run to identify the appropriate method in whatever class of anObject turns out to be.
     */
    
    Square *square = [[Square alloc]init];
    [square calculateAreaOfSide:10.0];
    Rectangle *rectangle = [[Rectangle alloc]init];
    [rectangle calculateAreaOfLength:10.0 andBreadth:5.0];
    
    NSArray *shapes = [[NSArray alloc]initWithObjects: square, rectangle,nil];
    
    //--------------------
    //id object1 = square;//RamaG Note:Dynamic Binding
    id object1 = [shapes objectAtIndex:0];//RamaG Note:Dynamic Binding
    [object1 printArea];//RamaG Note:Message Passing
    
    id object2 = [shapes objectAtIndex:1];
    [object2 printArea];
    

}


#pragma mark - Category method
#pragma mark -

- (IBAction)reverseStr:(id)sender
{
    [userNameTxtField resignFirstResponder];
    if ([userNameTxtField.text length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter String to reverse" message:@"Enter some string in textfield to reverse" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSString *reverseText = [userNameTxtField text];
        reverseText = [reverseText reverseString:reverseText];//Call reverseString Category method
        reversedTxtLbl.text = reverseText;//display the reversed string in view
    }
}

//extension method(accessible only inside this class)
#pragma mark - printName: extension method

- (void)printName:(NSString *)name
{
    NSLog(@"--GRR->%@",name);
}


#pragma mark - KVC

/////////////////KVC
-(void)KVC
{
    
    Character *conharector1;
    // KVC...
    conharector1 = [[Character alloc] init];
    conharector1.qualification = @"B.E.";
    conharector1.designation = @"Sr. iOS Application Developer";
    [conharector1 setValue:@"RamaG" forKey:@"Name"];
    [conharector1 setValue:[NSNumber numberWithInt:777] forKey:@"Rating"];
    
    //Done!
    NSLog(@"------------:KVC:-----------");
    NSString *GetconharectorName = [conharector1 valueForKey:@"Name"];
    NSNumber *GetconharectorRating = [conharector1 valueForKey:@"Rating"];
    NSNumber *Getconharectordesignation = [conharector1 valueForKey:@"designation"];
    
    NSLog(@"%@ Rating = %d has designation:%@ %@", GetconharectorName, [GetconharectorRating intValue],Getconharectordesignation,[conharector1 valueForKey:@"qualification"]);
    NSLog(@"------------:***:-----------");
    
}

#pragma mark - KVO

-(void)KVO
{
    Employee *employee = [[Employee  alloc]init];
    Manager *manager = [[Manager alloc]init];
    NSLog(@"------------:KVO:-----------");
    NSLog(@"..Rating = %d has setted initially", employee.required);
    [employee addObserver:manager forKeyPath:@"required" options:NSKeyValueObservingOptionNew   context:NULL];
    [employee setRequired:678];
    [employee removeObserver:manager forKeyPath:@"required"];
    NSLog(@"------------:***:-----------");
    
}

#pragma mark - Obj C RunTime

-(void)objCRunTime
{
    
    ClassC_Runtime *obj = [[ClassC_Runtime alloc] init];
    obj->a = 0xaaaaaaaa;
    obj->b = 0xbbbbbbbb;
    obj->c = 0xcccccccc;
    
    //NSData *objData = [NSData dataWithBytes:obj length:malloc_size(obj)];
    //NSData *objData = [NSData dataWithBytes:(__bridge const void *)(obj) length: malloc(sizeof(obj))];
    NSData *objData = [NSData dataWithBytes:(__bridge const void *)(obj) length: malloc(obj)];
    NSLog(@"Object contains %@", objData);
    //OPut:2009-01-27 15:58:04.904 a.out[22090:10b] Object contains <20300000 aaaaaaaa bbbbbbbb cccccccc>
}

/* In addition to your subclassing features basic delegate and rest of the other properties will remain same */
#pragma mark - UITextField Delegate Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    userNameTxtField.text = @"";
    reversedTxtLbl.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [userNameTxtField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload {
    reversedTxtLbl = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Protocol Test
#pragma mark -
//3. Test.
//Then to use the protocol as a fraction or a complex number we do the following:
-(void)protocolTest
{
    Fraction *frac = [[Fraction alloc] initWithNumerator:5 denominator:6];
    Complex *comp = [[Complex alloc]initWithReal:6 andImaginary:7];
    
    
    /*We define our objects (which implement the interface) and a variable id that implements the interface.
     The reason this object is of type id is so we can implement multiple interfaces (id is a reserved object type in objective-c meaning any object). 
     Then to switch implementations we just change implementations:*/
    
    id <PrintingProtocol> printable;
    // print it
    printable = frac;
    printf( "The fraction is: " );
    /*So when print is called, it is called on the Fraction.m and Complex.m after they have been cast appropriately.*/
    [printable print];
    printf( "\n" );
    
    
    // print complex
    printable = comp;
    printf( "The complex number is: " );
    [printable print];
    printf( "\n" );
    
    
}



#pragma mark - misc..

- (IBAction)LoginwithTwitter:(id)sender
{
    /*
     //    if([ViewController canSendTweet])
     //    {
     
     self.view.userInteractionEnabled=NO;
     self.navigationController.navigationBar.userInteractionEnabled=NO;
     //[self.spinner startAnimating];
     
     ACAccountStore *store = [[ACAccountStore alloc] init];
     ACAccountType *twitterType = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
     
     [store requestAccessToAccountsWithType:twitterType withCompletionHandler:^(BOOL granted, NSError *error) {
     if(granted) {
     // Remember that twitterType was instantiated above
     NSArray *twitterAccounts = [store accountsWithAccountType:twitterType];
     
     //////////////////
     if ([twitterAccounts count] > 0)
     {
     // Grab the initial Twitter account to tweet from.
     ACAccount *fbAccount = [twitterAccounts objectAtIndex:0];
     
     NSDictionary *tempDict = [[NSMutableDictionary alloc] initWithDictionary:[fbAccount dictionaryWithValuesForKeys:[NSArray arrayWithObject:@"properties"]]];
     
     NSString *tempUserID = [[tempDict objectForKey:@"properties"] objectForKey:@"username"];
     
     //                    self.emailStr=fbAccount.accountDescription;
     //                    self.nameForFacebook_String=fbAccount.username;
     //                    self.fID_String = [NSString stringWithFormat:@"%@", [[fbAccount valueForKey:@"properties"] valueForKey:@"user_id"]] ;
     //                    appDelegate.isForTwitterAlertBool=YES;
     //                    [self parseFacebookDetails];
     }
     
     
     // If there are no accounts, we need to pop up an alert
     if(twitterAccounts == nil || [twitterAccounts count] == 0) {
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twin Connect"
     message:@"There are no Twitter account configured. You can add or create a Twitter account in Settings."
     delegate:nil
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil];
     // alert.tag=222;
     // [alert show];
     }
     }
     else{
     //[self.spinner stopAnimating];
     self.view.userInteractionEnabled=YES;
     self.navigationController.navigationBar.userInteractionEnabled=YES;
     }
     
     }];
     */
    ////////////////
    /*
     NSLog(@"-----Login--------");
     ACAccountStore *account = [[ACAccountStore alloc] init];
     ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
     //NSString *message = _textView.text;
     //hear before posting u can allow user to select the account
     NSArray *arrayOfAccons = [account accountsWithAccountType:accountType];
     for(ACAccount *acc in arrayOfAccons)
     {
     NSLog(@"eMail: %@",acc.username);
     //NSLog(@"userFullName: %@",acc.userFullName);
     NSDictionary *properties = [acc dictionaryWithValuesForKeys:[NSArray arrayWithObject:@"properties"]];
     NSDictionary *details = [properties objectForKey:@"properties"];
     NSLog(@"user name = %@",[details objectForKey:@"fullName"]);//full name
     NSLog(@"user_id  =  %@",[details objectForKey:@"user_id"]);//user id
     NSLog(@"date_of_birth  =  %@",[details objectForKey:@"birth_Date"]);//user date of birth
     }
     
     ///////////////////FB
     ACAccountType *accountType_fb = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
     //NSString *message = _textView.text;
     //hear before posting u can allow user to select the account
     NSArray *arrayOfAccons1 = [account accountsWithAccountType:accountType_fb];
     for(ACAccount *acc in arrayOfAccons1)
     {
     NSLog(@"eMail: %@",acc.username);
     //NSLog(@"userFullName: %@",acc.userFullName);
     NSDictionary *properties = [acc dictionaryWithValuesForKeys:[NSArray arrayWithObject:@"properties"]];
     NSDictionary *details = [properties objectForKey:@"properties"];
     NSLog(@"user name = %@",[details objectForKey:@"fullName"]);//full name
     NSLog(@"user_id  =  %@",[details objectForKey:@"user_id"]);//user id
     NSLog(@"date_of_birth  =  %@",[details objectForKey:@"birth_Date"]);//user date of birth
     }
     
     //////////////New
     
     //self.accountStore = [[ACAccountStore alloc]init];
     ACAccountType *FBaccountType= [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
     
     NSString *key = @"456807474457838";//your app id
     NSDictionary *dictFB = [NSDictionary dictionaryWithObjectsAndKeys:key,ACFacebookAppIdKey,@[@"email"],ACFacebookPermissionsKey, nil];
     
     
     [account requestAccessToAccountsWithType:FBaccountType options:dictFB completion:
     ^(BOOL granted, NSError *e) {
     if (granted) {
     NSArray *accounts = [account accountsWithAccountType:FBaccountType];
     //self.facebookAccount = [accounts lastObject];
     //NSLog(@"facebook account =%@",self.facebookAccount);
     NSLog(@"facebook account =%lu",(unsigned long)[accounts count]);
     //[self get];
     } else {
     dispatch_async(dispatch_get_main_queue(), ^{
     
     // NSLog(@"%@",e.description);
     if([e code]== ACErrorAccountNotFound)
     {
     UIAlertView* alt = [[UIAlertView alloc] initWithTitle:@"Account not found"
     message:@"Please setup your Facebook account in Settings App" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
     [alt show];
     }
     else
     {
     UIAlertView* alt = [[UIAlertView alloc] initWithTitle:@"Access Denied"
     message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
     [alt show];
     }
     
     });
     NSLog(@"error getting permission %@",e);
     
     }
     }];
     */
    //-----------------
    
}
//    else
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Twitter Accounts" message:@"There are no Twitter accounts configured. You can add or create a Twitter account in Settings." delegate:nil                                                       cancelButtonTitle:@"OK"  otherButtonTitles:nil];
//
//
//        [alert show];
//
//    }

//}

//-(void)get
//{
//
//    NSURL *requestURL = [NSURL URLWithString:@"https://graph.facebook.com/me"];
//
//    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeFacebook
//                                            requestMethod:SLRequestMethodGET
//                                                      URL:requestURL
//                                               parameters:nil];
//    request.account = self.facebookAccount;
//
//    [request performRequestWithHandler:^(NSData *data,
//                                         NSHTTPURLResponse *response,
//                                         NSError *error) {
//
//        if(!error)
//        {
//            list =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//
//            NSLog(@"Dictionary contains: %@", list );
//            NSLog(@"EmailID %@",[list objectForKey:@"email"]);
//
//            NSLog(@"Birthday %@",[list objectForKey:@"birthday"]);
//            NSLog(@"Gender %@",[list objectForKey:@"gender"]);
//
//            NSLog(@"City %@",[[list objectForKey:@"location"] objectForKey:@"name"]);
//
//
//            if([list objectForKey:@"error"]!=nil)
//            {
//                [self attemptRenewCredentials];
//            }
//            dispatch_async(dispatch_get_main_queue(),^{
//            });
//
//        }
//        else{
//            //handle error gracefully
//            NSLog(@"error from get%@",error);
//            //attempt to revalidate credentials
//        }
//
//    }];
//
//
//}

//-(void)getfbuserinfo
//{
//    [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection connection, NSDictionary<FBGraphUser> FBuser, NSError *error) {
//        if (error) {
//            // Handle error
//            //[appDelegate hidespinner];
//        }
//
//        else
//        {
//            Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
//            NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
//            if (networkStatus == NotReachable)
//            {
//                NSLog(@"There IS NO internet connection");
//
//                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Gameizm" message:@"Network connection is not available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alert show];
//            }
//            else
//            {
//                userInfo = (NSMutableDictionary *)FBuser;
//                [accountRepo fbsigninmethod:[FBuser valueForKey:@"id"]];
//            }
//
//        }
//    }];
//}

//- (void)sessionStateChanged:(FBSession )session state:(FBSessionState) state error:(NSError )error
//{
//    // If the session was opened successfully
//    if (!error && state == FBSessionStateOpen){
//        NSLog(@"Session opened");
//        // Show the user the logged-in UI
//        [self userLoggedIn];
//        return;
//    }
//    if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed)
//    {
//        // If the session is closed
//        NSLog(@"Session closed");
//        // Show the user the logged-out UI
//        [self userLoggedOut];
//    }
//
//    // Handle errors
//    if (error){
//        NSLog(@"Error");
//        NSString *alertText;
//        NSString *alertTitle;
//        // If the error requires people using an app to make an action outside of the app in order to recover
//        if ([FBErrorUtility shouldNotifyUserForError:error] == YES){
//            alertTitle = @"Something went wrong";
//            alertText = [FBErrorUtility userMessageForError:error];
//            [self showMessage:alertText withTitle:alertTitle];
//        } else {
//
//            // If the user cancelled login, do nothing
//            if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
//                NSLog(@"User cancelled login");
//
//                // Handle session closures that happen outside of the app
//            } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
//                alertTitle = @"Session Error";
//                alertText = @"Your current session is no longer valid. Please log in again.";
//                [self showMessage:alertText withTitle:alertTitle];
//
//                // For simplicity, here we just show a generic message for all other errors
//                // You can learn how to handle other errors using our guide: https://developers.facebook.com/docs/ios/errors
//            } else {
//                //Get more error information from the error
//                NSDictionary *errorInformation = [[[error.userInfo objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"] objectForKey:@"body"] objectForKey:@"error"];
//
//                // Show the user an error message
//                alertTitle = @"Something went wrong";
//                alertText = [NSString stringWithFormat:@"Please retry. \n\n If the problem persists contact us and mention this error code: %@", [errorInformation objectForKey:@"message"]];
//                [self showMessage:alertText withTitle:alertTitle];
//            }
//        }
//        // Clear this token
//        [FBSession.activeSession closeAndClearTokenInformation];
//        // Show the user the logged-out UI
//        [self userLoggedOut];
//    }
//}




@end
