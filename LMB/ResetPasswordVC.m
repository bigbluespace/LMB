//
//  ResetPasswordVC.m
//  iMate
//
//  Created by Rezaul Karim on 11/11/15.
//  Copyright © 2015 Rezaul Karim. All rights reserved.
//

#import "ResetPasswordVC.h"

@interface ResetPasswordVC ()

@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassTxt;

@end

@implementation ResetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *emailImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 11, 18, 21)];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [paddingView addSubview:emailImg];
    
    emailImg.image = [UIImage imageNamed:@"icon-password"];
    _passwordTxt.leftView = paddingView;
    _passwordTxt.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *Img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 11, 18, 21)];
    
    UIView *View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [paddingView addSubview:emailImg];
    
    Img.image = [UIImage imageNamed:@"icon-password"];
    _confirmPassTxt.leftView = View;
    _confirmPassTxt.leftViewMode = UITextFieldViewModeAlways;
}
- (IBAction)submitBtn:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
