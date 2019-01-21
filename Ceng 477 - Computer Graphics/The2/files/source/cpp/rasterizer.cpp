#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include "hw2_types.h"
#include "hw2_math_ops.h"
#include "hw2_file_ops.h"
#include <iostream>

#define PI 3.14159265
using namespace std;

Camera cameras[100];
int numberOfCameras = 0;

Model models[1000];
int numberOfModels = 0;

Color colors[100000];
int numberOfColors = 0;

Translation translations[1000];
int numberOfTranslations = 0;

Rotation rotations[1000];
int numberOfRotations = 0;

Scaling scalings[1000];
int numberOfScalings = 0;

Vec3 vertices[100000];
int numberOfVertices = 0;

Color backgroundColor;


// Vec3 verticesModeled[100000];

// backface culling setting, default disabled
int backfaceCullingSetting = 0;

Color **image;


double f01(double x, double y, double x0, double x1, double y0, double y1) {
    return x * (y0 - y1) + y * (x1 - x0) + x0 * y1 - y0 * x1;
}

double f12(double x, double y, double x1, double x2, double y1, double y2) {
    return x * (y1 - y2) + y * (x2 - x1) + x1 * y2 - y1 * x2;
}

double f20(double x, double y, double x2, double x0, double y2, double y0) {
    return x * (y2 - y0) + y * (x0 - x2) + x2*y0 - y2*x0;
}



double calculateSlope(double x0, double y0, double x1, double y1) {
    return (y1 - y0) / (x1 - x0);
}




void print4x4Matrix(double m[4][4]) {
    for (size_t i = 0; i < 4; i++) {
        for (size_t j = 0; j < 4; j++) {
            cout << m[i][j] << " ";
        }
        cout << endl;
    }
}


void equalizeMatrix4x4(double m1[4][4], double m2[4][4]) {
    for (size_t i = 0; i < 4; i++) {
        for (size_t j = 0; j < 4; j++) {
            m1[i][j] = m2[i][j];
        }
    }
}

void multiplyMat34x41(double r[3], double m[3][4], double v[4]) {
    int i, j;
    double total;
    for (i = 0; i < 3; i++) {
        total = 0;
        for (j = 0; j < 4; j++)
            total += m[i][j] * v[j];
        r[i] = total;
    }
}




void multiplyMatrixWithPoint(double undividedPoint[4], double matrix[4][4], Vec3 point) {
    double processPoint[4] = {point.x, point.y, point.z, 1};
    multiplyMatrixWithVec4d(undividedPoint, matrix, processPoint);
}






void rotMatrixPrepare(double rotMatrix[4][4], Rotation rotObject) {
    Vec3 uVector, vVector, wVector;
    uVector.x = rotObject.ux;
    uVector.y = rotObject.uy;
    uVector.z = rotObject.uz;
    if (uVector.x <= uVector.y && uVector.x <= uVector.z) {
        vVector.x = 0;
        vVector.y = (-1) * uVector.z;
        vVector.z = uVector.y;
    } else if(uVector.y <= uVector.x && uVector.y <= uVector.z) {
        vVector.x = (-1) * uVector.z;
        vVector.y = 0;
        vVector.z = uVector.x;
    } else {
        vVector.x = (-1) * uVector.y;
        vVector.y = uVector.x;
        vVector.z = 0;
    }
    wVector = normalizeVec3(crossProductVec3(uVector, vVector));

    double mMatrix[4][4] = {{uVector.x,uVector.y,uVector.z,0},
                            {vVector.x,vVector.y,vVector.z,0},
                            {wVector.x,wVector.y,wVector.z,0},
                            {0,0,0,1}};

    double mTransMatrix[4][4] = {{uVector.x,vVector.x,wVector.x,0},
                                 {uVector.y,vVector.y,wVector.y,0},
                                 {uVector.z,vVector.z,wVector.z,0},
                                 {0,0,0,1}};

    double rXtheta[4][4] = {{1,0,0,0},
                            {0,cos(rotObject.angle*PI/180), sin(rotObject.angle*PI/180) * (-1), 0 },
                            {0,sin(rotObject.angle*PI/180), cos(rotObject.angle*PI/180), 0 },
                            {0,0,0,1}};

    double resultingMatrix[4][4];
    double tempMatrix[4][4];
    multiplyMatrixWithMatrix(tempMatrix, rXtheta, mMatrix);
    multiplyMatrixWithMatrix(resultingMatrix, mTransMatrix, tempMatrix);
    equalizeMatrix4x4(rotMatrix,resultingMatrix);
}






/*
	Initializes image with background color
*/
void initializeImage(Camera cam) {
    int i, j;

    for (i = 0; i < cam.sizeX; i++)
        for (j = 0; j < cam.sizeY; j++) {
            image[i][j].r = backgroundColor.r;
            image[i][j].g = backgroundColor.g;
            image[i][j].b = backgroundColor.b;

        }
}


double lineFunc(double x, double y, double x0, double x1, double y0, double y1) {
    return x * (y0 - y1) + y * (x1 - x0) + x0 * y1 - y0 * x1;
}


void lineRastCase1(double firstPoint[3], double secondPoint[3], int firstColor, int secondColor){
    Color c;
    Color dc;
    int x, y, d;
    y = firstPoint[1];
    d = 2*(firstPoint[1]-secondPoint[1]) + (secondPoint[0] - firstPoint[0]);
    c.r = colors[firstColor].r;
    c.g = colors[firstColor].g;
    c.b = colors[firstColor].b;

    dc.r = (int) round(colors[secondColor].r - colors[firstColor].r) / (secondPoint[0] - firstPoint[0]);
    dc.g = (int) round(colors[secondColor].g - colors[firstColor].g) / (secondPoint[0] - firstPoint[0]);
    dc.b = (int) round(colors[secondColor].b - colors[firstColor].b) / (secondPoint[0] - firstPoint[0]);
    for (x = firstPoint[0]; x < secondPoint[0]; x++) {
        image[x][y] = c;
        if (d < 0) {
            y +=1;
            d += 2 * ((firstPoint[1]-secondPoint[1]) + (secondPoint[0] - firstPoint[0]));
        } else{
            d += 2 * (firstPoint[1]-secondPoint[1]);
        }
        c.r += dc.r;
        c.g += dc.g;
        c.b += dc.b;
    }
}

void lineRastCase2(double firstPoint[3], double secondPoint[3], int firstColor, int secondColor) {
    Color c;
    Color dc;
    int x, y, d;
    x = firstPoint[0];
    d = 2 * (firstPoint[0]-secondPoint[0]) + (secondPoint[1] - firstPoint[1]);
    c.r = colors[firstColor].r;
    c.g = colors[firstColor].g;
    c.b = colors[firstColor].b;

    dc.r = (int) round(colors[secondColor].r - colors[firstColor].r) / (secondPoint[1] - firstPoint[1]);
    dc.g = (int) round(colors[secondColor].g - colors[firstColor].g) / (secondPoint[1] - firstPoint[1]);
    dc.b = (int) round(colors[secondColor].b - colors[firstColor].b) / (secondPoint[1] - firstPoint[1]);

    for (y = firstPoint[1]; y < secondPoint[1]; y++) {
        image[x][y] = c;
        if (d <= 0) {
            d += 2* (secondPoint[0]-firstPoint[0]);
        } else{
            x +=1;
            d += 2 * ((secondPoint[0]-firstPoint[0]) + (firstPoint[1] - secondPoint[1]));
        }
        c.r += dc.r;
        c.g += dc.g;
        c.b += dc.b;
    }
}

void lineRastCase3(double firstPoint[3], double secondPoint[3], int firstColor, int secondColor) {
    Color c;
    Color dc;
    int x, y, d;
    x = firstPoint[0];
    d = 2 * (firstPoint[0]-secondPoint[0]) + (secondPoint[1] - firstPoint[1]);
    c.r = colors[firstColor].r;
    c.g = colors[firstColor].g;
    c.b = colors[firstColor].b;

    dc.r = (int) round(colors[secondColor].r - colors[firstColor].r) / (secondPoint[1] - firstPoint[1]);
    dc.g = (int) round(colors[secondColor].g - colors[firstColor].g) / (secondPoint[1] - firstPoint[1]);
    dc.b = (int) round(colors[secondColor].b - colors[firstColor].b) / (secondPoint[1] - firstPoint[1]);

    for (y = firstPoint[1]; y > secondPoint[1]; y--) {
        image[x][y] = c;
        if (d < 0) {
            x +=1;
            d += 2 * ((firstPoint[1]-secondPoint[1]) + (firstPoint[0] - secondPoint[0]));
        } else{
            d += 2* (firstPoint[0]-secondPoint[0]);
        }
        c.r -= dc.r;
        c.g -= dc.g;
        c.b -= dc.b;
    }
}


void lineRastCase4(double firstPoint[3], double secondPoint[3], int firstColor, int secondColor) {
    Color c;
    Color dc;
    int x, y, d;
    y = firstPoint[1];
    d = 2*(firstPoint[1]-secondPoint[1]) + (secondPoint[0] - firstPoint[0]);
    c.r = colors[firstColor].r;
    c.g = colors[firstColor].g;
    c.b = colors[firstColor].b;

    dc.r = (int) round(colors[secondColor].r - colors[firstColor].r) / (secondPoint[0] - firstPoint[0]);
    dc.g = (int) round(colors[secondColor].g - colors[firstColor].g) / (secondPoint[0] - firstPoint[0]);
    dc.b = (int) round(colors[secondColor].b - colors[firstColor].b) / (secondPoint[0] - firstPoint[0]);
    for (x = firstPoint[0]; x < secondPoint[0]; x++) {
        image[x][y] = c;
        if (d <= 0) {
            d += 2 * (firstPoint[1]-secondPoint[1]);
        } else{
            y -=1;
            d += 2 * ((firstPoint[1]-secondPoint[1]) + (firstPoint[0] - secondPoint[0]));
        }
        c.r += dc.r;
        c.g += dc.g;
        c.b += dc.b;
    }
}





/*
	Transformations, culling, rasterization are done here.
	You can define helper functions inside this file (rasterizer.cpp) only.
	Using types in "hw2_types.h" and functions in "hw2_math_ops.cpp" will speed you up while working.
*/
void forwardRenderingPipeline(Camera cam) {


    // ******************************************
    // PREPARE MODELING MATRIX
    // ******************************************
    for (int i = 0; i < numberOfModels; i++) {

        double modelingMatrix[4][4] = {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
        double resultMatrix[4][4] = {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
        for (int j = 0; j < models[i].numberOfTransformations; j++) {

            switch (models[i].transformationTypes[j]) {
                case 'r': {
                    Rotation rotObject = rotations[models[i].transformationIDs[j]];
                    double rotMatrix[4][4];
                    rotMatrixPrepare(rotMatrix, rotObject);
                    multiplyMatrixWithMatrix(resultMatrix, rotMatrix, modelingMatrix);
                    equalizeMatrix4x4(modelingMatrix, resultMatrix);
                    break;
                }
                case 't': {
                    Translation transObject = translations[models[i].transformationIDs[j]];
                    double transMatrix[4][4] = {{1,0,0,transObject.tx},
                                                {0,1,0,transObject.ty},
                                                {0,0,1,transObject.tz},
                                                {0,0,0,1}};
                    multiplyMatrixWithMatrix(resultMatrix, transMatrix, modelingMatrix);
                    equalizeMatrix4x4(modelingMatrix, resultMatrix);
                    break;
                }
                case 's': {
                    Scaling scaleObject = scalings[models[i].transformationIDs[j]];
                    double scaleMatrix[4][4] = {{scaleObject.sx,0,0,0},
                                                {0,scaleObject.sy,0,0},
                                                {0,0,scaleObject.sz,0},
                                                {0,0,0,1}};
                    multiplyMatrixWithMatrix(resultMatrix, scaleMatrix, modelingMatrix);
                    equalizeMatrix4x4(modelingMatrix, resultMatrix);
                    break;
                }
            }
        }
        // ******************************************
        // PREPARE MODELING MATRIX
        // ******************************************



        // PREPARE CAMERA MATRIX
        double mCamera[4][4] = {{cam.u.x, cam.u.y, cam.u.z,(-1) * (cam.u.x * cam.pos.x + cam.u.y * cam.pos.y + cam.u.z * cam.pos.z)},
                                {cam.v.x, cam.v.y, cam.v.z,(-1) * (cam.v.x * cam.pos.x + cam.v.y * cam.pos.y + cam.v.z * cam.pos.z)},
                                {cam.w.x, cam.w.y, cam.w.z,(-1) * (cam.w.x * cam.pos.x + cam.w.y * cam.pos.y + cam.w.z * cam.pos.z)},
                                {0,0,0,1}};



        // double camTimesModel[4][4];
        // multiplyMatrixWithMatrix(camTimesModel, mCamera, modelingMatrix);
        // print4x4Matrix(camTimesModel);



        double mPer[4][4] = {{(2.0*cam.n / (cam.r - cam.l)), 0, ((cam.r + cam.l)/(cam.r-cam.l)), 0},
                             {0, (2.0*cam.n / (cam.t - cam.b)), ((cam.t + cam.b)/(cam.t-cam.b)), 0},
                             {0,0, (-1.0) * ((cam.f + cam.n)/(cam.f-cam.n)), ((-2.0) * cam.f * cam.n)/(cam.f-cam.n)},
                             {0,0,-1.0,0}};



        double mPerTimesCam[4][4];
        multiplyMatrixWithMatrix(mPerTimesCam, mPer, mCamera);

        // print4x4Matrix(mPerTimesCamTimesModel);

        // VIEWPORT MATRIX
        double matrixVp[3][4] = {{cam.sizeX/2.0, 0, 0, (cam.sizeX - 1) / 2.0},
                                 {0, cam.sizeY / 2.0, 0, (cam.sizeY - 1) /2.0},
                                 {0, 0, 0.5, 0.5}};



        int vertex0, vertex1,vertex2;
        Vec3 point0, point1, point2;
        double undividedPoint[4];
        double realPoint0[3], realPoint1[3], realPoint2[3];
        double xMin, xMax, yMin, yMax;
        double alfa, beta, gama;
        Vec3 midPoint, cameraToMid, normal;
        Vec3 vector01, vector02;

        double readyToCull0[4], readyToCull1[4], readyToCull2[4];
        double point0Oper[4], point1Oper[4], point2Oper[4];

        Color pixelColor;
        if (models[i].type == 1) {
            for (int k = 0; k < models[i].numberOfTriangles; k++) {

                vertex0 = models[i].triangles[k].vertexIds[0];
                vertex1 = models[i].triangles[k].vertexIds[1];
                vertex2 = models[i].triangles[k].vertexIds[2];

                point0 = vertices[vertex0];
                point1 = vertices[vertex1];
                point2 = vertices[vertex2];

                point0Oper[0] = point0.x;
                point0Oper[1] = point0.y;
                point0Oper[2] = point0.z;
                point0Oper[3] = 1.0;

                point1Oper[0] = point1.x;
                point1Oper[1] = point1.y;
                point1Oper[2] = point1.z;
                point1Oper[3] = 1.0;

                point2Oper[0] = point2.x;
                point2Oper[1] = point2.y;
                point2Oper[2] = point2.z;
                point2Oper[3] = 1.0;


                multiplyMatrixWithVec4d(readyToCull0, modelingMatrix, point0Oper);
                multiplyMatrixWithVec4d(readyToCull1, modelingMatrix, point1Oper);
                multiplyMatrixWithVec4d(readyToCull2, modelingMatrix, point2Oper);

                midPoint.x =  (readyToCull0[0] + readyToCull1[0] + readyToCull2[0]) / 3.0;
                midPoint.y =  (readyToCull0[1] + readyToCull1[1] + readyToCull2[1]) / 3.0;
                midPoint.z =  (readyToCull0[2] + readyToCull1[2] + readyToCull2[2]) / 3.0;

                cameraToMid = subtractVec3(midPoint, cam.pos);


                vector01.x = readyToCull1[0] - readyToCull0[0];
                vector01.y = readyToCull1[1] - readyToCull0[1];
                vector01.z = readyToCull1[2] - readyToCull0[2];

                vector02.x = readyToCull2[0] - readyToCull0[0];
                vector02.y = readyToCull2[1] - readyToCull0[1];
                vector02.z = readyToCull2[2] - readyToCull0[2];

                normal = crossProductVec3(vector01, vector02);

                if (dotProductVec3(cameraToMid, normal) > 0 && backfaceCullingSetting == 1) {
                    continue;
                }


                // POINT 0
                multiplyMatrixWithVec4d(undividedPoint, mPerTimesCam, readyToCull0);
                undividedPoint[0] = undividedPoint[0] / undividedPoint[3];
                undividedPoint[1] = undividedPoint[1] / undividedPoint[3];
                undividedPoint[2] = undividedPoint[2] / undividedPoint[3];
                undividedPoint[3] = 1.0;
                multiplyMat34x41(realPoint0, matrixVp, undividedPoint);

                // POINT 1
                multiplyMatrixWithVec4d(undividedPoint, mPerTimesCam, readyToCull1);
                undividedPoint[0] = undividedPoint[0] / undividedPoint[3];
                undividedPoint[1] = undividedPoint[1] / undividedPoint[3];
                undividedPoint[2] = undividedPoint[2] / undividedPoint[3];
                undividedPoint[3] = 1.0;
                multiplyMat34x41(realPoint1, matrixVp, undividedPoint);

                // POINT 2
                multiplyMatrixWithVec4d(undividedPoint, mPerTimesCam, readyToCull2);
                undividedPoint[0] = undividedPoint[0] / undividedPoint[3];
                undividedPoint[1] = undividedPoint[1] / undividedPoint[3];
                undividedPoint[2] = undividedPoint[2] / undividedPoint[3];
                undividedPoint[3] = 1.0;
                multiplyMat34x41(realPoint2, matrixVp, undividedPoint);

                xMin = min(min(realPoint0[0], realPoint1[0]), realPoint2[0]);
                xMax = max(max(realPoint0[0], realPoint1[0]), realPoint2[0]);

                yMin = min(min(realPoint0[1], realPoint1[1]), realPoint2[1]);
                yMax = max(max(realPoint0[1], realPoint1[1]), realPoint2[1]);

                for (size_t y = yMin; y < yMax; y++) {
                    for (size_t x = xMin; x < xMax; x++) {
                        alfa = f12(x,y, realPoint1[0], realPoint2[0], realPoint1[1], realPoint2[1])/
                        f12(realPoint0[0],realPoint0[1], realPoint1[0], realPoint2[0], realPoint1[1], realPoint2[1]);
                        beta = f20(x,y, realPoint2[0], realPoint0[0], realPoint2[1], realPoint0[1])/
                        f20(realPoint1[0], realPoint1[1], realPoint2[0], realPoint0[0], realPoint2[1], realPoint0[1]);
                        gama = f01(x,y, realPoint0[0], realPoint1[0], realPoint0[1], realPoint1[1])/
                        f01(realPoint2[0], realPoint2[1], realPoint0[0], realPoint1[0], realPoint0[1], realPoint1[1]);
                        if (alfa >= 0 && beta >= 0 && gama >= 0) {
                            pixelColor.r = alfa * colors[point0.colorId].r + beta * colors[point1.colorId].r + gama * colors[point2.colorId].r;
                            pixelColor.g = alfa * colors[point0.colorId].g + beta * colors[point1.colorId].g + gama * colors[point2.colorId].g;
                            pixelColor.b = alfa * colors[point0.colorId].b + beta * colors[point1.colorId].b + gama * colors[point2.colorId].b;
                            image[x][y] = pixelColor;
                        }
                    }

                }
            }
        } else {
            // int vertex0, vertex1,vertex2;
            // Vec3 point0, point1, point2;
            // double undividedPoint[4];
            // double realPoint0[3], realPoint1[3], realPoint2[3];
            double slope01, slope12, slope20;
            for (int k = 0; k < models[i].numberOfTriangles; k++) {

                vertex0 = models[i].triangles[k].vertexIds[0];
                vertex1 = models[i].triangles[k].vertexIds[1];
                vertex2 = models[i].triangles[k].vertexIds[2];

                point0 = vertices[vertex0];
                point1 = vertices[vertex1];
                point2 = vertices[vertex2];

                point0Oper[0] = point0.x;
                point0Oper[1] = point0.y;
                point0Oper[2] = point0.z;
                point0Oper[3] = 1.0;

                point1Oper[0] = point1.x;
                point1Oper[1] = point1.y;
                point1Oper[2] = point1.z;
                point1Oper[3] = 1.0;

                point2Oper[0] = point2.x;
                point2Oper[1] = point2.y;
                point2Oper[2] = point2.z;
                point2Oper[3] = 1.0;


                multiplyMatrixWithVec4d(readyToCull0, modelingMatrix, point0Oper);
                multiplyMatrixWithVec4d(readyToCull1, modelingMatrix, point1Oper);
                multiplyMatrixWithVec4d(readyToCull2, modelingMatrix, point2Oper);

                midPoint.x =  (readyToCull0[0] + readyToCull1[0] + readyToCull2[0]) / 3.0;
                midPoint.y =  (readyToCull0[1] + readyToCull1[1] + readyToCull2[1]) / 3.0;
                midPoint.z =  (readyToCull0[2] + readyToCull1[2] + readyToCull2[2]) / 3.0;

                cameraToMid = subtractVec3(midPoint, cam.pos);


                vector01.x = readyToCull1[0] - readyToCull0[0];
                vector01.y = readyToCull1[1] - readyToCull0[1];
                vector01.z = readyToCull1[2] - readyToCull0[2];

                vector02.x = readyToCull2[0] - readyToCull0[0];
                vector02.y = readyToCull2[1] - readyToCull0[1];
                vector02.z = readyToCull2[2] - readyToCull0[2];

                normal = crossProductVec3(vector01, vector02);

                if (dotProductVec3(cameraToMid, normal) > 0 && backfaceCullingSetting == 1) {
                    continue;
                }



                // POINT 0
                multiplyMatrixWithVec4d(undividedPoint, mPerTimesCam, readyToCull0);
                undividedPoint[0] = undividedPoint[0] / undividedPoint[3];
                undividedPoint[1] = undividedPoint[1] / undividedPoint[3];
                undividedPoint[2] = undividedPoint[2] / undividedPoint[3];
                undividedPoint[3] = 1.0;
                multiplyMat34x41(realPoint0, matrixVp, undividedPoint);

                // POINT 1
                multiplyMatrixWithVec4d(undividedPoint, mPerTimesCam, readyToCull1);
                undividedPoint[0] = undividedPoint[0] / undividedPoint[3];
                undividedPoint[1] = undividedPoint[1] / undividedPoint[3];
                undividedPoint[2] = undividedPoint[2] / undividedPoint[3];
                undividedPoint[3] = 1.0;
                multiplyMat34x41(realPoint1, matrixVp, undividedPoint);

                // POINT 2
                multiplyMatrixWithVec4d(undividedPoint, mPerTimesCam, readyToCull2);
                undividedPoint[0] = undividedPoint[0] / undividedPoint[3];
                undividedPoint[1] = undividedPoint[1] / undividedPoint[3];
                undividedPoint[2] = undividedPoint[2] / undividedPoint[3];
                undividedPoint[3] = 1.0;
                multiplyMat34x41(realPoint2, matrixVp, undividedPoint);
                double y, d;
                Color c, dc;
                // EDGE 01
                slope01 = calculateSlope(realPoint0[0], realPoint0[1], realPoint1[0], realPoint1[1]);

                if (slope01 >= 0 && slope01 <= 1) {
                    if (realPoint0[0] < realPoint1[0]) {
                        lineRastCase1(realPoint0,realPoint1,point0.colorId,point1.colorId);
                    } else{
                        lineRastCase1(realPoint1,realPoint0,point1.colorId,point0.colorId);
                    }
                } else if(slope01 > 1) {
                    if (realPoint0[0] < realPoint1[0]) {
                        lineRastCase2(realPoint0,realPoint1,point0.colorId,point1.colorId);
                    } else{
                        lineRastCase2(realPoint1,realPoint0,point1.colorId,point0.colorId);
                    }
                } else if(slope01 < -1){
                    if (realPoint0[0] < realPoint1[0]) {
                        lineRastCase3(realPoint0,realPoint1,point0.colorId,point1.colorId);
                    } else{
                        lineRastCase3(realPoint1,realPoint0,point1.colorId,point0.colorId);
                    }
                } else {
                    if (realPoint0[0] < realPoint1[0]) {
                        lineRastCase4(realPoint0,realPoint1,point0.colorId,point1.colorId);
                    } else{
                        lineRastCase4(realPoint1,realPoint0,point1.colorId,point0.colorId);
                    }
                }

                // EDGE 12
                slope12 = calculateSlope(realPoint1[0], realPoint1[1], realPoint2[0], realPoint2[1]);

                if (slope12 >= 0 && slope12 <= 1) {
                    if (realPoint1[0] < realPoint2[0]) {
                        lineRastCase1(realPoint1,realPoint2,point1.colorId,point2.colorId);
                    } else{
                        lineRastCase1(realPoint2,realPoint1,point2.colorId,point1.colorId);
                    }
                } else if(slope12 > 1) {
                    if (realPoint1[0] < realPoint2[0]) {
                        lineRastCase2(realPoint1,realPoint2,point1.colorId,point2.colorId);
                    } else{
                        lineRastCase2(realPoint2,realPoint1,point2.colorId,point1.colorId);
                    }
                } else if(slope12 < -1){
                    if (realPoint1[0] < realPoint2[0]) {
                        lineRastCase3(realPoint1,realPoint2,point1.colorId,point2.colorId);
                    } else{
                        lineRastCase3(realPoint2,realPoint1,point2.colorId,point1.colorId);
                    }
                } else {
                    if (realPoint1[0] < realPoint2[0]) {
                        lineRastCase4(realPoint1,realPoint2,point1.colorId,point2.colorId);
                    } else{
                        lineRastCase4(realPoint2,realPoint1,point2.colorId,point1.colorId);
                    }
                }

                // EDGE 20

                slope20 = calculateSlope(realPoint2[0], realPoint2[1], realPoint0[0], realPoint0[1]);

                if (slope20 >= 0 && slope20 <= 1) {
                    if (realPoint2[0] < realPoint0[0]) {
                        lineRastCase1(realPoint2,realPoint0,point2.colorId,point0.colorId);
                    } else{
                        lineRastCase1(realPoint0,realPoint2,point0.colorId,point2.colorId);
                    }
                } else if(slope20 > 1) {
                    if (realPoint2[0] < realPoint0[0]) {
                        lineRastCase2(realPoint2,realPoint0,point2.colorId,point0.colorId);
                    } else{
                        lineRastCase2(realPoint0,realPoint2,point0.colorId,point2.colorId);
                    }
                } else if(slope20 < -1){
                    if (realPoint2[0] < realPoint0[0]) {
                        lineRastCase3(realPoint2,realPoint0,point2.colorId,point0.colorId);
                    } else{
                        lineRastCase3(realPoint0,realPoint2,point0.colorId,point2.colorId);
                    }
                } else {
                    if (realPoint2[0] < realPoint0[0]) {
                        lineRastCase4(realPoint2,realPoint0,point2.colorId,point0.colorId);
                    } else{
                        lineRastCase4(realPoint0,realPoint2,point0.colorId,point2.colorId);
                    }
                }

            }
        }
    }




}


int main(int argc, char **argv) {
    int i, j;
    if (argc < 2) {
        std::cout << "Usage: ./rasterizer <scene file> <camera file>" << std::endl;
        return 1;
    }

    // read camera and scene files
    readSceneFile(argv[1]);
    readCameraFile(argv[2]);

    image = 0;

    for (i = 0; i < numberOfCameras; i++) {

        if (image) {
			for (j = 0; j < cameras[i].sizeX; j++) {
		        delete image[j];
		    }
			delete[] image;
		}

        image = new Color*[cameras[i].sizeX];
        if (image == NULL) {
            std::cout << "ERROR: Cannot allocate memory for image." << std::endl;
            exit(1);
        }
        for (j = 0; j < cameras[i].sizeX; j++) {
            image[j] = new Color[cameras[i].sizeY];
            if (image[j] == NULL) {
                std::cout << "ERROR: Cannot allocate memory for image." << std::endl;
                exit(1);
            }
        }
        // initialize image with basic values
        initializeImage(cameras[i]);
        // do forward rendering pipeline operations
        forwardRenderingPipeline(cameras[i]);
        // generate PPM file
        writeImageToPPMFile(cameras[i]);
        // Converts PPM image in given path to PNG file, by calling ImageMagick's 'convert' command.
        // Notice that os_type is not given as 1 (Ubuntu) or 2 (Windows), below call doesn't do conversion.
        // Change os_type to 1 or 2, after being sure that you have ImageMagick installed.
        convertPPMToPNG(cameras[i].outputFileName, 99);
    }

    return 0;

}
