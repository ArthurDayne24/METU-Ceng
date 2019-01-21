#include "parser.h"
#include <math.h>

parser::Vec3i operator*(parser::Vec3i v, double i) {
    return (parser::Vec3i) {(int) round(i) * v.x, (int) round(i) * v.y, (int) round(i) * v.z};
};

parser::Vec3i operator*(parser::Vec3i v, float i) {
    return (parser::Vec3i) {(int) round(i) * v.x, (int) round(i) * v.y, (int) round(i) * v.z};
};