#version 410
layout(location = 0) in vec3 position;
uniform mat4 MVP;
uniform mat4 MV;
uniform vec4 cameraPosition;
uniform vec4 lightPosition;
uniform float heightFactor;
uniform mat4 inverseTransposeV;
uniform sampler2D rgbTexture;
uniform int widthTexture;
uniform int heightTexture;

out vec2 textureCoordinate;
out vec3 vertexNormal;
out vec3 ToLightVector;
out vec3 ToCameraVector;

vec2 txtrColor;
vec4 finalTxtrColor;
vec4 neighbourPosition[6];
int neighbourOrder[9];
vec3 normalVector = vec3(0,0,0);
vec4 calculatedNeighbour;

vec2 regionType(vec4 regionPosition) {
	vec2 regionInfo = vec2(0,0);

	if (regionPosition.x > 0 && regionPosition.x < widthTexture) {
		if (regionPosition.z > 0 && regionPosition.z < heightTexture) {
			return vec2(1,6);
		} else if (regionPosition.z == heightTexture) {
			return vec2(5,4);
		} else {
			return vec2(2,4);
		}
	} else if (regionPosition.x == widthTexture) {
		if (regionPosition.z > 0 && regionPosition.z < heightTexture) {
			return vec2(0,4);
		} else if (regionPosition.z == heightTexture) {
			return vec2(0,3);
		} else {
			return vec2(2,2);
		}
	} else {
		if (regionPosition.z > 0 && regionPosition.z < heightTexture) {
			return vec2(3,4);
		} else if (regionPosition.z == heightTexture) {
			return vec2(5,2);
		} else {
			return vec2(3,3);
		}
	}
}

vec4 calculateNeighbour(vec2 regionInfo, int i) {
	calculatedNeighbour = neighbourPosition[neighbourOrder[int(regionInfo.x) + i]];
	finalTxtrColor = texture(rgbTexture, vec2(1 - (calculatedNeighbour.x / widthTexture), 1 - (calculatedNeighbour.z / heightTexture)));
	calculatedNeighbour.y = heightFactor * (0.2126 * finalTxtrColor.r + 0.7152 * finalTxtrColor.g + 0.0722 * finalTxtrColor.b);
	return calculatedNeighbour;
}


void main()
{
	// CHECKED AND WORKING
	textureCoordinate = vec2(1 - (position.x / widthTexture), 1 - (position.z / heightTexture));
	vec4 colorOfTxtr = texture(rgbTexture, vec2(1 - (position.x / widthTexture), 1 - (position.z / heightTexture)));
	vec4 initialVector = vec4(position.x, heightFactor * (0.2126 * colorOfTxtr.r + 0.7152 * colorOfTxtr.g + 0.0722 * colorOfTxtr.b),position.z, 1);
	ToCameraVector = normalize(vec3(MV * vec4(cameraPosition.xyz - initialVector.xyz,0)));
	ToLightVector = normalize(vec3(MV * vec4(lightPosition.xyz - initialVector.xyz,0)));
	for (int i = 0; i < 9; i++) {
		neighbourOrder[i] = i % 6;
	}
	neighbourPosition[0] = vec4(initialVector.x    , 0, initialVector.z - 1, 1);
	neighbourPosition[1] = vec4(initialVector.x - 1, 0, initialVector.z - 1, 1);
	neighbourPosition[2] = vec4(initialVector.x - 1, 0, initialVector.z    , 1);
	neighbourPosition[3] = vec4(initialVector.x    , 0, initialVector.z + 1, 1);
	neighbourPosition[4] = vec4(initialVector.x + 1, 0, initialVector.z + 1, 1);
	neighbourPosition[5] = vec4(initialVector.x + 1, 0, initialVector.z    , 1);
	vec2 regionInfo = regionType(initialVector);
	int totalNeighbour = int(regionInfo.y);
	vec4 neighbourArray[6];
	for (int i = 0; i < 6; i++) {
		neighbourArray[i] = vec4(0,0,0,1);
	}
	for (int i = 0; i < totalNeighbour; i++) {
		neighbourArray[i] = calculateNeighbour(regionInfo, i);
	}

	if (totalNeighbour < 4) {
		normalVector += cross(vec3(neighbourArray[0]-initialVector), vec3(neighbourArray[1]-initialVector)) +
		cross(vec3(neighbourArray[1]-initialVector), vec3(neighbourArray[2]-initialVector));
	} else if (totalNeighbour < 5) {
		normalVector += cross(vec3(neighbourArray[0]-initialVector), vec3(neighbourArray[1]-initialVector)) +
		cross(vec3(neighbourArray[1]-initialVector), vec3(neighbourArray[2]-initialVector)) +
		cross(vec3(neighbourArray[2]-initialVector), vec3(neighbourArray[3]-initialVector));
	} else {
		normalVector += cross(vec3(neighbourArray[0]-initialVector), vec3(neighbourArray[1]-initialVector)) +
		cross(vec3(neighbourArray[1]-initialVector), vec3(neighbourArray[2]-initialVector)) +
		cross(vec3(neighbourArray[2]-initialVector), vec3(neighbourArray[3]-initialVector)) +
		cross(vec3(neighbourArray[3]-initialVector), vec3(neighbourArray[4]-initialVector)) +
        cross(vec3(neighbourArray[4]-initialVector), vec3(neighbourArray[5]-initialVector)) +
        cross(vec3(neighbourArray[5]-initialVector), vec3(neighbourArray[0]-initialVector));
	}
	vertexNormal = normalize(vec3( transpose(inverse(MV)) * vec4(normalize(normalVector),0) ));
	gl_Position = MVP * initialVector;
	// CHECKED AND WORKING
}
