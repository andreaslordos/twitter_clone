//
//  Tweet.h
//  twitter
//
//  Created by Andreas Lordos on 6/20/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSObject
@property (nonatomic, strong) NSString *idStr; // used to interact with the twitter api
@property (nonatomic, strong) NSString *text; // tweet text
@property (nonatomic) int favoriteCount; //number of favorites
@property (nonatomic) BOOL favorited; // TRUE if user has favorited tweet
@property (nonatomic) int retweetCount; //number of retweets
@property (nonatomic) BOOL retweeted; // TRUE if user has retweeted tweet
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *createdAtString; // display date
@property (nonatomic, strong) User *retweetedByUser; // if retweet, this is the user that retweeted it

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries;
@end

NS_ASSUME_NONNULL_END
