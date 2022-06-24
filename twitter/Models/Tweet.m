//
//  Tweet.m
//  twitter
//
//  Created by Andreas Lordos on 6/20/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "Tweet.h"
#import "User.h"
#import "DateTools.h"

@implementation Tweet
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        // check if retweet. if not, set retweetedByUser and change the dictionary back to the original tweet
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        if (originalTweet != nil) {
            NSDictionary *userDictionary = dictionary[@"user"];
            self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];
            dictionary = originalTweet;
        }
        // set all other properties
        self.text = dictionary[@"text"];
        self.idStr = dictionary[@"id_str"];
        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
        self.retweetCount = [dictionary[@"retweet_count"] intValue];
        self.favorited = [dictionary[@"favorited"] boolValue];
        self.retweeted = [dictionary[@"retweeted"] boolValue];
        // initialize user
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        // format and set created at string
        NSString *dateString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
        NSDate *date = [formatter dateFromString:dateString];
        self.dateCreated = [NSString stringWithFormat: @"%ld/%ld/%ld", date.month, date.day, date.year];
        self.timeCreated = [NSString stringWithFormat: @"%ld:%ld", date.hour, date.minute];
        self.createdAtString = date.shortTimeAgoSinceNow;
        /*
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
        self.createdAtString = [formatter stringFromDate:date];
         */
    }
    return self;
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries {
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;
}


@end
