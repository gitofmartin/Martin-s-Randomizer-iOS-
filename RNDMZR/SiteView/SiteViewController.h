//
//  SiteViewController.h
//  RNDMZR
//
//  Created by 2 on 1/26/16.
//  Copyright © 2016 apperlo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiteViewController : UIViewController
- (IBAction)shareSite:(id)sender;
@property (weak) NSString *fullURL;
@property (weak, nonatomic) IBOutlet UIButton *siteButton;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
