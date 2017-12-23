//
//  BaseViewController.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor] ;

    if (self.navigationController.childViewControllers.count > 1) {
        //设置返回按钮
        [self setBackBtn];
        //隐藏底部标签栏
        [self setHidesBottomBarWhenPushed:YES];
        
    }

    
}


- (void)setBackBtn{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:ImgName(@"返回") style:(UIBarButtonItemStylePlain) target:self action:@selector(backBtn)] ;
}
- (void)backBtn{
    [self.navigationController popViewControllerAnimated:YES]; ;
}
- (void)setLeftTxt:(NSString *)title action:(SEL)action{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:title style:(UIBarButtonItemStylePlain) target:self action:action] ;
}
- (void)setLeftImg:(UIImage *)img action:(SEL)action{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:img style:(UIBarButtonItemStylePlain) target:self action:action] ;
}
- (void)setRightTxt:(NSString *)title action:(SEL)action{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:title style:(UIBarButtonItemStylePlain) target:self action:action] ;
}
- (void)setRightImg:(UIImage *)img action:(SEL)action{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:img style:(UIBarButtonItemStylePlain) target:self action:action] ;
}

@end
