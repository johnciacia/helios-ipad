//
//  HeliosData.m
//  helios
//
//  Created by John Ciacia on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HeliosData.h"

@implementation HeliosData

@synthesize data;
@synthesize observation;

static HeliosData *instance = NULL;

+ (HeliosData *)instance 
{
    @synchronized(self)
    {
        if (instance == NULL)
            instance = [[self alloc] init];
    }
    
    return(instance);
}


- (NSArray *)teachers
{
    if(!teachers)
        teachers = [[NSArray alloc] initWithArray:[data objectForKey:@"teachers"]];
    
    return teachers;
}

- (NSArray *)getObservationsByTeacherId:(NSInteger)teacherId
{
    NSMutableArray *obs = [[NSMutableArray alloc] init];
    
    for( int i = 0; i < [[data objectForKey:@"observations"] count]; i++) {
        if([[[[data objectForKey:@"observations"] objectAtIndex:i] objectForKey:@"teacher_id"] intValue] == teacherId ) {
            [obs addObject:[[data objectForKey:@"observations"] objectAtIndex:i]];
        }
    }
    
    return obs;
}

@end
