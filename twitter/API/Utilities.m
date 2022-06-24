//
//  Utilities.m
//  twitter
//
//  Created by Andreas Lordos on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities
+ (NSString *) convertCountToReadableString:(int)count {
    NSString *finalString = @"";
    if (count < 1000) {
        finalString = [finalString stringByAppendingString:[@(count) stringValue]];
    }
    else if (count < 10000) {
        finalString = [finalString stringByAppendingString:[@(count / 1000) stringValue]];
        finalString = [finalString stringByAppendingString:@","];
        finalString = [finalString stringByAppendingString:[@(count % 1000) stringValue]];
    }
    else if (count < 100000) {
        finalString = [finalString stringByAppendingString:[@(count / 1000) stringValue]];
        finalString = [finalString stringByAppendingString:@"."];
        finalString = [finalString stringByAppendingString:[@((count / 100) % 10) stringValue]];
        finalString = [finalString stringByAppendingString:@"K"];
    }
    else if (count < 1000000) {
        finalString = [finalString stringByAppendingString:[@(count / 1000) stringValue]];
        finalString = [finalString stringByAppendingString:@"K"];
    }
    else { // more than a million likes
        finalString = [finalString stringByAppendingString:[@(count / 1000000) stringValue]];
        finalString = [finalString stringByAppendingString:[@((count / 100000)% 10000) stringValue]];
        finalString = [finalString stringByAppendingString:@"M"];
    }
    return finalString;
}
@end
