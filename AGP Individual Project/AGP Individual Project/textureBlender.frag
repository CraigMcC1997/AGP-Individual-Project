#version 330

in vec2 tex_coord0;
in vec2 tex_coord1;

layout (location = 0) out vec4 color;

uniform sampler2D tex1;
uniform sampler2D tex2;

void main(void)
{
	color = (0.3*texture(tex1, tex_coord0) + 0.7*texture(tex2, tex_coord1)); // JR i've scaled here (0.3/0.7) just for testing (swap the textures in the glUniform1i(texX_uniform_loc, X); call in the cpp and you'll see the change in effect)
	color.a = 1.0;
}