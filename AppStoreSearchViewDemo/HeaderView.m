//
//  HeaderView.m
//  AppStoreSearchViewDemo
//
//  Created by MacOS on 2019/2/20.
//  Copyright © 2019 MacOS. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    SearchNavigationBarView *searchView = [[SearchNavigationBarView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:searchView];
    
    self.searchView = searchView;
}

@end
