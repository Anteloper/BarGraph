//
//  ClassCreatorViewController.h
//  Class_Discussion
//
//  Created by Luke Bakker on 4/29/15.
//  Copyright (c) 2015 Stepan Severov. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ClassAnalysis.h"
#import "Student.h"
#import <QuartzCore/QuartzCore.h>
@interface ClassCreatorViewController : UIViewController{
    UIView *ClassCreator;
    CGPoint startPoint;
    CGPoint currentButtonPoint;
    CGPoint previousButtonPoint;
    CGRect table;
    UIButton *clickMe;
    UIButton *student1;
    UIButton *student2;
    UIButton *student3;
    UIButton *student4;
    UIButton *student5;
    int clickCounter;
    int lineCreatorCounter;
    IBOutletCollection(UIButton) NSMutableArray *students;
    __weak IBOutlet UILabel *instructions;
    __weak IBOutlet UIView *ClassAnalysis;
   
}
@property Student* prevStudent;
@property NSMutableArray* times;
@property NSMutableArray* sequence;
@property NSTimer * theTime;
@property double timeInt;
-(IBAction) tableButtonClick :(id)sender;

-(IBAction)studentButtonClick:(id)sender;

@end