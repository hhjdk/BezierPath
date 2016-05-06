//
//  ViewController.h
//  贝塞尔曲线
//
//  Created by LANJIE on 16/4/5.
//  Copyright © 2016年 俞涛涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) void(^plusTapHandle)(CGPoint position);
@end

