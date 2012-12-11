//
//  FirstViewController.m
//  Collections
//
//  Created by Edward Ashak on 12/10/12.
//  Copyright (c) 2012 EdwardIshaq. All rights reserved.
//

#import "FirstViewController.h"
#import "SimpleCell.h"
#import "HeaderView.h"
@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[SimpleCell class] forCellWithReuseIdentifier:@"SIMPLE_CELL_ID"];
    [self.collectionView registerClass:[UILabel class] forSupplementaryViewOfKind:@"header" withReuseIdentifier:@"SIMPLE_COLLECTION_HEADER"];
    
    UINib *headerNib = [UINib nibWithNibName:@"HeaderView" bundle:nil];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER_ID"];
    UINib *footerNib = [UINib nibWithNibName:@"FooterView" bundle:nil];
    [self.collectionView registerNib:footerNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FOOTER_ID"];

    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    layout.minimumLineSpacing = 20.0;
    layout.itemSize = CGSizeMake(100, 100);
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 40, 20);
    layout.headerReferenceSize = CGSizeMake(500, 65);
    layout.footerReferenceSize = CGSizeMake(500, 75);
    
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
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = CGSizeMake(50, 50);
    CGFloat xOffset = arc4random()%50;
    CGFloat yOffset = arc4random()%50;
    itemSize.width += xOffset;
    itemSize.height += yOffset;
    
    return itemSize;
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
