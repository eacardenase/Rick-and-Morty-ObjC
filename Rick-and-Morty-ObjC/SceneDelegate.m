//
//  SceneDelegate.m
//  Rick-and-Morty-ObjC
//
//  Created by Edwin Cardenas on 3/1/25.
//

#import "SceneDelegate.h"
#import "BNRCharacterListViewController.h"
#import "BNRCharacterDetailsViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    
    BNRCharacterListViewController *characterListController = [[BNRCharacterListViewController alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc]
                                             initWithRootViewController:characterListController];
    
    BNRCharacterDetailsViewController *detailsController = [[BNRCharacterDetailsViewController alloc] init];
    characterListController.detailsViewController = detailsController;
    
    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        UINavigationController *detailNav = [[UINavigationController alloc]
                                             initWithRootViewController:detailsController];
        
        UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
        
        splitViewController.delegate = detailsController;
        splitViewController.viewControllers = @[navController, detailNav];
        
        self.window.rootViewController = splitViewController;
    } else {
        self.window.rootViewController = navController;
    }
    
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
