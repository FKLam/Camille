//
//  CMLTransitionManager.m
//  Camille
//
//  Created by 杨淳引 on 2017/1/23.
//  Copyright © 2017年 shayneyeorg. All rights reserved.
//

#import "CMLTransitionManager.h"
#import "UIViewController+CMLTransition.h"
#import "CMLTransitionManager+BreakAnimation.h"
#import "CMLTransitionManager+BacklashThenPushAnimation.h"
#import "CMLTransitionManager+BoomAnimation.h"

@implementation CMLTransitionManager

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return _transitionTime;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *viewControllerToPresent = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [self transitionAnimation:transitionContext transitionAnimationType:viewControllerToPresent.transitionAnimationType transitionType:_transitionType];
}

- (void)transitionAnimation:(id <UIViewControllerContextTransitioning>)transitionContext transitionAnimationType:(CMLTransitionAnimationType)animationType transitionType:(CMLTransitionType)transitionType {
    switch (animationType) {
        case CMLTransitionAnimationBreak:
            [self breakTransitionWithContext:transitionContext transitionType:transitionType];
            break;
            
        case CMLTransitionAnimationBoom:
            [self boomTransitionWithContext:transitionContext transitionType:transitionType];
            break;
            
        case CMLTransitionAnimationBacklashThenPush:
        default:
            [self backlashThenPushTransitionWithContext:transitionContext transitionType:transitionType];
            break;
    }
}

- (void)breakTransitionWithContext:(id <UIViewControllerContextTransitioning>)transitionContext transitionType:(CMLTransitionType)transitionType {
    switch (transitionType) {
        case CMLTransitionOpen:
            [self breakOpenWithTransitionContext:transitionContext];
            break;
            
        case CMLTransitionClose:
            [self breakCloseWithTransitionContext:transitionContext];
            break;
            
        default:
            break;
    }
}

- (void)backlashThenPushTransitionWithContext:(id <UIViewControllerContextTransitioning>)transitionContext transitionType:(CMLTransitionType)transitionType {
    switch (transitionType) {
        case CMLTransitionOpen:
            [self backlashThenPushWithContext:transitionContext];
            break;
            
        case CMLTransitionClose:
            [self backlashThenPopWithContext:transitionContext];
            break;
            
        default:
            break;
    }
}

- (void)boomTransitionWithContext:(id <UIViewControllerContextTransitioning>)transitionContext transitionType:(CMLTransitionType)transitionType {
    switch (transitionType) {
        case CMLTransitionOpen:
            [self boomOpenWithContext:transitionContext];
            break;
            
        case CMLTransitionClose:
            [self boomCloseWithContext:transitionContext];
            break;
            
        default:
            break;
    }
}

@end
