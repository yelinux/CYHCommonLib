//
//  YHSectionModel.h
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import <UIKit/UIKit.h>
#import "YHItemModel.h"

NS_ASSUME_NONNULL_BEGIN

#define YHAddHeader(property, T) \
({  \
YHItemModel <T*>*model = [[YHItemModel alloc] init];    \
model.reusableIdentifier = NSStringFromClass([T class]);    \
property.headerModel = model;    \
[sectionModel registerHeaderFooter:[T class]];  \
model;   \
})

#define YHAddFooter(property, T) \
({  \
YHItemModel <T*>*model = [[YHItemModel alloc] init];    \
model.reusableIdentifier = NSStringFromClass([T class]);    \
property.footerModel = model;    \
[sectionModel registerHeaderFooter:[T class]];  \
model;   \
})

#define YHAddRow(sectionModel, T) \
({  \
YHItemModel <T*>*model = [[YHItemModel alloc] init];    \
model.reusableIdentifier = NSStringFromClass([T class]);    \
[sectionModel.rowModels addObject:model];    \
[sectionModel registerCell:[T class]];  \
model;   \
})

@interface YHSectionModel : NSObject

@property (strong, nonatomic) YHItemModel <UITableViewHeaderFooterView*> *headerModel;
@property (strong, nonatomic) NSMutableArray <YHItemModel <UITableViewCell*> *> *rowModels;
@property (strong, nonatomic) YHItemModel <UITableViewHeaderFooterView*> *footerModel;

-(instancetype)init NS_UNAVAILABLE;
-(instancetype)initWithTableView: (UITableView*)tableView;

-(void)registerHeaderFooter: (Class)headerFooterClass;
-(void)registerCell: (Class)cellClass;

@end

NS_ASSUME_NONNULL_END
