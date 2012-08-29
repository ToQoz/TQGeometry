//
//  TQGeometry.m
//  TQGeometry
//
//  Created by ToQoz on 8/29/12.
//  Copyright (c) 2012 toqoz. All rights reserved.
//

#import "TQGeometry.h"

bool TQPolygonContainPoint(CGPoint *polygon, int N, CGPoint p)
{
    // c.f. solution 1(2d)
    // http://paulbourke.net/geometry/insidepoly/
    int counter = 0;
    int i;
    double xinters;
    CGPoint p1, p2;
    
    p1 = polygon[0];
    for (i = 1; i <= N; i++) {
        p2 = polygon[i % N];
        if (p.y >  MIN(p1.y, p2.y) && p.y <= MAX(p1.y, p2.y) && p.x <= MAX(p1.x, p2.x) && p1.y != p2.y) {
            // xiners: is x-coordinate on p1p2 when y-coordinate is p.y.
            // x = (slope of p1p2) * p.y + (intercept of x-axis)
            xinters = ((p2.x - p1.x) / (p2.y - p1.y)) * (p.y - p1.y) + p1.x;
            if (p1.x == p2.x || p.x <= xinters) {
                // intersect!
                counter++;
            }
        }
        p1 = p2;
    }
    
    if (counter % 2 == 0) {
        return false;
    } else {
        return true;
    }
}

CGPoint TQRotatedPoint(float degrees, CGPoint point, CGPoint center)
{
    CGAffineTransform _translate = CGAffineTransformMakeTranslation(center.x, center.y);
    CGAffineTransform _rotation = CGAffineTransformMakeRotation(TQDegreeToRadian(degrees));
    
    CGAffineTransform rotation =
        CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(_translate), _rotation), _translate);
    
    return CGPointApplyAffineTransform(point, rotation);
}

float TQDegreeToRadian(float degrees)
{
    return degrees * (M_PI / 180.0f);
}

float TQRadianToDegree(float radians)
{
    return radians * (180.0f / M_PI);
}