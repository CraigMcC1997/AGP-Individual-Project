#version 330

layout (location = 0) in vec2 in_position;
layout (location = 1) in vec2 in_tex_coord;

uniform mat4 modelview;
uniform mat4 projection;

out vec2 tex_coord0;
out vec2 tex_coord1;

uniform float time;

void main(void)
{
	 mat2 m = mat2(vec2(cos(time), sin(time)),
				    vec2(-sin(time), cos(time)));

	tex_coord0 = in_tex_coord;// * m;
	tex_coord1 = in_tex_coord;// * transpose(m);
	gl_Position = projection * modelview * vec4(in_position, 0.5, 1.0);
}