//
//  Student.m
//  Demo_Class
//
//  Created by sseverov on 5/11/15.
//  Copyright (c) 2015 Stepan Severov. All rights reserved.
//

#import "Student.h"

@interface Student()

@property (nonatomic, retain) UIImage* studentImage;

@end

@implementation Student

-(instancetype) initWithName:(NSString *)studentName image:(UIImage *)image{
    self.fullName = studentName;
    self.studentImage = image;
    
    return self;
}

/*-(NSString *)getImageName{
    return self.studentImage;
}
*/
@end
