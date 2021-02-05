//
//  TBRowModel.m
//  boti
//
//  Created by 吉川首寺v2 on 2020/5/9.
//  Copyright © 2020 创途. All rights reserved.
//

#import "TBRowModel.h"

@implementation TBRowModel

-(instancetype)init{
    if (self = [super init]) {
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = CGFLOAT_MIN;
    }
    return self;
}

+(instancetype)createWithBlock: (TBRowModelBlock)cellForRow estimatedRowHeight: (CGFloat)estimatedRowHeight{
    TBRowModel *model = [[TBRowModel alloc] init];
    model.cellForRow = cellForRow;
    model.estimatedRowHeight = estimatedRowHeight;
    return model;
}

+(instancetype)createWithBlock: (TBRowModelBlock)cellForRow rowHeight: (CGFloat)rowHeight{
    TBRowModel *model = [[TBRowModel alloc] init];
    model.cellForRow = cellForRow;
    model.rowHeight = rowHeight;
    return model;
}

@end
