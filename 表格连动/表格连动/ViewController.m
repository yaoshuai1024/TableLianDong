//
//  ViewController.m
//  表格连动
//
//  Created by yaoshuai on 2016/11/5.
//  Copyright © 2016年 ys. All rights reserved.
//

#import "ViewController.h"
#import "YSCategoryVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YSCategoryVC *categoryVC = [[YSCategoryVC alloc] init];
    [self addChildViewController:categoryVC];
    [self.view addSubview:categoryVC.view];
}

@end
