//
//  SignUpVC.m
//  imate
//
//  Created by Shariif Islam on 11/10/15.
//  Copyright © 2015 Rajkumar. All rights reserved.
//

#import "SignUpVC.h"

#define IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

UITextField *tf_fullName,*tf_userName,*tf_email,*tf_gender,*tf_address,*tf_password,*tf_confirmPassword;
UIImageView *iv_profileImage;
NSMutableArray *mArray_userAllInfoz;


@interface SignUpVC ()

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mArray_userAllInfoz = [NSMutableArray array];
    
  
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    iv_profileImage.layer.cornerRadius = iv_profileImage.layer.frame.size.height/2;
    
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showProfileImageUploadOptions)];
    [iv_profileImage addGestureRecognizer:tapRecognizer];
}

-(void)viewWillAppear:(BOOL)animated{
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

-(void)showProfileImageUploadOptions {
    
    NSLog(@"image view tapped ****");
    
    UIAlertController* alertController =
    [UIAlertController alertControllerWithTitle:nil
                                        message:@"Select an option"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
  
    
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"Take photo"
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action) {
                                [self takePhoto];
                            }]];
    
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"Select photo"
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action) {
                                [self selectPhoto];
                            }]];
 
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"Cancel"
                              style:UIAlertActionStyleDestructive
                            handler:^(UIAlertAction * action) {}]];

    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [iv_profileImage setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    
}


- (void)takePhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)selectPhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

- (IBAction)reset_action:(id)sender {
    
    tf_fullName.text = @"";
    tf_userName.text = @"";
    tf_email.text = @"";
    tf_gender.text = @"";
    tf_address.text = @"";
    tf_password.text = @"";
    tf_confirmPassword.text = @"";
    
    UIImage *image = [UIImage imageNamed:@"home-profile-pic"];
    [iv_profileImage setImage:image];
    
}
- (IBAction)submit_action:(id)sender {
    
    if ((![tf_fullName.text isEqualToString:@""] && ![tf_userName.text isEqualToString:@""] && ![tf_email.text isEqualToString:@""] && ![tf_gender.text isEqualToString:@""] && ![tf_address.text isEqualToString:@""] && ![tf_password.text isEqualToString:@""] && ![tf_confirmPassword.text isEqualToString:@""])) {
        
        if ([tf_userName.text length] > 2) {
  
            if ([self checkForEmailValidation:tf_email.text]) {
                
                if ([tf_password.text isEqualToString:tf_confirmPassword.text]) {
                    
                    NSMutableDictionary *infoz = [NSMutableDictionary dictionary];
                    
                    [infoz setValue:tf_fullName.text forKey:@"_full_name"];
                    [infoz setValue:tf_userName.text forKey:@"_user_name"];
                    [infoz setValue:tf_email.text forKey:@"_email"];
                    [infoz setValue:tf_gender.text forKey:@"_gender"];
                    [infoz setValue:tf_address.text forKey:@"_address"];
                    [infoz setValue:tf_password.text forKey:@"_password"];
                    [infoz setValue:tf_confirmPassword.text forKey:@"_confirm_password"];
                    
                    [infoz setValue:iv_profileImage.image forKey:@"_profile_image"];
                    
                    [mArray_userAllInfoz addObject:infoz];
                    
                    [self reset_action:sender];
                    
                    NSLog(@"User All Infozzz ****** %@",mArray_userAllInfoz);
                    UITabBarController *rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rootViewController"];
                    [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
                    
                } else {
                    
                    [self arletForSignUpField:@"Password mis-match"];
                    
                }
                
            } else {
                
                 [self arletForSignUpField:@"Invalid Email"];
            
            }
            
        } else {
            
            [self arletForSignUpField:@"User name must be atleast 3 charecters"];
            
        }
        
    } else {
        
        [self arletForSignUpField:@"Please fill the required field"];
        
    }
    
    
}

-(BOOL)checkForEmailValidation:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(void)arletForSignUpField:(NSString*)alertMessage{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                    message:alertMessage
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat size;
    
    if (IPAD) {
        size = 1000;
    } else {
        size = 600;
    }
    
    return size;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"tableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITextField *fullName = (UITextField *)[tableView viewWithTag:101];
    UITextField *userName = (UITextField *)[tableView viewWithTag:102];
    UITextField *email = (UITextField *)[tableView viewWithTag:103];
    UITextField *gender = (UITextField *)[tableView viewWithTag:104];
    UITextField *address = (UITextField *)[tableView viewWithTag:105];
    UITextField *pasword = (UITextField *)[tableView viewWithTag:106];
    UITextField *confirmPassword = (UITextField *)[tableView viewWithTag:107];
    UIImageView *imageView = (UIImageView *)[tableView viewWithTag:301];

    tf_fullName = fullName;
    tf_userName = userName;
    tf_email = email;
    tf_gender = gender;
    tf_address = address;
    tf_password = pasword;
    tf_confirmPassword = confirmPassword;
    iv_profileImage = imageView;
    
   

    return cell;
}


@end
