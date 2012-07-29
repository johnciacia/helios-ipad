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
    
@private
    NSArray *teachers;
}

+ (HeliosData *)instance;
- (NSArray *)teachers;

@property (nonatomic, readwrite) NSMutableDictionary *data;

@end
