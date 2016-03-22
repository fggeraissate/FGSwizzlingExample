//
//  NSObject+SwizzlingGeneralMethods.h
//  FGSwizzlingExample
//
//  Created by Fernanda Geraissate on 22/03/16.
//  Copyright © 2016 Fernanda G. Geraissate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SwizzlingGeneralMethods)

+ (void)swizzInstanceOriginalSelector:(SEL)selectorOriginal swizzledSelector:(SEL)selectorSwizz;
+ (void)swizzClassOriginalSelector:(SEL)selectorOriginal swizzledSelector:(SEL)selectorSwizz;

@end
