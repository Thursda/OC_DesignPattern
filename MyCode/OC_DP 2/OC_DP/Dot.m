
//
//  Dot.m
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "Dot.h"

@implementation Dot

- (void)drawInContext:(CGContextRef)context{
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGSize frameSize = self.size;
    CGRect frame = CGRectMake(x - frameSize.width / 2 ,
                              y - frameSize.height / 2,
                              frameSize.width, frameSize.height);
    CGContextSetFillColorWithColor(context, [self.color CGColor]);
    CGContextFillEllipseInRect(context, frame);
}

- (id)copyWithZone:(NSZone *)zone{
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    dotCopy.color = [UIColor colorWithCGColor:self.color.CGColor];
    dotCopy.size = _size;
    return dotCopy;
}
@end
