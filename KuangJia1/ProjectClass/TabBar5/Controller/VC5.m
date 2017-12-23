//
//  VC5.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC5.h"
#import "SecondVC5ViewController.h"

@interface VC5 ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *styleList;
    
    NSArray *layoutList;
}
@end

@implementation VC5

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"顶部菜单栏";
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44-64) style:(UITableViewStyleGrouped)];
    [self.view addSubview:_tableview];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    styleList = @[
                  @"SegmentHeadStyleDefault",
                  @"SegmentHeadStyleLine",
                  @"SegmentHeadStyleArrow",
                  @"SegmentHeadStyleSlide"
                  ];
    
    layoutList = @[
                   @"MLMSegmentLayoutDefault",
                   @"MLMSegmentLayoutCenter",
                   @"MLMSegmentLayoutLeft"
                   ];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return layoutList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return styleList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"reuseIdentifier"];
    }
    cell.textLabel.text = styleList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondVC5ViewController *vc = [SecondVC5ViewController new];
    vc.style = indexPath.row;
    vc.layout = indexPath.section;
    vc.title = styleList[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    label.text = layoutList[section];
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}


@end
