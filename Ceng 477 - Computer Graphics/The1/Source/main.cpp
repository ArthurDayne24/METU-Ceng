#include <iostream>
#include "parser.h"
#include "ppm.h"
#include <vector>
#include <math.h>
#include <limits.h>
#include <string.h>

typedef unsigned char RGB[3];

using namespace std;
using namespace parser;

Scene scene;

struct Intersect{
    bool doesIntersect = false;
    int material_id;
    float t;
    float length = 0;
    Vec3f normalT;
    Vec3f intersectionPoint;
};

void printVector(Vec3f vector){
    cout << "x: " << vector.x << endl;
    cout << "y: " << vector.y << endl;
    cout << "z: " << vector.z << endl;
}


Vec3f crossProduct(Vec3f &v1, Vec3f &v2){
    Vec3f temp;
    temp.x = v1.y * v2.z - v1.z * v2.y;
    temp.y = (v1.z * v2.x - v1.x * v2.z);
    temp.z = v1.x * v2.y - v1.y * v2.x;
    return temp;
}

float dotProduct(Vec3f &v1,Vec3f &v2){
    return v1.x*v2.x + v1.y*v2.y + v1.z*v2.z;
}


Vec3f multiplyByFloat(Vec3f &vector, float coefficient) {
    Vec3f result;
    result.x = vector.x * coefficient;
    result.y = vector.y * coefficient;
    result.z = vector.z * coefficient;
    return result;
}

Vec3f addTwoVectors(Vec3f &vector1, Vec3f &vector2) {
    Vec3f result;
    result.x = vector1.x + vector2.x;
    result.y = vector1.y + vector2.y;
    result.z = vector1.z + vector2.z;
    return result;
}



Vec3f subtractTwoVectors(Vec3f &v1,Vec3f &v2){
    Vec3f result;
    result.x = v1.x - v2.x;
    result.y = v1.y - v2.y;
    result.z = v1.z - v2.z;
    return result;
}


float calculateDet(float a,float b,float c,float d,float e,float f,float g,float h,float i){
    float first = a* ((e*i)-(f*h));
    float second = b* ((f*g)-(d*i));
    float third = c * ((d*h)-(g*e));
    return first +second +third;
}


float lenghtOfVector(Vec3f &vector){
    float lenU = sqrt(pow(vector.x,2) + pow(vector.y,2) + pow(vector.z,2) );
    return lenU;
}

Vec3f makeItUnit(Vec3f &vector) {
    float lenU = lenghtOfVector(vector);
    Vec3f result;
    result.x = vector.x/lenU;
    result.y = vector.y/lenU;
    result.z = vector.z/lenU;
    return result;
}


Vec3f calculatePointM(Camera &camera) {
    Vec3f result;
    result.x = camera.position.x + camera.gaze.x * camera.near_distance;
    result.y = camera.position.y + camera.gaze.y * camera.near_distance;
    result.z = camera.position.z + camera.gaze.z * camera.near_distance;
    return result;
}


Vec3f calculatePointQ(Camera &camera, Vec3f &vectorU, Vec3f &pointM) {
    Vec3f result;
    result.x = pointM.x + camera.near_plane.x * vectorU.x + camera.near_plane.w * camera.up.x;
    result.y = pointM.y + camera.near_plane.x * vectorU.y + camera.near_plane.w * camera.up.y;
    result.z = pointM.z + camera.near_plane.x * vectorU.z + camera.near_plane.w * camera.up.z;
    return result;
}


Vec3f calculatePointS(Vec3f &Q, float sU, float sV, Camera &camera, Vec3f &uVector) {
    Vec3f result;
    result.x = Q.x + sU *uVector.x - sV *camera.up.x;
    result.y = Q.y + sU *uVector.y - sV *camera.up.y;
    result.z = Q.z + sU *uVector.z - sV *camera.up.z;
    return result;
}

Intersect checkIntersectionTriangle(Vec3f &d, Vec3f &o, Triangle &triangle) {
    Intersect result;
    Vec3f a = scene.vertex_data[triangle.indices.v0_id-1];
    Vec3f b = scene.vertex_data[triangle.indices.v1_id-1];
    Vec3f c = scene.vertex_data[triangle.indices.v2_id-1];


    float detA = calculateDet(
            a.x - b.x, a.x - c.x, d.x,
            a.y - b.y, a.y - c.y, d.y,
            a.z - b.z, a.z - c.z, d.z);
    float beta = calculateDet(
            a.x - o.x, a.x - c.x, d.x,
            a.y - o.y, a.y - c.y, d.y,
            a.z - o.z, a.z - c.z, d.z)
            / detA;
    float gama = calculateDet(
            a.x - b.x, a.x - o.x, d.x,
            a.y - b.y, a.y - o.y, d.y,
            a.z - b.z, a.z - o.z, d.z)
            / detA;
    float t = calculateDet(
            a.x - b.x, a.x - c.x, a.x - o.x,
            a.y - b.y, a.y - c.y, a.y - o.y,
            a.z - b.z, a.z - c.z, a.z - o.z)
            / detA;

    if(t > 0 && (beta + gama) <= 1 && beta >= 0 && gama >= 0) {
        Vec3f temp;

        temp.x = d.x * t + o.x;
        temp.y = d.y * t + o.y;
        temp.z = d.z * t + o.z;
        result.intersectionPoint = temp;

        temp = subtractTwoVectors(temp,o);

        result.length = lenghtOfVector(temp);

        result.doesIntersect = true;
        result.t = t;

        Vec3f BsubA = subtractTwoVectors(b,a);
        Vec3f CsubA = subtractTwoVectors(c,a);
        temp = crossProduct(BsubA,CsubA);
        result.normalT = makeItUnit(temp);
        result.material_id = triangle.material_id;
        return result;
    }
    else
        result.doesIntersect = false;
    return result;

}


Intersect checkIntersectionSphere(Vec3f &d,Vec3f &o,Sphere &sphere) {
    Intersect result;
    Vec3f temp;
    float A, B, C;
    Vec3f c = scene.vertex_data[sphere.center_vertex_id - 1];
    Vec3f OsubC;
    OsubC.x = o.x - c.x;
    OsubC.y = o.y - c.y;
    OsubC.z = o.z - c.z;

    A = dotProduct(d,d);
    B = 2 * dotProduct(d, OsubC);
    C = dotProduct(OsubC, OsubC) - pow(sphere.radius,2);

    float discr = B * B - 4 * A * C;

    if(discr >= 0) {
        float t = (-1*B - sqrt(discr)) / (2*A);
        if(t > 0){
            result.t = t;
            result.doesIntersect = true;

            temp.x = d.x * t + o.x;
            temp.y = d.y * t + o.y;
            temp.z = d.z * t + o.z;
            result.intersectionPoint = temp;
            temp = subtractTwoVectors(temp, o);
            result.length = lenghtOfVector(temp);
            temp = subtractTwoVectors(result.intersectionPoint, c);
            result.normalT = makeItUnit(temp);
            result.material_id = sphere.material_id;
        } else {
            result.doesIntersect = false;
        }
    } else
        result.doesIntersect = false;
    return result;
}

Vec3f initializeVector(Vec3f &vector){
    vector.x = 0;
    vector.y = 0;
    vector.z = 0;
    return vector;
}


Intersect checkAllIntersections(Vec3f &vectorD, Vec3f &position){
    int meshCount = scene.meshes.size();
    int sphereCount = scene.spheres.size();
    int triangleCount = scene.triangles.size();

    Intersect tempIntersectionPoint;
    Intersect minIntersectPoint;

    minIntersectPoint.t = INT_MAX;
    minIntersectPoint.length = INT_MAX;
    minIntersectPoint.doesIntersect = false;

    for (int t = 0; t < triangleCount; ++t) {
        tempIntersectionPoint = checkIntersectionTriangle(vectorD, position, scene.triangles[t]);
        if(tempIntersectionPoint.doesIntersect) {
            if(minIntersectPoint.length >= tempIntersectionPoint.length) {
                minIntersectPoint = tempIntersectionPoint;
            }
        }
    }

    for (int t = 0; t < meshCount; ++t) {
        float faceCount= scene.meshes[t].faces.size();
        for (int m = 0; m < faceCount; ++m) {
            Triangle tempTriangle;
            tempTriangle.material_id = scene.meshes[t].material_id;
            tempTriangle.indices = scene.meshes[t].faces[m];
            tempIntersectionPoint = checkIntersectionTriangle(vectorD,position, tempTriangle);
            if(tempIntersectionPoint.doesIntersect) {
                if(minIntersectPoint.length >= tempIntersectionPoint.length) {
                    minIntersectPoint = tempIntersectionPoint;
                }
            }
        }
    }

    for (int s = 0; s < sphereCount; ++s) {
        tempIntersectionPoint = checkIntersectionSphere(vectorD, position,scene.spheres[s]);
        if(tempIntersectionPoint.doesIntersect){
            if(minIntersectPoint.length >= tempIntersectionPoint.length) {
                minIntersectPoint = tempIntersectionPoint;
            }
        }
    }

    return minIntersectPoint;
}


Vec3f colorize(Intersect &minIntersectPoint, Vec3f &o, int depth) {

    Vec3f result, wi, wiUnit, hVector, hVectorUnit, w0, w0Unit, shiftedPosition, wR, wRUnit;
        /* code */
    Vec3f diffShading, ambientShading, specShading;
    diffShading = initializeVector(diffShading);
    specShading = initializeVector(specShading);
    Intersect shadowIntersect;
    Vec3f diffuse = scene.materials[minIntersectPoint.material_id-1].diffuse;
    Vec3f ambient = scene.materials[minIntersectPoint.material_id-1].ambient;
    Vec3f specular = scene.materials[minIntersectPoint.material_id-1].specular;
    Vec3f mirror = scene.materials[minIntersectPoint.material_id-1].mirror;
    float phong_exponent = scene.materials[minIntersectPoint.material_id-1].phong_exponent;
    float lightDistance, tempCompare;
    int totalLightSource = scene.point_lights.size();
    float cosTheta, cosAlpha, tempLength;
    result.x = 0;
    result.y = 0;
    result.z = 0;

    // AMBIENT COMPONENT
    ambientShading.x = ambient.x * scene.ambient_light.x;
    ambientShading.y = ambient.y * scene.ambient_light.y;
    ambientShading.z = ambient.z * scene.ambient_light.z;


    result.x = result.x + ambientShading.x;
    result.y = result.y + ambientShading.y;
    result.z = result.z + ambientShading.z;

    w0 = subtractTwoVectors(o, minIntersectPoint.intersectionPoint);
    w0Unit = makeItUnit(w0);

    for (size_t i = 0; i < totalLightSource; i++) {


        wi = subtractTwoVectors(scene.point_lights[i].position ,minIntersectPoint.intersectionPoint);
        lightDistance = lenghtOfVector(wi);
        wiUnit = makeItUnit(wi);


        shiftedPosition.x = minIntersectPoint.intersectionPoint.x + (wiUnit.x * scene.shadow_ray_epsilon);
        shiftedPosition.y = minIntersectPoint.intersectionPoint.y + (wiUnit.y * scene.shadow_ray_epsilon);
        shiftedPosition.z = minIntersectPoint.intersectionPoint.z + (wiUnit.z * scene.shadow_ray_epsilon);

        shadowIntersect = checkAllIntersections(wiUnit, shiftedPosition);

        // !shadowIntersect.doesIntersect &&

        if (lightDistance < shadowIntersect.length && shadowIntersect.length > 0) {
            // DIFFUSE COMPONENT
            tempCompare = dotProduct(wiUnit, minIntersectPoint.normalT);
            cosTheta = tempCompare > 0 ? tempCompare : 0;
            diffShading.x = (diffuse.x * cosTheta * scene.point_lights[i].intensity.x) / pow(lightDistance, 2);
            diffShading.y = (diffuse.y * cosTheta * scene.point_lights[i].intensity.y) / pow(lightDistance, 2);
            diffShading.z = (diffuse.z * cosTheta * scene.point_lights[i].intensity.z) / pow(lightDistance, 2);

            // SPECULAR COMPONENT

            hVector.x = w0Unit.x + wiUnit.x;
            hVector.y = w0Unit.y + wiUnit.y;
            hVector.z = w0Unit.z + wiUnit.z;
            hVectorUnit = makeItUnit(hVector);
            tempCompare = dotProduct(minIntersectPoint.normalT, hVectorUnit);
            cosAlpha = tempCompare > 0 ? tempCompare : 0;
            specShading.x = (specular.x * pow(cosAlpha, scene.materials[minIntersectPoint.material_id-1].phong_exponent) * scene.point_lights[i].intensity.x) / pow(lightDistance, 2);
            specShading.y = (specular.y * pow(cosAlpha, scene.materials[minIntersectPoint.material_id-1].phong_exponent) * scene.point_lights[i].intensity.y) / pow(lightDistance, 2);
            specShading.z = (specular.z * pow(cosAlpha, scene.materials[minIntersectPoint.material_id-1].phong_exponent) * scene.point_lights[i].intensity.z) / pow(lightDistance, 2);

            // RESULT

            result.x = result.x + diffShading.x + specShading.x;
            result.y = result.y + diffShading.y + specShading.y;
            result.z = result.z + diffShading.z + specShading.z;




       }



    }
    if (depth > 0) {

        wR.x = (-1) * w0Unit.x + 2 * (minIntersectPoint.normalT.x) * dotProduct(minIntersectPoint.normalT,w0Unit);
        wR.y = (-1) * w0Unit.y + 2 * (minIntersectPoint.normalT.y) * dotProduct(minIntersectPoint.normalT,w0Unit);
        wR.z = (-1) * w0Unit.z + 2 * (minIntersectPoint.normalT.z) * dotProduct(minIntersectPoint.normalT,w0Unit);
        wRUnit = makeItUnit(wR);
        //

        shiftedPosition.x = minIntersectPoint.intersectionPoint.x + (wRUnit.x * scene.shadow_ray_epsilon);
        shiftedPosition.y = minIntersectPoint.intersectionPoint.y + (wRUnit.y * scene.shadow_ray_epsilon);
        shiftedPosition.z = minIntersectPoint.intersectionPoint.z + (wRUnit.z * scene.shadow_ray_epsilon);


        Intersect newPoint = checkAllIntersections(wRUnit, shiftedPosition);
     //    shiftedPosition.x = minIntersectPoint.intersectionPoint.x + (wRUnit.x * scene.shadow_ray_epsilon);
     //    shiftedPosition.y = minIntersectPoint.intersectionPoint.y + (wRUnit.y * scene.shadow_ray_epsilon);
     //    shiftedPosition.z = minIntersectPoint.intersectionPoint.z + (wRUnit.z * scene.shadow_ray_epsilon);

        //
        if(newPoint.doesIntersect && newPoint.length > 0 ) {
            Vec3f addedRgb = colorize(newPoint, shiftedPosition, depth-1);
            result.x += scene.materials[minIntersectPoint.material_id-1].mirror.x * addedRgb.x;
            result.y += scene.materials[minIntersectPoint.material_id-1].mirror.y * addedRgb.y;
            result.z += scene.materials[minIntersectPoint.material_id-1].mirror.z * addedRgb.z;
        }
    }


    // mirrorFunction(w0Unit,minIntersectPoint,scene.max_recursion_depth);
    return result;

}



int main(int argc, char* argv[])
{
    scene.loadFromXml(argv[1]);

    // The code below creates a test pattern and writes
    // it to a PPM file to demonstrate the usage of the
    // ppm_write function.

    const RGB BAR_COLOR[8] =
{
        { 255, 255, 255 },  // 100% White
        { 255, 255,   0 },  // Yellow
        {   0, 255, 255 },  // Cyan
        {   0, 255,   0 },  // Green
        { 255,   0, 255 },  // Magenta
        { 255,   0,   0 },  // Red
        {   0,   0, 255 },  // Blue
        {   0,   0,   0 },  // Black
    };


    Vec3f color;
    Vec3f pointM;
    Vec3f pointQ;
    Vec3f pointS;
    Vec3f vectorU;
    Vec3f vectorD;
    Intersect result;
    float sU, sV;


    int cameraSize = scene.cameras.size();

    for (int c = 0; c < cameraSize; ++c) {
        scene.cameras[c].gaze = makeItUnit(scene.cameras[c].gaze);
        scene.cameras[c].up = makeItUnit(scene.cameras[c].up);
        pointM = calculatePointM(scene.cameras[c]);
        vectorU = crossProduct(scene.cameras[c].gaze, scene.cameras[c].up);
        vectorU = makeItUnit(vectorU);
        pointQ = calculatePointQ(scene.cameras[c], vectorU, pointM);

        int width = scene.cameras[c].image_width, height = scene.cameras[c].image_height;
        unsigned char* image = new unsigned char [width * height * 3];

        int rgbCounter = 0;
        for (int j = 0; j < height; ++j)
        {
            for (int i = 0; i < width; ++i)
            {

                sU = (scene.cameras[c].near_plane.y - scene.cameras[c].near_plane.x) * (i + 0.5) / width;
                sV = (scene.cameras[c].near_plane.w - scene.cameras[c].near_plane.z) * (j + 0.5) / height;
                pointS = calculatePointS(pointQ, sU, sV, scene.cameras[c], vectorU);
                vectorD = subtractTwoVectors(pointS, scene.cameras[c].position);

                result = checkAllIntersections(vectorD,scene.cameras[c].position);
                if(result.doesIntersect) {

                    color = colorize(result, scene.cameras[c].position, scene.max_recursion_depth );
                    image[rgbCounter++] = ((int) color.x > 255) ? 255 : ((int) color.x);
                    image[rgbCounter++] = ((int) color.y > 255) ? 255 : ((int) color.y);
                    image[rgbCounter++] = ((int) color.z > 255) ? 255 : ((int) color.z);

                } else{
                    image[rgbCounter++] = scene.background_color.x;
                    image[rgbCounter++] = scene.background_color.y;
                    image[rgbCounter++] = scene.background_color.z;
                }


            }
        }
        char* char_array;
        strcpy(char_array, scene.cameras[c].image_name.c_str());
        write_ppm(char_array, image, width, height);
    }
}
