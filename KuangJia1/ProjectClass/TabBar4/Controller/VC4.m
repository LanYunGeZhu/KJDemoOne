//
//  VC4.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC4.h"
#import "UIImage+MessageImage.h"
#import "SFTagView.h"

@interface VC4 ()<SFTagViewDelegate,SFTagViewDataSource>
{
    UIImageView *_imageView;
    unsigned int _index;
}
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation VC4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"各种控件效果,待续";

    //设置图片右上角数字
    [self setImgAndNum];
    //设置标签
    [self setTag];
}

#pragma mark 设置图片右上角数字
- (void)setImgAndNum{
    _imageView = [UIImageView new];
    _imageView.frame = CGRectMake(30, 10, 30, 30);
    _imageView.image = [UIImage imageNamed:@"new"];
    [self.view addSubview:_imageView];
    _imageView.userInteractionEnabled = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:_imageView.image style:UIBarButtonItemStyleDone target:self action:nil];
    
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesBegan)]];
}

- (void)touchesBegan{
    
    _index += 9;
    if (_index > 110) _index = 0;
    
    _imageView.image = [[UIImage imageNamed:@"new"] hh_messageImageWithCount:_index imageSize:CGSizeMake(30, 30) tipRadius:10 tipTop:10 tipRight:10  fontSize:13 textColor:nil tipColor:nil];
    [_imageView sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:_imageView.image style:UIBarButtonItemStyleDone target:self action:nil];
    
    
}

#pragma mark 设置标签
- (void)setTag{
    
    self.titleArray = @[@"小龙虾", @"日本皮皮虾", @"蓝莓", @"美国进口蓝莓", @"意大利拉面", @"西瓜", @"苹果", @"牛肉", @"🐂", @"🍎", @"🍌",@"234567890876543",];
    SFTagView *view = [[SFTagView alloc] initWithFrame:CGRectMake(15, 64, self.view.frame.size.width -15, 20)];
    view.dataSource = self;
    view.delegate = self;
    view.themeColor = [UIColor redColor];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    view.tagCornerRadius = 0;
    [self.view addSubview:view];
}
- (NSInteger)numOfItems {
    return self.titleArray.count;
}

- (NSString *)tagView:(SFTagView *)tagView titleForItemAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (void)tagView:(SFTagView *)tagView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"点击%@", self.titleArray[index]);
}
#pragma mark 待续控件

@end
