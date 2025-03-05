//
//  BNRCharacterListViewController.h
//  Rick-and-Morty-ObjC
//
//  Created by Edwin Cardenas on 3/1/25.
//

#import <UIKit/UIkit.h>

@class BNRCharacterDetailsViewController;

NS_ASSUME_NONNULL_BEGIN

@interface BNRCharacterListViewController : UITableViewController

@property (nonatomic) BNRCharacterDetailsViewController *detailsViewController;

@end

NS_ASSUME_NONNULL_END
