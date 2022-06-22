//
//  TweetCell.m
//  twitter
//
//  Created by Andreas Lordos on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    //self.tweet = tweet;
    self.profilePicture.image = nil;
    [self.profilePicture setImageWithURL:[NSURL URLWithString:self.tweet.user.profilePicture]];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    self.realName.text = self.tweet.user.name;
    self.username.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
    self.tweetText.text = self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    self.retweetButton.titleLabel.text = [@(self.tweet.retweetCount) stringValue];
    self.favoriteButton.titleLabel.text = [@(self.tweet.favoriteCount) stringValue];
}

@end
