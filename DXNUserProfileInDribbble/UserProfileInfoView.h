//
//  UserProfileInfoView.h
//  DXNUserProfileInDribbble
//
//  Created by daixu on 15/10/31.
//  Copyright © 2015年 daixu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfileModel.h"

@interface UserProfileInfoView : UIView

@property (nonatomic, assign, readonly) BOOL isFold;

@property (nonatomic, strong) UserProfileModel *user;

@end
