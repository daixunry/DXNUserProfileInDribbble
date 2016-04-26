//
//  UserProfileModel.h
//  DXNUserProfileInDribbble
//
//  Created by daixu on 15/10/31.
//  Copyright © 2015年 daixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserProfileModel : NSObject

@property (nonatomic, strong) UIImage *userImage;

@property (nonatomic, copy) NSString *userFirstName;

@property (nonatomic, copy) NSString *userSecondName;

//email
@property (nonatomic, copy) NSString *email;

//电话
@property (nonatomic, copy) NSString *telephoneNumber;

//用户描述
@property (nonatomic, copy) NSString *userDescriber;

@property (nonatomic, assign) NSInteger followingCount;

@property (nonatomic, assign) NSInteger commentsCount;

@end
