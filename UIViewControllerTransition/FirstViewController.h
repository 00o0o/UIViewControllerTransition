//
//  FirstViewController.h
//  UIViewControllerTransition
//
//  Created by Clover on 4/10/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@end
