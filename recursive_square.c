#include<stdio.h>
#include<Windows.h>
#include<GL/glut.h>


GLfloat V[4][3] = { { 100, 100, 0 }, { 300, 100, 0 }, { 300, 300, 0 }, { 100, 300, 0 } };



void square(GLfloat *a, GLfloat *b, GLfloat *c, GLfloat *d){
	
	glBegin(GL_LINE_LOOP);
	glVertex3fv(a);
	glVertex3fv(b);
	glVertex3fv(c);
	glVertex3fv(d);
	glEnd();
	glFlush();
}


void divide_square(GLfloat *a, GLfloat *b, GLfloat *c, GLfloat *d, int m){
	GLfloat mid[4][3];
	if (m > 0){
		for (int j = 0; j < 3; j++){
			mid[0][j] = (a[j] + b[j]) / 2;
			mid[1][j] = (b[j] + c[j]) / 2;
			mid[2][j] = (c[j] + d[j]) / 2;
			mid[3][j] = (d[j] + a[j]) / 2;
		}
		glColor3f(1, 0, 0);
		square(mid[0], mid[1], mid[2], mid[3]);
		divide_square(mid[0], mid[1], mid[2],mid[3], m - 1);
	}
	else{
	
		glColor3f(0, 1, 0);

		square(a, b, c, d);
	}
}

void display(){
	glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
	glClearColor(0, 0, 0, 1);
	int num = 0;
	printf("Enter the number of divisions:");
	scanf_s("%d", &num);
	divide_square(V[0], V[1], V[2], V[3],num);
	
}



void main(){
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(500, 500);
	glutCreateWindow("Square");
	glMatrixMode(GL_PROJECTION);
	glOrtho(0, 500, 0, 500, -100, 500);
	glutDisplayFunc(display);
	glEnable(GL_DEPTH_TEST);
	glutMainLoop();
}
