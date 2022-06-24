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

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
    [self.retweetButton setTitle:[@(self.tweet.retweetCount) stringValue] forState:UIControlStateNormal];
    [self.retweetButton setTitle:[@(self.tweet.retweetCount) stringValue] forState:UIControlStateSelected];
    [self.favoriteButton setTitle:[@(self.tweet.favoriteCount) stringValue] forState:UIControlStateNormal];
    [self.favoriteButton setTitle:[@(self.tweet.favoriteCount) stringValue] forState:UIControlStateSelected];
    //self.retweetButton.titleLabel.text = [@(self.tweet.retweetCount) stringValue];
    //self.favoriteButton.titleLabel.text = [@(self.tweet.favoriteCount) stringValue];
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    self.profilePicture.image = nil;
    [self refreshData];
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited == YES) { // unfavorite
        //[sender setImage:unselectedImage forState:UIControlStateNormal];
        [sender setSelected:NO];
        // Update the local tweet model
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        //UIImage *img = [UIImage imageNamed:@"heart"];
        //[sender setImage:img forState:u];
    } else { // favorite
        //
        [sender setSelected:YES];
        // Update the local tweet model
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        //UIImage *img = [UIImage imageNamed:@"heart.fill"];
        //[sender setImage:img forState:UIControlStateNormal];
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
        //[sender setImage:unselectedImage forState:UIControlStateNormal];
        [sender setSelected:NO];
        // Update the local tweet model
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        //UIImage *img = [UIImage imageNamed:@"heart"];
        //[sender setImage:img forState:u];
    } else { // favorite
        //
        [sender setSelected:YES];
        // Update the local tweet model
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        //UIImage *img = [UIImage imageNamed:@"heart.fill"];
        //[sender setImage:img forState:UIControlStateNormal];
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
