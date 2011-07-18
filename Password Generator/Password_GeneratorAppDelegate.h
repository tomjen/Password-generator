//
//  Password_GeneratorAppDelegate.h
//  Password Generator
//
//  Created by Tommy Jensen on 18/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Password_GeneratorViewController;

@interface Password_GeneratorAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Password_GeneratorViewController *viewController;

@end
