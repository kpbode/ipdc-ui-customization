//
//  KBSampleViewController.m
//  UIAppearanceDemo
//
//  Created by Karl Bode on 05.11.11.
//  Copyright (c) 2011 hot coffee apps. All rights reserved.
//

#import "KBSampleViewController.h"
#import "KBNextViewController.h"
#import "KBCustomView.h"

@implementation KBSampleViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    [barButtonItem release];    
}

- (IBAction)openNextView:(id)sender {    
    KBNextViewController *viewController = [[KBNextViewController alloc] initWithNibName:@"KBNextViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Delegate UITableViewDatasource and -Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
