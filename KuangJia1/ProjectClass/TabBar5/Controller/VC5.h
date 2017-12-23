//
//  VC5.h
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "BaseViewController.h"
#import "MLMSegmentManager.h"

@interface VC5 : BaseViewController

@property (nonatomic, assign) MLMSegmentHeadStyle style;
@property (nonatomic, assign) MLMSegmentLayoutStyle layout;

@property (nonatomic,strong) UITableView *tableview ;

@end
