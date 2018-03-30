//
//  Dot.h
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGSize size;

- (void)drawInContext:(CGContextRef)context;

@end
