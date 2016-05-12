//
//  ViewController.m
//  RNDMZR
//
//  Created by 2 on 1/26/16.
//  Copyright © 2016 apperlo. All rights reserved.
//

#import "ViewController.h"
#import "MediaViewController.h"
#import "SiteViewController.h"
#import "KnowsViewController.h"
#import "SuggestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.labelCount.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
    PFQuery* query = [PFQuery queryWithClassName:@"count"];
    
    // get rows count of game class
    [query countObjectsInBackgroundWithBlock:^(int count, NSError* error){
        NSLog(@"%d", count);
        //query.skip = arc4random_uniform(count);
        query.limit = 1;
        [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error){
            if(!error){
                for (PFObject *object in objects){
                    NSString *nameFromObject = [NSString stringWithFormat:@"%@", [object objectForKey:@"number"]];
                    [self.labelCount setText:nameFromObject];
                }
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
                [self.labelCount setText:@"1234421"];
            }
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gameAction:(id)sender {
    //PFObject* game = [PFObject objectWithClassName:@"game"];
    PFQuery* query = [PFQuery queryWithClassName:@"game"];
    
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
                    [self.labelCount setText:nameFromObject];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nameFromObject]];
                        exit(0);
                    });
                }
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }];   
}

- (IBAction)appAction:(id)sender {
    PFQuery* query = [PFQuery queryWithClassName:@"app"];
    
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
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nameFromObject]];
                        exit(0);
                    });
                }
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }];

}

- (IBAction)mediaAction:(id)sender {
    MediaViewController* media = [[MediaViewController alloc]
                                  initWithNibName:@"MediaViewController" bundle:nil];
    [self presentViewController:media animated:YES completion:nil];
}

- (IBAction)siteAction:(id)sender {
    SiteViewController* site = [[SiteViewController alloc]
                                  initWithNibName:@"SiteViewController" bundle:nil];
    [self presentViewController:site animated:YES completion:nil];
}

- (IBAction)knowsAction:(id)sender {
    KnowsViewController* knows = [[KnowsViewController alloc]
                                initWithNibName:@"KnowsViewController" bundle:nil];
    [self presentViewController:knows animated:YES completion:nil];
}

- (IBAction)suggestAction:(id)sender {
    SuggestViewController* suggest = [[SuggestViewController alloc]
                                initWithNibName:@"SuggestViewController" bundle:nil];
    [self presentViewController:suggest animated:YES completion:nil];
}

@end
