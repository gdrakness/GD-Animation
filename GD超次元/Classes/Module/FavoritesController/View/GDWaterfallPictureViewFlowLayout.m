//
//  GDWaterfallPictureViewFlowLayout.m
//  GD超次元
//
//  Created by gdarkness on 16/8/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDWaterfallPictureViewFlowLayout.h"

@implementation GDWaterfallPictureViewFlowLayout
{
    //存放每个item高度
    NSMutableArray *columnNumberArray;
    //存放布局属性
    NSMutableArray *attributedArray;
}

-(void)prepareLayout{
    [super prepareLayout];
    columnNumberArray = [NSMutableArray arrayWithCapacity:_columnNumber];
    attributedArray = [NSMutableArray arrayWithCapacity:_columnNumber];
    for (int i = 0; i < _columnNumber; i++) {
        columnNumberArray[i] = @(_edgIndsets.top);
    }
    CGFloat totalWidth = CGRectGetWidth(self.collectionView.frame);
    CGFloat totalItemWidth = totalWidth - _edgIndsets.left - _edgIndsets.right - _padding * (_columnNumber - 1);
    CGFloat itemWidth = totalItemWidth / _columnNumber;
    NSInteger itemNumber = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < itemNumber; i++) {
        CGFloat itemHeight = arc4random_uniform(15) + 120;
        NSInteger currentColumn = [self minYColumn];
        CGFloat itemX = _edgIndsets.left + currentColumn * (itemWidth + _padding);
        CGFloat itemY = [columnNumberArray[currentColumn] floatValue];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        if (_delegate && [_delegate respondsToSelector:@selector(WaterfallPictureViewHeightForItemAtIndex:)]) {
//            itemHeight = [_delegate WaterfallPictureViewHeightForItemAtIndex:indexPath];
//        }
        CGRect frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = frame;
        [attributedArray addObject:attributes];
            CGFloat newY = itemY + itemHeight + _padding + 8;
            columnNumberArray[currentColumn] = @(newY);
            newY = 0.0;
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attributes in attributedArray) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [resultArray addObject:attributes];
        }
    }
    return resultArray;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return attributedArray[indexPath.item];
}

-(CGSize)collectionViewContentSize{
    CGFloat width = CGRectGetWidth(self.collectionView.frame);
    NSInteger index = [self maxYColumn];
    CGFloat height = [columnNumberArray[index] floatValue];
    return CGSizeMake(width, height);
}

-(NSInteger)maxYColumn{
    __block CGFloat maxHeight = 0.0;
    __block NSInteger maxColumn = 0;
    [columnNumberArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat heightInArray = [columnNumberArray[idx] floatValue];
        if (heightInArray > maxHeight) {
            maxHeight = heightInArray;
            maxColumn = idx;
        }
    }];
    return maxColumn;
}

-(NSInteger)minYColumn{
    __block CGFloat minHeight = MAXFLOAT;
    __block NSInteger minColumn = 0;
    [columnNumberArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat height = [columnNumberArray[idx] floatValue];
        if (height < minHeight) {
            minHeight = height;
            minColumn = idx;
        }
    }];
    return minColumn;
}

-(void)setCloumnNumber:(NSInteger)columnNumber{
    if (_columnNumber != columnNumber) {
        columnNumber = columnNumber;
    }
    [self invalidateLayout];
}

-(void)setPadding:(CGFloat)padding{
    if (_padding != padding) {
        _padding = padding;
    }
    [self invalidateLayout];
}

-(void)setEdgIndsets:(UIEdgeInsets)edgIndsets{
    if (!UIEdgeInsetsEqualToEdgeInsets(_edgIndsets, edgIndsets)) {
        _edgIndsets = edgIndsets;
    }
    [self invalidateLayout];
}
@end
