//
//  ClassCreatorViewController.m
//  Class_Discussion
//
//  Created by Luke Bakker on 4/29/15.
//  Copyright (c) 2015 Stepan Severov. All rights reserved.
//

#import "ClassCreatorViewController.h"
#import "ViewController.h"
//#import "ClassAnalysis.h"
#import "Student.h"
#import "BarDrawer.h"
@import UIKit;

@interface ClassCreatorViewController ()
- (IBAction)getDataButton:(id)sender;

@property NSMutableArray* studentList;

@end

@implementation ClassCreatorViewController

/*- (instancetype) initWithCoder:(NSCoder *)aDecoder{
        UIView *myCustomView = [[ClassAnalysis alloc]init];
   
        self.view = myCustomView;
       myCustomView dra
    return self;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
   
       students=[[NSMutableArray alloc] init];
    student5= [[UIButton alloc]initWithFrame:CGRectMake(10, 80, 100, 100)];
    [student5 setBackgroundImage:[UIImage imageNamed:@"Warsaw.jpg"] forState:UIControlStateNormal];
    [student5 addTarget:self action:@selector(studentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    CALayer *btnLayer5 = [student5 layer];
    [btnLayer5 setMasksToBounds:YES];
    [btnLayer5 setCornerRadius:10.0f];
   
    
    student4= [[UIButton alloc]initWithFrame:CGRectMake(10, 80, 100, 100)];
    [student4 setBackgroundImage:[UIImage imageNamed:@"Creagh.jpg"] forState:UIControlStateNormal];
    [student4 addTarget:self action:@selector(studentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    CALayer *btnLayer4 = [student4 layer];
    [btnLayer4 setMasksToBounds:YES];
    [btnLayer4 setCornerRadius:10.0f];
    
    
    student3= [[UIButton alloc]initWithFrame:CGRectMake(10, 80, 100, 100)];
    [student3 setBackgroundImage:[UIImage imageNamed:@"Nilsson.jpg"] forState:UIControlStateNormal];
    [student3 addTarget:self action:@selector(studentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    CALayer *btnLayer3 = [student3 layer];
    [btnLayer3 setMasksToBounds:YES];
    [btnLayer3 setCornerRadius:10.0f];
    
    
    student2= [[UIButton alloc]initWithFrame:CGRectMake(10, 80, 100, 100)];
    [student2 setBackgroundImage:[UIImage imageNamed:@"Curtis.jpg"] forState:UIControlStateNormal];
    [student2 addTarget:self action:@selector(studentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    CALayer *btnLayer2 = [student2 layer];
    [btnLayer2 setMasksToBounds:YES];
    [btnLayer2 setCornerRadius:10.0f];
   
    
    student1= [[UIButton alloc]initWithFrame:CGRectMake(10, 80, 100, 100)];
    [student1 setBackgroundImage:[UIImage imageNamed:@"Bakker.jpg"] forState:UIControlStateNormal];
    [student1 addTarget:self action:@selector(studentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    CALayer *btnLayer = [student1 layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:10.0f];
    [students addObject: student1];
    [students addObject: student2];
    [students addObject: student3];
    [students addObject: student4];
    [students addObject: student5];
    [self.view addSubview:student5];
    [self.view addSubview:student4];
    [self.view addSubview:student3];
      [self.view addSubview:student2];
    [self.view addSubview:student1];
  
   
    
    clickCounter=0;
    lineCreatorCounter=0;
    clickMe = [[UIButton alloc]initWithFrame:CGRectMake(220, 320, 200, 300)];
    [clickMe setBackgroundImage:[UIImage imageNamed: @"table.jpg"]forState:UIControlStateNormal];
    [clickMe addTarget:self action:@selector(tableButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    clickMe.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    CALayer *btnLayerC = [clickMe layer];
    [btnLayerC setMasksToBounds:YES];
    [btnLayerC setCornerRadius:10.0f];
    [self.view addSubview:clickMe];
    
    [self createStudentArray];
    [student1 addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    [clickMe addTarget:self action:@selector(wasDragged:withEvent:)
      forControlEvents:UIControlEventTouchDragInside];
   /* [student2 addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    [student3 addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    [student4 addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    [student5 addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    [clickMe addTarget:self action:@selector(wasDragged:withEvent:)
       forControlEvents:UIControlEventTouchDragInside];*/
    // Do any additional setup after loading the view.
     }
     

-(void) createStudentArray{
    Student *studentA = [[Student alloc] initWithName:@"Ben Bakker" image:[UIImage imageNamed:@"Bakker.jpg"]];
    Student *studentB = [[Student alloc] initWithName:@"Dr. Curtis" image:[UIImage imageNamed:@"Curtis.jpg"]];
    Student *studentC = [[Student alloc] initWithName:@"Peter Nilsson" image:[UIImage imageNamed:@"Nilsson.jpg"]];
    Student *studentD = [[Student alloc] initWithName:@"Amie Creagh" image:[UIImage imageNamed:@"Creagh.jpg"]];
    Student *studentE = [[Student alloc] initWithName:@"Peter Warsaw" image:[UIImage imageNamed:@"Warsaw.jpg"]];
    
    
    self.studentList = [[NSMutableArray alloc] initWithObjects:studentA,studentB,studentC,studentD,studentE, nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)countDown{
    _timeInt++;
 
}

-(IBAction)tableButtonClick:(id)sender{
    if(clickCounter==0){
        CGRect buttonFrame =clickMe.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        clickMe.frame=buttonFrame;
        clickCounter++;
    }else{
        [self printOutcome];
    }
}

-(IBAction)studentButtonClick:(id)sender{

    if(clickCounter==5){
        student5=[students objectAtIndex:clickCounter-1];
        CGRect buttonFrame =student5.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student5.frame=buttonFrame;
        clickCounter++;
        NSLog(@"%i",clickCounter);
    }
    if(clickCounter==4){
        student4=[students objectAtIndex:clickCounter-1];
        CGRect buttonFrame =student4.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student4.frame=buttonFrame;
        clickCounter++;
        NSLog(@"%i",clickCounter);
        [student5 addTarget:self action:@selector(wasDragged:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];
    }
    if(clickCounter==3){
        student3=[students objectAtIndex:clickCounter-1];
        CGRect buttonFrame =student3.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student3.frame=buttonFrame;
        clickCounter++;
        NSLog(@"%i",clickCounter);
        [student4 addTarget:self action:@selector(wasDragged:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];

    }
    if(clickCounter==2){
        student2=[students objectAtIndex:clickCounter-1];
        CGRect buttonFrame =student2.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student2.frame=buttonFrame;
        clickCounter++;
        NSLog(@"%i",clickCounter);
        [student3 addTarget:self action:@selector(wasDragged:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];

    }
    if(clickCounter==1){
        student1=[students objectAtIndex:clickCounter-1];
        CGRect buttonFrame =student1.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student1.frame=buttonFrame;
        clickCounter++;
         NSLog(@"%i",clickCounter);
        [student2 addTarget:self action:@selector(wasDragged:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];
    }
    
    if(clickCounter>5){
        if(sender==student1){
            
            if(clickCounter==6){
                self.prevStudent=self.studentList[0];
                 _theTime= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown)userInfo:nil repeats:YES];
                
            }
            clickCounter++;
            /*self.prevStudent.timeSpoken+=_timeInt;
            self.prevStudent=self.studentList[1];*/
            // NSLog(@"%f",temp);
            //double temp=[[_times objectAtIndex:0] doubleValue];
            //   NSLog(@"%f",_timeInt);
            
            [self addStudentToSequence:self.prevStudent];
            [self addTimeToTimeArray:_timeInt];
                       NSLog(@"%f",_timeInt);
             NSLog(@"%@",self.prevStudent.fullName);
            _timeInt=0;
            self.prevStudent=self.studentList[0];
                    }
        if(sender==student2){
            
            if(clickCounter==6){
                self.prevStudent=self.studentList[1];
                 _theTime= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown)userInfo:nil repeats:YES];
                clickCounter++;
            }
             clickCounter++;
            [self addTimeToTimeArray:_timeInt];
             [self addStudentToSequence:self.prevStudent];
            NSLog(@"%f",_timeInt);
             NSLog(@"%@",self.prevStudent.fullName);
            _timeInt=0;
            self.prevStudent=self.studentList[1];
           /* self.prevStudent.timeSpoken+=_timeInt;
             self.prevStudent=self.studentList[2];*/
                               }
        if(sender==student3){
            
            if(clickCounter==6){
                self.prevStudent=self.studentList[2];
                 _theTime= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown)userInfo:nil repeats:YES];
            }
             clickCounter++;
            [self addTimeToTimeArray:_timeInt];
             [self addStudentToSequence:self.prevStudent];
            NSLog(@"%f",_timeInt);
             NSLog(@"%@",self.prevStudent.fullName);
            _timeInt=0;
            self.prevStudent=self.studentList[2];
            /*self.prevStudent.timeSpoken+=_timeInt;
             self.prevStudent=self.studentList[3];*/
           
           
        }
        if(sender==student4){
           
            if(clickCounter==6){
                self.prevStudent=self.studentList[3];
                 _theTime= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown)userInfo:nil repeats:YES];
            }
             clickCounter++;
            [self addTimeToTimeArray:_timeInt];
             [self addStudentToSequence:self.prevStudent];
            NSLog(@"%f",_timeInt);
             NSLog(@"%@",self.prevStudent.fullName);
            _timeInt=0;
            self.prevStudent=self.studentList[3];
            /*self.prevStudent.timeSpoken+=_timeInt;
             self.prevStudent=self.studentList[4];*/
            
                     }
        if(sender==student5){
           
            if(clickCounter==6){
                self.prevStudent=self.studentList[4];
                 _theTime= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown)userInfo:nil repeats:YES];
            }
             clickCounter++;
            [self addTimeToTimeArray:_timeInt];
             [self addStudentToSequence:self.prevStudent];
            NSLog(@"%f",_timeInt);
            NSLog(@"%@",self.prevStudent.fullName);
            _timeInt=0;
            self.prevStudent=self.studentList[4];
            /*self.prevStudent.timeSpoken+=_timeInt;
             self.prevStudent=self.studentList[5];*/
            
            
        }
    }
}
- (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event
{
    if(clickCounter<6){ // get the touch
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    // get delta
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    startPoint=location;
    startPoint.x = location.x - previousLocation.x;
    startPoint.y = location.y - previousLocation.y;
    
    // move button
    button.center = CGPointMake(button.center.x + startPoint.x,
                                button.center.y + startPoint.y);
    startPoint=button.center;
}
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
   // startPoint=[[touches anyObject]locationInView:ClassCreator];
    
        // Do your stuff the user is currently holding down her finger…
   // if (clickMe.state & UIControlStateHighlighted) {
        // Do your stuff the user is currently holding down her finger…
       // if(startPoint.x<250 && startPoint.x>50 && startPoint.y>80 && startPoint.y<380){
      /*    if(clickCounter==0){
        CGRect buttonFrame =clickMe.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        clickMe.frame=buttonFrame;
   // }
    }
    else if (clickCounter==1){
        CGRect buttonFrame =student1.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student1.frame=buttonFrame;
    }
    else if (clickCounter==2){
        CGRect buttonFrame =student2.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student2.frame=buttonFrame;
    }
    else if (clickCounter==3){
        CGRect buttonFrame =student3.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student3.frame=buttonFrame;
    }
    else if (clickCounter==4){
        CGRect buttonFrame =student4.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student4.frame=buttonFrame;
    }
    else if (clickCounter==5){
        CGRect buttonFrame =student5.frame;
        buttonFrame.origin.x=startPoint.x-buttonFrame.size.width/2;
        buttonFrame.origin.y=startPoint.y-buttonFrame.size.height/2;
        student5.frame=buttonFrame;
  //  }
    }*/
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
  //  startPoint =[[touches anyObject]locationInView:ClassCreator];
    
}
-(void) addStudentToSequence: (Student*) student{
    
    if (!self.sequence){
        self.sequence = [[NSMutableArray alloc] init];
    }
    
    [self.sequence addObject:student.fullName];
    
}
-(void) addTimeToTimeArray: (double) time{
    
    if (!_times){
        _times = [[NSMutableArray alloc] init];
    }
    
    [self.times addObject:[NSNumber numberWithDouble:time]];
    
}
-(void) printOutcome{
    for (int i=0; i<_sequence.count; i++){
        NSLog(@"%@ talked for %@ seconds",[[_sequence objectAtIndex:i] fullName],[_times objectAtIndex:i]);
        
    }
    
}
-(void) addTotalTime: (double) time toStudent: (Student*) student{
    
    student.timeSpoken = student.timeSpoken + time;
    
}
-(void) printTotalTimes{
    for (int i=0; i<_studentList.count; i++){
        NSLog(@"%@ talked for %f seconds",[[_studentList objectAtIndex:i] fullName],[[_studentList objectAtIndex:i] timeSpoken]);
        
    }
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)getDataButton:(id)sender {
    ViewController *barGraph = (ViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"Bar Graph"];
    
    barGraph.timeSpokenList = self.times;
    barGraph.nameList = self.sequence;
    NSLog(@"There are %lu items in sequence array",(unsigned long)barGraph.nameList.count);
    NSLog(@"There are %lu items in time array",(unsigned long)barGraph.timeSpokenList.count);
    

    [self.navigationController pushViewController:barGraph animated:YES];
}
@end