//
//  BNRCharacterDetailsViewController.m
//  Rick-and-Morty-ObjC
//
//  Created by Edwin Cardenas on 3/1/25.
//

#import "BNRCharacterDetailsViewController.h"

@implementation BNRCharacterDetailsViewController

- (void)setupViews
{
    self.navigationItem.title = self.characterDetails[@"name"];
}

#pragma mark - Lifecycle

- (void)loadView
{
    self.view = [[UIView alloc] init];
    
    [self setupViews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
}

@end
