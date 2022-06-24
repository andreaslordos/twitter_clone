//
//  ComposeViewController.m
//  twitter
//
//  Created by Andreas Lordos on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *composeBox;
@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.composeBox.delegate = self;
}

-(void)textViewDidChange:(UITextView *)textView
{
  NSString *temp = textView.text;
  int64_t titleLength = textView.text.length;
  self.characterCount.text = [@(300 - textView.text.length) stringValue];
  if (titleLength > 299)
   {
   textView.text = [temp substringToIndex:299];
   }
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
