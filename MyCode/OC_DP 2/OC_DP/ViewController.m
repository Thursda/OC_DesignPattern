//
//  ViewController.m
//  OC_DP
//
//  Created by Jason on 2018/3/30.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "Dot.h"
#import "Stroke.h"

@interface AFfjlView : UIView

@property (nonatomic, strong) Dot *dot;
@property (nonatomic, strong) Stroke *stroke;

@property (nonatomic, strong) Stroke *currentStroke;
@property (nonatomic, strong) NSMutableArray *strokesArray;

@end

@implementation AFfjlView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.strokesArray = [NSMutableArray arrayWithCapacity:10];
    self.dot = [Dot new];
    _dot.size = CGSizeMake(50, 50);
    _dot.location = self.center;
    _dot.color = [UIColor brownColor];
//    [self addLine];
    self.stroke = [Stroke new];
    _stroke.width = 3.0;
    _stroke.color = [UIColor brownColor];
    
    return self;
}

- (void)addLine{
    self.stroke = [Stroke new];
    _stroke.width = 3.0;
    _stroke.color = [UIColor brownColor];
//    
//    for (int i = 0; i < 50; i ++) {
//        CGFloat x = arc4random() % lround(CGRectGetWidth(self.frame));
//        CGFloat y = arc4random() % lround(CGRectGetHeight(self.frame));
//        Vertex *vertext = [[Vertex alloc] initWithLocation:CGPointMake(x, y)];
//        [_stroke addMark:vertext];
//    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (touches.count == 1) {
        self.currentStroke = [Stroke new];
        _currentStroke.width = 3.0;
        _currentStroke.color = [UIColor brownColor];
//        [self.strokesArray addObject:self.stroke];
        [self.stroke addMark:_currentStroke];
        
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self];
        NSLog(@"--- x = %f, y = %f",location.x, location.y);
        _currentStroke.location = location;
        Vertex *vertex = [[Vertex alloc] initWithLocation:location];
        [_currentStroke addMark:vertex];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (touches.count == 1) {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self];
        Vertex *vertex = [[Vertex alloc] initWithLocation:location];
        [_currentStroke addMark:vertex];
        [self setNeedsDisplay];

    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (touches.count == 1) {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self];
        Vertex *vertex = [[Vertex alloc] initWithLocation:location];
        [_currentStroke addMark:vertex];
        [self setNeedsDisplay];
    }
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.dot drawInContext:context];
    [self.stroke drawInContext:context];
//    for (Stroke *s in self.strokesArray) {
//        [s drawInContext:context];
//    }

}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AFfjlView *view = [[AFfjlView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}



@end
