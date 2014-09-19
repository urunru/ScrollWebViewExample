//
//  ViewController.m
//  ScrollViewExample
//
//  Created by MURAKAMI on 2014/09/19.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UIScrollView *scrollView;
}
@end

const NSUInteger maxPage = 3;    //(※3)総page数

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width*maxPage, scrollView.bounds.size.height);
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollView.pagingEnabled = YES;
    scrollView.bouncesZoom = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    for (int i = 0; i < maxPage ; i++){
        UIWebView *webView = [[UIWebView alloc] init];
        webView.frame = CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height);
        webView.tag = i;
        NSString* urlString = @"http://google.com";
        switch (i) {
            case 0:
                urlString = @"http://google.com";
                break;
            case 1:
                urlString = @"http://twitter.com";
                break;
            case 2:
                urlString = @"http://facebook.com";
                break;
        }
        NSURL* googleURL = [NSURL URLWithString: urlString];
        // さらにこれを使って、Requestオブジェクトをつくります
        NSURLRequest* myRequest = [NSURLRequest requestWithURL: googleURL];
        // これを、myFirstWebViewのloadRequestメソッドに渡します
        [webView loadRequest:myRequest];
        [scrollView addSubview:webView];
    }
    
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"ho");
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"%@", scrollView.webview);
}
@end
