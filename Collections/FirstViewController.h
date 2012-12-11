//
//  FirstViewController.h
//  Collections
//
//  Created by Edward Ashak on 12/10/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;

@end
