//
//  WxxMainTests.m
//  WxxMainTests
//
//  Created by Cassie on 2019/10/10.
//  Copyright © 2019 Cassie. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface WxxMainTests : XCTestCase

@property(nonatomic, strong) ViewController *vc;

@end

@implementation WxxMainTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _vc = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testModuleBUrl {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
   id obj = [self.vc vcFromUrl:@"wxx://ModuleB"];
    XCTAssertNotNil(obj);
    
}


@end
