//
//  SFTagView.h
//  KuangJia1
//
//  Created by MrSong on 17/8/3.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFTagViewProtocol.h"

@interface SFTagView : UIView

@property (nonatomic, weak) id<SFTagViewDelegate> delegate;
@property (nonatomic, weak) id<SFTagViewDataSource> dataSource;

/** 外观配置项 */

@property (nonatomic, strong) UIColor *themeColor;

@property (nonatomic, assign) NSInteger tagCornerRadius;

@property (nonatomic, assign) CGFloat cellHeight;

- (void)reloadData;

@end
