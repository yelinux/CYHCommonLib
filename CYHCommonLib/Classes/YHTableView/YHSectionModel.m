//
//  YHSectionModel.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import "YHSectionModel.h"
#import "UITableView+YHExpand.h"

@interface YHSectionModel()

@property (weak, nonatomic) UITableView *tableView;

@end

@implementation YHSectionModel

-(instancetype)initWithTableView: (UITableView*)tableView {
    if (self = [super init]) {
        _tableView = tableView;
    }
    return self;
}

-(void)registerHeaderFooter: (Class)headerFooterClass{
    [self.tableView registerHeaderFooter:headerFooterClass];
}

-(void)registerCell: (Class)cellClass{
    [self.tableView registerCell:cellClass];
}

-(NSMutableArray<YHItemModel<UITableViewCell *> *> *)rowModels{
    if (_rowModels == nil) {
        _rowModels = NSMutableArray.new;
    }
    return _rowModels;
}

@end
