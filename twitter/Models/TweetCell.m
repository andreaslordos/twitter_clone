//
//  TweetCell.m
//  twitter
//
//  Created by Andreas Lordos on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "Utilities.h"

@implementation TweetCell



- (void)awakeFromNib {
    [super awakeFromNib];
    UIColor *someColor = [Utilities colorFromHexString:@"#ADB8C2"];
    self.defaultColor = someColor;
    [self.favoriteButton setTitleColor:UIColor.redColor forState:UIControlStateSelected];
    [self.favoriteButton setTitleColor:self.defaultColor forState:UIControlStateNormal];
    [self.retweetButton setTitleColor:UIColor.greenColor forState:UIControlStateSelected];
    [self.retweetButton setTitleColor:self.defaultColor forState:UIControlStateNormal];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// sets labels
- (void)refreshData {
    [self.profilePicture setImageWithURL:[NSURL URLWithString:self.tweet.user.profilePicture]];
    self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.height /2;
    self.profilePicture.layer.masksToBounds = YES;
    self.profilePicture.layer.borderWidth = 0;
    self.realName.text = self.tweet.user.name;
    self.username.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
    self.tweetText.text = self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    [self.retweetButton setTitle:[Utilities convertCountToReadableString:(self.tweet.retweetCount)] forState:UIControlStateNormal];
    [self.retweetButton setTitle:[Utilities convertCountToReadableString:(self.tweet.retweetCount)] forState:UIControlStateSelected];
    [self.favoriteButton setTitle:[Utilities convertCountToReadableString:(self.tweet.favoriteCount)] forState:UIControlStateNormal];
    [self.favoriteButton setTitle:[Utilities convertCountToReadableString:(self.tweet.favoriteCount)] forState:UIControlStateSelected];
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    self.profilePicture.image = nil;
    [self refreshData];
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited == YES) { // unfavorite
        [sender setSelected:NO];
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        self.favoriteButton.tintColor = self.defaultColor;
    } else { // favorite
        [sender setSelected:YES];
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        self.favoriteButton.tintColor = UIColor.redColor;
    }
    // Update cell UI
    [self refreshData];
    
    // Send a POST request to the POST favorites/create endpoint
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully toggled favorite the following Tweet: %@", tweet.text);
        }
    }];
}


- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted == YES) { // unretweet
        [sender setSelected:NO];
        // Update the local tweet model
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        self.retweetButton.tintColor = self.defaultColor;
    } else { // retweet
        //
        [sender setSelected:YES];
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        self.retweetButton.tintColor = UIColor.greenColor;
    }
    // Update cell UI
    [self refreshData];
    
    // Send a POST request to the POST favorites/create endpoint
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully toggled retweet the following Tweet: %@", tweet.text);
        }
    }];
}



@end
