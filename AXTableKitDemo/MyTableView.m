//
//  MyTableView.m
//  AXTableKitDemo
//
//  Created by xaoxuu on 10/11/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "MyTableView.h"

@implementation MyTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (AXTableModelType *)ax_tableViewPreloadDataSource{
    AXTableModel *model = [AXTableModel new];
    [model addSection:^(AXTableSectionModel *section) {
        for (int i = 0; i < 10; i++) {
            [section addRow:^(AXTableRowModel *row) {
                row.title = [NSString stringWithFormat:@"%d", i];
            }];
        }
    }];
    return model;
}


- (void)ax_tableViewDataSource:(void (^)(AXTableModelType *))dataSource{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        dataSource([self loadDataSourceFromBundle]);
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dataSource([self loadDataSourceFromPath:[[NSBundle mainBundle] pathForResource:@"MyTableView2" ofType:@"json"]]);
    });
}

- (void)ax_tableViewCell:(AXTableViewCellType *)cell willSetModel:(AXTableRowModelType *)model forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row <= 4) {
        model.accessoryType = indexPath.row;
    }
}

@end
