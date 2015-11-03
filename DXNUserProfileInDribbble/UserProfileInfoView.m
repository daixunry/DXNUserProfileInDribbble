//
//  UserProfileInfoView.m
//  DXNUserProfileInDribbble
//
//  Created by daixu on 15/10/31.
//  Copyright © 2015年 daixu. All rights reserved.
//

#import "UserProfileInfoView.h"

@interface UserProfileInfoView()
{
    UILabel *_nameLabel;
    
    UILabel *_followingCountLabel;
    UILabel *_followingTipLabel;
    
    UILabel *_commentCountLabel;
    UILabel *_commentTipLabel;
    
    UILabel *_userDiscribeLabel;
    UILabel *_userEmailLabel;
    UILabel *_userPhoneNumberLabel;
    
    UIImageView *_emailImgV;
    UIImageView *_foldImgV;
    UIImageView *_phoneNumberImgV;
    
    UIView *_followContentView;
    UIView *_detailContentView;
    
    CAGradientLayer *_gradientLayer;
}

@property (nonatomic, assign) BOOL isFold;

@end

@implementation UserProfileInfoView

#pragma mark ------------------------init and make constraints

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        [self setBackground];
        [self setSubviews];
        [self setConstraints];
        [self setGesture];
    }
    return self;
}

//设置渐变背景
- (void)setBackground
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(id)[UIColor colorWithRed:0.898 green:0.357 blue:0.251 alpha:1].CGColor,
                             (id)[UIColor colorWithRed:0.894 green:0.180 blue:0.400 alpha:1].CGColor];
    gradientLayer.locations = @[@(.0),@(.5)];
    gradientLayer.frame = self.bounds;
    gradientLayer.opacity = 0.9;
    
    _gradientLayer = gradientLayer;
    self.backgroundColor = [UIColor clearColor];
    [self.layer addSublayer:_gradientLayer];
}

- (void)setSubviews
{
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:18];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.clipsToBounds = YES;

    _followingCountLabel = [[UILabel alloc] init];
    _followingCountLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    _followingCountLabel.textColor = [UIColor whiteColor];

    _followingTipLabel = [[UILabel alloc] init];
    _followingTipLabel.font = [UIFont fontWithName:@"Verdana" size:14];
    _followingTipLabel.textColor = [UIColor whiteColor];
    
    _commentCountLabel = [[UILabel alloc] init];
    _commentCountLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    _commentCountLabel.textColor = [UIColor whiteColor];

    _commentTipLabel = [[UILabel alloc] init];
    _commentTipLabel.font = [UIFont fontWithName:@"Verdana" size:14];
    _commentTipLabel.textColor = [UIColor whiteColor];
    
    _userDiscribeLabel = [[UILabel alloc] init];
    _userDiscribeLabel.font = [UIFont fontWithName:@"Verdana" size:12];
    _userDiscribeLabel.numberOfLines = 4;
    _userDiscribeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _userDiscribeLabel.textColor = [UIColor whiteColor];
    
    _userEmailLabel = [[UILabel alloc] init];
    _userEmailLabel.font = [UIFont fontWithName:@"Verdana" size:13];
    _userEmailLabel.textColor = [UIColor whiteColor];
    
    _userPhoneNumberLabel = [[UILabel alloc] init];
    _userPhoneNumberLabel.font = [UIFont fontWithName:@"Verdana" size:13];
    _userPhoneNumberLabel.textColor = [UIColor whiteColor];
    
    _emailImgV = [[UIImageView alloc] init];
    _emailImgV.image = [UIImage imageNamed:@"email"];
    _emailImgV.contentMode = UIViewContentModeScaleAspectFill;
    
    _foldImgV = [[UIImageView alloc] init];
    _foldImgV.image = [UIImage imageNamed:@"screenup"];
    _foldImgV.contentMode = UIViewContentModeScaleAspectFill;

    _phoneNumberImgV = [[UIImageView alloc] init];
    _phoneNumberImgV.image = [UIImage imageNamed:@"smartphone"];
    _phoneNumberImgV.contentMode = UIViewContentModeScaleAspectFill;
    
    _followContentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 80, self.frame.size.width, 80)];
    _followContentView.backgroundColor = [UIColor clearColor];
    [_followContentView addSubview:_followingCountLabel];
    [_followContentView addSubview:_followingTipLabel];
    [_followContentView addSubview:_commentCountLabel];
    [_followContentView addSubview:_commentTipLabel];
    
    _detailContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 80)];
    _detailContentView.backgroundColor = [UIColor clearColor];
    [_detailContentView addSubview:_nameLabel];
    [_detailContentView addSubview:_userDiscribeLabel];
    [_detailContentView addSubview:_userPhoneNumberLabel];
    [_detailContentView addSubview:_emailImgV];
    [_detailContentView addSubview:_userEmailLabel];
    [_detailContentView addSubview:_foldImgV];
    [_detailContentView addSubview:_phoneNumberImgV];
    
    _userDiscribeLabel.hidden = YES;
    _userPhoneNumberLabel.hidden = YES;
    _userEmailLabel.hidden = YES;
    _emailImgV.hidden = YES;
    _phoneNumberImgV.hidden = YES;
    
    [self addSubview:_followContentView];
    [self addSubview:_detailContentView];
}

- (void)setConstraints
{
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
    }];

    [_foldImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-20);
        make.centerY.mas_equalTo(_nameLabel);
        make.width.mas_equalTo(10.5);
        make.height.mas_equalTo(6);
    }];
    
    [_userDiscribeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.offset(-20);
        make.top.mas_equalTo(_nameLabel.mas_bottom).offset(20);
    }];
    
    [_userEmailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userDiscribeLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(40);
    }];

    [_emailImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userDiscribeLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(16);
    }];
    
    [_userPhoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userEmailLabel.mas_bottom).offset(15);
        make.left.mas_equalTo(40);
    }];
    
    [_phoneNumberImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userEmailLabel.mas_bottom).offset(15);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(16);
    }];
    
    [_followingTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.offset(-20);
    }];
    
    [_followingCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_followingTipLabel);
        make.bottom.mas_equalTo(_followingTipLabel.mas_top).offset(-5);
    }];
    
    [_commentTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(-20);
    }];
    
    [_commentCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_commentTipLabel);
        make.bottom.mas_equalTo(_commentTipLabel.mas_top).offset(-5);
    }];
}

#pragma mark ------------------------setter

- (void)setUser:(UserProfileModel *)user
{
    _user = user;

    _followingTipLabel.text = @"FOLLOWING";
    _commentTipLabel.text = @"COMMENTS";
    _userEmailLabel.text = _user.email;
    _userPhoneNumberLabel.text = _user.telephoneNumber;
    
    NSMutableAttributedString *descStr = [[NSMutableAttributedString alloc] initWithString:_user.userDescriber];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineHeightMultiple = 1.2;
    [descStr addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, _user.userDescriber.length)];
    _userDiscribeLabel.attributedText = [descStr copy];
    
    [self doTextAni];
}

#pragma mark ------------------------gesture

- (void)setGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fold:)];
    [self addGestureRecognizer:tap];
}

#pragma mark ------------------------animations

- (void)fold:(UITapGestureRecognizer *)gesture
{
    //保持视图位于相对屏幕的位置不动
    [self removeViewForConstPosition];
    
    if (self.isFold) {
        [UIView animateWithDuration:.3 animations:^{
            _userDiscribeLabel.alpha = 0;
            _userEmailLabel.alpha = 0;
            _userPhoneNumberLabel.alpha = 0;
            _emailImgV.alpha = 0;
            _phoneNumberImgV.alpha = 0;
            
        } completion:^(BOOL finished) {
            _userDiscribeLabel.hidden = YES;
            _userEmailLabel.hidden = YES;
            _userPhoneNumberLabel.hidden = YES;
            _emailImgV.hidden = YES;
            _phoneNumberImgV.hidden = YES;
            
            [UIView animateWithDuration:.3
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 CGSize screenSize = [UIScreen mainScreen].bounds.size;
                                 self.frame = CGRectMake(10, screenSize.height - 170, screenSize.width - 20, 160);
                                 self.layer.cornerRadius = 5;
                                 _foldImgV.transform = CGAffineTransformIdentity;
                                 CGRect detailFrame = _detailContentView.frame;
                                 detailFrame.origin.y = self.frame.origin.y;
                                 detailFrame.size.height = 80;
                                 _detailContentView.frame = detailFrame;
                             }
                             completion:^(BOOL finished) {
                                 [self resetViewPosition];
                                 self.isFold = !self.isFold;
                             }];
        }];
        
    } else {
    
        self.isFold = !self.isFold;
        [UIView animateWithDuration:.3
                         animations:^{
                             CGSize screenSize = [UIScreen mainScreen].bounds.size;
                             self.frame = CGRectMake(0, screenSize.height - 320, screenSize.width, 320);
                             _gradientLayer.frame = self.bounds;
                             _foldImgV.transform = CGAffineTransformMakeRotation(M_PI);
                             CGRect detailFrame = _detailContentView.frame;
                             detailFrame.origin.y = self.frame.origin.y;
                             detailFrame.size.height = self.frame.size.height - 90;
                             _detailContentView.frame = detailFrame;
                         }
                         completion:^(BOOL finished) {
                             [self resetViewPosition];
                             [self doDescAni];
                             self.layer.cornerRadius = 0;
                         }];
    }
    
    
}

//保持视图位于相对屏幕的位置不动
- (void)removeViewForConstPosition
{
    [self changeView:_followContentView to:[UIApplication sharedApplication].keyWindow from:self];
    [self changeView:_detailContentView to:[UIApplication sharedApplication].keyWindow from:self];
}

- (void)changeView:(UIView *)v to:(UIView *)toV from:(UIView *)fromV
{
    CGRect frame = [fromV convertRect:v.frame toView:toV];
    [v removeFromSuperview];
    v.frame = frame;
    [toV addSubview:v];
}

//恢复视图原来的位置
- (void)resetViewPosition
{
    [self changeView:_followContentView to:self from:[UIApplication sharedApplication].keyWindow];
    [self changeView:_detailContentView to:self from:[UIApplication sharedApplication].keyWindow];
}

//描述文本动画
- (void)doDescAni
{
    _userDiscribeLabel.alpha = 0;
    _userEmailLabel.alpha = 0;
    _userPhoneNumberLabel.alpha = 0;
    _emailImgV.alpha = 0;
    _phoneNumberImgV.alpha = 0;
    
    _userDiscribeLabel.frame = CGRectOffset(_userDiscribeLabel.frame, 0, 40);
    _userEmailLabel.frame = CGRectOffset(_userEmailLabel.frame, 0, 40);
    _userPhoneNumberLabel.frame = CGRectOffset(_userPhoneNumberLabel.frame, 0, 40);
    _emailImgV.frame = CGRectOffset(_emailImgV.frame, 0, 40);
    _phoneNumberImgV.frame = CGRectOffset(_phoneNumberImgV.frame, 0, 40);
    
    _userDiscribeLabel.hidden = NO;
    _userEmailLabel.hidden = NO;
    _userPhoneNumberLabel.hidden = NO;
    _emailImgV.hidden = NO;
    _phoneNumberImgV.hidden = NO;
    
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        _userDiscribeLabel.frame = CGRectOffset(_userDiscribeLabel.frame, 0, -40);
        _userEmailLabel.frame = CGRectOffset(_userEmailLabel.frame, 0, -40);
        _userPhoneNumberLabel.frame = CGRectOffset(_userPhoneNumberLabel.frame, 0, -40);
        _emailImgV.frame = CGRectOffset(_emailImgV.frame, 0, -40);
        _phoneNumberImgV.frame = CGRectOffset(_phoneNumberImgV.frame, 0, -40);
        
        _userDiscribeLabel.alpha = 1;
        _userEmailLabel.alpha = 1;
        _userPhoneNumberLabel.alpha = 1;
        _emailImgV.alpha = 1;
        _phoneNumberImgV.alpha = 1;
        
    } completion:nil];
}

//text切换效果
- (void)doTextAni
{
    _followingCountLabel.text = [NSString stringWithFormat:@"%zd",_user.followingCount];
    _commentCountLabel.text = [NSString stringWithFormat:@"%zd",_user.commentsCount];
    NSString *name = [NSString stringWithFormat:@"%@ %@",_user.userFirstName,_user.userSecondName];
    _nameLabel.text = name;

    CATransition *pageUpTrasition = [[CATransition alloc] init];
    pageUpTrasition.type = kCATransitionPush;
    pageUpTrasition.subtype = kCATransitionFromBottom;
    [_followingCountLabel.layer addAnimation:pageUpTrasition forKey:@"pageUpAnimation"];
    [_commentCountLabel.layer addAnimation:pageUpTrasition forKey:@"pageUpAnimation"];
    
    CATransition *fadeTrasition = [[CATransition alloc] init];
    fadeTrasition.type = kCATransitionMoveIn;
    fadeTrasition.subtype = kCATransitionFromLeft;
    [_nameLabel.layer addAnimation:fadeTrasition forKey:@"pageUpAnimation"];
}

@end
