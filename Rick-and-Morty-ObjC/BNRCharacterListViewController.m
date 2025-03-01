//
//  BNRCharacterListViewController.m
//  Rick-and-Morty-ObjC
//
//  Created by Edwin Cardenas on 3/1/25.
//

#import "BNRCharacterListViewController.h"

@interface BNRCharacterListViewController ()

@property (nonatomic) NSURLSession *session;

@end

@implementation BNRCharacterListViewController

- (void)fetchCharacters
{
    NSString *requestString = @"https://rickandmortyapi.com/api/character";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", json);
    }];
    
    [dataTask resume];
}

#pragma mark - Lifecycle

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        self.navigationItem.title = @"Rick and Morty Characters";
        
        NSURLSessionConfiguration *config = NSURLSessionConfiguration.defaultSessionConfiguration;
        _session = [NSURLSession sessionWithConfiguration:config];
        
        [self fetchCharacters];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
