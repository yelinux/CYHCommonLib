//
//  TBSectionModel.h
//  boti
//
//  Created by 吉川首寺v2 on 2020/5/9.
//  Copyright © 2020 创途. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TBRowModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef UITableViewHeaderFooterView* _Nullable (^TBSectionModelBlock)(UITableView *tableView);

@interface TBSectionModel : NSObject

@property(copy, nonatomic) TBSectionModelBlock viewForHeader;
@property(copy, nonatomic) TBSectionModelBlock viewForFooter;

@property (assign, nonatomic) CGFloat sectionHeaderHeight;   // default is UITableViewAutomaticDimension
@property (assign, nonatomic) CGFloat sectionFooterHeight;   // default is UITableViewAutomaticDimension

@property (assign, nonatomic) CGFloat estimatedSectionHeaderHeight;
@property (assign, nonatomic) CGFloat estimatedSectionFooterHeight;

@property (strong, nonatomic) NSMutableArray <TBRowModel*>*rowModelList;

-(void)createHeader: (TBSectionModelBlock)block estimatedSectionHeaderHeight: (CGFloat)estimatedSectionHeaderHeight;
-(void)createHeader: (TBSectionModelBlock)block sectionHeaderHeight: (CGFloat)sectionHeaderHeight;

-(void)createFooter: (TBSectionModelBlock)block estimatedSectionFooterHeight: (CGFloat)estimatedSectionFooterHeight;
-(void)createFooter: (TBSectionModelBlock)block sectionFooterHeight: (CGFloat)sectionFooterHeight;

@end

NS_ASSUME_NONNULL_END
