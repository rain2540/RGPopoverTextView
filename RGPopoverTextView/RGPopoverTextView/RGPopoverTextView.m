//
//  RGPopoverTextView.m
//  RGPopoverTextView
//
//  Created by Rain on 2018/8/23.
//  Copyright © 2018年 Rain. All rights reserved.
//

#import "RGPopoverTextView.h"

@interface RGPopoverTextView ()

@property (strong, nonatomic) UILabel *titleView;
@property (strong, nonatomic) UIControl *overlayView;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UIButton *cancelButton;

@end

@implementation RGPopoverTextView

#pragma mark Initializer
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (void)defaultInit {
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 1.0;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleView.font = [UIFont systemFontOfSize:19.0f];
    self.titleView.backgroundColor = [UIColor whiteColor];
    self.titleView.textAlignment = NSTextAlignmentCenter;
    self.titleView.textColor = [UIColor blueColor];
    CGFloat xWidth = self.bounds.size.width;
    CGFloat yHeight = self.bounds.size.height;
    self.titleView.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titleView.frame = CGRectMake(0, 0, xWidth, 57.0f);
    [self addSubview:self.titleView];
    
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 56, self.bounds.size.width, 1.0);
    line.backgroundColor = [UIColor colorWithRed:238 / 255.0 green:238 / 255.0 blue:242 / 255.0 alpha:1.0];
    [self addSubview:line];
    
    self.cancelButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(58.0, yHeight - 75.0, xWidth - 58.0 * 2, 50.0);
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self addSubview:self.cancelButton];
    
    CGRect textViewFrame = CGRectMake(10.0, 57.0f, xWidth - 20.0, yHeight - 57.0f - 75.0 - 8.0);
    self.textView = [[UITextView alloc] initWithFrame:textViewFrame];
    self.textView.editable = NO;
    self.textView.textColor = [UIColor blackColor];
    [self addSubview:self.textView];
    
    self.overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
    [self.overlayView addTarget:self
                         action:@selector(dismiss)
               forControlEvents:UIControlEventTouchUpInside];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleView.text = title;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    _titleView.textColor = titleColor;
}

- (void)setText:(NSString *)text {
    _text = text;
    _textView.text = text;
}

- (void)setAttributeText:(NSAttributedString *)attributeText {
    _attributeText = attributeText;
    _textView.attributedText = attributeText;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _textView.textColor = textColor;
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    _textView.font = textFont;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [_cancelButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setButtonBackgroundColor:(UIColor *)buttonBackgroundColor {
    _buttonBackgroundColor = buttonBackgroundColor;
    [_cancelButton setBackgroundColor:buttonBackgroundColor];
}

- (void)setButtonWithRoundCorner:(BOOL)buttonWithRoundCorner {
    _buttonWithRoundCorner = buttonWithRoundCorner;
    if (_buttonWithRoundCorner == YES) {
        _cancelButton.layer.masksToBounds = YES;
        _cancelButton.layer.borderWidth = 1.0;
        _cancelButton.layer.borderColor = self.buttonBackgroundColor.CGColor;
        _cancelButton.layer.cornerRadius = _cancelButton.bounds.size.height / 2;
    }
}

#pragma mark - animations
- (void)fadeIn {
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)fadeOut {
    [UIView animateWithDuration:.35 animations:^{
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}

- (void)show {
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    self.center = CGPointMake(keywindow.bounds.size.width/2.0f,
                              keywindow.bounds.size.height/2.0f);
    [self fadeIn];
}

- (void)dismiss {
    [self fadeOut];
}

#define mark - UITouch
- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{    
    // dismiss self
    [self dismiss];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
