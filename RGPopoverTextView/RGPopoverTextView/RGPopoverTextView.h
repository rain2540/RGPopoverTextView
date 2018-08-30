//
//  RGPopoverTextView.h
//  RGPopoverTextView
//
//  Created by Rain on 2018/8/23.
//  Copyright © 2018年 Rain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGPopoverTextView : UIView

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UIColor *titleColor;
@property (copy, nonatomic) NSString *text;
@property (copy, nonatomic) NSAttributedString *attributeText;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIFont *textFont;
@property (copy, nonatomic) NSString *buttonTitle;
@property (strong, nonatomic) UIColor *buttonBackgroundColor;
@property (assign, nonatomic) BOOL buttonWithRoundCorner;

- (void)show;
- (void)dismiss;

@end
