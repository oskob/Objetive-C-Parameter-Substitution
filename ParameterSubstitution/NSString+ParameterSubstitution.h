//
//  NSString+ParameterSubstitution.h
//  ParameterSubstitution
//
//  Created by Oskar Öberg on 2014-09-12.
//  Copyright (c) 2014 Oskar Öberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ParameterSubstitution)

- (NSString*)stringBySubstitutingParameters:(NSDictionary*)parameters;
- (NSString*)stringBySubstitutingParameters:(NSDictionary*)parameters usingDelimiter:(NSString*)delimiter;

@end
