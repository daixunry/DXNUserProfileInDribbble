//
//  UserProfileNavView.h
//  DXNUserProfileInDribbble
//
//  Created by daixu on 15/10/31.
//  Copyright © 2015年 daixu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfileViewControllerViewModel.h"

@class UserProfileNavView;
@protocol UserProfileNavViewDelegate <NSObject>

- (void)userProfileNavView:(UserProfileNavView *)view goTo:(NSInteger)index;

@end

@interface UserProfileNavView : UIView

@property (nonatomic, assign, readonly) NSInteger index;

@property (nonatomic, weak)UserProfileViewControllerViewModel *viewModel;

@property (nonatomic, weak)id<UserProfileNavViewDelegate> delegate;

@end
