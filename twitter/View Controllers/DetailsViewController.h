//
//  DetailsViewController.h
//  twitter
//
//  Created by Andreas Lordos on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
NS_ASSUME_NONNULL_BEGIN

@protocol DetailsViewControllerDelegate

@end

@interface DetailsViewController : UIViewController
@property (nonatomic, weak) id<DetailsViewControllerDelegate> delegate;
@property (strong, nonatomic) Tweet *tweet;
@property (strong, nonatomic) UIColor *defaultColor;
@end

NS_ASSUME_NONNULL_END
