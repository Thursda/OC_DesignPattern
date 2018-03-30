//
//  Vertex.h
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Mark.h"

@interface Vertex : NSObject <Mark>

@property (nonatomic, assign) CGPoint location;

- (instancetype)initWithLocation:(CGPoint)point;

- (void)drawInContext:(CGContextRef)context;
@end
