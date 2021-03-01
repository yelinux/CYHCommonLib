//
//  TBDataDelegate.h
//  CYHCommonLib
//
//  Created by chenyehong on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "TBSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBDataDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSArray <TBSectionModel*>*sectionModelList;

@end

NS_ASSUME_NONNULL_END
