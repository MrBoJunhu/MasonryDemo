//
//  ViewController.m
//  MasonryUseDemo
//
//  Created by bill on 16/9/19.
//  Copyright © 2016年 bill. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatViewUseMasonry];
}


- (void)creatViewUseMasonry {
    
    UIView *firstV= [[UIView alloc] init];
    
    firstV.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:firstV];
    
    [firstV mas_makeConstraints:^(MASConstraintMaker *make) {
       // 设置 firstV 居中
        make.center.equalTo(self.view);
        
        // 设置宽高
        make.size.mas_equalTo(CGSizeMake(200, 100));
                              
        
    }];
    
    /**
     1. mas_makeConstraints: 只负责添加新增约束, Autolayout 中不能同时存在两条针对同一个对象的约束, 否则会报错;
     2. mas_updateConstraints: 针对上面的情况, 会更新在 block 中出现的约束, 确保不会出现两个相同的约束.
     3. mas_remakeConstraints: 会清除之前所有的约束, 仅保留最新的约束;
     
     4. mas_equalTo : 除了支持 NSNumber 的数值外, 就支持 CGPoint CGSize UIEdgeInsets
     */
    
    UIView *secondV = [[UIView alloc] init];
    
    secondV.backgroundColor = [UIColor redColor];
    
    secondV.alpha = 0.3;
    
    [self.view addSubview:secondV];
    
    [secondV mas_makeConstraints:^(MASConstraintMaker *make) {
       // 方法1:
        make.top.equalTo(self.view).with.offset(15);

        make.bottom.equalTo(self.view).with.offset(-15);

        make.left.equalTo(self.view).with.offset(15);

        make.right.equalTo(self.view).with.offset(-15);
        
        //方法2:
        make.top.left.bottom.and.right.equalTo(self.view).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
       
        // 方法3:
//        make.edges.equalTo(self.view).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
    }];
    
    
    // 3. 让两个高度为 50 的VIEW 垂直居中偏下100 , 并且等宽 等间隔, 间隔为 10
    UIView *v3 = [[UIView alloc] init];
    
    v3.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:v3];
    
    UIView *v4 = [[UIView alloc] init];
    
    v4.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:v4];
    
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(200);
        
        make.left.equalTo(self.view.mas_left).with.offset(10);
        
        make.right.equalTo(v4.mas_left).with.offset(-10);
        
        make.width.equalTo(v4);
        
        make.height.mas_equalTo(50);
        
    }];
    
    [v4  mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(200);
        
        make.width.equalTo(v3);
        
        make.height.equalTo(v3);
        
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        
        make.left.equalTo(v3.mas_right).with.offset(10);
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
