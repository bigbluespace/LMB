//
//  ChatMenuViewController.h
//  iMate
//
//  Created by Jimmy on 20/05/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatMenuViewController : UIViewController
{
    NSMutableArray *arrOfUsers;
}

- (IBAction)unwindToChatMenuViewController:(UIStoryboardSegue *)segue;
@end
