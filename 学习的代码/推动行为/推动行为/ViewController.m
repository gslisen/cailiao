//
//  ViewController.m
//  推动行为
//
//  Created by 李森 on 16/2/16.
//  Copyright © 2016年 ROWENA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (nonatomic,strong) UIDynamicAnimator *anim;
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
    UIPushBehavior *push=[[UIPushBehavior alloc]initWithItems:@[_view1] mode:UIPushBehaviorModeContinuous];
    //获得角度
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
//    CGFloat angle=atan2(point.y-self.view.frame.origin.y,point.x-self.view.frame.origin.x);
//   
//    //设置角度
//    [push setAngle:angle];
    
//    //设置距离
//    CGFloat distance=sqrt(pow(point.x-self.view.frame.origin.x,2)+pow(point.y-self.view.frame.origin.y,2));
    [push setMagnitude:0.1];
    
    [push setPushDirection:CGVectorMake(point.y-self.view1.frame.origin.y,point.x-self.view1.frame.origin.x)];
    
    UICollisionBehavior *coll=[[UICollisionBehavior alloc]initWithItems:@[_view1]];
    coll.translatesReferenceBoundsIntoBoundary=YES;
    
    
    [self.anim removeAllBehaviors];
    [self.anim addBehavior:coll];
    
    [self.anim addBehavior:push];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
