//
//  DetailsViewController.m
//  twitter
//
//  Created by Andreas Lordos on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Utilities.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *tweetName;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UIButton *tweetOptions;
@property (weak, nonatomic) IBOutlet UILabel *tweetUsername;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@end

@implementation DetailsViewController


// sets labels
- (void)refreshData {
    self.profilePicture.image = nil;
    [self.profilePicture setImageWithURL:[NSURL URLWithString:self.tweet.user.profilePicture]];
    self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.height /2;
    self.profilePicture.layer.masksToBounds = YES;
    self.profilePicture.layer.borderWidth = 0;
    self.tweetName.text = self.tweet.user.name;
    self.tweetUsername.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
    self.tweetText.text = self.tweet.text;
    self.dateLabel.text = self.tweet.dateCreated;
    self.timeLabel.text = self.tweet.timeCreated;
    self.retweetCount.text = [[Utilities convertCountToReadableString:(self.tweet.retweetCount)] stringByAppendingString:@" Retweets"];
    self.likeCount.text = [[Utilities convertCountToReadableString:(self.tweet.favoriteCount)] stringByAppendingString:@" Likes"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshData];
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
