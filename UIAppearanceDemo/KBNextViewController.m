//
//  KBNextViewController.m
//  UIAppearanceDemo
//
//  Created by Karl Bode on 15.11.11.
//  Copyright (c) 2011 hot coffee apps. All rights reserved.
//

#import "KBNextViewController.h"

@implementation KBNextViewController
@synthesize someSwitch = _someSwitch;

- (void)dealloc {
    [_someSwitch release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Next";
        
    self.someSwitch.onTintColor = [UIColor purpleColor];
}

- (void)viewDidUnload {
    [self setSomeSwitch:nil];
    [super viewDidUnload];
}

@end
