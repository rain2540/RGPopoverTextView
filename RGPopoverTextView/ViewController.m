//
//  ViewController.m
//  RGPopoverTextView
//
//  Created by Rain on 2018/8/23.
//  Copyright © 2018年 Rain. All rights reserved.
//

#import "ViewController.h"
#import "RGPopoverTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)popoverAction:(UIButton *)sender {
    CGRect popViewFrame = CGRectMake(16.0, 100.0, [[UIScreen mainScreen] bounds].size.width - 32.0, [[UIScreen mainScreen] bounds].size.height - 200.0);
    RGPopoverTextView *popView = [[RGPopoverTextView alloc] initWithFrame:popViewFrame];
    popView.title = @"帮助";
    popView.titleColor = [UIColor colorWithRed:48.0 / 255.0 green:76.0 / 255.0 blue:156.0 / 255.0 alpha:1.0];
    
    NSString *htmlString = @"<br>\
    <br><font color = '#444444'>首付比例设定同普通产品，但以车辆开票价及附加品费用合计为基数计算；</font><br>\
    <br><font color = '#444444'>附加品总额不能超过车辆指导价的</font><font color = '#D0021B'>15%</font><font color = '#444444'>；</font><br>\
    <br><font color = '#444444'>贷款额限定为车辆开票价与车辆指导价两者孰低的</font><font color = '#D0021B'>80%</font><font color = '#444444'>；</font><br>\
    <br><font color = '#444444'>购置税不能超</font><font color = '#D0021B'>（车辆开票价 ÷（1+16%）x10%）</font><font color = '#444444'>。</font>";
    popView.attributeText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    popView.textFont = [UIFont systemFontOfSize:16.0];
    popView.buttonTitle = @"CLOSE";
    popView.buttonBackgroundColor = [UIColor colorWithRed:60.0 / 255.0 green:96.0 / 255.0 blue:197.0 / 255.0 alpha:1.0];
    popView.buttonWithRoundCorner = YES;
    [popView show];
}

@end
