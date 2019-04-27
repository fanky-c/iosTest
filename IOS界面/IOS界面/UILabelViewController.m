//
//  UILabelViewController.m
//  IOS界面
//
//  Created by 赵超 on 2019/4/27.
//  Copyright © 2019 fanky_c. All rights reserved.
//

#import "UILabelViewController.h"

@interface UILabelViewController ()

@end

@implementation UILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    
    //文本标签, 默认透明色
    UILabel* label = [[UILabel alloc] init];
    label.frame = CGRectMake(30, 50, 150, 430);
    label.backgroundColor = [UIColor yellowColor];
    
    label.text = @"例如，在此次取消部门规章设定的证明事项中，取消了《〈教师资格条例〉实施办法》（教育部令第10号）第十二条规定的，申请教师资格时提交的身份证复印件、学历证书复印件和普通话水平测试等级证书复印件。申请教师资格时提交的思想品德情况的鉴定或者证明材料，改为《个人承诺书》。其中，涉及需要申请人提交的无犯罪记录证明材料，改为政府部门核查。";
    label.textColor = [UIColor redColor];
    
    //文字布局
    label.textAlignment = NSTextAlignmentCenter;
    
    //设置换行模式
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    //设置显示行数(0可以不限制行数)
    label.numberOfLines = 0;
    
    
    //字体
    label.font = [UIFont systemFontOfSize:30];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.font = [UIFont italicSystemFontOfSize:30];
    label.font = [UIFont fontWithName:@"DIN Condensed" size:25];
//    for (NSString*name in [UIFont familyNames]) {
//        NSLog(@"%@", name);
//    }
    
    
    //设置阴影
    //label.shadowColor = [UIColor grayColor];
    //label.shadowOffset = CGSizeMake(2, 2);
    
    //透明度
    //label.alpha = 0.5f;
    
    //根据字符串大小计算label大小
    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(355, 100000) lineBreakMode:NSLineBreakByCharWrapping];
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, size.width, size.height);
    
    [self.view addSubview:label];
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
