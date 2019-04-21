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
    view1.frame = CGRectMake(100, 100, 200, 40);
    view1.backgroundColor = [UIColor colorWithRed:0.1 green:0.2 blue:0.3 alpha:1];
    [self.view addSubview:view1];
    NSLog(@"view1的值 = x:%f;y:%f;width:%f;height:%f", view1.frame.origin.x, view1.frame.origin.y, view1.frame.size.width, view1.frame.size.height);
    NSLog(@"view1 center的值 = x:%f;y:%f;", view1.center.x, view1.center.y);
    
    
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
