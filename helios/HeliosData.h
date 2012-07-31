//
//  HeliosData.h
//  helios
//
//  Created by John Ciacia on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeliosData : NSObject {
    NSMutableDictionary *data;
    
    NSDictionary *user;
    NSDictionary *teacher;
    NSMutableDictionary *observation;
    
    NSArray *standards;
    NSArray *elements;
    NSArray *indicators;
    
@private
    NSArray *teachers;
    NSArray *observations;
}

+ (HeliosData *)instance;
- (NSArray *)teachers;
- (NSArray *)getObservationsByTeacherId:(int)teacherId;


@property (nonatomic, readwrite) NSMutableDictionary *data;
@property (nonatomic, readwrite) NSMutableDictionary *observation;

@end