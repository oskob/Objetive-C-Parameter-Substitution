//
//  NSString+ParameterSubstitution.m
//  ParameterSubstitution
//
//  Created by Oskar Öberg on 2014-09-12.
//  Copyright (c) 2014 Oskar Öberg. All rights reserved.
//

#import "NSString+ParameterSubstitution.h"

@implementation NSString (ParameterSubstitution)

- (NSString*)stringBySubstitutingParameters:(NSDictionary*)parameters;
{
    return @"";
}

- (NSString*)stringBySubstitutingParameters:(NSDictionary*)parameters usingDelimiter:(NSString*)delimiter;
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"%@[^%@]*%@", delimiter, delimiter, delimiter] options:0 error:&error];
    
    NSMutableString *newString = [NSMutableString new];
    NSUInteger pos = 0;
    
    for(NSTextCheckingResult *match in [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)])
    {
        NSRange matchRange = [match range];
        
        [newString appendString:[self substringWithRange:NSMakeRange(pos, matchRange.location-pos)]];
        
        if([[self substringWithRange:matchRange] isEqualToString:[NSString stringWithFormat:@"%@%@", delimiter, delimiter]])
        {
            [newString appendString:delimiter];
        }
        else
        {
            NSRange paddedRange = matchRange;
            paddedRange.location += 1;
            paddedRange.length -= 2;
            NSString *param = [self substringWithRange:paddedRange];
            if(parameters[param])
            {
                [newString appendString:parameters[param]];
            }
        }
        
        pos = matchRange.location + matchRange.length;
    }
    
    [newString appendString:[self substringWithRange:NSMakeRange(pos, self.length-pos)]];
    
    return newString;
}


@end
