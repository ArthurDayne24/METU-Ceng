/*
#include <iostream>
#include <math.h>
#include "raytracer.h"
#include "parser.h"
#include "ppm.h"

int cameraCount;
int sphereCount;
typedef unsigned int RGB[3];

int[] findMPoint(){

}


int main(int argc, char *argv[]){



    scene.loadFromXml(argv[1]);

    parser::Camera camera;

    cameraCount = scene.cameras.size();

    std::cout << "Camera Count :  " << cameraCount << std::endl;
    sphereCount = scene.spheres.size();
    std::cout << "Sphere Count :  " << sphereCount<< std::endl;

    startFacePreparing();


}*/



/*

if(c < triangleCount){
if(checkIntersection(scene.vertex_data, scene.triangles[c].indices, camera.position, vectorD)){
bol = true;
}
}
else{
int index = c-triangleCount;
for (int h = 0; h <  scene.meshes[index].faces.size(); ++h) {
if(checkIntersection(scene.vertex_data, scene.meshes[index].faces[index], camera.position, vectorD)){
bol = true;
}
}
}*/

/*

bool checkIntersection(vector<parser::Vec3f> vertex_data, parser::Face face, parser::Vec3f position, parser::Vec3f vectorD){
    parser::Vec3f A = vertex_data[face.v0_id-1];
    parser::Vec3f B = vertex_data[face.v1_id-1];
    parser::Vec3f C = vertex_data[face.v2_id-1];*/
