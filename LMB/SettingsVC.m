
  /*SettingsVC.m
   
  Created by Shariif Islam on 11/14/15.
  Copyright © 2015 Shariif Islam. All rights reserved.*/


#import "SettingsVC.h"
#import "PreferenceManager.h"

#define IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define kCellHeight 55.0

NSArray *array_settingsContent;
//BOOL cellSelected;
NSString *selectedCell;
UIView *view_distanceCell;
UIView *view_choiceCell;
UIButton *btn_cellCollapse;

int enlargeRow;
NSIndexPath *index_path;

UISlider *slider_distance;
UILabel *lb_distanceSliderValue;

@interface SettingsVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation SettingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    selectedCell = @"";
    array_settingsContent = [NSArray array];
    array_settingsContent = @[@"Chat Settings",@"Distance",@"Choice",@"About",@"Privacy Policy",@"Terms and Conditions",@"Delete Account"];
    
    // Set slider initial value
    [PreferenceManager setDistanceValue:@"50"];
    
    // Hide table view separator
    self.tableView.separatorColor = [UIColor clearColor];
    
    /*UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    [tempImageView setFrame:self.tableView.frame];
    self.tableView.backgroundView = tempImageView;*/
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)getSliderValue:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    float value = slider.value *100;
    lb_distanceSliderValue.text = [NSString stringWithFormat:@"%0.f",value];
    
}



- (IBAction)saveDistanceValue:(id)sender {
    
    // Save slider value to preference
    [PreferenceManager setDistanceValue:lb_distanceSliderValue.text];
    
    // Collapse enlarge cell
    if ([index_path row] == enlargeRow) {
        selectedCell = @"";
        enlargeRow = 0;
    } else {
        
        selectedCell = @"DISTANCE";
        enlargeRow = 1;
    }
    
    [self enlargeCellheight:index_path];
}

-(void)loadVC:(NSString*)identifier{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vC = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.navigationController pushViewController:vC animated:YES];
}

- (IBAction)checkBoxButtonAction:(id)sender {
    
    if ([sender backgroundColor] == [UIColor blueColor]) {
        [sender setBackgroundColor:[UIColor whiteColor]];
    } else {
     [sender setBackgroundColor:[UIColor blueColor]];
    }
}

-(void)enlargeCellheight:(NSIndexPath *)indexPath{

    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    /*[_tableView beginUpdates];
      [_tableView endUpdates];*/
    
}

-(void)setCellAccessory:(NSString*)imageName{
    
    btn_cellCollapse.hidden = NO;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@",imageName,@".png"]];
    [btn_cellCollapse setBackgroundImage:image forState:UIControlStateNormal];
    
}

- (IBAction)CellAccessoryButtonAction:(id)sender {
    
    
}

#pragma mark - TABLE VIEW DELEGATE METHODS

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return array_settingsContent.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*CGFloat size;
     if (IPAD) {
     size = 75;
     } else {
     size = 50;
     }
     return size;*/
    
    if(![selectedCell isEqualToString:@""]) {
        
        if ([indexPath row] == enlargeRow) {
            return kCellHeight * 3.0;
        }
    }

    return kCellHeight;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.item) {
        case 0:
            selectedCell = @"";
            [self loadVC:@"chatSettingsVC"];
            break;
        case 1:
            if ([indexPath row] == enlargeRow) {
                // if cell already enlarged
                selectedCell = @"";
                enlargeRow = 0;
            } else {
                // if not then enlarge cell
                selectedCell = @"DISTANCE";
                enlargeRow = 1;
            }
            [self enlargeCellheight:indexPath];
            break;
        case 2:
            if ([indexPath row] == enlargeRow) {
                selectedCell = @"";
                enlargeRow = 0;
                
            } else {
                selectedCell = @"CHOICE";
                enlargeRow = 2;
            }
            [self enlargeCellheight:indexPath];
            break;
        case 3:
            selectedCell = @"";
            [self loadVC:@"aboutVC"];
            break;
        case 4:
            selectedCell = @"";
            [self loadVC:@"privacyPolicyVC"];
            break;
        case 5:
            selectedCell = @"";
            [self loadVC:@"termsAndServicesVC"];
            break;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Store cell indexpath initially
    index_path = indexPath;
    
    static NSString *CellIdentifier = @"settingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Settings Table View Content
    UILabel *title = (UILabel*)[tableView viewWithTag:101];
    UISwitch *deleteAccount = (UISwitch*)[tableView viewWithTag:102];
    UIButton *collapse = (UIButton*)[tableView viewWithTag:103];
    UIView *view_distance = (UIView*)[tableView viewWithTag:1001];
    UIView *view_choice = (UIView*)[tableView viewWithTag:1002];
    UIView *view_mainCell = (UIView*)[tableView viewWithTag:3001];
    
    //Customize Cell boder
    view_mainCell.layer.cornerRadius = 3;
    view_mainCell.layer.borderColor=[UIColor whiteColor].CGColor;
    view_mainCell.layer.borderWidth=1.0f;

    // Distance View Content
    UISlider *slider = (UISlider*)[tableView viewWithTag:1101];
    UILabel *sliderValue = (UILabel*)[tableView viewWithTag:1102];
    
    view_distanceCell = view_distance;
    view_choiceCell = view_choice;
    btn_cellCollapse = collapse;
    
    slider_distance = slider;
    lb_distanceSliderValue = sliderValue;
    
    lb_distanceSliderValue.text = [PreferenceManager getDistanceValue];
    
    title.text = array_settingsContent[indexPath.row];
    
    if ([indexPath row] == 6) {
        
        btn_cellCollapse.hidden = YES;
        deleteAccount.hidden = NO;
        view_distanceCell.hidden = YES;
        view_choiceCell.hidden = YES;
        
    } else if ([indexPath row] == 1 ){
        
        if (cell.frame.size.height > 75) {
            [self setCellAccessory:@"minus"];
        } else {
            [self setCellAccessory:@"plus"];
        }
        view_distanceCell.hidden = NO;
        view_choiceCell.hidden = YES;
        deleteAccount.hidden = YES;
        
    }else if ([indexPath row] == 2 ){
        
        if (cell.frame.size.height > 75) {
            [self setCellAccessory:@"minus"];
        } else {
            [self setCellAccessory:@"plus"];
        }
        view_distanceCell.hidden = YES;
        view_choiceCell.hidden = NO;
        deleteAccount.hidden = YES;
        
    } else {
        
        [self setCellAccessory:@"next"];
        view_distanceCell.hidden = YES;
        view_choiceCell.hidden = YES;
        deleteAccount.hidden = YES;
        
    }
    
    return cell;
}


@end
