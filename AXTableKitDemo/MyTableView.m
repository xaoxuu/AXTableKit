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


- (void)ax_tableViewCell:(AXTableViewCellType *)cell willSetModel:(AXTableRowModelType *)model forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if ([model respondsToSelector:@selector(setAccessoryType:)]) {
            model.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    } else if (indexPath.section == 2) {
        if ([model respondsToSelector:@selector(setAccessoryType:)]) {
            model.accessoryType = UITableViewCellAccessoryDetailButton;
        }
    } else if (indexPath.section == 3) {
        if ([model respondsToSelector:@selector(setAccessoryType:)]) {
            model.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
    }
    
}


@end
