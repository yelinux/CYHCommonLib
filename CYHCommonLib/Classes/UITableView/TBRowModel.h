//
//  TBRowModel.h
//  boti
//
//  Created by 吉川首寺v2 on 2020/5/9.
//  Copyright © 2020 创途. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UITableViewCell* _Nonnull (^TBRowModelBlock)(UITableView *tableView, NSIndexPath *indexPath);

@interface TBRowModel : NSObject

@property(copy, nonatomic) TBRowModelBlock cellForRow;

@property (nonatomic) CGFloat rowHeight;             // default is UITableViewAutomaticDimension
@property (nonatomic) CGFloat estimatedRowHeight;

+(instancetype)createWithBlock: (TBRowModelBlock)cellForRow estimatedRowHeight: (CGFloat)estimatedRowHeight;
+(instancetype)createWithBlock: (TBRowModelBlock)cellForRow rowHeight: (CGFloat)rowHeight;

@end

NS_ASSUME_NONNULL_END
