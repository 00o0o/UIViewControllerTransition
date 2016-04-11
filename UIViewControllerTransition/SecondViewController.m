//
//  SecondViewController.m
//  UIViewControllerTransition
//
//  Created by Clover on 4/10/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "SecondViewController.h"
#import <YYWebImage/YYWebImage.h>
#import "TransitionAnimation.h"

@interface SecondViewController ()


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 100.0, 280.0, 280.0)];
        imageView.center = CGPointMake(self.view.center.x, imageView.center.y);
        [imageView yy_setImageWithURL:[NSURL URLWithString:_imageUrl] placeholder:nil];
        [self.view addSubview:imageView];
        imageView;
    });
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    return [TransitionAnimation transitionWithType:(operation == UINavigationControllerOperationPush ? TransitionTypePush : TransitionTypePop)];
}

@end
