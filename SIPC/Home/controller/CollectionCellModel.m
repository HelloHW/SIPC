//
//  CollectionCellModel.m
//  sterm_overseas
//
//  Created by sTagRD on 2017/12/14.
//  Copyright © 2017年 stag. All rights reserved.
//

#import "CollectionCellModel.h"

@implementation CollectionCellModel

+ (CollectionCellModel *)createNewCellModel:(NSString *)titleString imageUrl:(NSString *)imageUrl {
    CollectionCellModel *model = [[CollectionCellModel alloc] init];
    model.titleString = titleString;
    model.imageUrl = imageUrl;
    return model;
}

@end
