//
//  INSTimelineViewController.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSTimelineViewController.h"
#import "INSPhotosManager.h"

@interface INSTimelineViewController ()

@end

@implementation INSTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
#warning Test Code
    [[INSPhotosManager sharedInstance] getPopularPhotosWithCompletion:^(NSError *error, NSArray *photos){
        
    }];
}

@end
