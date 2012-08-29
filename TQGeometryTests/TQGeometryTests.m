//
//  TQGeometryTests.m
//  TQGeometryTests
//
//  Created by ToQoz on 8/29/12.
//  Copyright (c) 2012 toqoz. All rights reserved.
//

#import "TQGeometryTests.h"
#import "TQGeometry.h"

@implementation TQGeometryTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testTQPolygonContainPoint
{
    int vertexsCount = 5;
    CGPoint vertexs[ vertexsCount ];
    vertexs[1] = CGPointMake(0, 0);
    vertexs[2] = CGPointMake(0, 10);
    vertexs[3] = CGPointMake(10, 10);
    vertexs[4] = CGPointMake(10, 0);

    STAssertTrue(TQPolygonContainPoint(vertexs, vertexsCount, CGPointMake(5, 5)), @"(5, 5) should be contain.");
    STAssertTrue(TQPolygonContainPoint(vertexs, vertexsCount, CGPointMake(10, 10)), @"(10, 10) should be contain.");
    STAssertFalse(TQPolygonContainPoint(vertexs, vertexsCount, CGPointMake(11, 0)), @"(11, 0) should not be contain.");

}

- (void)testTQDegree2radian
{
    STAssertEquals((float)TQRadianToDegree(1), (float)(180.0f / M_PI), @"1radian should equal 180.0f/M_PI");
}

- (void)testTQRadian2Degree
{
    STAssertEquals((float)TQDegreeToRadian(180.0f / M_PI), (float)(1), @"1radian should equal 180.0f/M_PI");
}

- (void)testTQRotatedPoint
{
    STAssertEquals(TQRotatedPoint(90, CGPointMake(10, 0), CGPointMake(0, 0)), CGPointMake(0, 10), @"(10, 10) rotated 45degrees should equal (0, 10)");
    STAssertEquals(TQRotatedPoint(-90, CGPointMake(10, 0), CGPointMake(0, 0)), CGPointMake(0, -10), @"(10, 10) rotated 45degrees should equal (0, 10)");
}

@end
