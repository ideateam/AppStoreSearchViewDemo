//
//  SearchNavigationBarView.h
//  AppStoreSearchViewDemo
//
//  Created by MacOS on 2018/11/8.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^SearchWasTapChangeStyle)(void);
typedef  void(^ClickCancelChangeStyle)(void);

@interface SearchNavigationBarView : UIView

@property(nonatomic,copy) SearchWasTapChangeStyle tapChange;
@property(nonatomic,copy) ClickCancelChangeStyle clickCancel;
@property(nonatomic,strong)UITextField *searchTextTF;
@property(nonatomic,strong)UIButton *searchContentBTN;

@end

