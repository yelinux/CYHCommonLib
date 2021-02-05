//
//  TBSectionModel.m
//  boti
//
//  Created by 吉川首寺v2 on 2020/5/9.
//  Copyright © 2020 创途. All rights reserved.
//

#import "TBSectionModel.h"

@implementation TBSectionModel

-(instancetype)init{
    if (self = [super init]) {
        self.sectionHeaderHeight = UITableViewAutomaticDimension;
        self.sectionFooterHeight = UITableViewAutomaticDimension;
        
        self.estimatedSectionHeaderHeight = CGFLOAT_MIN;
        self.estimatedSectionFooterHeight = CGFLOAT_MIN;
        
        self.rowModelList = [NSMutableArray array];
    }
    return self;
}

-(void)createHeader: (TBSectionModelBlock)block estimatedSectionHeaderHeight: (CGFloat)estimatedSectionHeaderHeight{
    self.viewForHeader = block;
    self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight;
}

-(void)createHeader: (TBSectionModelBlock)block sectionHeaderHeight: (CGFloat)sectionHeaderHeight{
    self.viewForHeader = block;
    self.sectionHeaderHeight = sectionHeaderHeight;
}

-(void)createFooter: (TBSectionModelBlock)block estimatedSectionFooterHeight: (CGFloat)estimatedSectionFooterHeight{
    self.viewForFooter = block;
    self.estimatedSectionFooterHeight = estimatedSectionFooterHeight;
}

-(void)createFooter: (TBSectionModelBlock)block sectionFooterHeight: (CGFloat)sectionFooterHeight{
    self.viewForFooter = block;
    self.sectionFooterHeight = sectionFooterHeight;
}

@end
