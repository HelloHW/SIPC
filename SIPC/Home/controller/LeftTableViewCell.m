//
//  LeftTableViewCell.m
//  ABMS
//
//  Created by ELI.钟华威 on 2018/1/9.
//  Copyright © 2018年 Stag. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)reloadDataWithModel:(CollectionCellModel*)model;{
    __imageView.image = [UIImage imageNamed:model.imageUrl];
    _TitleLabel.text = model.titleString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
