//
//  SimpleCell.m
//  Collections
//
//  Created by Edward Ashak on 12/10/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "SimpleCell.h"

@implementation SimpleCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        bg.backgroundColor = [self randomColor];
        
        UIView *selectedBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        selectedBg.backgroundColor = [UIColor yellowColor];
        
        self.backgroundView = bg;
        [bg release];
        self.selectedBackgroundView = selectedBg;
        [selectedBg release];
        
        indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
        [self.contentView addSubview:indexLabel];
    }
    return self;
}

- (void)setLabel:(NSString *)label {
    indexLabel.frame = CGRectMake(0, 0, self.frame.size.width, 20);
    indexLabel.text = label;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (UIColor*)randomColor {
    return [UIColor colorWithRed:arc4random()%256/255. green:arc4random()%256/255. blue:arc4random()%256/255. alpha:1];
}
@end
