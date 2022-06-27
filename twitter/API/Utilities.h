//
//  Utilities.h
//  twitter
//
//  Created by Andreas Lordos on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utilities : NSObject
+ (NSString *) convertCountToReadableString:(int)count;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end

NS_ASSUME_NONNULL_END
