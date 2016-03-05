//
//  CMLAccountingItemCell.h
//  Camille
//
//  Created by 杨淳引 on 16/2/23.
//  Copyright © 2016年 shayneyeorg. All rights reserved.
//

#define kCellBackgroundColor kAppViewColor

#import <UIKit/UIKit.h>

@class CMLAccountingItemCell;

@protocol CMLAccountingItemCellDelegate <NSObject>

- (void)accountingItemCellDidTapExpandArea:(CMLAccountingItemCell *)accountingItemCell;

@end

@interface CMLAccountingItemCell : UITableViewCell

@property (nonatomic, weak) id <CMLAccountingItemCellDelegate> delegate;

+ (instancetype)loadFromNib;
+ (CGFloat)heightForCellByExpand:(BOOL)isExpand;
- (void)refreshWithCatogoryModels:(NSArray *)categoryModels itemsDic:(NSDictionary *)itemsDic isExpand:(BOOL)isExpand;

@end
