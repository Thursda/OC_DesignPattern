//
//  Vertex.m
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

- (instancetype)initWithLocation:(CGPoint)location{
    self = [[Vertex alloc] init];
    if (self) {
        _location = location;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)context{
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGContextAddLineToPoint(context, x, y);
}

- (id)copyWithZone:(NSZone *)zone{
    Vertex *vertextCopy = [[[self class] allocWithZone:zone] initWithLocation:_location];
    return vertextCopy;
}
@end
