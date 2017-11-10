//
//  AXTableViewCell.h
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXTableViewProtocol.h"


@interface AXTableViewCell : UITableViewCell <AXTableViewCell>

- (void)setModel:(NSObject<AXTableRowModel> *)model;
- (NSObject<AXTableRowModel> *)model;


@end
