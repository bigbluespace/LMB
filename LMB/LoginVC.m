//
//  LoginVC.m
//  iMate
//
//  Created by Rezaul Karim on 16/11/15.
//  Copyright © 2015 Rezaul Karim. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Button Action
- (IBAction)loginBtn:(id)sender {
    
    UITabBarController *rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rootViewController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
    
    
}

#pragma mark - tap gesture recognizer

- (IBAction)forgotPassword:(UITapGestureRecognizer *)sender {
    NSLog(@"Forgot e Asi");
}

- (IBAction)signUp:(UITapGestureRecognizer *)sender {
    NSLog(@"Sign Up e Asi");
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
