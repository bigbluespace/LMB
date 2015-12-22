//
//  ProfilePage.m
//  iMate
//
//  Created by Rezaul Karim on 14/11/15.
//  Copyright © 2015 Rezaul Karim. All rights reserved.
//

#import "ProfilePage.h"

@interface ProfilePage ()
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation ProfilePage

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = _headerView.frame;
    rect.size.height = self.view.frame.size.width;
    _headerView.frame = rect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 400;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profileCell"];
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"friendCell" forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark - Menu Button Items
- (IBAction)menuBtnClick:(id)sender {
    
}

- (IBAction)chatListBtn:(id)sender {
    
}


- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
