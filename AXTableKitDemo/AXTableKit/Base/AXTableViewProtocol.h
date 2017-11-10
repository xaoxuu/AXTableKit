//
//  AXTableViewProtocol.h
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - models

@protocol AXTableRowModel <NSObject>

- (NSString *)title;

- (NSString *)detail;

- (NSString *)target;

@end

@protocol AXTableSectionModel <NSObject>
@required

- (NSArray<AXTableRowModel> *)rows;

@end

@protocol AXTableModel <NSObject>
@required

- (NSArray<NSObject<AXTableSectionModel> *> *)sections;

@end

#pragma mark - cell


@protocol AXTableViewCell <NSObject>
@required
/**
 cell必须要有数据模型
 
 @param model 数据模型
 */
- (void)setModel:(NSObject<AXTableRowModel> *)model;
- (NSObject<AXTableRowModel> *)model;

@end


#pragma mark - view


@protocol AXTableView <UITableViewDataSource,UITableViewDelegate>

#pragma mark data source

@optional
/**
 预加载的数据源
 */
- (NSArray *)tableViewPreloadDataSource;

@required
/**
 设置异步加载的数据源(使用本地同名json数据源可以不用实现此方法)
 
 @param dataSource 加载完成的回调
 */
- (void)tableViewDataSource:(void (^)(NSObject<AXTableModel> *))dataSource;

#pragma mark delegate

@optional
/**
 初始化table view
 
 @param tableView table view
 */
- (void)tableViewDidLoadFinished:(UITableView<AXTableView> *)tableView;


/**
 即将设置模型
 
 @param indexPath 索引
 @param cell cell
 @param model 数据模型
 */
- (void)indexPath:(NSIndexPath *)indexPath cell:(UITableViewCell<AXTableViewCell> *)cell willSetModel:(NSObject<AXTableRowModel> *)model;


/**
 选中了某一行(实现了此方法后点击cell将不会自动执行push操作，除非此方法内实现了push操作。)
 
 @param indexPath 索引
 @param model 数据模型
 */
- (void)indexPath:(NSIndexPath *)indexPath didSelected:(NSObject<AXTableRowModel> *)model;


/**
 是否允许push到某个控制器
 
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
 根据索引获取组模型
 
 @param section 组
 @return 组模型
 */
- (NSObject<AXTableSectionModel> *)tableViewSectionModel:(NSInteger)section;

/**
 根据索引获取row模型
 
 @param indexPath 索引
 @return row模型
 */
- (NSObject<AXTableRowModel> *)tableViewRowModel:(NSIndexPath *)indexPath;


@end








#pragma mark - vc


/**
 跳转到默认视图控制器
 */
@protocol AXDefaultVC <NSObject>
@required

- (void)setDetail:(NSString *)detail;

@end




