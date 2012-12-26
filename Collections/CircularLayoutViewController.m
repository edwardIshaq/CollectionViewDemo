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
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.circularLayout = (CircularCollectionViewLayout*)self.collectionView.collectionViewLayout;
    [self.collectionView registerClass:[SimpleCell class] forCellWithReuseIdentifier:@"SIMPLE_CELL_ID"];
    self.circularLayout.numItems = [self numItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_collectionView release];
    [_slider release];
    [super dealloc];
}

#pragma mark - UICollectionViewDataSource implementation

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self numItems];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SIMPLE_CELL_ID" forIndexPath:indexPath];
    cell.label = [NSString stringWithFormat:@"%d,%d", indexPath.section, indexPath.row];
    return cell;
}


- (IBAction)numItemsChanged:(id)sender {
    self.circularLayout.numItems = [self numItems];
//    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (NSInteger)numItems {
    NSInteger num = floorf(self.slider.value);
    return num;
}
@end
