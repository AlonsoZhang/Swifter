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
    
    self.aaa.stringValue = string1;
     NSLog(@"%@",string1);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
