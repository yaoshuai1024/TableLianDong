//
//  YSCategoryVC.m
//  表格连动
//
//  Created by yaoshuai on 2016/11/5.
//  Copyright © 2016年 ys. All rights reserved.
//

#import "YSCategoryVC.h"
#import "YSProductVC.h"

@interface YSCategoryVC ()<UITableViewDelegate, UITableViewDataSource, ProductsDelegate>

@property (nonatomic, strong) UITableView *categoryTableView;
@property (nonatomic, strong) NSArray *categoryArr;
@property (nonatomic, strong) YSProductVC *productsVC;

@end

@implementation YSCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"TestDemo";
    [self configData];
    [self createTableView];
    [self createProductsVC];
    
}

- (void)configData {
    
    if (!_categoryArr) {
        
        NSArray *numArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        NSMutableArray *tmpArr = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            NSString *tmpStr = [NSString stringWithFormat:@"第%@类", numArr[i]];
            [tmpArr addObject:tmpStr];
        }
        _categoryArr = tmpArr;
    }
}

- (void)createTableView {
    
    self.categoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, self.view.frame.size.height) style:UITableViewStylePlain];
    self.categoryTableView.delegate = self;
    self.categoryTableView.dataSource = self;
    self.categoryTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.categoryTableView];
}

- (void)createProductsVC {
    
    _productsVC = [[YSProductVC alloc] init];
    _productsVC.delegate = self;
    [self addChildViewController:_productsVC];
    [self.view addSubview:_productsVC.view];
}

//MARK:-tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _categoryArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *ident = @"ident";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    
    cell.textLabel.text = [_categoryArr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_productsVC) {
        [_productsVC scrollToSelectedIndexPath:indexPath];
    }
}

#pragma mark - ProductsDelegate
- (void)willDisplayHeaderView:(NSInteger)section {
    
    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)didEndDisplayingHeaderView:(NSInteger)section {
    
    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section + 1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

@end
