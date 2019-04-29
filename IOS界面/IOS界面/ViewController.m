//
//  ViewController.m
//  IOS界面
//
//  Created by 赵超 on 2019/4/18.
//  Copyright © 2019 fanky_c. All rights reserved.
//

#import "ViewController.h"
#import "UiView.h"
#import "UILabelViewController.h"
#import "UIImageViewController.h"
#import "UIImageViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSArray* array = [[NSArray alloc] initWithObjects:@"UIView",@"UILabel",@"UIImageView上", @"UIImageView中", nil];
    
    for(int i=0; i<array.count; i++){
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(100, 100+80*i, 140, 40);
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.tag = 100 + i;
    }
    
}

-(void)pressBtn:(UIButton*)btn{
    NSInteger tag = btn.tag;
    if(tag == 100){
        UiView* uiview = [[UiView alloc] init];
        [self presentViewController:uiview animated:YES completion:nil];
    }
    else if(tag == 101){
        UILabelViewController* label = [[UILabelViewController alloc] init];
        [self presentViewController:label animated:YES completion:nil];
    }else if (tag == 102){
        UIViewController* imageView = [[UIImageViewController alloc] init];
        [self presentViewController:imageView animated:YES completion:nil];
    }else if(tag == 103){
        UIImageViewController2* imageView = [[UIImageViewController2 alloc] init];
        [self presentViewController:imageView animated:YES completion:nil];
    }
}



@end
