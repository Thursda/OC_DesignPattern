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

@dynamic location;

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
    if ([self.children containsObject:mark]) {
        [self.children removeObject:mark];
    }else{
        [self.children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childAtIndex:(NSInteger)index{
    if (index < 0 || index >= self.children.count) {
        return [self.children objectAtIndex:index];
    }
    return nil;
}
- (CGPoint)location{
    return [self.children firstObject].location;
}
- (id<Mark>)lastChild{
    return [self.children lastObject];
}

- (NSUInteger)count{
    return [self.children count];
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


- (id)copyWithZone:(NSZone *)zone{
    Stroke *strockCopy = [[[self class] allocWithZone:zone] init];
    [strockCopy setColor:[UIColor colorWithCGColor:[_color CGColor]]];
    [strockCopy setSize:_size];
    for (id <Mark> child in _children) {
        id<Mark> childCopy = [child copy];
        [strockCopy addMark:childCopy];
    }
    return strockCopy;
}


@end
