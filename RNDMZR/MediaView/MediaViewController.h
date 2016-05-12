//
//  MediaViewController.h
//  RNDMZR
//
//  Created by 2 on 1/26/16.
//  Copyright © 2016 apperlo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *mediaButton;
- (IBAction)shareMedia:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (weak) NSString *fullURL;
@end
