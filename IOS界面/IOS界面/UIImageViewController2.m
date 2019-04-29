//
//  UIImageViewController2.m
//  IOS界面
//
//  Created by 赵超 on 2019/4/29.
//  Copyright © 2019 fanky_c. All rights reserved.
//

#import "UIImageViewController2.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface UIImageViewController2 ()

@end

@implementation UIImageViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor greenColor];
    
    //[self savePhotosAlbum];
    //[self jpg2png];
    [self deCompositionGif];
}


//保存到相册
-(void)savePhotosAlbum{
    UIImage* image = [UIImage imageNamed:@"obama.jpg"];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

//jpg - > png
-(void)jpg2png{
    UIImage* image = [UIImage imageNamed:@"obama.jpg"];
    NSDate* data = UIImagePNGRepresentation(image);
    UIImage* imagePng = [UIImage imageWithData:data];
    UIImageWriteToSavedPhotosAlbum(imagePng, nil, nil, nil);
}

//jpg -> jpg 可以压缩大小
-(void)jpg2jpg{
    UIImage* image = [UIImage imageNamed:@"obama.jpg"];
    NSDate* data = UIImageJPEGRepresentation(image, 0.4); //0-1  可以控制大小
    UIImage* imagePng = [UIImage imageWithData:data];
    UIImageWriteToSavedPhotosAlbum(imagePng, nil, nil, nil);
}


//gif分解
//1. 拿到gif图片数据
//2. 将gif分解一帧一帧
//3. 将一帧转化为uiimage
//4. 将uiimage保存成图片
-(void)deCompositionGif{
    //拿到gif图片数据
    NSString* gifPath = [[NSBundle mainBundle] pathForResource:@"gif" ofType:@"gif"];
    NSData* data = [NSData dataWithContentsOfFile:gifPath];
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, nil);
    
    //将gif分解一帧一帧
    size_t count = CGImageSourceGetCount(source);
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (int i=0; i<count; i++) {
        CGImageSourceRef imageRef = CGImageSourceCreateImageAtIndex(source, i, NULL);
        
        //将一帧转化为uiimage
        UIImage* image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        
        [array addObject:image];
        
        //释放内存
        //CGImageRelease(imageRef);
    }
    
    CFRelease(source);
    
    int i = 0;
    for (UIImage* image in array) {
        NSData* data = UIImagePNGRepresentation(image);
        NSArray* path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* gifPath = [path firstObject];
        NSString* gifPathNum = [gifPath stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
        i++;
        [data writeToFile: gifPathNum atomically:NO];
    }
    
    
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
