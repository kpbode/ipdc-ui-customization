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
#import "KBCustomView.h"
#import "KBMainView.h"
#import "KBCustomSlider.h"

@interface KBAppDelegate ()

- (void)applyAppearance;
- (void)applyBasicAppearance;
- (void)applyAppearanceFirstApproach;
- (void)applyAppearanceWithContainment;
- (void)applyAppearanceWithContainmentForNavigationController;
- (void)applyAppearanceForCustomView;
- (void)applyAppearanceWithSpecificity;
- (void)applyAppearanceWithSpecificity1;
- (void)applyAppearanceWithSubclassing;

@end

@implementation KBAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc {
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self applyBasicAppearance];
    
    
    
    [self applyAppearance];
    
    UIViewController *viewController1 = [[[KBFirstViewController alloc] initWithNibName:@"KBSampleViewController" bundle:nil] autorelease];
    viewController1.tabBarItem.title = @"First";
    viewController1.tabBarItem.image = [UIImage imageNamed:@"first.png"];
    
    UINavigationController *navigationController1 = [[[UINavigationController alloc] initWithRootViewController:viewController1] autorelease];
    
    UIViewController *viewController2 = [[[KBSecondViewController alloc] initWithNibName:@"KBSampleViewController" bundle:nil] autorelease];
    viewController2.tabBarItem.title = @"Second";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"second.png"];
    
    KBNavigationController *navigationController2 = [[[KBNavigationController alloc] initWithRootViewController:viewController2] autorelease];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationController1, navigationController2, nil];
    
    
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {}







- (void)applyAppearance {
    
    // first styling (slide 14)
    [self applyAppearanceFirstApproach];
    
    // apply also to custom view (slide 16)
    [self applyAppearanceForCustomView];
    
    
    // apply selector with containment hierarchy
    [self applyAppearanceWithContainment];
    // first approach is too simple, does not respect "following" views
    [self applyAppearanceWithContainmentForNavigationController];
    
    
//    [self applyAppearanceWithSpecificity1];
    
    // style a subclassed slider seperatly
//    [self applyAppearanceWithSubclassing];
    
}

- (void)applyBasicAppearance {
    
    KBMainView *mainViewProxy = [KBMainView appearance];
    mainViewProxy.backgroundColor = [UIColor whiteColor];
    
    UITabBar *tabBarProxy = [UITabBar appearance];
    tabBarProxy.backgroundImage = [UIImage imageNamed:@"tabbar_bg.png"];
    tabBarProxy.selectedImageTintColor = [UIColor yellowColor];
    
    UITabBarItem *tabBarItemProxy = [UITabBarItem appearance];
    [tabBarItemProxy setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                             [UIFont fontWithName:@"HelveticaNeue" size:10.0], UITextAttributeFont,
                                             [UIColor yellowColor], UITextAttributeTextColor,
                                             nil] forState:UIControlStateNormal];
    KBCustomView *customViewProxy = [KBCustomView appearance];
    customViewProxy.backgroundColor = [UIColor clearColor];
    
}

/**
 *
 * Simple Customizing with UIAppearance Proxy and without Containment Selectors
 *
 **/
- (void)applyAppearanceFirstApproach {
    
    // pattern from colorlovers
    UIColor *color1 = [UIColor colorWithRed:0.827 green:0.098 blue:0.000 alpha:1.];
    UIColor *color2 = [UIColor colorWithRed:1.000 green:0.400 blue:0.000 alpha:1.];
    UIColor *color3 = [UIColor colorWithRed:1.000 green:0.949 blue:0.686 alpha:1.];
    
    
    
    UISlider *sliderProxy = [UISlider appearance];
    sliderProxy.minimumTrackTintColor = color1;
    sliderProxy.thumbTintColor = color2;
    sliderProxy.maximumTrackTintColor = color3;
    
    UISwitch *switchProxy = [UISwitch appearance];
    switchProxy.onTintColor = color1;
    
    UISegmentedControl *segmentedControlProxy = [UISegmentedControl appearance];
    segmentedControlProxy.tintColor = color1;
    [segmentedControlProxy setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont, 
                                                   nil] forState:UIControlStateNormal];
    
    UIProgressView *progressViewProxy = [UIProgressView appearanceWhenContainedIn:nil];
    progressViewProxy.trackTintColor = color1;
    progressViewProxy.progressTintColor = color2;
    
    UIActivityIndicatorView *activityIndicatorViewProxy = [UIActivityIndicatorView appearance];
    activityIndicatorViewProxy.color = color2;
    
    
    UINavigationBar *navigationBarProxy = [UINavigationBar appearance];
    navigationBarProxy.tintColor = color1;
    navigationBarProxy.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont, 
                                              nil];
    [navigationBarProxy setTitleVerticalPositionAdjustment:-3.0 forBarMetrics:UIBarMetricsDefault];
    
    UISearchBar *searchBarProxy = [UISearchBar appearance];
    searchBarProxy.tintColor = color1;
    [searchBarProxy setScopeBarButtonTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue" size:18.0], UITextAttributeFont, nil] forState:UIControlStateNormal];
    
    UIBarButtonItem *barButtonItemProxy = [UIBarButtonItem appearance];
    barButtonItemProxy.tintColor = color1;
    [barButtonItemProxy setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, nil] forState:UIControlStateNormal];
    
    UIButton *buttonProxy = [UIButton appearance];
    [buttonProxy setTitleColor:color1 forState:UIControlStateNormal];
    
}

- (void)applyAppearanceForCustomView {
    
    KBCustomView *customViewProxy = [KBCustomView appearance];
    customViewProxy.mainColor = [UIColor colorWithRed:0.827 green:0.098 blue:0.000 alpha:1.];
    
}

- (void)applyAppearanceWithContainment {
    
    UIColor *color1 = [UIColor colorWithRed:0.000 green:0.769 blue:0.271 alpha:1.];
    UIColor *color2 = [UIColor colorWithRed:0.000 green:0.337 blue:0.110 alpha:1.];
    UIColor *color3 = [UIColor colorWithRed:0.353 green:0.353 blue:0.353 alpha:1.];
    
    UISlider *sliderProxy = [UISlider appearanceWhenContainedIn:[KBSecondViewController class], nil];
    sliderProxy.minimumTrackTintColor = color1;
    sliderProxy.thumbTintColor = color2;
    sliderProxy.maximumTrackTintColor = color3;
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateNormal];
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateHighlighted];
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateSelected];
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateDisabled];
    
    UISwitch *switchProxy = [UISwitch appearanceWhenContainedIn:[KBSecondViewController class], nil];
    switchProxy.onTintColor = color1;
    
    UISegmentedControl *segmentedControlProxy = [UISegmentedControl appearanceWhenContainedIn:[KBSecondViewController class], nil];
    segmentedControlProxy.tintColor = color1;
    [segmentedControlProxy setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont,
                                                   color2, UITextAttributeTextColor,
                                                   [UIColor clearColor], UITextAttributeTextShadowColor,
                                                   [NSValue valueWithCGPoint:CGPointZero], UITextAttributeTextShadowOffset, 
                                                   nil] forState:UIControlStateNormal];
    
    UIProgressView *progressViewProxy = [UIProgressView appearanceWhenContainedIn:[KBSecondViewController class], nil];
    progressViewProxy.trackTintColor = color1;
    progressViewProxy.progressTintColor = color2;
    
    UIActivityIndicatorView *activityIndicatorViewProxy = [UIActivityIndicatorView appearanceWhenContainedIn:[KBSecondViewController class], nil];
    activityIndicatorViewProxy.color = color2;
    
    // KBSecondViewController does not work (wrong containment order), need a custom navigationController here to get the containment working
    
    UINavigationBar *navigationBarProxy = [UINavigationBar appearanceWhenContainedIn:[KBNavigationController class], nil];
    [navigationBarProxy setBackgroundImage:[UIImage imageNamed:@"werder_navbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    navigationBarProxy.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont,
                                              [UIColor whiteColor], UITextAttributeTextColor,
                                              [UIColor blackColor], UITextAttributeTextShadowColor,
                                              [NSValue valueWithCGPoint:CGPointZero], UITextAttributeTextShadowOffset, 
                                              nil];
    
    [navigationBarProxy setTitleVerticalPositionAdjustment:-3.0 forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    UISearchBar *searchBarProxy = [UISearchBar appearanceWhenContainedIn:[KBSecondViewController class], nil];
    searchBarProxy.tintColor = color1;
    searchBarProxy.backgroundImage = [UIImage imageNamed:@"werder_searchbar_bg.png"];
    
    
    UIBarButtonItem *navigationBarButtonItem = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], [KBNavigationController class], nil];
    navigationBarButtonItem.tintColor = color2;
    
    UIBarButtonItem *barButtonItemProxy = [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], [KBNavigationController class], nil];
    barButtonItemProxy.tintColor = [UIColor purpleColor];
    
    UIBarButtonItem *searchBarButtonItemProxy = [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil];
    searchBarButtonItemProxy.tintColor = [UIColor yellowColor];
    
    UIButton *buttonProxy = [UIButton appearanceWhenContainedIn:[KBSecondViewController class], nil];
    [buttonProxy setTitleColor:color1 forState:UIControlStateNormal];
    
}

- (void)applyAppearanceWithContainmentForNavigationController {
    
    UIColor *color1 = [UIColor colorWithRed:0.000 green:0.769 blue:0.271 alpha:1.];
    UIColor *color2 = [UIColor colorWithRed:0.000 green:0.337 blue:0.110 alpha:1.];
    UIColor *color3 = [UIColor colorWithRed:0.353 green:0.353 blue:0.353 alpha:1.];
    
    KBMainView *mainViewProxy = [KBMainView appearanceWhenContainedIn:[KBNavigationController class], nil];
    mainViewProxy.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"werder_bg.png"]];
    
    UISlider *sliderProxy = [UISlider appearanceWhenContainedIn: [KBNavigationController class], nil];
    sliderProxy.minimumTrackTintColor = color1;
    sliderProxy.thumbTintColor = color2;
    sliderProxy.maximumTrackTintColor = color3;
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateNormal];
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateHighlighted];
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateSelected];
    [sliderProxy setThumbImage:[UIImage imageNamed:@"raute.png"] forState:UIControlStateDisabled];
    
    UISwitch *switchProxy = [UISwitch appearanceWhenContainedIn:[KBNavigationController class], nil];
    switchProxy.onTintColor = color1;
    
    UISegmentedControl *segmentedControlProxy = [UISegmentedControl appearanceWhenContainedIn:[KBNavigationController class], nil];
    segmentedControlProxy.tintColor = color1;
    [segmentedControlProxy setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont,
                                                   color2, UITextAttributeTextColor,
                                                   [UIColor clearColor], UITextAttributeTextShadowColor,
                                                   [NSValue valueWithCGPoint:CGPointZero], UITextAttributeTextShadowOffset, 
                                                   nil] forState:UIControlStateNormal];
    
    UIProgressView *progressViewProxy = [UIProgressView appearanceWhenContainedIn:[KBNavigationController class], nil];
    progressViewProxy.trackTintColor = color1;
    progressViewProxy.progressTintColor = color2;
    
    UIActivityIndicatorView *activityIndicatorViewProxy = [UIActivityIndicatorView appearanceWhenContainedIn:[KBNavigationController class], nil];
    activityIndicatorViewProxy.color = color2;
    
    // KBSecondViewController does not work (wrong containment order), need a custom navigationController here to get the containment working
    
    UINavigationBar *navigationBarProxy = [UINavigationBar appearanceWhenContainedIn:[KBNavigationController class], nil];
    [navigationBarProxy setBackgroundImage:[UIImage imageNamed:@"werder_navbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    navigationBarProxy.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont fontWithName:@"HelveticaNeue" size:24.0], UITextAttributeFont,
                                              [UIColor whiteColor], UITextAttributeTextColor,
                                              [UIColor blackColor], UITextAttributeTextShadowColor,
                                              [NSValue valueWithCGPoint:CGPointZero], UITextAttributeTextShadowOffset, 
                                              nil];
    
    [navigationBarProxy setTitleVerticalPositionAdjustment:-3.0 forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *navigationBarButtonItem = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], [KBNavigationController class], nil];
    navigationBarButtonItem.tintColor = color2;
    
    UISearchBar *searchBarProxy = [UISearchBar appearanceWhenContainedIn:[KBNavigationController class], nil];
    searchBarProxy.tintColor = color1;
    searchBarProxy.backgroundImage = [UIImage imageNamed:@"werder_searchbar_bg.png"];
    
    UIBarButtonItem *barButtonItemProxy = [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], [KBNavigationController class], nil];
    barButtonItemProxy.tintColor = [UIColor purpleColor];
    
    UIBarButtonItem *searchBarButtonItemProxy = [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil];
    searchBarButtonItemProxy.tintColor = [UIColor yellowColor];
    
    UIButton *buttonProxy = [UIButton appearanceWhenContainedIn:[KBNavigationController class], nil];
    [buttonProxy setTitleColor:color1 forState:UIControlStateNormal];
    
    KBCustomView *customViewProxyInSecondView = [KBCustomView appearanceWhenContainedIn:[KBNavigationController class], nil];
    customViewProxyInSecondView.mainColor = [UIColor colorWithRed:0.000 green:0.769 blue:0.271 alpha:1.];
    
}

- (void)applyAppearanceWithSpecificity {
    
    // the more specified appearance proxy wins, view is orange
    
    KBCustomView *customViewProxy2 = [KBCustomView appearanceWhenContainedIn:[UINavigationController class], nil];
    customViewProxy2.mainColor = [UIColor orangeColor];
    
    KBCustomView *customViewProxy = [KBCustomView appearance];
    customViewProxy.mainColor = [UIColor yellowColor];
    
}

- (void)applyAppearanceWithSpecificity1 {
    
    // the views will be gray
    
    KBCustomView *customViewProxy1 = [KBCustomView appearanceWhenContainedIn:[UINavigationController class], nil];
    customViewProxy1.mainColor = [UIColor orangeColor];
    
    // this selector wins since its more specific than the previous one
    
//    KBCustomView *customViewProxy2 = [KBCustomView appearanceWhenContainedIn:[KBSampleViewController class], [UINavigationController class], nil];
//    customViewProxy2.mainColor = [UIColor grayColor];
    
}

- (void)applyAppearanceWithSubclassing {
        
    // wins over simple UISlider appearance proxy, but looses to more specific like in applyAppearanceWithContainment, since they're more special
    
    KBCustomSlider *customSliderProxy = [KBCustomSlider appearance];
    customSliderProxy.minimumTrackTintColor = [UIColor cyanColor];
    customSliderProxy.maximumTrackTintColor = [UIColor yellowColor];
    customSliderProxy.thumbTintColor = [UIColor blackColor];
    
}

@end
