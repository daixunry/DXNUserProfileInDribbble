//
//  DXNUserProfileInDribbbleTests.m
//  DXNUserProfileInDribbbleTests
//
//  Created by daixu on 16/4/26.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserProfileViewControllerViewModel.h"

@interface DXNUserProfileInDribbbleTests : XCTestCase

@end

@implementation DXNUserProfileInDribbbleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    UserProfileViewControllerViewModel *vm = [UserProfileViewControllerViewModel new];
    XCTAssertGreaterThan(vm.users.count, 0);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
