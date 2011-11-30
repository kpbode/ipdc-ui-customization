//
//  KBFirstViewController.m
//  UIAppearanceDemo
//
//  Created by Karl Bode on 05.11.11.
//  Copyright (c) 2011 hot coffee apps. All rights reserved.
//

#import "KBFirstViewController.h"

@implementation KBFirstViewController

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
}

@end
