//
//  SecondViewController.h
//  UIViewControllerTransition
//
//  Created by Clover on 4/10/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UINavigationControllerDelegate>

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, strong) UIImageView *imageView;
@end
