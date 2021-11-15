//
//  UITableView+YHExpand.h
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import <UIKit/UIKit.h>
#import "YHBaseDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (YHExpand)

@property (strong, nonatomic) YHBaseDelegate *yhDelegate;

-(void)registerHeaderFooter: (Class)headerFooterClass;
-(void)registerCell: (Class)cellClass;

@end

NS_ASSUME_NONNULL_END
