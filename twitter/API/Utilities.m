//
//  Utilities.m
//  twitter
//
//  Created by Andreas Lordos on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "Utilities.h"
#import <UIKit/UIKit.h>

@implementation Utilities

// converts ints to readable strings - e.g. 123456 becomes 123K, 1046 becomes 1,046 etc.
+ (NSString *) convertCountToReadableString:(int)count {
    NSString *finalString = @"";
    if (count < 1000) {
        finalString = [finalString stringByAppendingString:[@(count) stringValue]];
    }
    else if (count < 10000) {
        finalString = [finalString stringByAppendingString:[@(count / 1000) stringValue]];
        finalString = [finalString stringByAppendingString:@","];
        if (count % 1000 < 10) {
            finalString = [finalString stringByAppendingString:@"0"];
        }
        if (count % 1000 < 100) {
            finalString = [finalString stringByAppendingString:@"0"];
        }
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


// Assumes input like "#00FF00" (#RRGGBB).
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
