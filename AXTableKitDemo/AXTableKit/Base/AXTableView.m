//
//  AXTableView.m
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "AXTableView.h"
#import "AXTableViewCell.h"
#import "AXDefaultVC.h"


@interface AXTableView () <UIScrollViewDelegate>



// @xaoxuu: list
@property (strong, nonatomic) NSMutableArray<NSObject<AXTableSectionModel> *> *dataList;



@end


@implementation AXTableView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [self initWithFrame:frame style:UITableViewStyleGrouped]) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        
        
        [self setupData];
        
        
        [self setupTableView];
        
        [self setupDelegates];
        
        
        // load finished
        if ([self respondsToSelector:@selector(tableViewDidLoadFinished:)]) {
            [self tableViewDidLoadFinished:self];
        }
    }
    return self;
}

- (void)setupData{
    self.reuseIdentifier = NSStringFromClass([AXTableViewCell class]);
}

- (void)setupTableView{
    // @xaoxuu: 注册复用池
    if (self.reuseIdentifier.length) {
        [self registerNib:[UINib nibWithNibName:self.reuseIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:self.reuseIdentifier];
    }
    
    // @xaoxuu: 高度
    self.estimatedRowHeight = 44;
    self.estimatedSectionHeaderHeight = 0;
    self.rowHeight = 44;
    // @xaoxuu: 分割线
    
    
    
}

- (void)setupDelegates{
    // @xaoxuu: 设置table view
    
    
}


#pragma mark - func

- (void)reloadData{
    
    
    
    [super reloadData];
}


- (void)tableViewDataSource:(void (^)(NSObject<AXTableModel> *))dataSource{
    // @xaoxuu: 尝试从与类同名的json文件中加载数据源
    
    AXTableModel *model = [AXTableModel modelWithDictionary:nil];
    [model addSection:^(AXTableSectionModel *section) {
        [section addRow:^(AXTableRowModel *row) {
            
        }];
    }];
#warning 尝试从与类同名的json文件中加载数据源
}


#pragma mark - data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList[section].rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    
    UITableViewCell<AXTableViewCell> *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    
    NSObject<AXTableRowModel> *model = self.dataList[section].rows[row];
    // @xaoxuu: 即将设置模型
    if ([self respondsToSelector:@selector(indexPath:cell:willSetModel:)]) {
        [self indexPath:indexPath cell:cell willSetModel:model];
    }
    // @xaoxuu: 设置模型
    if ([cell respondsToSelector:@selector(setModel:)]) {
        cell.model = model;
    }
    
    
    return cell;
}


#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    NSObject<AXTableRowModel> *model = self.dataList[section].rows[row];
    if (!model) {
        return;
    }
    // @xaoxuu: selection action
    if ([self respondsToSelector:@selector(indexPath:didSelected:)]) {
        [self indexPath:indexPath didSelected:model];
        return;
    }
    
    // @xaoxuu: push action
    UIViewController *vc = [[[NSClassFromString(model.target) class] alloc] init];
    if (vc) {
        vc.title = NSLocalizedString(model.title, nil);
        [self _indexPath:indexPath tryPush:vc withModel:model];
    } else if (model.target.length) {
        // @xaoxuu: push default vc
        AXDefaultVC *vc = [[AXDefaultVC alloc] init];
        vc.title = NSLocalizedString(model.title, nil);
        [vc setDetail: NSLocalizedString(model.detail, nil)];
        [self _indexPath:indexPath tryPush:vc withModel:model];
    }
    
}


- (void)_indexPath:(NSIndexPath *)indexPath tryPush:(UIViewController *)targetVC withModel:(NSObject<AXTableRowModel> *)model{
    void (^block_push)(void) = ^{
        if ([self respondsToSelector:@selector(indexPath:willPush:)]) {
            [self indexPath:indexPath willPush:targetVC];
        }
        [self.controller.navigationController pushViewController:targetVC animated:YES];
    };
    if ([self respondsToSelector:@selector(indexPath:shouldPush:)]) {
        if ([self indexPath:indexPath shouldPush:targetVC]) {
            block_push();
        }
    } else {
        block_push();
    }
}


#pragma mark - extension

- (UIViewController *)controller{
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    }
    return nil;
}

@end
