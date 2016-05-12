//
//  KnowsViewController.h
//  RNDMZR
//
//  Created by 2 on 1/26/16.
//  Copyright © 2016 apperlo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnowsViewController : UIViewController
@property (weak) NSString *fullURL;
- (IBAction)knowAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *knowButton;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
