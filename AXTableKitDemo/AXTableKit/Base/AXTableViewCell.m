//
//  AXTableViewCell.m
//  AXTableKit
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "AXTableViewCell.h"

@interface AXTableViewCell ()


@end


@implementation AXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(NSObject<AXTableRowModel> *)model{
    _model = model;
    
    
}

@end