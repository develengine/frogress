#version 460 core

layout(location = 0) in vec3 i_position;
layout(location = 1) in vec3 i_normals;
layout(location = 2) in vec2 i_texCoords;

layout(location = 0) out vec3 o_normals;
layout(location = 1) out vec3 o_position;
layout(location = 2) out vec2 o_texCoords;

uniform mat4 u_mvpMat;
uniform mat4 u_modMat;

void main() {
    vec4 position = u_modMat * vec4(i_position, 1.0);
    gl_Position = u_mvpMat * position;

    o_normals = mat3(transpose(inverse(u_modMat))) * i_normals;
    o_position = position.xyz;

    o_texCoords = i_texCoords;
}
