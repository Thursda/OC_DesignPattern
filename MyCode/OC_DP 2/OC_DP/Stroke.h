//
//  Stroke.h
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Mark.h"

@interface Stroke : NSObject <Mark>
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign) CGFloat width;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childAtIndex:(NSInteger)index;
- (id<Mark>)lastChild;

- (void)drawInContext:(CGContextRef)context;

@end
