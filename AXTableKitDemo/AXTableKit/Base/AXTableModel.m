//
//  AXTableModel.m
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "AXTableModel.h"

@implementation AXTableModel

- (instancetype)init{
    if (self = [super init]) {
        _title = @"";
        _headerTitle = @"";
        _headerHeight = 0;
        _footerTitle = @"";
        _footerHeight = 20;
        _sections = [NSMutableArray array];
    }
    return self;
}

- (void)addSection:(void (^)(AXTableSectionModel *))section{
    AXTableSectionModel *model = [[AXTableSectionModel alloc] init];
    if (section) {
        section(model);
    }
    [self.sections addObject:model];
}

@end

@implementation AXTableSectionModel

- (instancetype)init{
    if (self = [super init]) {
        _headerTitle = @"";
        _headerHeight = 44;
        _footerTitle = @"";
        _footerHeight = 0;
        _rowHeight = 44;
        _rows = [NSMutableArray array];
    }
    return self;
}


- (void)addRow:(void (^)(AXTableRowModel *))row{
    AXTableRowModel *model = [[AXTableRowModel alloc] init];
    if (row) {
        row(model);
    }
    [self.rows addObject:model];
}

@end

@implementation AXTableRowModel

- (instancetype)init{
    if (self = [super init]) {
        _title = @"";
        _detail = @"";
        _icon = @"";
        _target = @"";
    }
    return self;
}

@end
