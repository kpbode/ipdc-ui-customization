//
//  KBAppDelegate.m
//  UIAppearanceDemo
//
//  Created by Karl Bode on 05.11.11.
//  Copyright (c) 2011 hot coffee apps. All rights reserved.
//

#import "KBAppDelegate.h"
#import "KBFirstViewController.h"
#import "KBSecondViewController.h"
#import "KBNavigationController.h"

@interface KBAppDelegate ()

- (void)applyAppearanceSimple;
- (void)applyAppearanceWithContainment;

@end

@implementation KBAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    [self applyAppearanceSimple];
    [self applyAppearanceWithContainment];
    
    
    UIViewController *viewController1 = [[[KBFirstViewController alloc] initWithNibName:@"KBSampleViewController" bundle:nil] autorelease];
    
    UINavigationController *navigationController1 = [[[UINavigationController alloc] initWithRootViewController:viewController1] autorelease];
    
    UIViewController *viewController2 = [[[KBSecondViewController alloc] initWithNibName:@"KBSampleViewController" bundle:nil] autorelease];
    
    KBNavigationController *navigationController2 = [[[KBNavigationController alloc] initWithRootViewController:viewController2] autorelease];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationController1, navigationController2, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/


// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
    
    NSLog(@"didEndCustomizingViewControllers");
    
}

- (void)applyAppearanceSimple {
    
    // pattern from colorlovers
    UIColor *color1 = [UIColor colorWithHue:0.562 saturation:0.357 brightness:0.922 alpha:1.];
    UIColor *color2 = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.000 alpha:1.];
    UIColor *color3 = [UIColor colorWithHue:0.985 saturation:0.931 brightness:0.682 alpha:1.];
    
    UISlider *sliderProxy = [UISlider appearance];
    sliderProxy.minimumTrackTintColor = color1;
    sliderProxy.thumbTintColor = color2;
    sliderProxy.maximumTrackTintColor = color3;
    
    UISwitch *switchProxy = [UISwitch appearance];
    switchProxy.onTintColor = color1;
    
    UISegmentedControl *segmentedControlProxy = [UISegmentedControl appearance];
    segmentedControlProxy.tintColor = color1;
    [segmentedControlProxy setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont, nil] forState:UIControlStateNormal];
    
    UIProgressView *progressViewProxy = [UIProgressView appearanceWhenContainedIn:nil];
    progressViewProxy.trackTintColor = color1;
    progressViewProxy.progressTintColor = color2;
    
    UIActivityIndicatorView *activityIndicatorViewProxy = [UIActivityIndicatorView appearance];
    activityIndicatorViewProxy.color = color2;
    
    UITabBar *tabBarProxy = [UITabBar appearance];
    tabBarProxy.tintColor = [UIColor colorWithHue:0.247 saturation:0.498 brightness:1.000 alpha:1.];
    tabBarProxy.selectedImageTintColor = [UIColor colorWithHue:0.222 saturation:0.140 brightness:0.843 alpha:1.];
    
    UINavigationBar *navigationBarProxy = [UINavigationBar appearance];
    navigationBarProxy.tintColor = color1;
    navigationBarProxy.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont, nil];
    [navigationBarProxy setTitleVerticalPositionAdjustment:-3.0 forBarMetrics:UIBarMetricsDefault];
    
    // used in uibarbuttonitem
//    UIButton *buttonProxy = [UIButton appearance];
//    buttonProxy.tintColor = color1;
    
    
    
}

- (void)applyAppearanceWithContainment {
    
    UIColor *color1 = [UIColor colorWithHue:0.112 saturation:0.598 brightness:0.996 alpha:1.];
    UIColor *color2 = [UIColor colorWithHue:0.944 saturation:0.167 brightness:0.141 alpha:1.];
    UIColor *color3 = [UIColor colorWithHue:0.538 saturation:0.986 brightness:0.557 alpha:1.];
    
    UISlider *sliderProxy = [UISlider appearanceWhenContainedIn:[KBSecondViewController class], nil];
    sliderProxy.minimumTrackTintColor = color1;
    sliderProxy.thumbTintColor = color2;
    sliderProxy.maximumTrackTintColor = color3;
    
    UISwitch *switchProxy = [UISwitch appearanceWhenContainedIn:[KBSecondViewController class], nil];
    switchProxy.onTintColor = color1;
    
    UISegmentedControl *segmentedControlProxy = [UISegmentedControl appearanceWhenContainedIn:[KBSecondViewController class], nil];
    segmentedControlProxy.tintColor = color1;
    [segmentedControlProxy setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont,
                                                   color2, UITextAttributeTextColor,
                                                   [UIColor clearColor], UITextAttributeTextShadowColor,
                                                   [NSValue valueWithCGPoint:CGPointZero], UITextAttributeTextShadowOffset, nil] forState:UIControlStateNormal];
    
    UIProgressView *progressViewProxy = [UIProgressView appearanceWhenContainedIn:[KBSecondViewController class], nil];
    progressViewProxy.trackTintColor = color1;
    progressViewProxy.progressTintColor = color2;
    
    UIActivityIndicatorView *activityIndicatorViewProxy = [UIActivityIndicatorView appearanceWhenContainedIn:[KBSecondViewController class], nil];
    activityIndicatorViewProxy.color = color2;
    
    // KBSecondViewController does not work (wrong containment order), need a custom navigationController here to get the containment working
    
    UINavigationBar *navigationBarProxy = [UINavigationBar appearanceWhenContainedIn:[KBNavigationController class], nil];
    navigationBarProxy.tintColor = color1;
    navigationBarProxy.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont,
                                              color2, UITextAttributeTextColor,
                                              [UIColor clearColor], UITextAttributeTextShadowColor,
                                              [NSValue valueWithCGPoint:CGPointZero], UITextAttributeTextShadowOffset, nil];
    
    [navigationBarProxy setTitleVerticalPositionAdjustment:-3.0 forBarMetrics:UIBarMetricsDefault];
    
    
//    UIView *alertBackgroundView = [UIView appearanceWhenContainedIn:[UIAlertView class], nil];
//    alertBackgroundView.backgroundColor = color1;
    
    UILabel *labelProxy = [UILabel appearanceWhenContainedIn:[KBSecondViewController class], [UIButton class], nil];
    labelProxy.backgroundColor = color1;
    
}

@end
