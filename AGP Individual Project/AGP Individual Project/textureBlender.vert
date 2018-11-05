#version 330

// JR
layout (location = 0) in vec4 in_Position; // size vec4 (usual cube) and also match name to in_Position (and in_TexCoord below - these must match the glBindAttribLocation call in the cpp code )
layout (location = 3) in vec2 in_TexCoord; // match the location to RT3D_TEXCOORD in glBindAttribLocation(p,RT3D_TEXCOORD,"in_TexCoord");

uniform mat4 modelview;
uniform mat4 projection;

out vec2 tex_coord0;
out vec2 tex_coord1;

uniform float time;

void main(void)
{
	 mat2 m = mat2(vec2(cos(time), sin(time)),
				    vec2(-sin(time), cos(time)));

	tex_coord0 = in_TexCoord * m;
	tex_coord1 = in_TexCoord * transpose(m);
	gl_Position = projection * modelview * vec4(in_Position.xyz, 1.0);
}