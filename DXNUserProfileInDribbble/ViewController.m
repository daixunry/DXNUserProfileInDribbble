//
//  ViewController.m
//  DXNUserProfileInDribbble
//
//  Created by daixu on 15/10/31.
//  Copyright © 2015年 daixu. All rights reserved.
//

#import "ViewController.h"
#import "UserProfileInfoView.h"
#import "UserProfileNavView.h"
#import "UserProfileModel.h"
#import "UserProfileViewControllerViewModel.h"

@interface ViewController ()<UIScrollViewDelegate,UserProfileNavViewDelegate>
{
    UIScrollView *_scrollView;
    UIView *_contentView;
    UserProfileInfoView *_infoView;
    UserProfileNavView *_navView;
}

@property (nonatomic, strong) UserProfileViewControllerViewModel *viewModel;

@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[UserProfileViewControllerViewModel alloc] init];
    [self perpareSubviews];
    [self setUserProfileViews];
    self.index = 0;
}

#pragma mark ------------------------set views

- (void)perpareSubviews
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.scrollEnabled = NO;
    [self.view addSubview:_scrollView];
    
    _contentView = [[UIView alloc] init];
    [_scrollView addSubview:_contentView];
    
    _infoView = [[UserProfileInfoView alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 170, self.view.frame.size.width - 20, 160)];
    [self.view addSubview:_infoView];
    
    _navView = [[UserProfileNavView alloc] init];
    _navView.viewModel = self.viewModel;
    _navView.delegate = self;
    [self.view addSubview:_navView];
    
    //make constraints
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
    }];
    
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_infoView);
        make.size.mas_equalTo(CGSizeMake(140, 50));
        make.bottom.mas_equalTo(_infoView.mas_top).offset(-10);
    }];
    
    //observer infoView fold state
    [RACObserve(_infoView, isFold) subscribeNext:^(id x) {
        if ([x boolValue]) {
            _navView.hidden = YES;
        } else {
            _navView.hidden = NO;
            _navView.alpha = 0;
            [UIView animateWithDuration:.5 animations:^{
                _navView.alpha = 1;
            }];
        }
    }];
}

- (void)setUserProfileViews
{
    UIImageView *lastImgView;
    for (NSInteger i = 0; i < self.viewModel.users.count; i++) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.clipsToBounds = YES;
        UserProfileModel *userM = self.viewModel.users[i];
        if (userM.userImage) {
            imageV.image = userM.userImage;
        }
        [_contentView addSubview:imageV];
        
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastImgView) {
                make.left.mas_equalTo(lastImgView.mas_right);
            } else {
                make.left.mas_equalTo(0);
            }
            make.top.bottom.mas_equalTo(self.view);
            make.width.mas_equalTo(self.view);
        }];
        
        lastImgView = imageV;
    }
    
    [_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(lastImgView.mas_right);
    }];
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    if (self.viewModel.users.count > 0) {
        _infoView.user = self.viewModel.users[self.index];
        [_scrollView setContentOffset:CGPointMake(_index*_scrollView.frame.size.width, 0) animated:YES];
    }
}

#pragma mark ------------------------UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    if (self.index != index) {
        self.index = index;
    }
}

#pragma mark ------------------------UserProfileNavViewDelegate

- (void)userProfileNavView:(UserProfileNavView *)view goTo:(NSInteger)index
{
    self.index = index;
}

@end
