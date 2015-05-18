//
//  BarDrawer.m
//  BarGraph
//
//  Created by ohill on 5/12/15.
//  Copyright (c) 2015 ohill. All rights reserved.
//

#import "BarDrawer.h"
@interface BarDrawer(){
    NSArray *listOfStudents;
    NSMutableDictionary *positionData;
    NSMutableDictionary *timeData;
    NSMutableArray *colorArray;
}

@end
@implementation BarDrawer


- (void)drawRect:(CGRect)rect {
    NSLog(@"There are %lu items in sequence array",(unsigned long)self.nameList.count);
    NSLog(@"There are %lu items in time array",(unsigned long)self.timeSpokenList.count);
    
    [self readData];
    double greatestTimeSpoken = [self findGreatestTimeSpoken];
    
    
    int topMargin = self.frame.size.height/4;
    int leftMargin=30;
    int rightMargin = self.frame.size.width-120;
    
    int standardWidth = 30;
    
    double lengthMultiplier = rightMargin/greatestTimeSpoken;

    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    colorArray = [[NSMutableArray alloc] initWithObjects:[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor purpleColor],nil];


    for(int i =0;i<listOfStudents.count;i++){
        NSMutableArray *temp = [timeData objectForKey:[listOfStudents objectAtIndex:i]];
        int lastPoint = leftMargin;
        for(int j=0; j<temp.count;j++){
            
            CGContextSetFillColorWithColor(context, [[colorArray objectAtIndex:j] CGColor]);
            CGContextFillRect(context, CGRectMake(lastPoint, topMargin+(50*i),lengthMultiplier*[[temp objectAtIndex:j]integerValue], standardWidth));
            lastPoint+=lengthMultiplier*[[temp objectAtIndex:j]integerValue];
            CGContextStrokePath(context); // do actual stroking

        }
    }
}
-(void)readData{
    
    
    
    positionData = [[NSMutableDictionary alloc] init];
    timeData = [[NSMutableDictionary alloc]init];

    
    //create an array of unique students
    listOfStudents = [_nameList valueForKeyPath:[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"]];
   
 
        for(int i=0;i<listOfStudents.count;i++){
    
            NSMutableArray *speakingPosition = [[NSMutableArray alloc]initWithCapacity:30];
        
            //for each student, iterate through nameList and create an array of positions at which the student spoke
            for(int j=0;j<_nameList.count;j++){
            
                if([[_nameList objectAtIndex:j]isEqualToString: [listOfStudents objectAtIndex: i]]){
                    NSNumber *p=[NSNumber numberWithInt:j];
                    [speakingPosition addObject:p];
                    // hold the position in both arrays that each student spoke
                }
            }
            [positionData setValue:speakingPosition forKey:[listOfStudents objectAtIndex:i]];
        }
    }
-(double)findGreatestTimeSpoken{
    
    double greatestTalkTime =0;
    //for each student
    for(int i=0;i<listOfStudents.count;i++){
        NSMutableArray *studentTimeSpoken = [[NSMutableArray alloc]initWithCapacity:30];
        
        //enumerate through temp, the array of speaking positions, and add up times
        NSMutableArray *temp=[positionData objectForKey:[listOfStudents objectAtIndex:i]];
        
        int total = 0;
        
        for(int j = 0;j<temp.count;j++){
            //grabs the time spoken by a student at position j
            NSNumber *t=[NSNumber numberWithInt:[[_timeSpokenList objectAtIndex:[[temp objectAtIndex:j]intValue]]intValue]];
            [studentTimeSpoken addObject:t];
            total+=[t intValue];
        }
        [timeData setValue:studentTimeSpoken forKey:[listOfStudents objectAtIndex:i]];

        if(total>=greatestTalkTime)
            greatestTalkTime=total;
            
    }
    return greatestTalkTime;
}

@end
