//
//  ScreenPt.m
//  Demo2
//
//  Created by liuming on 2019/3/30.
//  Copyright © 2019 liuming. All rights reserved.
//

#import "ScreenPt.h"

@interface ScreenPt()
@property(nonatomic,assign) GLint x;
@property(nonatomic,assign) GLint y;
@end
@implementation ScreenPt

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.x = 0;
        self.y = 0;
    }
    return self;
}
- (void)setCoords:(GLint)xCoord y:(GLint)yCoord
{
    self.y = yCoord;
    self.x = xCoord;
}
- (GLint)getX
{
    return _x;
}
- (GLint)getY
{
    return _y;
}
@end
