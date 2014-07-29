//
//  ViewController.m
//  Earth
//
//  Created by Gin on 7/27/14.
//  Copyright (c) 2014 Nguyễn Huỳnh Lâm. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    CustomView* customView = [CustomView new];
    self.view = customView;

}



@end
