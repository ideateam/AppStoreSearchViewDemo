//
//  SearchNavigationBarView.m
//  AppStoreSearchViewDemo
//
//  Created by MacOS on 2018/11/8.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "SearchNavigationBarView.h"
#import "defineArgue.h"

@interface SearchNavigationBarView ()<UITextFieldDelegate>

@end

@implementation SearchNavigationBarView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height - 20, self.frame.size.height - 20)];
    leftImageView.image = [UIImage imageNamed:@""];
    
    UITextField *searchTextTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, self.frame.size.width - 30, self.frame.size.height - 25)];
    [self addSubview:searchTextTF];
    
    self.searchTextTF = searchTextTF;
    searchTextTF.delegate = self;
    searchTextTF.placeholder = @"App Store";
    searchTextTF.textColor = [UIColor blueColor];
    searchTextTF.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    searchTextTF.leftViewMode = UITextFieldViewModeAlways;
    searchTextTF.leftView = leftImageView;
    
    searchTextTF.layer.masksToBounds = YES;
    searchTextTF.layer.cornerRadius = 8;
    
    UIButton *searchContentBTN = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, 0, 60, 40)];
    [self addSubview:searchContentBTN];
    self.searchContentBTN = searchContentBTN;
    
    [searchContentBTN setTitle:@"取消" forState:UIControlStateNormal];
    [searchContentBTN setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    searchContentBTN.titleLabel.font = [UIFont systemFontOfSize:14];
    searchContentBTN.hidden = YES;
    
    [searchContentBTN addTarget:self action:@selector(clcikCancel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.tapChange) {
        self.tapChange();
    }
}

- (void)clcikCancel{
    if (self.clickCancel) {
        self.clickCancel();
    }
}

@end
