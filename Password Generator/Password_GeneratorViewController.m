//
//  Password_GeneratorViewController.m
//  Password Generator
//
//  Created by Tommy Jensen on 18/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Password_GeneratorViewController.h"

@implementation Password_GeneratorViewController

- (void)dealloc
{
    [capitalLetters release];
    [specialLetters release];
    [numericLetters release];
    [adjustLength release];
    [passwordSuggestion release];
    [lblLength release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    [self updateLengthLabel];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [capitalLetters release];
    capitalLetters = nil;
    [specialLetters release];
    specialLetters = nil;
    [numericLetters release];
    numericLetters = nil;
    [adjustLength release];
    adjustLength = nil;
    [passwordSuggestion release];
    passwordSuggestion = nil;
    [lblLength release];
    lblLength = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)lengthChanged:(id)sender {
    [self updateLengthLabel];
}

- (IBAction)generatePassword:(id)sender {
    NSArray *lower =[NSArray arrayWithObjects: @"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"t", @"s", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    NSArray *upper =[NSArray arrayWithObjects: @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"T", @"S", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    NSArray *special = [NSArray arrayWithObjects: @"@", @"%", @"&", @"[", @"{", @"}", @"(", @"=", @"*", @")",@"+", @"]", @"!", @"#", @"\"", @"\\", nil ];
    NSArray *numerical = [NSArray arrayWithObjects: @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    NSMutableArray * candidate = [[[NSMutableArray alloc]initWithArray:lower] autorelease];
    NSMutableString * pwSuggestion = [[[NSMutableString alloc]initWithCapacity:(int)[adjustLength value]]autorelease];
    if([capitalLetters isOn])
        [candidate addObjectsFromArray:upper];
    if([specialLetters isOn])
        [candidate addObjectsFromArray:special];
    if([numericLetters isOn])
        [candidate addObjectsFromArray:numerical];
    for(int i = 0; i<(int) [adjustLength value]; i++){
        [pwSuggestion appendString:[candidate objectAtIndex: arc4random()% [candidate count]]];
    }
    passwordSuggestion.text=[[pwSuggestion copy]autorelease];
}

- (void)updateLengthLabel{
    lblLength.text = [NSString stringWithFormat:@"Adjust length (%d)", (int)[adjustLength value]];
}
@end
