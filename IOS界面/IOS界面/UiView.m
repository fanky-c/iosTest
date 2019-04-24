//
//  UiView.m
//  IOS界面
//
//  Created by 赵超 on 2019/4/20.
//  Copyright © 2019 fanky_c. All rights reserved.
//

#import "UiView.h"

@interface UiView ()

@end

@implementation UiView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //uiscreen, bounds的X、Y永远为0
    float x = [[UIScreen mainScreen] bounds].origin.x;
    float y = [[UIScreen mainScreen] bounds].origin.y;
    float width = [[UIScreen mainScreen] bounds].size.width;
    float height = [[UIScreen mainScreen] bounds].size.height;
    NSLog(@"UIScreen的值 = x:%f;y:%f;width:%f;height:%f", x, y, width, height);
    
    
    
    //view1
    UIView* view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(100, 100, 250, 250);
    view1.backgroundColor = [UIColor colorWithRed:0.1 green:0.2 blue:0.3 alpha:1];
    view1.tag = 1;
    [self.view addSubview:view1];
    NSLog(@"view1的值 = x:%f;y:%f;width:%f;height:%f", view1.frame.origin.x, view1.frame.origin.y, view1.frame.size.width, view1.frame.size.height);
    NSLog(@"view1 center的值 = x:%f;y:%f;", view1.center.x, view1.center.y);
    
//    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view1.frame.size.width, view1.frame.size.height)];
//    label1.text = @"一";
//    label1.textAlignment = NSTextAlignmentJustified;
//    label1.textColor = [UIColor whiteColor];
//    [view1 addSubview:label1];
    
    
    
    
    //view2
    UIView* view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(50, 50, 150, 150);
    view2.backgroundColor = [UIColor yellowColor];
    view2.tag = 2;
    [view1 addSubview:view2];
    NSLog(@"view2 center的值 = x:%f;y:%f;", view2.center.x, view2.center.y);
    
    
    
    //view3
    UIView* view3 = [[UIView alloc] init];
    view3.frame = CGRectMake(50, 50, 100, 50);
    view3.backgroundColor = [UIColor redColor];
    view3.tag = 3;
    [view2 addSubview:view3];
    
    
    //view4
    UIView* view4 = [[UIView alloc] initWithFrame:CGRectMake(60, 60, 50, 50)];
    view4.backgroundColor = [UIColor redColor];
    [view2 addSubview:view4];
    
    
    //子视图，是个数组
    NSArray* subViewsArray = [view1 subviews];
    for (UIView* view in subViewsArray) {
        if(view.tag == 2){
            view.backgroundColor = [UIColor greenColor];
        }
    }
    
    //通过tag获取对应子视图
    [view1 viewWithTag:3].backgroundColor = [UIColor darkGrayColor];
    
    
    //父视图，只有一个
    view3.superview.backgroundColor = [UIColor purpleColor];
    
    
    
    //设置层级关系
    // 1. 同一个父视图，现在加入的会被后加入的view会给覆盖
    // 2. 子视图跟随父视图进行层级 遮挡
    
    
    
    //交互层级
    //[view2 exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    //1. 插入view到指定层
     UIView* view5 = [[UIView alloc] initWithFrame:CGRectMake(70, 70, 50, 50)];
     view5.backgroundColor = [UIColor blackColor];
    
    [view2 insertSubview:view5 atIndex:0];
    
    //[view2 insertSubview:view5 aboveSubview:view4];
    
    //[view2 insertSubview:view5 belowSubview:view3];
    
    //2. 最顶层
    //[view2 bringSubviewToFront:view5];
    
    //3. 最底层
    [view2 sendSubviewToBack:view5];
    
    
    
    //自适应
    UIView* backView = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 10, 400, 50, 50)];
    backView.tag = 1001;
    backView.backgroundColor = [UIColor redColor];
    backView.autoresizesSubviews = YES; //开始自适应
    [self.view addSubview:backView];
    
    UIView* innerView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    innerView.backgroundColor = [UIColor blackColor];
    innerView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin| UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [backView addSubview:innerView];
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 500, 100, 20);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnClick{
    UIView* view = [self.view viewWithTag:1001];
    view.frame = CGRectMake(view.frame.origin.x - 5, view.frame.origin.y - 5, view.frame.size.width + 10, view.frame.size.height+10);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





@end
