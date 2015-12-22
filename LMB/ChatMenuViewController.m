//
//  ChatMenuViewController.m
//  iMate
//
//  Created by Jimmy on 20/05/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import "ChatMenuViewController.h"

@interface ChatMenuViewController ()
@property (nonatomic, weak) IBOutlet UITableViewCell *cellMain;
@end

@implementation ChatMenuViewController

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
    arrOfUsers = [[NSMutableArray alloc]init];
    [arrOfUsers addObject:@"Emely"];
    [arrOfUsers addObject:@"Jhon"];
    [arrOfUsers addObject:@"Aaliyah"];
    [arrOfUsers addObject:@"Valentina"];
    [arrOfUsers addObject:@"Barbara"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToChatMenuViewController:(UIStoryboardSegue *)segue
{

}

#pragma mark UITableView Datasource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return arrOfOptions.count;
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellMainNibID = @"UserCell";
    
    _cellMain = [tableView dequeueReusableCellWithIdentifier:cellMainNibID];
    if (_cellMain == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"UserCell" owner:self options:nil];
        
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor redColor];
        [_cellMain setSelectedBackgroundView:bgColorView];
    }
    
    UIImageView *mainImage = (UIImageView *)[_cellMain viewWithTag:1];
    UIImageView *bgImage = (UIImageView *)[_cellMain viewWithTag:4];
    UILabel *imageTitle = (UILabel *)[_cellMain viewWithTag:2];
    UILabel *lblUnreadMsg = (UILabel *)[_cellMain viewWithTag:3];
    if (indexPath.row == 2)
    {
        bgImage.hidden = false;
        lblUnreadMsg.hidden = false;
        lblUnreadMsg.text = @"3";
    }
    imageTitle.text = [arrOfUsers objectAtIndex:indexPath.row];
    mainImage.image = [UIImage imageNamed:@"all-matches-prifile-pic.png"];
    
    return _cellMain;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"slidingToChat" sender:nil];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.view.bounds = CGRectMake(-40, 0, 240, self.view.frame.size.height);
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
