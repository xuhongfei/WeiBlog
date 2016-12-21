//
//  WBOAuthController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/4.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBOAuthController.h"
#import "WBAccount.h"
#import "WBTool.h"
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "WBCommon.h"

#import "WBHttpAuthorizeParam.h"
#import "WBAuthorizeTool.h"

@interface WBOAuthController () <UIWebViewDelegate>

@end

@implementation WBOAuthController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&response_type=code&redirect_uri=%@", WBOAuthClientId, WBOAuthRedirectURL];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.delegate = self;
    [webView loadRequest:request];
}


- (void)accessTokenWithCode:(NSString *)code
{

    WBHttpAuthorizeParam *param = [[WBHttpAuthorizeParam alloc] init];
    param.client_id = WBOAuthClientId;
    param.client_secret = WBOAuthClientSecret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = WBOAuthRedirectURL;
    
    [WBAuthorizeTool authorizeDataWithParam:param success:^(WBAccount *account) {
        [WBAccountTool saveAccount:account];
        [WBTool chooseRootConroller];
    } failure:^(NSError *error) {
        
    }];
}



#pragma mark - UIWebViewDelegate Function
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    
    NSRange range = [urlStr rangeOfString:@"code="];
    
    if (range.length) {
        int loc = (int)(range.length + range.location);
        NSString *code = [urlStr substringFromIndex:loc];
        
        [self accessTokenWithCode:code];
    }
    
    return YES;
}



@end
