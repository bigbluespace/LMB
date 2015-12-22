//
//  PreferenceManager.m
//  imate
//
//  Created by Shariif Islam on 11/19/15.
//  Copyright © 2015 Shariif Islam. All rights reserved.
//

#import "PreferenceManager.h"

@interface PreferenceManager ()

@end

@implementation PreferenceManager

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)setDistanceValue:(NSString*)value{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:@"distance_value"];
    
}

+(NSString*)getDistanceValue{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"distance_value"];
}


@end
