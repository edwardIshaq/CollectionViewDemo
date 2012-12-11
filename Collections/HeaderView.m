//
//  HeaderView.m
//  Collections
//
//  Created by Edward Ashak on 12/11/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [_label release];
    [super dealloc];
}
@end
