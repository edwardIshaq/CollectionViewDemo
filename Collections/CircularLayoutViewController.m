//
//  SecondViewController.m
//  Collections
//
//  Created by Edward Ashak on 12/10/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "CircularLayoutViewController.h"
#import "SimpleCell.h"
#import "CircularCollectionViewLayout.h"

@interface CircularLayoutViewController ()

@end

@implementation CircularLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[SimpleCell class] forCellWithReuseIdentifier:@"SIMPLE_CELL_ID"];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    layout.minimumLineSpacing = 20.0;
    layout.itemSize = CGSizeMake(100, 100);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_collectionView release];
    [super dealloc];
}

#pragma mark - UICollectionViewDataSource implementation

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SIMPLE_CELL_ID" forIndexPath:indexPath];
    cell.label = [NSString stringWithFormat:@"%d,%d", indexPath.section, indexPath.row];
    cell.transform = CGAffineTransformMakeRotation(arc4random()%1*M_2_PI);
    return cell;
}


@end
