//
//  BNRCharacterDetailsViewController.h
//  Rick-and-Morty-ObjC
//
//  Created by Edwin Cardenas on 3/1/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRCharacterDetailsViewController : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic, copy) NSDictionary *characterDetails;

@end

NS_ASSUME_NONNULL_END
