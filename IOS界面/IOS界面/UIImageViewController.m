//
//  UIImageViewController.m
//  IOS界面
//
//  Created by 赵超 on 2019/4/27.
//  Copyright © 2019 fanky_c. All rights reserved.
//

#import "UIImageViewController.h"

@interface UIImageViewController ()

@end

@implementation UIImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
#if 0
    //uiimage是承载图片数据,uiimageView才是显示图片的载体。
    //uiimage加载图片的方式:initWithContentsOfFile(适合大的图片，不需要缓存)、initWithData(二进制)、imageNamed(有缓存，只需要写图片名字即可)
    
    NSString* path = [[NSBundle mainBundle] resourcePath]; //工程目录
    NSString* imagePath = [NSString stringWithFormat:@"%@/obama.jpg", path]; //图片路径
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    //UIImage* image = [UIImage imageNamed:@"obama.jpg"];
    
    //图片载体，图片大小由他来控制
    //UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, image.size.width, image.size.height)];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    imageView.image = image;
    
    
    //内容模式:
    //默认：UIViewContentModeScaleToFill:拉伸充满整个
    //UIViewContentModeScaleAspectFill: 拉伸不改变比例，充满最大边。可能会出界
    //UIViewContentModeScaleAspectFit: 拉伸不改变比例，充满最小边。一般不会出界
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:imageView];
    
#endif
    
    
    
    //播放序列图（就是多张图片有序播放）
    NSMutableArray* imageArray = [[NSMutableArray alloc] init];
    for (int i=1; i<=4; i++) {
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]];
        NSLog(@"%@", [NSString stringWithFormat:@"%d.jpg", i+0]);
        [imageArray addObject:image];
    }
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 300, 600)];
    imageView.layer.borderWidth = 2;
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    //动画数组
    imageView.animationImages = imageArray;
    
    //动画时间
    imageView.animationDuration = 0.2;
    
    //动画重复次数
    imageView.animationRepeatCount = 2;
    
    //开始动画
    [imageView startAnimating];
    
}


-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
