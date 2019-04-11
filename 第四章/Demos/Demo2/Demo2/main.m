//
//  main.m
//  Demo2
//
//  Created by liuming on 2019/3/30.
//  Copyright © 2019 liuming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScreenPt.h"
#import <math.h>
#import <stdlib.h>

const double TWO_PI = 3.151592654 * 2;
GLsizei winWidth = 400, winHeight = 400;
GLuint regHex;

void init()
{
    ScreenPt * hexVertex = [[ScreenPt alloc] init];
    ScreenPt * circCtr = [[ScreenPt alloc] init];
    
    GLdouble theta;
    GLint k;
    
    [circCtr setCoords:winWidth / 2 y:winHeight / 2];
    glClearColor(1.0, 1.0, 1.0, 0.0);
    //创建一张表
    regHex = glGenLists(1);
    
    glNewList(regHex, GL_COMPILE);
        glColor3f(1.0, 0.0, 1.0);
        glBegin(GL_POLYGON);
            for (k = 0; k < 6; k++) {
                theta = TWO_PI * k / 6.0f;
                [hexVertex setCoords:[circCtr getX] + 150 * cos(theta)
                                   y:[circCtr getY] + 150 * sin(theta)];
                glVertex2i([hexVertex getX], [hexVertex getY]);
                
            }
        glEnd();
    glEndList();
}

void regHexagon(void)
{
    glClear(GL_COLOR_BUFFER_BIT);
    glCallList(regHex);
    glFlush();
}

void winReshapeFcn(int newWidth,int newHeight)
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0.0, (GLdouble)newWidth,0.0,(GLdouble)newHeight);
    glClear(GL_COLOR_BUFFER_BIT);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        glutInit(&argc, argv);
        glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
        glutInitWindowPosition(100, 100);
        glutInitWindowSize(winWidth, winHeight);
        glutCreateWindow("Reshape - Function & Display-List Example");
        
        init();
        glutDisplayFunc(regHexagon);
        glutReshapeFunc(winReshapeFcn);
        glutMainLoop();
        
    }
    return 0;
}
