//
//  Stroke.m
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "Stroke.h"
@interface Stroke()
@property (nonatomic, strong) NSMutableArray<id<Mark>> *children;
@end


@implementation Stroke
- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSMutableArray *)children{
    if (!_children) {
        _children = [NSMutableArray arrayWithCapacity:0];
    }
    return _children;
}
- (void)addMark:(id<Mark>)mark{
    if (mark) {
        [self.children addObject:mark];
    }
}
- (void)removeMark:(id<Mark>)mark{
    if (mark) {
        [self.children removeObject:mark];
    }
}

- (id<Mark>)childAtIndex:(NSInteger)index{
    if (index < 0 || index >= self.children.count) {
        return [self.children objectAtIndex:index];
    }
    return nil;
}

- (id<Mark>)lastChild{
    return [self.children lastObject];
}

-(void)drawInContext:(CGContextRef)context{
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    for (id<Mark> mark in self.children) {
        [mark drawInContext:context];
    }
    CGContextSetLineWidth(context, self.width);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    CGContextStrokePath(context);
}



@end
