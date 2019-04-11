//
//  main.m
//  Demo3
//
//  Created by anita on 2019/4/10.
//  Copyright © 2019 anita. All rights reserved.
//

#import <Foundation/Foundation.h>
#include<GLUT/GLUT.h>

GLsizei winWidth = 600,winHeight = 500;
GLint xRaster = 25, yRaster = 150;
GLubyte label[36] ={'j','a','p',  'F','e','b',  'M','a','r',
                    'A','P','r',  'M','a','y',  'J','u','n',
                    'j','u','l',  'A','u','g',  'S','e','p',
                    'O','c','t',  'N','o','v',  'D','e','c',
};

GLint dataValue[12] = {420,342,324,310,262,185,
                        190,196,217,240,312,438
};

void init(void)
{
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0, 600, 0, 500);
}

void lineGraph(void)
{
    GLint month;
    GLint x = 30;
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(0.0f, 0.0f, 1.0f);
    glBegin(GL_LINE_STRIP);
    for (int i = 0; i < 12; i ++) {
        glVertex2i(x + i * 50, dataValue[i]);
    }
    glEnd();
    
    glColor3f(1.0f, 0.0f, 0.0f);
    for (int i = 0; i < 12; i ++) {
        glRasterPos2i(xRaster + i * 50 +1 , dataValue[i] - 3);
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15, '*');
    }
    glColor3f(0.0f, 0.0f, 0.0f);
    xRaster = 20;
    for (month=0; month < 12; month ++) {
        glRasterPos2i(xRaster, yRaster);
        for (int i = 3 * month; i < 3 *month + 3; i++) {
            glutBitmapCharacter(GLUT_BITMAP_HELVETICA_12, label[i]);
        }
        xRaster += 50;
    }
   
    glFlush();
}

void winReshapeFunc(GLint width,GLint height)
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0.0, (GLdouble)winWidth, 0.0, (GLdouble)winHeight);
    glClear(GL_COLOR_BUFFER_BIT);
    
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        glutInit(&argc, argv);
        glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB);
        glutInitWindowPosition(100, 100);
        glutInitWindowSize(winWidth, winHeight);
        glutCreateWindow("Line chart Data Plot");
        
        init();
        glutDisplayFunc(lineGraph);
        glutReshapeFunc(winReshapeFunc);
        glutMainLoop();
        
    }
    return 0;
}
