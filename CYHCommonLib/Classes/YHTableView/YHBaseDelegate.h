//
//  YHBaseDelegate.h
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import <UIKit/UIKit.h>
#import "YHSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHBaseDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray <YHSectionModel*> *sectionModels;

-(void)configTableView;
-(YHSectionModel*)createSectionModel;

@end

@interface YHEstimatedDelegate : YHBaseDelegate

@end

NS_ASSUME_NONNULL_END
