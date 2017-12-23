//
//  QRCodeView.h
//  KuangJia1
//
//  Created by MrSong on 17/8/2.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeView : UIView

@property (strong,nonatomic) UIButton *lightBtn;
@property (strong,nonatomic) UIButton *imgBtn;
@property (strong,nonatomic) UIButton *createBtn;

+ (instancetype)maskView;
- (void)repetitionAnimation;


@end
