//
//  LYTextVC.m
//  KuangJia1
//
//  Created by MrSong on 17/8/3.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "LYTextVC.h"
#import "Masonry.h"

@interface LYTextVC ()

@end

@implementation LYTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    
}

-(void)setupUI{
    
    UILabel *label = [[UILabel alloc] init];
    
    [label sizeToFit];
    
    label.font = [UIFont systemFontOfSize:20];
    
    label.numberOfLines = 0;
        
    label.textColor = [UIColor blackColor];
    
    label.text = self.contentStr;
    
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"扫描结果";
    
    [label mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.offset(4);
        make.right.offset(-4);
        make.top.offset(64);
    }];
}


@end
