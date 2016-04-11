//
//  FirstViewController.m
//  UIViewControllerTransition
//
//  Created by Clover on 4/10/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "FirstViewController.h"
#import "ImageCell.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSArray<NSString *> *datas;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionView = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 1.5;
        flowLayout.minimumLineSpacing = 3.0;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.contentInset = UIEdgeInsetsMake(3.0, 3.0, 3.0, 3.0);
        [collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"Cell"];
        [self.view addSubview:collectionView];
        collectionView;
    });
}

- (NSArray<NSString *> *)datas {
    return @[@"http://img.zcool.cn/community/012dde5548bd210000019ae9554313.jpg",
             @"http://img.zcool.cn/community/0175375548bcfd0000019ae977c9a4.jpg",
             @"http://img.zcool.cn/community/0165ae5548bd000000019ae93b6972.jpg",
             @"http://img.zcool.cn/community/01bbdc5548bcfe0000019ae90d36cf.jpg",
             @"http://img.zcool.cn/community/01cd275548bd0a0000019ae96ee9e1.jpg",
             @"http://img.zcool.cn/community/018e855548bd000000019ae997edb8.jpg",
             @"http://img.zcool.cn/community/0118325548bd0d0000019ae9a84140.jpg",
             @"http://img.zcool.cn/community/01e3fa5548bd000000019ae90a09f0.jpg",
             @"http://img.zcool.cn/community/01a3395548bd000000019ae909e872.jpg",
             @"http://img.zcool.cn/community/012dde5548bd210000019ae9554313.jpg",
             @"http://img.zcool.cn/community/0175375548bcfd0000019ae977c9a4.jpg",
             @"http://img.zcool.cn/community/0165ae5548bd000000019ae93b6972.jpg",
             @"http://img.zcool.cn/community/01bbdc5548bcfe0000019ae90d36cf.jpg",
             @"http://img.zcool.cn/community/01cd275548bd0a0000019ae96ee9e1.jpg",
             @"http://img.zcool.cn/community/018e855548bd000000019ae997edb8.jpg",
             @"http://img.zcool.cn/community/0118325548bd0d0000019ae9a84140.jpg",
             @"http://img.zcool.cn/community/01e3fa5548bd000000019ae90a09f0.jpg",
             @"http://img.zcool.cn/community/01a3395548bd000000019ae909e872.jpg"];
}

- (NSString *)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    return self.datas.count > index ? self.datas[index] : nil;
}

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageUrl = [self itemAtIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _currentIndexPath = indexPath;
    NSString *imageUrl = [self itemAtIndexPath:indexPath];
    
    SecondViewController *vc = [SecondViewController new];
    vc.imageUrl = imageUrl;
    self.navigationController.delegate = vc;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (CGRectGetWidth(self.view.bounds) - 12.0) / 3;
    return CGSizeMake(width, width);
}
@end
