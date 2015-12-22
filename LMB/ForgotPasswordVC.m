//
//  ForgotPasswordVC.m
//  iMate
//
//  Created by Rezaul Karim on 10/11/15.
//  Copyright © 2015 Rezaul Karim. All rights reserved.
//

#import "ForgotPasswordVC.h"

@interface ForgotPasswordVC ()

@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@end

@implementation ForgotPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *emailImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 21, 16)];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [paddingView addSubview:emailImg];
    
    emailImg.image = [UIImage imageNamed:@"icon-email"];
    _emailAddress.leftView = paddingView;
    _emailAddress.leftViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitBtn:(UIButton *)sender {
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
