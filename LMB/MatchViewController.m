//
//  MatchViewController.m
//  iMate
//
//  Created by Jimmy on 24/05/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import "MatchViewController.h"

@interface MatchViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView_firstMatch;
@property (weak, nonatomic) IBOutlet UIImageView *imageView_secondMatch;
@property (weak, nonatomic) IBOutlet UIButton *btn_startConversation;
@property (weak, nonatomic) IBOutlet UIButton *btn_keepSurfing;

@end

@implementation MatchViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _imageView_firstMatch.layer.cornerRadius = _imageView_firstMatch.layer.frame.size.height/2;
    _imageView_secondMatch.layer.cornerRadius = _imageView_secondMatch.layer.frame.size.height/2;
    
    _btn_keepSurfing.layer.cornerRadius = 5;//half of the width
    _btn_keepSurfing.layer.borderColor=[UIColor whiteColor].CGColor;
    _btn_keepSurfing.layer.borderWidth=1.0f;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
