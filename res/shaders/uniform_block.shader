#shader vertex
#version 330 core
	    
layout (location = 0) in vec3 position;
layout (location = 1) in vec2 texCoord;


layout(std140) uniform Matrices
{
    mat4 proj;
    mat4 view;
};

uniform mat4 model;


out vec2 v_TexCoord;

void main()
{
	gl_Position = proj * view * model * vec4(position,1.0); //Multiply the projection matrix by the position
	v_TexCoord = texCoord; 
}
   

#shader fragment
#version 330 core

layout (location = 0) out vec4 color; 

uniform sampler2D u_Texture;

in vec2 v_TexCoord;

void main()
{
	vec4 texColor = texture(u_Texture,v_TexCoord);



	color = texColor;

	
	
};

//origin: main8.cpp