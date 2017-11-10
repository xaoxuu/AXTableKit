//
//  AXTableView.h
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXTableModel.h"
#import "AXTableViewProtocol.h"


@interface AXTableView : UITableView <AXTableView>


/**
 复用id，如果自定义cell，需要将此值设置为cell的NibName
 */
@property (copy, nonatomic) NSString *reuseIdentifier;

// @xaoxuu: bg
//@property (strong, nonatomic) UIColor *backgroundColor;



/**
 刷新tableView
 */
//- (void)reloadTableView;

/**
 重新获取数据源并刷新tableView
 */
//- (void)reloadDataSourceAndTableView;

/**
 根据指定的新数据源重新加载tableView
 
 @param dataList data source
 */
//- (void)reloadTableViewWithDataSource:(NSArray *)dataList;


/**
 删除某一行
 
 @param indexPath 索引
 */
//- (void)deleteCellWithIndexPath:(NSIndexPath *)indexPath;



@end
