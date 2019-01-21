/*
#include <iostream>
#include "parser.h"
#include "ppm.h"
#include <vector>
#include <math.h>
#include <limits.h>

typedef unsigned char RGB[3];

using namespace std;
using namespace parser;


struct Intersect{
    bool doesIntersect;
    int material_id;
    float length;
    Vec3f normalT;
    Vec3f intersectionPoint;
};



Vec3f crossProduct(Vec3f &first, Vec3f &second){
    Vec3f temp;
    temp.x = first.y * second.z - first.z * second.y;
    temp.y = (first.z * second.x - first.x * second.z);
    temp.z = first.x * second.y - first.y * second.x;
    return temp;
}

void calculateM(Vec3f *M,Vec3f &gaze, Vec3f &position, float distance){
    M->x = position.x + gaze.x * distance ;
    M->y = position.y + gaze.y * distance ;
    M->z = position.z + gaze.z * distance ;

    cout << "M.x :  " << M->x << endl;
    cout << "M.y :  " << M->y << endl;
    cout << "M.z :  " << M->z << endl;
    cout << "-------------" << endl;
}

void calculateS(Vec3f *S, Vec3f &Q, float sU, float sV, Vec3f &vVector, Vec3f &uVector){
    S->x = Q.x + sU *uVector.x - sV *vVector.x;
    S->y = Q.y + sU *uVector.y - sV *vVector.y;
    S->z = Q.z + sU *uVector.z - sV *vVector.z;
}

void calculateQ(Vec3f *Q, Vec3f &M, Camera &camera, Vec3f &uVector){

    cout << "      uVector.x :  " <<uVector.x << endl;
    cout << "      uVector.y :  " <<uVector.y << endl;
    cout << "      uVector.z :  " <<uVector.z << endl;

    cout << endl;
    cout << "      ---Find t * v ---" << endl;
    Vec3f VmultT;
    VmultT.x = camera.near_plane.w * camera.up.x;
    VmultT.y = camera.near_plane.w * camera.up.y;
    VmultT.z = camera.near_plane.w * camera.up.z;

    cout << "      VmultT.x :  " <<VmultT.x << endl;
    cout << "      VmultT.y :  " <<VmultT.y << endl;
    cout << "      VmultT.z :  " <<VmultT.z << endl;

    cout << endl;
    cout << "      ---Find l * u ---" << endl;

    Vec3f UmultL;
    UmultL.x = camera.near_plane.x * uVector.x;
    UmultL.y = camera.near_plane.x * uVector.y;
    UmultL.z = camera.near_plane.x * uVector.z;


    cout << "      UmultL.x :  " <<UmultL.x << endl;
    cout << "      UmultL.y :  " <<UmultL.y << endl;
    cout << "      UmultL.z :  " <<UmultL.z << endl;

    cout << endl;
    cout << "---   Q   ---" << endl;

    Q->x = M.x + UmultL.x + VmultT.x;
    Q->y = M.y + UmultL.y + VmultT.y;
    Q->z = M.z + UmultL.z + VmultT.z;

    cout << "Q.x :  " <<Q->x << endl;
    cout << "Q.y :  " <<Q->y << endl;
    cout << "Q.z :  " <<Q->z << endl;
}

void calculateD(Vec3f *vectorD, Vec3f &S, Vec3f &position){
    vectorD->x = S.x - position.x;
    vectorD->y = S.y - position.y;
    vectorD->z = S.z - position.z;
}

float calculateDet(float a,float b,float c,float d,float e,float f,float g,float h,float i){
    float first = a* ((e*i)-(f*h));
    float second = b* ((f*g)-(d*i));
    float third = c * ((d*h)-(g*e));
    return first +second +third;
}

Intersect checkIntersection(vector<Vec3f> &vertex_data, Face &face, Vec3f &position, Vec3f &vectorD){
    Intersect tempT;
    Vec3f A = vertex_data[face.v0_id-1];
    Vec3f B = vertex_data[face.v1_id-1];
    Vec3f C = vertex_data[face.v2_id-1];

    float detA = calculateDet(
            A.x-B.x, A.x-C.x, vectorD.x,
            A.y-B.y, A.y-C.y, vectorD.y,
            A.z-B.z, A.z-C.z, vectorD.z);

    float beta = calculateDet(
            A.x-position.x, A.x-C.x, vectorD.x,
            A.y-position.y, A.y-C.y, vectorD.y,
            A.z-position.z, A.z-C.z, vectorD.z)
                 /detA;

    float gama = calculateDet(
            A.x-B.x, A.x-position.x, vectorD.x,
            A.y-B.y, A.y-position.y, vectorD.y,
            A.z-B.z, A.z-position.z, vectorD.z)
                 /detA;

    float t = calculateDet(
            A.x-B.x, A.x-C.x, A.x-position.x,
            A.y-B.y, A.y-C.y, A.y-position.y,
            A.z-B.z, A.z-C.z, A.z-position.z)
              /detA;

    if((t>0) && (beta +gama <= 1) && (0<=beta) && (0 <= gama)){
        tempT.length = t;
        tempT.doesIntersect = true;
    } else{
        tempT.doesIntersect = false;
    }
    return tempT;
}

float dotProduct(Vec3f &v1,Vec3f &v2){
    return v1.x*v2.x + v1.y*v2.y + v1.z*v2.z;
}

Vec3f subVectors(Vec3f &v1,Vec3f &v2){
    Vec3f result;
    result.x = v1.x - v2.x;
    result.y = v1.y - v2.y;
    result.z = v1.z - v2.z;
    return result;
}


float lenghtOfVector(Vec3f &vector){
    float lenU = sqrt(pow(vector.x,2) + pow(vector.y,2) + pow(vector.z,2) );
    return lenU;
}

Vec3f makeItUnit(Vec3f &vector){
    float lenU = lenghtOfVector(vector);
    vector.x = vector.x/lenU;
    vector.y = vector.y/lenU;
    vector.z = vector.z/lenU;
    return vector;
}

Intersect checkSphereIntersection(Vec3f &C, float R, Vec3f &O, Vec3f &D ){
    Intersect tempT;
    Vec3f OeksiC = subVectors(O,C);
    float A = dotProduct(D,D);
    float B = 2 * dotProduct(D,OeksiC);
    float c = dotProduct(OeksiC,OeksiC) - pow(R,2);

    float diskriminant = pow(B,2) - 4*A*c;


    if(diskriminant >= 0){

        float t1 = (-1*B -1*sqrt(diskriminant))/(2*A);
        float t2 = (-1*B +sqrt(diskriminant))/(2*A);

        if(t1>0 && t2 >0){

            if(t1<t2){
                tempT.length = t1;
                tempT.doesIntersect = true;
                tempT.intersectionPoint.x = O.x + D.x*t1;
                tempT.intersectionPoint.y = O.y + D.y*t1;
                tempT.intersectionPoint.z = O.z + D.z*t1;

                Vec3f temp = subVectors(tempT.intersectionPoint,C);
                tempT.normalT = makeItUnit(temp);
            } else{

                tempT.length = t2;
                tempT.doesIntersect = true;
                tempT.intersectionPoint.x = O.x + D.x*t2;
                tempT.intersectionPoint.y = O.y + D.y*t2;
                tempT.intersectionPoint.z = O.z + D.z*t2;

                Vec3f temp = subVectors(tempT.intersectionPoint,C);
                tempT.normalT = makeItUnit(temp);
            }
        } else{
            tempT.doesIntersect = false;
        }
    } else{
        tempT.doesIntersect = false;
    }

    return tempT;



}

Intersect changeMinT(Intersect &minT, Vec3f &position,Vec3f &vectorD, Intersect &tempT,Face &face,int material_id, vector<Vec3f> &vertex_data){

    minT.length = tempT.length;

    Vec3f A = vertex_data[face.v0_id-1];
    Vec3f B = vertex_data[face.v1_id-1];
    Vec3f C = vertex_data[face.v2_id-1];

    Vec3f temp1 = subVectors(B,A);
    Vec3f temp2 = subVectors(C,A);
    Vec3f temp3 = crossProduct(temp1,temp2);
    minT.normalT = makeItUnit(temp3);


    minT.intersectionPoint.x = position.x + vectorD.x*minT.length;
    minT.intersectionPoint.y = position.y + vectorD.y*minT.length;
    minT.intersectionPoint.z = position.z + vectorD.z*minT.length;


    minT.material_id = material_id;
    return minT;
}

Vec3f colorize(
        Intersect &intersect,
        vector<PointLight> &pointLights,
        Material &material,
        Vec3f &ambientLight,
        float shadowRayEpsilon,
        int maxRecursionDepth){

    // DIFFUSE SHADING

    Vec3f temp = subVectors(pointLights[0].position, intersect.intersectionPoint);
    Vec3f wI = makeItUnit(temp);

    float distanceBetweenLigthAndPoint = lenghtOfVector(temp);
    float dotResult = dotProduct(wI,intersect.normalT);
    float kosTETA = dotResult > 0 ? dotResult : 0;

    Vec3f diffuse;
    diffuse.x= material.diffuse.x * kosTETA * pointLights[0].intensity.x/pow(distanceBetweenLigthAndPoint,2);
    diffuse.y= material.diffuse.y * kosTETA * pointLights[0].intensity.y/pow(distanceBetweenLigthAndPoint,2);
    diffuse.z= material.diffuse.z * kosTETA * pointLights[0].intensity.z/pow(distanceBetweenLigthAndPoint,2);

    // DIFFUSE SHADING






    return diffuse;

}


int main(int argc, char* argv[])
{
    // Sample usage for reading an XML scene file
    Scene scene;

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



    Vec3f M;
    Vec3f Q;
    Vec3f S;
    float sU, sV;
    int triangleCount = scene.triangles.size();
    int meshCount = scene.meshes.size();
    int sphereCount = scene.spheres.size();
    //cout << "meshFacesCount ------------> " << meshFacesCount << endl;
    //cout << "triangleCount ----------->  " << triangleCount << endl;

    for (int j = 0; j < scene.cameras.size(); ++j) {
        Camera camera = scene.cameras[j];
        int width = camera.image_width, height = camera.image_height;


        // Find M point
        cout << "---Find M ---" << endl;
        calculateM(&M,camera.gaze, camera.position , camera.near_distance);

        //Find Q point
        cout << "---Find Q ---" << endl;
        cout << "      ---Find vVector ---" << endl;
        Vec3f uVector =  crossProduct(camera.gaze, camera.up);
        uVector = makeItUnit(uVector);
        calculateQ(&Q, M, camera,uVector);


        unsigned char* image = new unsigned char [width * height * 3];
        bool bol = false;
        int i = 0;

        cout << "----------------" << endl;
        int count = 0;
        for (int y = 0; y < height; ++y)
        {
            // cout << "im here " << y << endl;
            for (int x = 0; x < width; ++x)
            {
                Intersect minT;
                minT.length = INT_MAX;
                minT.material_id = INT_MAX;

                Intersect tempT;
                //cout << "x * y " << x*y << endl;

                sU = (camera.near_plane.y - camera.near_plane.x) * (x + 0.5) / width;
                sV = (camera.near_plane.w - camera.near_plane.z) * (y + 0.5) / height;
                calculateS(&S, Q,sU,sV,camera.up,uVector);
                Vec3f vectorD;
                calculateD(&vectorD,S,camera.position);
                //cout << "D ----->  " << vectorD.x <<" "<< vectorD.y << " " << vectorD.z << endl;

                //cout << "true" << endl;


                for (int c = 0; c < triangleCount;++c){
                    tempT = checkIntersection(scene.vertex_data, scene.triangles[c].indices, camera.position, vectorD);
                    if(tempT.doesIntersect){
                        if(minT.length > tempT.length){
                            //cout << " im here" << endl;

                            minT = changeMinT(minT, camera.position,vectorD,tempT,scene.triangles[c].indices,scene.triangles[c].material_id,scene.vertex_data);


                        }
                        bol = true;
                    }
                }
                for (int c = 0; c < meshCount; ++c) {
                    int faceSize = scene.meshes[c].faces.size();
                    for (int v = 0; v < faceSize; ++v) {
                        tempT = checkIntersection(scene.vertex_data, scene.meshes[c].faces[v], camera.position, vectorD);
                        if(tempT.doesIntersect){
                            if(minT.length > tempT.length){
                                minT = changeMinT(minT,camera.position,vectorD,tempT,scene.meshes[c].faces[v],scene.meshes[c].material_id,scene.vertex_data);
                            }
                            bol = true;
                        }
                    }
                }
                for (int c = 0; c < sphereCount; ++c) {
                            //cout << "FUCKFUCKFUCK" << endl;
                    tempT = checkSphereIntersection(scene.vertex_data[scene.spheres[c].center_vertex_id - 1],scene.spheres[c].radius, camera.position, vectorD);
                    if(tempT.doesIntersect){
                        if(minT.length > tempT.length){

                            minT.length = tempT.length;
                            minT.material_id = scene.spheres[c].material_id;
                            minT.normalT = tempT.normalT;
                            minT.intersectionPoint = tempT.intersectionPoint;
                        }
                        bol = true;
                    }
                }




                if(bol){
                    count++;
                    Vec3f RGB  = colorize(
                            minT,
                            scene.point_lights,
                            scene.materials[minT.material_id-1],
                            scene.ambient_light,
                            scene.shadow_ray_epsilon,
                            scene.max_recursion_depth);
                    //cout << "RGB values -- >> " << RGB.x << " - " << RGB.y << " - " << RGB.z << endl;

                    image[i++] = RGB.x;
                    image[i++] = RGB.z;
                    image[i++] = RGB.y;

//                    image[i++] = BAR_COLOR[minT.material_id][0] ;
//                    image[i++] = BAR_COLOR[minT.material_id][1] ;
//                    image[i++] = BAR_COLOR[minT.material_id][2] ;

                    bol = false;
                } else{
                    image[i++] = scene.background_color.x;
                    image[i++] = scene.background_color.y;
                    image[i++] = scene.background_color.z;
                }
            }
        }
        write_ppm(argv[j+2], image, width, height);
    }
}
*/
