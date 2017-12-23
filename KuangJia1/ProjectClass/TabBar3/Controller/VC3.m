//
//  VC3.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC3.h"
////下面两个宏加入后可以省略mas_
//#define MAS_SHORTHAND
//#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface VC3 ()

@end

@implementation VC3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自适应";
    
    //  蓝色View
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    //  红色View
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    //label
    UILabel *lab = [[UILabel alloc]init];
    lab.backgroundColor = [UIColor orangeColor];
    lab.font = [UIFont systemFontOfSize:6];
    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];
    
    //  bluView的约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(10);
        make.height.equalTo(@30);
    }];
    
    //  redView的约束
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blueView.mas_centerX);
        make.right.equalTo(blueView.mas_right);
        make.top.equalTo(blueView.mas_bottom).offset(10);
        make.height.equalTo(blueView.mas_height);
    }];
    
    //  label的约束
    lab.preferredMaxLayoutWidth = self.view.frame.size.width-40;
    [lab setContentHuggingPriority:(UILayoutPriorityRequired) forAxis:(UILayoutConstraintAxisVertical)];
    lab.numberOfLines = 0;
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(redView.mas_bottom).offset(10);
    }];
    
    
    lab.text =
    @"\n漂洋过海来看你\n\n为你我用了半年的积蓄漂洋过海的来看你\n为了这次相聚\n我连见面时的呼吸都曾反复练习\n言语从来没能将我的情意表达千万分之一\n为了这个遗憾我在夜里想了又想不肯睡去\n记忆它总是慢慢的累积在我心中无法抹去\n为了你的承诺\n我在最绝望的时候都忍着不哭泣\n陌生的城市啊熟悉的角落里\n也曾彼此安慰也曾相拥叹息\n不管将要面对什么样的结局\n在漫天风沙里望着你远去\n我竟悲伤得不能自己\n多盼能送君千里直到山穷水尽一生和你相依\n为你我用了半年的积蓄漂洋过海的来看你\n为了这次相聚\n我连见面时的呼吸都曾反复练习\n言语从来没能将我的情意表达千万分之一\n为了这个遗憾我在夜里想了又想不肯睡去\n记忆它总是慢慢的累积\n在我心中无法抹去为了你的承诺\n我在最绝望的时候都忍着不哭泣\n陌生的城市啊熟悉的角落里\n也曾彼此安慰也曾相拥叹息\n不管将要面对什么样的结局\n在漫天风沙里望着你远去\n我竟悲伤得不能自己\n多盼能送君千里直到山穷水尽一生和你相依\n陌生的城市啊熟悉的角落里\n也曾彼此安慰也曾相拥叹息\n不管将要面对什么样的结局\n在漫天风沙里望着你远去\n我竟悲伤得不能自己\n多盼能送君千里直到山穷水尽一生和你相依\n陌生的城市啊熟悉的角落里\n也曾彼此安慰也曾相拥叹息\n不管将要面对什么样的结局\n在漫天风沙里望着你远去\n我竟悲伤得不能自己\n多盼能送君千里直到山穷水尽一生和你相依\n";
    
    

}

//各种约束的方法
- (void)autolaoutMethod:(id)kongjian{
    //1.添加约束
    [kongjian mas_makeConstraints:^(MASConstraintMaker *make) {
        //insets表示距离一个视图上左下右的间距
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        //offset表示距离一个视图有多少偏移
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(20);
        make.height.equalTo(self.view).offset(20);
        make.width.equalTo(self.view).offset(20);

        
    }];
    //2.更新约束
    [kongjian mas_updateConstraints:^(MASConstraintMaker *make) {
    }];
    //3.重写约束
    [kongjian mas_remakeConstraints:^(MASConstraintMaker *make) {
    }];
    
}



@end
