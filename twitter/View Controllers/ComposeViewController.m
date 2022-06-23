//
//  ComposeViewController.m
//  twitter
//
//  Created by Andreas Lordos on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *composeBox;
@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)tweetAction:(id)sender {
    if (self.composeBox.hasText) {
        NSString *text = self.composeBox.text;
        [[APIManager shared] postStatusWithText:text completion:^(Tweet *tweet, NSError *error) {
            if (error != nil) {
                NSLog(@"Error composing tweet: %@", error.localizedDescription);
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error composing tweet"
                                            message:@"Please try again."
                                            preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alert animated:YES completion:nil];
            } else {
                NSLog(@"😎😎😎 Successfully composed tweet");
                [self.delegate didTweet:tweet];
                [self dismissViewControllerAnimated:NO completion:nil]; // dismiss view controller after tweet
            }
        }];
    }
    else { // compose box is empty
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error composing tweet"
                                    message:@"Tweets cannot be empty."
                                    preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
