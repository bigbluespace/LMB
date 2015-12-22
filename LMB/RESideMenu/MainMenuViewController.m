//
//  MainMenuViewController.m
//  iMate
//
//  Created by Jimmy on 20/05/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import "MainMenuViewController.h"
#import "RESideMenu.h"

@interface MainMenuViewController ()

@property (nonatomic, weak) IBOutlet UITableViewCell *cellMain;
@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    arrOfOptions = [[NSMutableArray alloc]init];
    
    [self addTitle:@"Home" imageName:@"icon-sidemenu-home.png" storeyboardId:@"homeView"];
    [self addTitle:@"My Profile" imageName:@"icon-sidemenu-chat.png" storeyboardId:@"profileView"];
    [self addTitle:@"Settings" imageName:@"icon-sidemenu-location.png" storeyboardId:@"settings"];
    [self addTitle:@"Logout" imageName:@"icon-sidemenu-setting.png" storeyboardId:@""];
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addTitle:(NSString *)title imageName:(NSString *)imageName storeyboardId:(NSString *)id_
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:title forKey:@"title"];
    [dic setObject:imageName forKey:@"image"];
    [dic setObject:id_ forKey:@"storyboardId"];
    [arrOfOptions addObject:dic];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToMainMenuViewController:(UIStoryboardSegue *)segue{

}

#pragma mark UITableView Datasource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // return arrOfOptions.count;
    return arrOfOptions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc] init];
//    
//    return view;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellMainNibID = @"cellMain";
    
    _cellMain = [tableView dequeueReusableCellWithIdentifier:cellMainNibID];
//    if (_cellMain == nil) {
//        [[NSBundle mainBundle] loadNibNamed:@"MainCellLeft" owner:self options:nil];
//        
//        UIView *bgColorView = [[UIView alloc] init];
//        bgColorView.backgroundColor = [UIColor redColor];
//        [_cellMain setSelectedBackgroundView:bgColorView];
//    }
    
    _cellMain.backgroundColor = [UIColor clearColor];
    
    
    NSMutableDictionary *menuItem = [arrOfOptions objectAtIndex:indexPath.row];
    
    UIImageView *mainImage = (UIImageView *)[_cellMain viewWithTag:1];
    UILabel *imageTitle = (UILabel *)[_cellMain viewWithTag:2];
    imageTitle.text = [menuItem objectForKey:@"title"];
    mainImage.image = [UIImage imageNamed:[menuItem objectForKey:@"image"]];
    
    return _cellMain;
}


//- (UIViewController *) viewFromStoryboard:(NSString *)storyboardID
//{
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController * controller = [storyBoard instantiateViewControllerWithIdentifier:storyboardID];
//    
//    return controller;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *menuItem = [arrOfOptions objectAtIndex:indexPath.row];
   // NSString *segueName = [menuItem objectForKey:@"segue"];
   // if (segueName.length > 0)
   //     [self performSegueWithIdentifier:segueName sender:nil];
    if (indexPath.row == 3) {
        UITabBarController *rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginNav"];
        [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
    }
    else {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:[menuItem valueForKey:@"storyboardId"]]]
                                                     animated:YES];
        [self.sideMenuViewController hideMenuViewController];
        
        
    }
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
