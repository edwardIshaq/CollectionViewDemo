//
//  FirstViewController.m
//  Collections
//
//  Created by Edward Ashak on 12/10/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "FlowLayoutExample.h"
#import "SimpleCell.h"
#import "HeaderView.h"

@interface FlowLayoutExample ()

@end

@implementation FlowLayoutExample


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    //register cell
    [self.collectionView registerClass:[SimpleCell class] forCellWithReuseIdentifier:@"SIMPLE_CELL_ID"];

    //register header
    UINib *headerNib = [UINib nibWithNibName:@"HeaderView" bundle:nil];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER_ID"];
    
    //register footer
    UINib *footerNib = [UINib nibWithNibName:@"FooterView" bundle:nil];
    [self.collectionView registerNib:footerNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FOOTER_ID"];
    
    //adjust layout
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    layout.minimumLineSpacing = 20.0;
    layout.itemSize = CGSizeMake(100, 100);
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 40, 20);
    layout.headerReferenceSize = CGSizeMake(50, 65);
    layout.footerReferenceSize = CGSizeMake(50, 75);
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
    return 23;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SIMPLE_CELL_ID" forIndexPath:indexPath];
    cell.label = [NSString stringWithFormat:@"%d,%d", indexPath.section, indexPath.row];
//    cell.transform = CGAffineTransformMakeRotation(arc4random()%1*M_2_PI);
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(50 + arc4random()%50, 50 + arc4random()%50);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HEADER_ID" forIndexPath:indexPath];
        header.label.text = [NSString stringWithFormat:@"Header for section: %d", indexPath.section];
        
        return header;
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FOOTER_ID" forIndexPath:indexPath];
        return footer;
    }
    return nil;
}


@end
