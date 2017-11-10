//
//  AXSimpleTableView.h
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "AXTableView.h"
#import "AXTableModel.h"
#import "AXSimpleTableViewCell.h"

@class AXSimpleTableView;
@protocol AXSimpleTableView <AXTableView>

@required
/**
 设置异步加载的数据源(使用本地同名json数据源可以不用实现此方法)
 
 @param dataSource 加载完成的回调
 */
- (void)tableViewDataSource:(void (^)(AXTableModel *))dataSource;

#pragma mark delegate

@optional
/**
 初始化table view
 
 @param tableView table view
 */
- (void)tableViewDidLoadFinished:(AXSimpleTableView *)tableView;

/**
 即将设置模型
 
 @param indexPath 索引
 @param cell cell
 @param model 数据模型
 */
- (void)indexPath:(NSIndexPath *)indexPath cell:(AXSimpleTableViewCell *)cell willSetModel:(AXTableRowModel *)model;

/**
 cell的icon
 
 @param indexPath 索引
 @param icon icon
 */
- (void)indexPath:(NSIndexPath *)indexPath icon:(void (^)(UIImage *icon))icon;


/**
 选中了某一行(实现了此方法后点击cell将不会自动执行push操作，除非此方法内实现了push操作。)
 
 @param indexPath 索引
 @param model 数据模型
 */
- (void)indexPath:(NSIndexPath *)indexPath didSelected:(AXTableRowModel *)model;


/**
 将要push到某个控制器
 
 @param indexPath 索引
 @param targetVC 目标控制器
 @return 是否可以push
 */
- (BOOL)indexPath:(NSIndexPath *)indexPath shouldPush:(UIViewController *)targetVC;


/**
 将要push到某个控制器
 
 @param indexPath 索引
 @param targetVC 目标控制器
 */
- (void)indexPath:(NSIndexPath *)indexPath willPush:(UIViewController *)targetVC;


/**
 accessory type 默认是">"
 
 @param indexPath 索引
 @param accessoryType accessory type
 */
- (void)indexPath:(NSIndexPath *)indexPath accessoryType:(void (^)(UITableViewCellAccessoryType accessoryType))accessoryType;

/**
 是否显示开关、开关默认状态
 
 @param indexPath 索引
 @param showSwitch 是否显示开关、开关默认状态
 */
- (void)indexPath:(NSIndexPath *)indexPath showSwitch:(void (^)(BOOL show, BOOL open))showSwitch;

/**
 开关状态改变事件
 
 @param indexPath 索引
 @param sender 开关
 */
- (void)indexPath:(NSIndexPath *)indexPath switchValueChanged:(UISwitch *)sender;






@end
@interface AXSimpleTableView : AXTableView <AXSimpleTableView>


/**
 根据索引获取组模型
 
 @param section 组
 @return 组模型
 */
- (AXTableSectionModel *)tableViewSectionModel:(NSInteger)section;

/**
 根据索引获取row模型
 
 @param indexPath 索引
 @return row模型
 */
- (AXTableRowModel *)tableViewRowModel:(NSIndexPath *)indexPath;


@end
