//
//  User.m
//  twitter
//
//  Created by Andreas Lordos on 6/20/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        // see https://dev.twitter.com/overview/api/users
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        NSString *separatorString = @"_normal";
        NSString *normal_url = dictionary[@"profile_image_url_https"];
        self.profilePicture = [normal_url stringByReplacingOccurrencesOfString:separatorString withString:@""];
    }
    
    return self;
}
@end
