//
//  SecondViewController.h
//  Collections
//
//  Created by Edward Ashak on 12/10/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CircularCollectionViewLayout;

@interface CircularLayoutViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;
@property (retain, nonatomic) IBOutlet CircularCollectionViewLayout *circularLayout;
- (IBAction)numItemsChanged:(id)sender;
@property (retain, nonatomic) IBOutlet UISlider *slider;

@end
