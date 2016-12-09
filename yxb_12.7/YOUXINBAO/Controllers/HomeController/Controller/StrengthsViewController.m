//
//  StrengthsViewController.m
//  YOUXINBAO
//
//  Created by 密码是111 on 16/9/26.
//  Copyright © 2016年 北京全彩时代网络科技有限公司. All rights reserved.
//

#import "StrengthsViewController.h"
#import "HomeCtrMidView.h"
@implementation StrengthsViewController


-(void)dealloc{
    NSLog(@"LoanCenterViewController1 is dealloc");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = rgb(238, 236, 246, 1.0);
    [self setTitle:@"五项安全保障"];
    [self addwebView];
    
}
-(void)addwebView{
    NSString*url;
     if(_flagNumber==1000){
        url=@"http://www.51jt.com/webView/single/advantage-list.jsp#e1";
    }

    else if(_flagNumber==1001){
        url=@"http://www.51jt.com/webView/single/advantage-list.jsp#e2";
    }
    else if(_flagNumber==1002){
        url=@"http://www.51jt.com/webView/single/advantage-list.jsp#e3";
    }
    else if(_flagNumber==1003){
        url=@"http://www.51jt.com/webView/single/advantage-list.jsp#e4";
    }
    else if(_flagNumber==1004){
        url=@"http://www.51jt.com/webView/single/advantage-list.jsp#e5";
    }
    else{
         [self setTitle:@"借条优势"];
        url=@"http://www.51jt.com/webView/single/advantage.jsp";
    }
     UIWebView*webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
}
@end
