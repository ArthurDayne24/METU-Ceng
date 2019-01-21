#include <ostream>
#include "helper.h"
#include "glm/ext.hpp"
#include "glm/glm.hpp"

#define HEIGHTCHANGE 0.5f
#define PITCHCHANGE 0.20f
#define YAWCHANGE 0.20f
#define CHANGESPEED 0.30f


GLuint idProgramShader;
GLuint idFragmentShader;
GLuint idVertexShader;
GLuint idJpegTexture;
GLuint idMVPMatrix;
GLint mvLocation;
GLint mvpLocation;
GLint lightPosition;
GLint shaderLocation;
GLint heightFactorShade;
GLint widthTextureShade;
GLint heightTextureShade;

static GLFWwindow *win = NULL;

GLFWvidmode *mode;
const GLFWmonitor *currentScreen;

float heightFactor = 10.0;
float perspectiveAngle  = 45.0;
float aspectRatio = 1;

float nearDistance = 0.1;
float farDistance = 1000.0;
float speed = 0.0;
bool screenAlter = false;

int widthImagePlane, heightImagePlane;
int textureWidth, textureHeight;


static void errorCallback(int error, const char *description) {
    fprintf(stderr, "Error: %s\n", description);
}


glm::vec3 cameraPos;
glm::vec3 cameraUpVec = glm::vec3(0.0, 1.0, 0.0);
glm::vec3 cameraGazeVec = glm::vec3(0.0, 0.0, 1.0);
glm::vec3 uVector = glm::vec3(-1.0, 0.0, 0.0);
glm::vec3 *vertexArray;

glm::mat4 modelM;
glm::mat4 viewM;
glm::mat4 projectionM;
glm::mat4 mv;
glm::mat4 mvp;
glm::mat4 movementMatrix;
int prevWidth, prevHeight;
int verticeCount;


void shaderAdjustment() {
	cameraPos += (speed * cameraGazeVec);
	glViewport(0, 0, widthImagePlane, heightImagePlane);
	projectionM = glm::perspective(perspectiveAngle, aspectRatio, nearDistance, farDistance);
	viewM = glm::lookAt(cameraPos, glm::vec3(cameraPos.x + cameraGazeVec.x * nearDistance, cameraPos.y + cameraGazeVec.y * nearDistance, cameraPos.z + cameraGazeVec.z * nearDistance),cameraUpVec);
	modelM = glm::mat4(1.0f);
	mv = viewM * modelM;
	mvp = projectionM * viewM * modelM;

	mvLocation = glGetUniformLocation(idProgramShader, "MV");
	glUniformMatrix4fv(mvLocation, 1, GL_FALSE, &mv[0][0]);

	mvpLocation = glGetUniformLocation(idProgramShader, "MVP");
	glUniformMatrix4fv(mvpLocation, 1, GL_FALSE, &mvp[0][0]);

	lightPosition = glGetUniformLocation(idProgramShader, "lightPosition");
	glm::vec4 vec = glm::vec4((float) textureWidth / 2.0, (float) textureWidth + (float) textureHeight, (float) textureHeight / 2.0,1);
	glUniform4fv(lightPosition, 1, &vec.x);

	shaderLocation = glGetUniformLocation(idProgramShader, "cameraPosition");
	glm::vec4 cameraPosition4 = glm::vec4(cameraPos, 1);
	glUniform4fv(shaderLocation, 1, &cameraPosition4.x);

	heightFactorShade = glGetUniformLocation(idProgramShader, "heightFactor");
	glUniform1f(heightFactorShade, heightFactor);

	widthTextureShade = glGetUniformLocation(idProgramShader, "widthTexture");
	glUniform1i(widthTextureShade, textureWidth);

	heightTextureShade = glGetUniformLocation(idProgramShader, "heightTexture");
	glUniform1i(heightTextureShade, textureHeight);

}


void createMeshData(int width, int height) {
    verticeCount = 6 * width * height;
    vertexArray = new glm::vec3[verticeCount];
    int verticeCount = 0;
    for (int i = 0; i < width-1; i++) {
        for (int j = 0; j < height-1; j++) {
            vertexArray[verticeCount++] = glm::vec3(i, 0, j);
            vertexArray[verticeCount++] = glm::vec3(i + 1, 0, j + 1);
            vertexArray[verticeCount++] = glm::vec3(i + 1, 0, j);
            vertexArray[verticeCount++] = glm::vec3(i, 0, j);
            vertexArray[verticeCount++] = glm::vec3(i, 0, j + 1);
            vertexArray[verticeCount++] = glm::vec3(i + 1, 0, j + 1);
        }
    }
}

void renderImage() {
    glEnableClientState(GL_VERTEX_ARRAY);
    glVertexPointer(3, GL_FLOAT, 0, vertexArray);
    glDrawArrays(GL_TRIANGLES, 0, verticeCount);
    glDisableClientState(GL_VERTEX_ARRAY);
}


static void keyBindings(GLFWwindow *window, int key, int scancode, int action, int mods) {
    if (action == GLFW_REPEAT || action == GLFW_PRESS) {
		if (key == GLFW_KEY_ESCAPE) {
			glfwSetWindowShouldClose(window, GLFW_TRUE);
		} else if (key == GLFW_KEY_W) {
			cameraGazeVec = glm::rotate(cameraGazeVec, glm::radians(PITCHCHANGE), uVector);
			cameraUpVec = glm::rotate(cameraUpVec, glm::radians(PITCHCHANGE), uVector);
		} else if (key == GLFW_KEY_S) {
			cameraGazeVec = glm::rotate(cameraGazeVec, glm::radians(-PITCHCHANGE), uVector);
			cameraUpVec = glm::rotate(cameraUpVec, glm::radians(-PITCHCHANGE), uVector);
		} else if (key == GLFW_KEY_A) {
			cameraGazeVec = glm::rotate(cameraGazeVec, glm::radians(YAWCHANGE), cameraUpVec);
			uVector = glm::rotate(uVector, glm::radians(YAWCHANGE), cameraUpVec);
		} else if (key == GLFW_KEY_D) {
			cameraGazeVec = glm::rotate(cameraGazeVec, glm::radians(-YAWCHANGE), cameraUpVec);
			uVector = glm::rotate(uVector, glm::radians(-YAWCHANGE), cameraUpVec);
		} else if (key == GLFW_KEY_U) {
			speed += CHANGESPEED;
		} else if (key == GLFW_KEY_J) {
			speed -= CHANGESPEED;
		} else if (key == GLFW_KEY_O) {
			heightFactor += HEIGHTCHANGE;
		} else if (key == GLFW_KEY_L) {
			heightFactor -= HEIGHTCHANGE;
		} else if (key == GLFW_KEY_F) {
			if (screenAlter) {
				glfwSetWindowMonitor(window, nullptr, 0, 0, prevWidth, prevHeight, 0);
				screenAlter = false;
			} else {
				prevWidth = widthImagePlane;
				prevHeight = heightImagePlane;
				glfwSetWindowMonitor(window, const_cast<GLFWmonitor *>(currentScreen), 0, 0, mode->width, mode->height, mode->refreshRate);
				screenAlter = true;
			}
		} else {
			return;
		}
    }
}

void changeWindowSize(GLFWwindow *win, int width, int height) {
    widthImagePlane = width;
    heightImagePlane = height;
}

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Only one texture image expected!\n");
        exit(-1);
    }

    glfwSetErrorCallback(errorCallback);

    if (!glfwInit()) {
        exit(-1);
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_COMPAT_PROFILE);
    widthImagePlane = 600;
    heightImagePlane = 600;
    win = glfwCreateWindow(widthImagePlane, heightImagePlane, "HW3", NULL, NULL);
    if (!win) {
        glfwTerminate();
        exit(-1);
    }

    glfwMakeContextCurrent(win);

    GLenum err = glewInit();
    if (err != GLEW_OK) {
        fprintf(stderr, "Error: %s\n", glewGetErrorString(err));
        glfwTerminate();
        exit(-1);
    }

	initShaders();
	glUseProgram(idProgramShader);
	initTexture(argv[1], &textureWidth, &textureHeight);

    glfwSetKeyCallback(win, keyBindings);
    glfwSetWindowSizeCallback(win, changeWindowSize);

    currentScreen = glfwGetPrimaryMonitor();
    mode = const_cast<GLFWvidmode *>(glfwGetVideoMode(const_cast<GLFWmonitor *>(currentScreen)));
	glfwGetWindowSize( win, &widthImagePlane, &heightImagePlane);


    createMeshData(textureWidth, textureHeight);
	cameraPos = glm::vec3(textureWidth / 2, textureWidth / 10, -(textureWidth / 4));
	shaderAdjustment();


    glEnable(GL_DEPTH_TEST);
	glShadeModel(GL_SMOOTH);
    while (!glfwWindowShouldClose(win)) {
		glClearColor(0, 0, 0, 1);
		glClearDepth(1.0f);
		glClearStencil(0);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
        renderImage();
        glfwSwapBuffers(win);
        glfwPollEvents();
		shaderAdjustment();
		glfwSwapBuffers(win);
		glfwPollEvents();
		glFlush();
    }
    glfwDestroyWindow(win);
    glfwTerminate();
    return 0;
}
