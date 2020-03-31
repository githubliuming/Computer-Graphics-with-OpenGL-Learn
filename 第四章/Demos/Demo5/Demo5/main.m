//
//  main.m
//  Demo5
//
//  Created by anita on 2019/4/11.
//  Copyright © 2019 anita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLUT/GLUT.h>
#include <math.h>
#include <stdlib.h>

//extern void circleMidPoint(GLint,GLint,GLfloat);

const int n= 600000;
GLint winWidth = 500,winHeight = 500;
GLdouble towPi = 3.1415926536f * 2;
struct scrpt {
    GLint x,y;
} scrpt;
void init()
{
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0, winWidth, 0, winHeight);
}
void drawn()
{
    struct scrpt cirCtr,piePt;
    GLint radius = winWidth / 4;
    GLdouble sliceAngle,previousSliceAngle = 0.0;
    GLint nSlices = 12;
    GLfloat dataValues[12] = {10.0,7.0,13.0,5.0,13.0,14.0,3.0,16.0,5.0,3.0,17.0,8.0};
    GLfloat dataSum = 0.0;
    cirCtr.x = winWidth / 2.0;
    cirCtr.y = winHeight / 2.0;
    
//    circleMidPoint(cirCtr,radius);
    double R = radius;
     glColor3f(0.5, 0.5, 0.5);
    glBegin(GL_POLYGON);
    for(int i=0;i<n;i++)
        glVertex2f(R*cos(towPi/n*i) + cirCtr.x,R*sin(towPi/n*i) + cirCtr.y);
    glEnd();
    
    for (int i = 0; i < nSlices; i++) {
        dataSum += dataValues[i];
    }
    glColor3f(1.0, 1.0, 1.0);
    for (int i = 0; i < nSlices; i++)
    {
        sliceAngle = towPi *dataValues[i] / dataSum + previousSliceAngle;
        piePt.x = cirCtr.x + radius * cos(sliceAngle);
        piePt.y = cirCtr.y + radius * sin(sliceAngle);
        glBegin(GL_LINES);
            glVertex2i(cirCtr.x, cirCtr.y);
            glVertex2i(piePt.x, piePt.y);
        glEnd();
        previousSliceAngle = sliceAngle;
    }
    
}
void display()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(0.0, 0.0, 1.0);
    
    drawn();
    glFlush();
}
void refreshep(int width,int height)
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, winWidth, 0, winHeight);
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
        glutCreateWindow("hell world");
        
        init();
        glutDisplayFunc(display);
        glutReshapeFunc(refreshep);
        glutMainLoop();
        
        
        NSArray * array = @[@(1),@(1),@(1),@(1),@(3)];
        
        NSArray<NSString *> *nubs = @[@(1),@(1),@(1),@(1),@(3)];
        
    }
    return 0;
}
