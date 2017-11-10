//
//  AXSimpleTableViewCell.h
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "AXTableViewCell.h"
#import "AXTableModel.h"


@interface AXSimpleTableViewCell : AXTableViewCell <AXTableViewCell>


// @xaoxuu: model
@property (strong, readwrite, nonatomic) AXTableRowModel *model;

// @xaoxuu: image
@property (strong, nonatomic) UIImage *icon;


@end
