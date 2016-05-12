//
//  MediaViewController.m
//  RNDMZR
//
//  Created by 2 on 1/26/16.
//  Copyright © 2016 apperlo. All rights reserved.
//

#import "MediaViewController.h"
#import <Parse/Parse.h>
@interface MediaViewController ()

@end

@implementation MediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mediaButton.enabled=false;
    PFQuery* query = [PFQuery queryWithClassName:@"media"];
    
    // get rows count of game class
    [query countObjectsInBackgroundWithBlock:^(int count, NSError* error){
        NSLog(@"%d", count);
        query.skip = arc4random_uniform(count);
        query.limit = 1;
        [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error){
            if(!error){
                for (PFObject *object in objects){
                    NSString *nameFromObject = [NSString stringWithFormat:@"%@", [object objectForKey:@"url"]];
                    NSLog(@"URL adress is %@", nameFromObject); //<-- here it works printing out the whole dictionary
                    self.fullURL = nameFromObject;
                    NSURL* URL = [NSURL URLWithString:self.fullURL];
                    NSURLRequest* requestObj = [NSURLRequest requestWithURL:URL];
                    [_webView loadRequest:requestObj];
                    self.mediaButton.enabled=true;
                }
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)shareMedia:(id)sender {
    NSString *a=@"Found (";
    NSString *b=self.fullURL;
    NSString *c=@") on #Randomizer http://appstore.com/randomizerdiscoverwhatever";
    NSString *alertString=[a stringByAppendingString:b];
    alertString=[alertString stringByAppendingString:c];
    
    //NSURL *url=[NSURL URLWithString:self.fullURL];
    
    UIActivityViewController *controller=[[UIActivityViewController alloc] initWithActivityItems:@[alertString] applicationActivities:nil];
    
    controller.excludedActivityTypes = @[UIActivityTypePostToWeibo,
                                         UIActivityTypeMessage,
                                         UIActivityTypeMail,
                                         UIActivityTypePrint,
                                         UIActivityTypeCopyToPasteboard,
                                         UIActivityTypeAssignToContact,
                                         UIActivityTypeSaveToCameraRoll,
                                         UIActivityTypeAddToReadingList,
                                         UIActivityTypePostToFlickr,
                                         UIActivityTypePostToVimeo,
                                         UIActivityTypePostToTencentWeibo,
                                         UIActivityTypeAirDrop];

    [self presentViewController:controller animated:YES completion:nil];
    //UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"iTunes Message" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //[alert show];
}
@end
