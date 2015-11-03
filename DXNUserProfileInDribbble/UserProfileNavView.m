//
//  UserProfileNavView.m
//  DXNUserProfileInDribbble
//
//  Created by daixu on 15/10/31.
//  Copyright © 2015年 daixu. All rights reserved.
//

#import "UserProfileNavView.h"

@interface UserProfileNavView()

@property (nonatomic, assign) NSInteger index;

@end


@implementation UserProfileNavView
{
    UIButton *_preBtn;
    UIButton *_nextBtn;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setSubviews];
        [self setConstraints];
        [self setActions];
        self.index = 0;
    }
    return self;
}

- (void)setSubviews
{
    _preBtn = [[UIButton alloc] init];
    [_preBtn setBackgroundImage:[UIImage imageNamed:@"backImg"] forState:UIControlStateNormal];
    
    _nextBtn = [[UIButton alloc] init];
    _nextBtn.transform = CGAffineTransformMakeRotation(M_PI);
    [_nextBtn setBackgroundImage:[UIImage imageNamed:@"backImg"] forState:UIControlStateNormal];
    
    [self addSubview:_preBtn];
    [self addSubview:_nextBtn];
}

- (void)setConstraints
{
    [_preBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_centerX).offset(-47);
        make.width.height.mas_equalTo(42);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_preBtn.mas_right).offset(10);
        make.width.height.mas_equalTo(_preBtn);
        make.centerY.mas_equalTo(self);
    }];
}

- (void)setActions
{
    @weakify(self)
    
    _preBtn.rac_command = [[RACCommand alloc] initWithEnabled:RACObserve(self, index) signalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self)
            self.index -= 1;
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    RACSignal *nextBtnEnableSignal = [RACObserve(self, index) map:^id(id value) {
        @strongify(self)
        if ([value integerValue] == (self.viewModel.users.count - 1) || self.viewModel.users.count == 1) {
            return @(0);
        }
        return @(1);
    }];
    
    _nextBtn.rac_command = [[RACCommand alloc] initWithEnabled:nextBtnEnableSignal signalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self)
            self.index += 1;
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    
    if (self.delegate) {
        [self.delegate userProfileNavView:self goTo:_index];
    }
}

@end
