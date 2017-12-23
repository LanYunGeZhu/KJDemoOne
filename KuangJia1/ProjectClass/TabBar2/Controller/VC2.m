//
//  VC2.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC2.h"
#import "BHInfiniteScrollView.h"

@interface VC2 ()<BHInfiniteScrollViewDelegate>

@property (nonatomic, strong) BHInfiniteScrollView* infinitePageView;

@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"各种轮播图";
    
    self.automaticallyAdjustsScrollViewInsets = NO ;
    
    NSArray* urlsArray = @[
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646722_1456498424671_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646649_1456498410838_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646706_1456498430419_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646723_1456498427059_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646705_1456498422529_800x600.jpg"
                           ];
    
    
    NSArray* titlesArray = @[@"欢迎使用BHInfiniteScrollView无限轮播图",
                             @"如果你在使用过程中遇到什么疑问",
                             @"可以添加QQ群：206177395",
                             @"我会及时修复bug",
                             @"为你解答问题",
                             ];
    
    CGFloat viewHeight = ([UIScreen mainScreen].bounds.size.height-108)/4;
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    
    BHInfiniteScrollView* infinitePageView1 = [BHInfiniteScrollView
                                               infiniteScrollViewWithFrame:CGRectMake(0, 0, viewWidth, viewHeight) Delegate:self ImagesArray:urlsArray];
    infinitePageView1.titlesArray = titlesArray;
    infinitePageView1.dotSize = 10;
    infinitePageView1.pageControlAlignmentOffset = CGSizeMake(0, 20);
    infinitePageView1.titleView.textColor = [UIColor whiteColor];
    infinitePageView1.titleView.margin = 30;
    infinitePageView1.titleView.hidden = YES;
    infinitePageView1.scrollTimeInterval = 2;
    infinitePageView1.autoScrollToNextPage = YES;
    infinitePageView1.delegate = self;
    [self.view addSubview:infinitePageView1];
    
    
    
    BHInfiniteScrollView* infinitePageView2 = [BHInfiniteScrollView
                                               infiniteScrollViewWithFrame:CGRectMake(0, viewHeight, viewWidth, viewHeight) Delegate:self ImagesArray:urlsArray];
    infinitePageView2.titlesArray = titlesArray;
    infinitePageView2.dotSize = 10;
    infinitePageView2.pageControlAlignmentOffset = CGSizeMake(0,10);
    infinitePageView2.scrollTimeInterval = 2;
    infinitePageView2.autoScrollToNextPage = YES;
    infinitePageView2.scrollDirection = BHInfiniteScrollViewScrollDirectionHorizontal;
    infinitePageView2.pageControlAlignmentH = BHInfiniteScrollViewPageControlAlignHorizontalRight;
    infinitePageView2.pageControlAlignmentV = BHInfiniteScrollViewPageControlAlignVerticalButtom;
    infinitePageView2.reverseDirection = YES;
    [self.view addSubview:infinitePageView2];
    
    BHInfiniteScrollView* infinitePageView3 = [BHInfiniteScrollView
                                               infiniteScrollViewWithFrame:CGRectMake(0, viewHeight*2, viewWidth, viewHeight) Delegate:self ImagesArray:urlsArray];
    infinitePageView3.dotSize = 10;
    infinitePageView3.pageControlAlignmentOffset = CGSizeMake(10,0);
    infinitePageView3.scrollTimeInterval = 2;
    infinitePageView3.autoScrollToNextPage = YES;
    infinitePageView3.scrollDirection = BHInfiniteScrollViewScrollDirectionVertical;
    infinitePageView3.pageControlAlignmentH = BHInfiniteScrollViewPageControlAlignHorizontalRight;
    infinitePageView3.pageControlAlignmentV = BHInfiniteScrollViewPageControlAlignVerticalButtom;
    infinitePageView3.reverseDirection = NO;
    [self.view addSubview:infinitePageView3];
    
    
    BHInfiniteScrollView* infinitePageView4 = [BHInfiniteScrollView
                                               infiniteScrollViewWithFrame:CGRectMake(0, viewHeight*3, viewWidth, viewHeight) Delegate:self ImagesArray:urlsArray];
    infinitePageView4.dotSize = 10;
    infinitePageView4.pageControlAlignmentOffset = CGSizeMake(10,0);
    infinitePageView4.dotColor = [UIColor redColor];
    infinitePageView4.scrollTimeInterval = 2;
    infinitePageView4.autoScrollToNextPage = YES;
    infinitePageView4.scrollDirection = BHInfiniteScrollViewScrollDirectionVertical;
    infinitePageView4.pageControlAlignmentH = BHInfiniteScrollViewPageControlAlignHorizontalLeft;
    infinitePageView4.pageControlAlignmentV = BHInfiniteScrollViewPageControlAlignVerticalCenter;
    infinitePageView4.reverseDirection = YES;
    infinitePageView4.infiniteLoop = YES;
    [self.view addSubview:infinitePageView4];
    _infinitePageView = infinitePageView4;
    [self performSelector:@selector(stop) withObject:nil afterDelay:5];
    [self performSelector:@selector(start) withObject:nil afterDelay:10];
    
}

- (void)stop {
    [_infinitePageView stopAutoScrollPage];
}

- (void)start {
    [_infinitePageView startAutoScrollPage];
}
//轮播图滚动到第几张
- (void)infiniteScrollView:(BHInfiniteScrollView *)infiniteScrollView didScrollToIndex:(NSInteger)index {
    NSLog(@"did scroll to index %ld", index);
}
//点击选中轮播图
- (void)infiniteScrollView:(BHInfiniteScrollView *)infiniteScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"did select item at index %ld", index);
}

@end
