//
//  TransitionAnimation.h
//  UIViewControllerTransition
//
//  Created by Clover on 4/10/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TransitionType) {
    TransitionTypePush = 0,
    TransitionTypePop
};

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithType:(TransitionType)type;
- (instancetype)initWithTransitionType:(TransitionType)type;
@end
