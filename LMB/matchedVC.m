//
//  matchedVC.m
//  iMate
//
//  Created by Rezaul Karim on 14/11/15.
//  Copyright © 2015 Rezaul Karim. All rights reserved.
//

#import "matchedVC.h"

@interface matchedVC ()
@property (weak, nonatomic) IBOutlet UILabel *matchStatus;
@property (weak, nonatomic) IBOutlet UIImageView *maleProfilePic;
@property (weak, nonatomic) IBOutlet UIImageView *femaleProfilePic;
@property (weak, nonatomic) IBOutlet UIButton *keepSurfingBtn;

@end

@implementation matchedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _keepSurfingBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _keepSurfingBtn.layer.borderWidth = 2;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Nav Bar Button
- (IBAction)menuBtn:(id)sender {
    
}

- (IBAction)chatMenuBtn:(id)sender {
    
}

#pragma mark - Match Page Button Event
- (IBAction)conversationBtn:(id)sender {
    
}

- (IBAction)surfingBtn:(id)sender {
    
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
