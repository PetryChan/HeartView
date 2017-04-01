//
//  ViewController.m
//  Heart
//
//  Created by petry(陈荣) on 2017/3/31.
//  Copyright © 2017年 petry(陈荣). All rights reserved.
//

#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGH  [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "PEHeartFlyView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *giftBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imgV.image = [UIImage imageNamed:@"reba.jpeg"];
    [self.view insertSubview:imgV atIndex:0];
    

}

- (IBAction)heartClick:(UIButton *)sender
{
//    NSLog(@"heartClick");
    //button点击动画 变小恢复变大恢复
    CAKeyframeAnimation *btnAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    btnAnimation.values = @[@(1.0),@(0.7),@(0.5),@(0.3),@(0.5),@(0.7),@(1.0), @(1.2), @(1.4), @(1.2), @(1.0)];
    //keyTimes分为了11帧
    btnAnimation.keyTimes = @[@(0.0),@(0.1),@(0.2),@(0.3),@(0.4),@(0.5),@(0.6),@(0.7),@(0.8),@(0.9),@(1.0)];
    //默认值,表示当关键帧为座标点的时候,关键帧之间直接直线相连进行插值计算
    btnAnimation.calculationMode = kCAAnimationLinear;
    btnAnimation.duration = 0.3;
    [sender.layer addAnimation:btnAnimation forKey:@"SHOW"];
    
    PEHeartFlyView *heart = [[PEHeartFlyView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(SCREENWIDTH / 2.0, self.giftBtn.frame.origin.y + self.giftBtn.frame.size.height/3.0);
    heart.center = fountainSource;
    [heart animateInView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
