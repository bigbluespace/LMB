//
//  MainMenuViewController.h
//  iMate
//
//  Created by Jimmy on 20/05/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *arrOfOptions;
}

- (IBAction)unwindToMainMenuViewController:(UIStoryboardSegue *)segue;

@end
