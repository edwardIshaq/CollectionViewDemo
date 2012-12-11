//
//  UICollectionViewShelfLayout.m
//  Collections
//
//  Created by Edward Ashak on 12/11/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "UICollectionViewShelfLayout.h"
#import <QuartzCore/QuartzCore.h>

@implementation UICollectionViewShelfLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *array = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
//    NSIndexPath *decorationIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
//    
//    UICollectionViewLayoutAttributes *decorationAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"Shelf" withIndexPath:decorationIndexPath];
//    decorationAttributes.frame = CGRectMake(0.0f,
//                                            0.0f,
//                                            self.collectionViewContentSize.width,
//                                            75);
//    [array addObject:decorationAttributes];

    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size   = self.collectionView.bounds.size;

    for (UICollectionViewLayoutAttributes *attributes in array) {
        if ([attributes representedElementCategory] == UICollectionElementCategoryCell) {
            
            continue;
            
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance / 200;
            CGFloat nAngle = M_PI_4 * normalizedDistance;
            [attributes setTransform3D:CATransform3DMakeRotation(nAngle, 0, 0.1, 0)];
        }
        else if ([attributes representedElementCategory] == UICollectionElementCategoryDecorationView) {
            NSLog(@"%@",attributes);
            /*
             [attributesArray addObject:[self layoutAttributesForDecorationViewOfKind:@"BackgroundView" atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]];

             */
        }
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [super layoutAttributesForItemAtIndexPath:indexPath];
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)decorationViewKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    layoutAttributes.frame = CGRectMake(0.0, 0.0, self.collectionViewContentSize.width, self.collectionViewContentSize.height);
    layoutAttributes.zIndex = -1;
    return layoutAttributes;
}


@end
