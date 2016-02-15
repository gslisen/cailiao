//
//  ViewController.m
//  2-15uidynamic学习
//
//  Created by 李森 on 16/2/15.
//  Copyright © 2016年 ROWENA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *greedview;
//创建一个物理仿真器
@property (nonatomic,strong) UIDynamicAnimator *anim;
@end

@implementation ViewController

//懒加载
-(UIDynamicAnimator*)anim
{
    if (!_anim) {
        //参照视图是self.view
        _anim=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
        
    }
    return _anim;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self text2];
    

}

-(void)test
{
    //演示 重力行为
    //创建物理仿真器 指导当前控制器范围 作为我们的范围
    //懒加载
    
    //创建物理仿真行为  顺便添加物理仿真元素
    UIGravityBehavior *gravity=[[UIGravityBehavior alloc]initWithItems:@[_greedview]];
    
    //设置方向 x-y轴
    gravity.gravityDirection=CGVectorMake(1,0.5);
    
    //设置加速度
    gravity.magnitude=10.0;
    
    //将物理仿真行为 添加到物理仿真器中
    //注意 必须设置为全局  懒加载对象需要用self.
    [self.anim addBehavior:gravity];

}

//测试碰撞
-(void)text2
{  _greedview.frame=CGRectMake(146,100 ,100 ,100);
    
    
    [_anim removeAllBehaviors];
    
    
  //重力仿真行为
    UIGravityBehavior *gravity=[[UIGravityBehavior alloc]initWithItems:@[_greedview]];
    //创建碰撞行为
    gravity.magnitude=10;
    
    UICollisionBehavior *collisonb=[[UICollisionBehavior alloc]initWithItems:@[_greedview,self.view2]];
    //设置碰撞的边界
    collisonb.translatesReferenceBoundsIntoBoundary=YES;
    
    //设置直线边界 通过2个点设置
//    [collisonb addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(50,400) toPoint:CGPointMake(300, 500)];
    //添加图形边界
    //某个范围的内切圆
    UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(50, 100, 300, 500)];
    [collisonb addBoundaryWithIdentifier:@"yuan" forPath:path];
    [self.anim addBehavior:gravity];
    [self.anim addBehavior:collisonb];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
