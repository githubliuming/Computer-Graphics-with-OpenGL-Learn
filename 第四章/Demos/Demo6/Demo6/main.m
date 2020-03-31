//
//  main.m
//  Demo6
//
//  Created by anita on 2019/4/20.
//  Copyright © 2019 anita. All rights reserved.
//

#import <Foundation/Foundation.h>
#include<GLUT/GLUT.h>
#include <stdlib.h>
#include <math.h>


struct screentPt {
    GLint x;
    GLint y;
};

typedef enum {limacon = 1,cardioid = 2,threeLeaf = 3,fourLeaf = 4,spiral = 5 } cureName;
GLsizei winWidth = 600; GLsizei winHeight = 500;
GLdouble twoPi = 3.1415926 * 2;

void init()
{
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0, winWidth, 0, winHeight);
}

void lineSengment(struct screentPt pt1 ,struct screentPt pt2)
{
    glBegin(GL_LINES);
    glVertex2i(pt1.x, pt1.y);
    glVertex2i(pt2.x, pt2.y);
    glEnd();
    
}

void drawCurve(GLint cureNum)
{
    const GLint a = 175, b = 60;
    GLfloat r = 0.0, theta,dtheta = 1.0f / 10000;
    GLint x0 = 200, y0 = 250;
    struct screentPt curvePt[2];
    
    glColor3f(0.0f, 0.0f, 0.0f);
    curvePt[0].x = x0;
    curvePt[0].y = y0;
    
    switch (cureNum) {
        case limacon: curvePt[0].x += (a + b); break;
        case cardioid: curvePt[0].x += (a + a);break;
        case threeLeaf: curvePt[0].x += a;break;
        case fourLeaf:curvePt[0].x += a;break;
        case spiral:break;
        default:
            break;
    }
    
    theta = dtheta;
    while (theta < twoPi)
    {
        switch (cureNum) {
            case limacon:
            {
                r = a * cos(theta) + b;
            }break;
            case cardioid:
            {
                r = a * (1 + cos(theta));
            }
                break;
            case threeLeaf:
            {
                r = a * cos(3 * theta);
            }break;
            case fourLeaf:
            {
                r = a * cos(2 * theta);
            }break;
            case spiral:
            {
                r = (a / 4.0) * theta;
            }break;
            default:
                break;
        }
        curvePt[1].x = x0 + r * cos(theta);
        curvePt[1].y = y0 + r * sin(theta);
        lineSengment(curvePt[0], curvePt[1]);
        
        curvePt[0].x = curvePt[1].x;
        curvePt[0].y = curvePt[1].y;
        
        theta += dtheta;
    }
    
}

void displayFunc(void)
{
    GLint curveNum = -1;
    glClear(GL_COLOR_BUFFER_BIT);
    NSLog(@"Enter th integer value corresponding to ");
    NSLog(@"One of the following curve names.");
    NSLog(@"Press any other key to exit");
    scanf("%d",&curveNum);
    if (curveNum == 1 ||
        curveNum == 2 ||
        curveNum == 3 ||
        curveNum == 4 ||
        curveNum == 5)
    {
        drawCurve(curveNum);
    }
    else
    {
        exit(0);
    }
    glFlush();
}

void winReshapeFuc(GLint newWidth,GLint newHeight)
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, winWidth, 0 , winHeight);
    glClear(GL_COLOR_BUFFER_BIT);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        glutInit(&argc, argv);
        glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
        glutCreateWindow("hello ");
        glutInitWindowSize(winWidth, winHeight);
        glutInitWindowPosition(100, 100);
        
        init();
        glutDisplayFunc(displayFunc);
        glutReshapeFunc(winReshapeFuc);
        glutMainLoop();
        
    }
    return 0;
}
