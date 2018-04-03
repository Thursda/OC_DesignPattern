//
//  Mark.h
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef Mark_h
#define Mark_h

@protocol Mark <NSObject>

@optional

- (UIColor *)color;
- (CGSize)size;
- (CGPoint)location;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;

- (id<Mark>)childAtIndex:(NSInteger)index;
- (NSUInteger)count;
- (id<Mark>)lastChild;

- (void)drawInContext:(CGContextRef)context;

- (id)copy;

@end

#endif /* Mark_h */
