//
//  ViewController.m
//  uidynamic的学习之捕捉
//
//  Created by 李森 on 16/2/15.
//  Copyright © 2016年 ROWENA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIDynamicAnimator *anim;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;


@end


@implementation ViewController

-(UIDynamicAnimator*)anim
{
    if (!_anim) {
        _anim=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    }
    return _anim;

}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
   
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //获得手指触摸对应的对象
    UITouch *touch=[touches anyObject];
    
    //获得触摸点
    CGPoint point=[touch locationInView:self.view];
    //创建捕捉行为
    UISnapBehavior *snap=[[UISnapBehavior alloc]initWithItem:self.view1 snapToPoint:point];
    //防震系数  越到 振幅越小
    snap.damping=1;
    
    //创建捕捉行为
    UISnapBehavior *snap5=[[UISnapBehavior alloc]initWithItem:self.view5 snapToPoint:point];
    //防震系数  越到 振幅越小
    snap5.damping=1;
    
    //创建捕捉行为
    UISnapBehavior *snap2=[[UISnapBehavior alloc]initWithItem:self.view2 snapToPoint:point];
    //防震系数  越到 振幅越小
    snap2.damping=1;
    
    
    //创建捕捉行为
    UISnapBehavior *snap3=[[UISnapBehavior alloc]initWithItem:self.view3 snapToPoint:point];
    //防震系数  越到 振幅越小
    snap3.damping=1;
    
    
    //创建捕捉行为
    UISnapBehavior *snap4=[[UISnapBehavior alloc]initWithItem:self.view4 snapToPoint:point];
    //防震系数  越到 振幅越小
    snap4.damping=1;
    
    //增加一个碰撞行为
    UICollisionBehavior *coll=[[UICollisionBehavior alloc]initWithItems:@[_view1,_view2,_view3,_view4,_view5]];
    
    
    
    //清空之前的并再一次开始
    [self.anim removeAllBehaviors];
    
    [self.anim addBehavior:coll];
    [self.anim addBehavior:snap2];
    [self.anim addBehavior:snap];
    [self.anim addBehavior:snap3];

    [self.anim addBehavior:snap4];

    [self.anim addBehavior:snap5];

    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
