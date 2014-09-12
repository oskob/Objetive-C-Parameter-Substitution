//
//  ParameterSubstitutionTests.m
//  ParameterSubstitutionTests
//
//  Created by Oskar Öberg on 2014-09-12.
//  Copyright (c) 2014 Oskar Öberg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+ParameterSubstitution.h"

@interface ParameterSubstitutionTests : XCTestCase

@end

@implementation ParameterSubstitutionTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testParameterSubstitutions
{
    NSString *test1 = @"a %b% c";
    NSString *test2 = @"%a% b c";
    NSString *test3 = @"a b %c%";
    NSString *test4 = @"testing something &param& yes";
    NSString *test5 = @"%%testing%% something %param% yes%%";
    NSString *test6 = @"hello %param% test % more test";
    
    
    XCTAssert([[test1 stringBySubstitutingParameters:@{@"b": @"x"} usingDelimiter:@"%"] isEqualToString:@"a x c"], @"Fail");
    XCTAssert([[test2 stringBySubstitutingParameters:@{@"a": @"x"} usingDelimiter:@"%"] isEqualToString:@"x b c"], @"Fail");
    XCTAssert([[test3 stringBySubstitutingParameters:@{@"c": @"x"} usingDelimiter:@"%"] isEqualToString:@"a b x"], @"Fail");
    
    
    XCTAssert([[test4 stringBySubstitutingParameters:@{@"param": @"hello"} usingDelimiter:@"&"] isEqualToString:@"testing something hello yes"], @"Fail");
    XCTAssert([[test5 stringBySubstitutingParameters:@{@"param": @"hello"} usingDelimiter:@"%"] isEqualToString:@"%testing% something hello yes%"], @"Fail");
    XCTAssert([[test6 stringBySubstitutingParameters:@{@"param": @"hello"} usingDelimiter:@"%"] isEqualToString:@"hello hello test % more test"], @"Fail");
}

@end
