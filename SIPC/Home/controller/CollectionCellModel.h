//
//  CollectionCellModel.h
//  sterm_overseas
//
//  Created by sTagRD on 2017/12/14.
//  Copyright © 2017年 stag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionCellModel : NSObject

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, assign) NSInteger operateType;


+ (CollectionCellModel *)createNewCellModel:(NSString *)titleString imageUrl:(NSString *)imageUrl;


@end
