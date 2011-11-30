//
//  MyCustomView.m
//  UIAppearanceDemo
//
//  Created by Karl Bode on 17.11.11.
//  Copyright (c) 2011 hot coffee apps. All rights reserved.
//

#import "KBCustomView.h"

@implementation KBCustomView

@synthesize mainColor = _mainColor;

- (void)dealloc {
    [_mainColor release];
    [super dealloc];
}

- (void)awakeFromNib {
    self.mainColor = [UIColor purpleColor];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [self.mainColor CGColor]);
    CGContextFillEllipseInRect(ctx, rect);
}

@end
