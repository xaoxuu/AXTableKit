//
//  AXSimpleTableView.m
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "AXSimpleTableView.h"
#import "AXSimpleTableViewCell.h"

@interface AXSimpleTableView () <UIScrollViewDelegate>



// @xaoxuu: list
@property (strong, nonatomic) NSMutableArray<AXTableSectionModel *> *dataList;


@end

@implementation AXSimpleTableView

- (void)setupData{
    self.reuseIdentifier = NSStringFromClass([AXSimpleTableViewCell class]);
}


- (AXTableSectionModel *)tableViewSectionModel:(NSInteger)section{
    return self.dataList[section];
}

- (AXTableRowModel *)tableViewRowModel:(NSIndexPath *)indexPath{
    return self.dataList[indexPath.section].rows[indexPath.row];
}

- (void)deleteCellWithIndexPath:(NSIndexPath *)indexPath{
    [self.dataList[indexPath.section].rows removeObjectAtIndex:indexPath.row];
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}




@end
