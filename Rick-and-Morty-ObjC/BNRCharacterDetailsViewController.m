//
//  BNRCharacterDetailsViewController.m
//  Rick-and-Morty-ObjC
//
//  Created by Edwin Cardenas on 3/1/25.
//

#import "BNRCharacterDetailsViewController.h"
#import "BNRCharacterListViewController.h"

@interface BNRCharacterDetailsViewController ()

@property (nonatomic) UIImageView *characterImageView;

@end

@implementation BNRCharacterDetailsViewController

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    
    if (_imageURL) {
        NSURLRequest *request = [NSURLRequest requestWithURL:_imageURL];
        NSURLSession *session = [NSURLSession
                                 sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
        
        __weak BNRCharacterDetailsViewController *weakSelf = self;
        
        NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            BNRCharacterDetailsViewController *strongSelf = weakSelf;
            
            if (error) {
                NSLog(@"%@", error.localizedDescription);
                
                return;
            }
            
            UIImage *characterImage = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                strongSelf.characterImageView.image = characterImage;
            });
        }];
        
        [dataTask resume];
    }
}

- (UIImageView *)characterImageView
{
    if (!_characterImageView) {
        _characterImageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"person.fill"]];
        _characterImageView.contentMode = UIViewContentModeScaleAspectFit;
        _characterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _characterImageView;
}

- (UILabel *)characterName
{
    if (!_characterName) {
        _characterName = [[UILabel alloc] init];
        _characterName.translatesAutoresizingMaskIntoConstraints = NO;
        _characterName.numberOfLines = 0;
    }
    
    return _characterName;
}

- (UILabel *)characterStatus
{
    if (!_characterStatus) {
        _characterStatus = [[UILabel alloc] init];
        _characterStatus.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _characterStatus;
}

- (UILabel *)characterSpecie
{
    if (!_characterSpecie) {
        _characterSpecie = [[UILabel alloc] init];
        _characterSpecie.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _characterSpecie;
}
 
- (void)setupViews
{
    [self.view addSubview:self.characterImageView];
    [self.view addSubview:self.characterName];
    [self.view addSubview:self.characterStatus];
    [self.view addSubview:self.characterSpecie];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.characterImageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8],
        [self.characterImageView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [self.characterImageView.widthAnchor constraintEqualToConstant:200],
        [self.characterImageView.heightAnchor constraintEqualToAnchor:self.characterImageView.widthAnchor],
        
        [self.characterName.topAnchor constraintEqualToAnchor:self.characterImageView.topAnchor constant:10],
        [self.characterName.leadingAnchor constraintEqualToAnchor:self.characterImageView.trailingAnchor constant:10],
        [self.characterName.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-8],
        
        [self.characterStatus.topAnchor constraintEqualToAnchor:self.characterName.bottomAnchor constant:10],
        [self.characterStatus.leadingAnchor constraintEqualToAnchor:self.characterName.leadingAnchor],
        
        [self.characterSpecie.topAnchor constraintEqualToAnchor:self.characterStatus.bottomAnchor constant:10],
        [self.characterSpecie.leadingAnchor constraintEqualToAnchor:self.characterName.leadingAnchor]
    ]];
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

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode
{
    if (displayMode == UISplitViewControllerDisplayModeSecondaryOnly) {
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }
}

@end
