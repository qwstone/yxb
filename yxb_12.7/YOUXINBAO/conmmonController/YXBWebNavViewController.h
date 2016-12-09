//
//  YXBWebNavViewController.h
//  YOUXINBAO
//
//  Created by zjp on 15/5/21.
//  Copyright (c) 2015年 北京全彩时代网络科技有限公司. All rights reserved.
//

#import "QCBaseViewController.h"
#import "KVNProgress.h"
    #import "YXBLoanCenterViewController.h"

@interface YXBWebNavViewController : QCBaseViewController

@property(nonatomic,copy)NSString *titleName;
- (id)initWithURL:(NSString *)url;
@property(nonatomic,strong)UIActivityIndicatorView   *activity;
@property(nonatomic,strong)UIWebView *webView;
@property (nonatomic, copy) NSString *urlStr;
@end
