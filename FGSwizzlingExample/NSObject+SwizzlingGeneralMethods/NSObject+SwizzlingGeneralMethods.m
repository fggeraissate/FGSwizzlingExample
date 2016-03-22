//
//  NSObject+SwizzlingGeneralMethods.m
//  FGSwizzlingExample
//
//  Created by Fernanda Geraissate on 22/03/16.
//  Copyright © 2016 Fernanda G. Geraissate. All rights reserved.
//

#import "NSObject+SwizzlingGeneralMethods.h"

#import <objc/runtime.h>

@implementation NSObject (SwizzlingGeneralMethods)

#pragma mark - General Swizz Methods

+ (void)swizzInstanceOriginalSelector:(SEL)selectorOriginal swizzledSelector:(SEL)selectorSwizz {
    
    Class class = [self class];
    
    Method methodOriginal = class_getInstanceMethod(class, selectorOriginal);
    Method methodSwizz = class_getInstanceMethod(class, selectorSwizz);
    
    [NSObject swizzClass:class
                originalSelector:selectorOriginal
                swizzledSelector:selectorSwizz
                  originalMethod:methodOriginal
                  swizzledMethod:methodSwizz];
}

+ (void)swizzClassOriginalSelector:(SEL)selectorOriginal swizzledSelector:(SEL)selectorSwizz {
    
    Class class = object_getClass((id)self);
    
    Method methodOriginal = class_getClassMethod(class, selectorOriginal);
    Method methodSwizz = class_getClassMethod(class, selectorSwizz);
    
    [NSObject swizzClass:class
                originalSelector:selectorOriginal
                swizzledSelector:selectorSwizz
                  originalMethod:methodOriginal
                  swizzledMethod:methodSwizz];
}

+ (void)swizzClass:(Class)class
  originalSelector:(SEL)selectorOriginal
  swizzledSelector:(SEL)selectorSwizz
    originalMethod:(Method)methodOriginal
    swizzledMethod:(Method)methodSwizz {
    
    IMP implementationOriginal = method_getImplementation(methodOriginal);
    IMP implementationSwizz = method_getImplementation(methodSwizz);
    
    BOOL didAddMethod = class_addMethod(class,
                                        selectorOriginal,
                                        implementationSwizz,
                                        method_getTypeEncoding(methodSwizz));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            selectorSwizz,
                            implementationOriginal,
                            method_getTypeEncoding(methodOriginal));
        
    } else {
        method_exchangeImplementations(methodOriginal, methodSwizz);
    }
}


@end
