////  PMCRequest.h//  PayEaseComPayment////  Created by 陈 斐 on 14-5-29.//  Copyright (c) 2014年 PayEase. All rights reserved.//#import <UIKit/UIKit.h>@protocol PMCRequestDelegate;@interface PMCRequest : NSObject@property (nonatomic, copy) NSString *requestTag;@property (nonatomic, assign)id<PMCRequestDelegate> delegate;- (void)sendGetRequestWithURLString:(NSString *)urlString withTag:(NSString *)requestTag;- (void)sendPOSTRequest:(NSString *)baseURLString parametersData:(NSData *)parameterData withTag:(NSString *)requestTag;- (void)resetConnection;@end@protocol PMCRequestDelegate@required- (void)request:(PMCRequest *)request failed:(NSString *)errorMessage;- (void)request:(PMCRequest *)request success:(id)XMLData;@end