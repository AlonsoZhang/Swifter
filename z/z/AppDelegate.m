//
//  AppDelegate.m
//  z
//
//  Created by Alonso Zhang on 16/7/5.
//  Copyright © 2016年 Alonso Zhang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"b" ofType:@"txt" ];
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    NSString *testStr = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    NSString * keystring = @"";
    NSString * keystring2 = @"";
    NSString * string1 = @"";
    while ([testStr rangeOfString:@"href=\"/"].location != NSNotFound)
    {
        NSRange range = [testStr rangeOfString:@"href=\"/"];
        keystring = [testStr substringFromIndex:NSMaxRange(range)];
        if ([keystring rangeOfString:@"/"].location != NSNotFound)
        {
            range = [keystring rangeOfString:@"/"];
            testStr = [keystring substringFromIndex:NSMaxRange(range)];
            keystring = [[keystring substringToIndex:range.location]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
        }
        
        NSRange range2 = [testStr rangeOfString:@"post-stub-title\">"];
        keystring2 = [testStr substringFromIndex:NSMaxRange(range2)];
        if ([keystring2 rangeOfString:@"<"].location != NSNotFound)
        {
            range = [keystring2 rangeOfString:@"<"];
            testStr = [keystring2 substringFromIndex:NSMaxRange(range)];
            keystring2 = [[keystring2 substringToIndex:range.location]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        
        
        string1 = [NSString stringWithFormat:@"%@\n%@ -- %@",string1,keystring2, keystring];
    //NSLog(@"%@",testStr);
    }
    
    //self.aaa.stringValue = string1;
     //NSLog(@"%@",string1);
    string1 = @"";
    NSString *filePathc = [[NSBundle mainBundle] pathForResource:@"c" ofType:@"txt" ];
    NSData *myDatac = [NSData dataWithContentsOfFile:filePathc];
    NSString *testStrc = [[NSString alloc] initWithData:myDatac encoding:NSUTF8StringEncoding];
    NSMutableArray *responseArray = [NSMutableArray arrayWithArray:[[testStrc substringToIndex:[testStrc length]] componentsSeparatedByString:@"\n"]];
    NSString *item;
    for (item in responseArray) {
        
        NSRange range = [item rangeOfString:@" -- "];
        keystring = [item substringToIndex:(NSMaxRange(range)-4)];
        NSLog(@"%@",keystring);
        keystring2 = [item substringFromIndex:NSMaxRange(range)];
        NSLog(@"%@",keystring2);
        string1 = [NSString stringWithFormat:@"%@\n[%@](https://github.com/AlonsoZhang/Swifter/blob/master/article/%@.md)",string1,keystring,keystring2];
        
        //[命名空间](https://github.com/AlonsoZhang/Swifter/blob/master/article/namespace.md)
    }
    //NSLog(@"%@",responseArray);
    self.aaa.stringValue = string1;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
