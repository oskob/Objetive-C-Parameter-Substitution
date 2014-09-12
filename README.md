Objetive-C Parameter Substitution Category

Simple category for substituting parameter names with values.

## Usage
	#import "NSString+ParameterSubstitution.h"
	
	NSString *rawString = @"Hello %name%!";
	NSString *parameters = @{@"name": @"World"};
	NSString *substitutedString = [rawString stringBySubstitutingParameters:parameters];
	
	// substitutedString == @"Hello World!"
	
