//
//  CircularCollectionViewLayout.m
//  Collections
//
//  Created by Edward Ashak on 12/17/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "CircularCollectionViewLayout.h"

@implementation CircularCollectionViewLayout

- (void)prepareLayout {
    //calculate the degree increment
    //360 / items_count
}

- (CGSize)collectionViewContentSize {
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat minDim      = fminf(screen.size.width, screen.size.height);
    CGSize contentSize  = CGSizeMake(minDim, minDim);
    
    return contentSize;
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return nil;
}
@end
