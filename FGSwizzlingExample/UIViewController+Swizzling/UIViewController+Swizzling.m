//
//  UIViewController+Swizzling.m
//  FGSwizzlingExample
//
//  Created by Fernanda Geraissate on 18/03/16.
//  Copyright © 2016 Fernanda G. Geraissate. All rights reserved.
//

#import "UIViewController+Swizzling.h"

#import "NSObject+SwizzlingGeneralMethods.h"

@implementation UIViewController (Swizzling)

#pragma mark - Load

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        
        [self swizzlingViewDidAppear];
    });
}

#pragma mark - Swizzling viewDidAppear:

+ (void)swizzlingViewDidAppear {
    
    SEL selectorOriginal = @selector(viewDidAppear:);
    SEL selectorSwizz = @selector(extensionViewDidAppear:);
    
    [self swizzInstanceOriginalSelector:selectorOriginal swizzledSelector:selectorSwizz];
}

#pragma mark - viewDidAppear extension

- (void)extensionViewDidAppear:(BOOL)animated {
    
    NSLog(@"viewController %@ appeared", self);
    
    [self extensionViewDidAppear:animated];
}

@end
