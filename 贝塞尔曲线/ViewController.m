//
//  ViewController.m
//  贝塞尔曲线
//
//  Created by LANJIE on 16/4/5.
//  Copyright © 2016年 俞涛涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *plusBtn;
@property (strong, nonatomic) NSMutableArray<CALayer *> *redLayers;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end

@implementation ViewController


- (NSMutableArray<CALayer *> *)redLayers {
    if (!_redLayers) {
        _redLayers = [NSMutableArray array];
    }
    return _redLayers;
}
- (void)viewDidLoad {
 
    [super viewDidLoad];
    CGPoint startPoint = [self.view convertPoint:self.plusBtn.center fromView:self.view];
    CGPoint endPoint = [self.view convertPoint:self.bottomView.center fromView:self.bottomView];
    [self initCHLayerFromPoint:startPoint toPoint:endPoint];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)initCHLayerFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint {
    
    CALayer *chLayer = [[CALayer alloc] init];
    [self.redLayers addObject:chLayer];
    
    chLayer.frame = CGRectMake(startPoint.x, startPoint.y, 15, 15);
    chLayer.cornerRadius = CGRectGetWidth(chLayer.frame)/2.f;
    chLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:chLayer];
    
    CAKeyframeAnimation *CHAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    CGPathAddQuadCurveToPoint(path, NULL, endPoint.x, startPoint.y, endPoint.x, endPoint.y);
    
    CHAnimation.path = path;
    CHAnimation.removedOnCompletion = NO;
    CHAnimation.fillMode = kCAFillModeBoth;
    CHAnimation.duration = 0.5;
    CHAnimation.delegate = self;
    
    [chLayer addAnimation:CHAnimation forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnclick:(id)sender {
    
    CGPoint startPoint = [self.view convertPoint:self.plusBtn.center fromView:self.view];
    CGPoint endPoint = [self.view convertPoint:self.bottomView.center fromView:self.bottomView];
    [self initCHLayerFromPoint:startPoint toPoint:endPoint];
}

@end
