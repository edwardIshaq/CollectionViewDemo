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
    if (self.numItems) {
        angle = (CGFloat)2*M_PI/self.numItems;
    }
    else{
        angle = 0;
    }
}

- (void)setNumItems:(NSUInteger)numItems {
    _numItems = numItems;
    [self.collectionView reloadData];
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
    CGFloat x,y,alpha;
    UICollectionViewLayoutAttributes *attrs;
    
    for (int i=0; i<self.numItems; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        alpha = i * angle;
        x = floorf(R * cosf(alpha) + center.x);
        y = floorf(R * cosf(M_PI_2-alpha) + center.y);
        attrs.center = CGPointMake(x, y);
        attrs.size = CGSizeMake(100, 100);
        
        if (alpha > 0 && alpha < M_PI_4) {
            attrs.zIndex = i;
        }
        else if (alpha >= M_PI_4 && alpha < M_PI_2){
            attrs.zIndex = i;
        }
        [array addObject:attrs];
    }
    
    NSArray *result = [NSArray arrayWithArray:array];
    [array release];
    return result;
}

@end
