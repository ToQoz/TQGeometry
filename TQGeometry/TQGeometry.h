//
//  TQGeometry.h
//  TQGeometry
//
//  Created by ToQoz on 8/29/12.
//  Copyright (c) 2012 toqoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

extern bool TQPolygonContainPoint(CGPoint *polygon, int N, CGPoint p);
extern CGPoint TQRotatedPoint(float degrees, CGPoint point, CGPoint center);
extern float TQDegreeToRadian(float degrees);
extern float TQRadianToDegree(float radians);