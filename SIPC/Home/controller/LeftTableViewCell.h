//
//  LeftTableViewCell.h
//  ABMS
//
//  Created by ELI.钟华威 on 2018/1/9.
//  Copyright © 2018年 Stag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionCellModel.h"
@interface LeftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *_imageView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

-(void)reloadDataWithModel:(CollectionCellModel*)model;

@end
