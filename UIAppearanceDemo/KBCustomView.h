//
//  MyCustomView.h
//  UIAppearanceDemo
//
//  Created by Karl Bode on 17.11.11.
//  Copyright (c) 2011 hot coffee apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBCustomView : UIView<UIAppearance>

@property (nonatomic, retain) UIColor *mainColor UI_APPEARANCE_SELECTOR;

@end
