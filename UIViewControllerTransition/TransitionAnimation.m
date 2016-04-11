//
//  TransitionAnimation.m
//  UIViewControllerTransition
//
//  Created by Clover on 4/10/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "TransitionAnimation.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ImageCell.h"

@interface TransitionAnimation ()

@property (nonatomic, assign) TransitionType type;
@end

@implementation TransitionAnimation

+ (instancetype)transitionWithType:(TransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}
- (instancetype)initWithTransitionType:(TransitionType)type {
    self = [super init];
    if(self) {
        _type = type;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch(_type) {
        case TransitionTypePush:
            [self pushAnimation:transitionContext];
            break;
        case TransitionTypePop:
            [self popAnimation:transitionContext];
            break;
    }
}

- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    FirstViewController *fromVC = (FirstViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    SecondViewController *toVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    ImageCell *cell = (ImageCell *)[fromVC.collectionView cellForItemAtIndexPath:fromVC.currentIndexPath];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *tempView = [cell.imageView snapshotViewAfterScreenUpdates:NO];
    tempView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:containerView];
    
    cell.imageView.hidden = YES;
    
    toVC.view.alpha = 0.0;
    toVC.imageView.hidden = YES;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        
        tempView.frame = [toVC.imageView convertRect:toVC.imageView.bounds toView:containerView];
        toVC.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        tempView.hidden = YES;
        toVC.imageView.hidden = NO;
        
        [transitionContext completeTransition:YES];
    }];
    
    
}

- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    SecondViewController *fromVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FirstViewController *toVC = (FirstViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    ImageCell *cell = (ImageCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.currentIndexPath];
    
    UIView *containerView = [transitionContext containerView];
    UIView *tempView = containerView.subviews.lastObject;
    
    cell.imageView.hidden = YES;
    
    fromVC.imageView.hidden = YES;
    
    tempView.hidden = NO;
    [containerView insertSubview:toVC.view atIndex:0];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        
        tempView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:containerView];
        fromVC.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if([transitionContext transitionWasCancelled]) {
            tempView.hidden = YES;
            fromVC.imageView.hidden = NO;
        }else {
            cell.imageView.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
}
@end
