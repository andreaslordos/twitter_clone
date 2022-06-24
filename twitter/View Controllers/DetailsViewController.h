//
//  DetailsViewController.h
//  twitter
//
//  Created by Andreas Lordos on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailsViewControllerDelegate

@end

@interface DetailsViewController : UIViewController
@property (nonatomic, weak) id<DetailsViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
