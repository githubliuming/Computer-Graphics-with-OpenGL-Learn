//
//  ScreenPt.h
//  Demo2
//
//  Created by liuming on 2019/3/30.
//  Copyright © 2019 liuming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLUT/GLUT.h>
@interface ScreenPt : NSObject

- (void) setCoords:(GLint) xCoord y:(GLint) yCoord;

- (GLint)getX;
- (GLint)getY;
@end

