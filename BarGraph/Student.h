//
//  Student.h
//  Demo_Class
//
//  Created by sseverov on 5/11/15.
//  Copyright (c) 2015 Stepan Severov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Student : NSObject

@property (nonatomic, strong) NSString * fullName;
@property (nonatomic) double timeSpoken;

-(instancetype) initWithName: (NSString *) studentName image:(UIImage *) image;
//-(UIImage*)getImageNamed;
@end
