//
//  UserProfileViewControllerViewModel.m
//  DXNUserProfileInDribbble
//
//  Created by daixu on 15/10/31.
//  Copyright © 2015年 daixu. All rights reserved.
//

#import "UserProfileViewControllerViewModel.h"
#import "UserProfileModel.h"

@interface UserProfileViewControllerViewModel()

@property (nonatomic, strong) NSArray *users;

@end

@implementation UserProfileViewControllerViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createTestData];
    }
    return self;
}

//创建测试数据
- (void)createTestData
{
    UserProfileModel *user = [[UserProfileModel alloc] init];
    user.userFirstName = @"JURI";
    user.userSecondName = @"UENO";
    user.email = @"juriueno@test.com";
    user.telephoneNumber = @"123456789";
    user.userDescriber = @"上野树里（うえの じゅり），1986年5月25日出生于日本兵库县加古川市，女演员，毕业于日出高等学校,眉宇中的英气、眼神中的坚定、言谈举止中透露出的率真，上野树里绝对不是“大和抚子（清雅美态的日本女性）”式的日本美女。但就是她在同期新人中的唯一性，让她脱颖而出。";
    user.followingCount = 789;
    user.commentsCount = 500;
    user.userImage = [UIImage imageNamed:@"sysl.jpg"];
    
    UserProfileModel *user2 = [[UserProfileModel alloc] init];
    user2.userFirstName = @"SONG";
    user2.userSecondName = @"JIA";
    user2.email = @"songjia@test.com";
    user2.telephoneNumber = @"T123456789";
    user2.userDescriber = @"宋佳，1980年11月13日出生于黑龙江省哈尔滨市南岗区，毕业于上海戏剧学院表演系，中国女演员，因有同名的前辈女演员宋佳，故多被媒体称为“小宋佳”。2006年出演电影《好奇害死猫》开始崭露头角，并因此获第26届中国电影金鸡奖最佳女配角提名；2012年，出演都市励志剧《那样芬芳》，饰演荣芬芳。";
    user2.followingCount = 873;
    user2.commentsCount = 223;
    user2.userImage = [UIImage imageNamed:@"songjia2.jpeg"];
    
    UserProfileModel *user3 = [[UserProfileModel alloc] init];
    user3.userFirstName = @"SCARLETT";
    user3.userSecondName = @"JOHANSSON";
    user3.email = @"Johansson@test.com";
    user3.telephoneNumber = @"T123456789";
    user3.userDescriber = @"斯佳丽·约翰逊已经成为新一代的翘楚。1984年出生于纽约的她，小的时候就是童星。现在青春正好的女星中，斯嘉丽。身材玲珑有致可与玛丽莲梦露相媲美，她既前卫又复古，有老派好莱坞女星的style，同时散发出新生代的自信气质，兼具古典与现代美。她具有诱人犯罪的性感。她出演过《迷失东京》，《保姆日记》，《另一个波琳家的女孩》与《苏格兰玛丽女王》，动作片《亚马逊》以及爱情片《拿破仑与贝琪》。";
    user3.followingCount = 556;
    user3.commentsCount = 765;
    user3.userImage = [UIImage imageNamed:@"sjl.jpeg"];
    
    
    self.users = [NSArray arrayWithObjects:user, user2, user3, nil];
}

@end
