//
//  CircularCollectionViewLayout.m
//  Collections
//
//  Created by Edward Ashak on 12/17/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "CircularCollectionViewLayout.h"

@implementation CircularCollectionViewLayout
//@synthesize numItems = _numItems;

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _numItems = 0;
    }
    return self;
}
- (void)prepareLayout {
    [super prepareLayout];
    //calculate the degree increment
    //360 / items_count
}

- (void)setNumItems:(NSUInteger)numItems {
    _numItems = numItems;
    [self invalidateLayout];
}

- (CGSize)collectionViewContentSize {
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat minDim      = fminf(screen.size.width, screen.size.height);
    CGSize contentSize  = CGSizeMake(minDim, minDim);
    
    return contentSize;
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    if (self.numItems == 0) {
        return nil;
    }
    
    CGRect screen   = [[UIScreen mainScreen] bounds];
    CGFloat R  = fminf(screen.size.width, screen.size.height)/2.0;
    CGPoint center = CGPointMake(R, R);
    R -= 100;   //Shrink the radius so that the item bounds are in the view
    
    NSMutableArray *array = [NSMutableArray new];
    CGFloat x,y,alpha,angle;
    angle = (CGFloat)2*M_PI/self.numItems;
    

    for (int i=0; i<self.numItems; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath] retain];
        alpha = i * angle;
        x = R * cosf(alpha) + center.x;
        y = R * cosf(M_PI_2-alpha) + center.y;
        attrs.center = CGPointMake(x, y);
        attrs.size = CGSizeMake(100, 100);
        if (alpha > 0 && alpha < M_PI_4) {
            attrs.zIndex = i;
        }
        else if (alpha >= M_PI_4 && alpha < M_PI_2){
            attrs.zIndex = i;
        }
        [array addObject:attrs];
        [attrs release];
    }
    
    NSArray *result = [NSArray arrayWithArray:array];
    [array release];
    return result;
}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CGRect screen   = [[UIScreen mainScreen] bounds];
//    CGFloat R  = fminf(screen.size.width, screen.size.height)/2.0;
//    CGPoint center = CGPointMake(R, R);
//    R -= 100;   //Shrink the radius so that the item bounds are in the view
//    
//    CGFloat x,y,alpha,angle;
//    angle = (CGFloat)2*M_PI/self.numItems;
//
//    UICollectionViewLayoutAttributes *attrs = [[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath] retain];
//    alpha = indexPath.row * angle;
//    x = R * cosf(alpha) + center.x;
//    y = R * cosf(M_PI_2-alpha) + center.y;
//    attrs.center = CGPointMake(x, y);
//    attrs.size = CGSizeMake(100, 100);
//    if (alpha > 0 && alpha < M_PI_4) {
//        attrs.zIndex = indexPath.row;
//    }
//    else if (alpha >= M_PI_4 && alpha < M_PI_2){
//        attrs.zIndex = indexPath.row;
//    }
//
//    return attrs;
//}

@end
