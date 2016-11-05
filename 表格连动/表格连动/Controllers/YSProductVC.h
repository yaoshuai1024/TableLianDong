//
//  YSProductVC.h
//  表格连动
//
//  Created by yaoshuai on 2016/11/5.
//  Copyright © 2016年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProductsDelegate <NSObject>

- (void)willDisplayHeaderView:(NSInteger)section;
- (void)didEndDisplayingHeaderView:(NSInteger)section;

@end

@interface YSProductVC : UIViewController

@property(nonatomic, weak) id<ProductsDelegate> delegate;

/**
 当CategoryTableView滚动时,ProductsTableView跟随滚动至指定section

 @param indexPath indexPath
 */
- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath;

@end
