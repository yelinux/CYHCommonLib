//
//  YHBaseDelegate.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import "YHBaseDelegate.h"

@implementation YHBaseDelegate

-(void)configTableView{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}

-(YHSectionModel*)createSectionModel{
    YHSectionModel *mod = [[YHSectionModel alloc] initWithTableView:self.tableView];
    [self.sectionModels addObject:mod];
    return mod;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionModels.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sectionModels[section].rowModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    YHItemModel <UITableViewHeaderFooterView*> *headerModel = self.sectionModels[section].headerModel;
    return headerModel ? headerModel.heightBlock() : CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    YHItemModel <UITableViewHeaderFooterView*> *headerModel = self.sectionModels[section].headerModel;
    if (headerModel) {
        UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerModel.reusableIdentifier];
        headerModel.setDataBlock(view);
        return view;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    YHItemModel <UITableViewHeaderFooterView*> *footerModel = self.sectionModels[section].footerModel;
    return footerModel ? footerModel.heightBlock() : CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    YHItemModel <UITableViewHeaderFooterView*> *footerModel = self.sectionModels[section].footerModel;
    if (footerModel) {
        UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerModel.reusableIdentifier];
        footerModel.setDataBlock(view);
        return view;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.sectionModels[indexPath.section].rowModels[indexPath.row].heightBlock();
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YHItemModel <UITableViewCell*> *rowModel = self.sectionModels[indexPath.section].rowModels[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rowModel.reusableIdentifier forIndexPath:indexPath];
    rowModel.setDataBlock(cell);
    return cell;
}

-(NSMutableArray<YHSectionModel *> *)sectionModels{
    if (_sectionModels == nil) {
        _sectionModels = NSMutableArray.new;
    }
    return _sectionModels;
}

@end

@implementation YHEstimatedDelegate

-(void)configTableView{
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    YHItemModel <UITableViewHeaderFooterView*> *headerModel = self.sectionModels[section].headerModel;
    return headerModel ? headerModel.estimatedHeightBlock() : CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.sectionModels[indexPath.section].rowModels[indexPath.row].estimatedHeightBlock();
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    YHItemModel <UITableViewHeaderFooterView*> *footerModel = self.sectionModels[section].footerModel;
    return footerModel ? footerModel.estimatedHeightBlock() : CGFLOAT_MIN;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    CGFloat height = view.frame.size.height;
    if (height > 0) {
        YHItemModel <UITableViewHeaderFooterView*> *headerModel = self.sectionModels[section].headerModel;
        if (headerModel.displayHeightBlock) {
            headerModel.displayHeightBlock(height);
        }
    }
}

-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    CGFloat height = view.frame.size.height;
    if (height > 0) {
        YHItemModel <UITableViewHeaderFooterView*> *footerModel = self.sectionModels[section].footerModel;
        if (footerModel.displayHeightBlock) {
            footerModel.displayHeightBlock(height);
        }
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = cell.frame.size.height;
    if (height > 0) {
        YHItemModel <UITableViewCell*> *rowModel = self.sectionModels[indexPath.section].rowModels[indexPath.row];
        if (rowModel.displayHeightBlock) {
            rowModel.displayHeightBlock(height);
        }
    }
}

@end
