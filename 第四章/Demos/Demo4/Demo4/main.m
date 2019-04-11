//
//  main.m
//  Demo4
//
//  Created by anita on 2019/4/11.
//  Copyright © 2019 anita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLUT/GLUT.h>

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

void barChat(void)
{
    GLint month;
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(0.6f, 0.4f, 1.0f);
    //画出条形
    for(int i = 0; i< 12;i++)
    {
        double leftX  = i * 50;
        glRecti(20 + leftX, 165, 40 + leftX, dataValue[i]);
    }
    xRaster = 20;
    glColor3f(0.3, 0.5, 0.7);
    for (month = 0; month < 12; month ++)
    {
        int start = month * 3;
         glRasterPos2d(xRaster  , yRaster);
        for (int i = start; i < start + 3 ; i++)
        {
            glutBitmapCharacter(GLUT_BITMAP_HELVETICA_12, label[i]);
        }
        xRaster += 50;
    }
    glFlush();
    
}
void init()
{
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0, winHeight, 0, winHeight);
}

void winReshapeFunc(GLint width,GLint height)
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, width, 0, height);
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
        glutCreateWindow("my window");
        
        init();
        glutDisplayFunc(barChat);
        glutReshapeFunc(winReshapeFunc);
        glutMainLoop();
    }
    return 0;
}
