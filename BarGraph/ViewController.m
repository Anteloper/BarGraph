//
//  ViewController.m
//  BarGraph
//
//  Created by ohill on 5/11/15.
//  Copyright (c) 2015 ohill. All rights reserved.
//

#import "ViewController.h"
#include <CoreGraphics/CGGeometry.h>
#import "BarGraphView.h"
#import "BarDrawer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) loadView{
    
    BarDrawer * newView = [[BarDrawer alloc] init];
    
    NSLog(@"There are %lu items in sequence array",(unsigned long)self.nameList.count);
    NSLog(@"There are %lu items in time array",(unsigned long)self.timeSpokenList.count);
    
    newView.timeSpokenList = self.timeSpokenList;
    newView.nameList = self.nameList;
    
    self.view = newView;
}

- (void)viewDidLoad {

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

@end
