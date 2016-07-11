//
//  LTWebViewVC.m
//  LTTools
//
//  Created by yelon on 16/4/26.
//  Copyright © 2016年 yelon. All rights reserved.
//

#import "LTWebViewVC.h"
#import "LTWebView.h"
#define ssss @"<html><head><meta http-equiv='Content-Type' content='text/html; charset=GBK'></head><body><div style='font-size:16px;'>Redirect ......</div><form name='yspaysubmit' action='http://113.106.160.201:889/businessgate/yspay.do' method='post'><input type='hidden' name='src' value='yszfjs1'/><input type='hidden' name='msgCode' value='S3001'/><input type='hidden' name='msgId' value='201606120000000000003'/><input type='hidden' name='check' value='ZWZ8xUMmQG28nMfjaJCEMbGAKWKAn4GTpcIzODAF1pJmw2Cw7YioLqJJeo/CCDaRZqy/+7sGuvMmoVySazjpI88yRfgcusl0xxkXmZuFwnicXGt+hQyMpI0sz8tdJMSH47qPzHJFyn8wS/4/wIo/9s52wzCjiw3mDUYqetVVcw4=                                                                                     '/><input type='hidden' name='msg' value='PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iR0JLIj8+Cjx5c3BheT48aGVhZD48VmVyPjEuMDwvVmVyPjxTcmM+eXN6ZmpzMTwvU3JjPjxNc2dDb2RlPlMzMDAxPC9Nc2dDb2RlPjxUaW1lPjIwMTYwNjEzMTY1NDU4PC9UaW1lPjwvaGVhZD48Ym9keT48T3JkZXI+PE9yZGVySWQ+MjAxNjA2MTIwMDAwMDAwMDAwMDAzPC9PcmRlcklkPjxCdXNpQ29kZT4wMTAwMDAxMDwvQnVzaUNvZGU+PFNob3BEYXRlPjIwMTYwNjEzPC9TaG9wRGF0ZT48Q3VyPkNOWTwvQ3VyPjxBbW91bnQ+MTAwPC9BbW91bnQ+PE5vdGU+MTIzNDwvTm90ZT48RXh0cmFEYXRhPjwvRXh0cmFEYXRhPjxSZW1hcms+PC9SZW1hcms+PFRpbWVvdXQ+MTAwODA8L1RpbWVvdXQ+PFN1cHBvcnRDYXJkcz5ZWTwvU3VwcG9ydENhcmRzPjxCYW5rVHlwZT48L0JhbmtUeXBlPjxCYW5rQWNjb3VudFR5cGU+PC9CYW5rQWNjb3VudFR5cGU+PC9PcmRlcj48UGF5ZWU+PFVzZXJDb2RlPnlzemZqczE8L1VzZXJDb2RlPjxOYW1lPtL4yqLWp7i2t/7O8bnJt93T0M/euavLvr2ty9W31rmry748L05hbWU+PC9QYXllZT48Tm90aWNlPjxQZ1VybD5odHRwOi8vMTE1LjI4Ljg5LjE0Mjo4NjA0PC9QZ1VybD48QmdVcmw+aHR0cDovLzExNS4yOC44OS4xNDI6ODYwNDwvQmdVcmw+PC9Ob3RpY2U+PC9ib2R5PjwveXNwYXk+'/></form><script>document.forms['yspaysubmit'].submit();</script></body></html>"
@interface LTWebViewVC ()<LTWebViewDelegate>{

    LTWebView *ltwebView;
}

@end

@implementation LTWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];

    ltwebView = [[LTWebView alloc]initWithFrame:self.view.bounds];
    ltwebView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:ltwebView];
    
//    [ltwebView lt_loadUrl:@"http://192.168.2.1:63342/Dangmian/www/demo/test.html"];
    [ltwebView lt_loadHTMLString:[NSString stringWithFormat:@"%@",ssss] baseURL:nil];
}

#pragma mark LTWebViewDelegate
-(void)ltwebViewDidStartLoad:(LTWebView *)webView{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

-(void)ltwebViewDidFinishLoad:(LTWebView *)webView{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(BOOL)ltwebView:(LTWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
  navigationType:(UIWebViewNavigationType)navigationType{
    
    NSURL *url = [request URL];
    NSString *absoluteString = [url absoluteString];
    NSLog(@"absoluteString == %@",absoluteString);
    
    if ([absoluteString hasPrefix:@"http://itunes.apple.com"]) {
        
        [[UIApplication sharedApplication]openURL:url];
        return NO;
    }
   
    return YES;
}

-(void)ltwebView:(LTWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSLog(@"error==%@",error);
    NSLog(@"localizedFailureReason==%@",error.localizedFailureReason);
    NSLog(@"localizedDescription==%@",error.localizedDescription);
    NSLog(@"localizedRecoverySuggestion==%@",error.localizedRecoverySuggestion);
    NSLog(@"localizedRecoveryOptions==%@",error.localizedRecoveryOptions);
    NSLog(@"helpAnchor==%@",error.helpAnchor);
}
@end
