//
//  Password_GeneratorViewController.h
//  Password Generator
//
//  Created by Tommy Jensen on 18/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Password_GeneratorViewController : UIViewController {
    
    IBOutlet UISwitch *capitalLetters;
    IBOutlet UISwitch *specialLetters;
    IBOutlet UISwitch *numericLetters;
    IBOutlet UISlider *adjustLength;
    IBOutlet UILabel *passwordSuggestion;
    IBOutlet UILabel *lblLength;
}
- (IBAction)lengthChanged:(id)sender;
- (IBAction)generatePassword:(id)sender;
- (void) updateLengthLabel;

@end
