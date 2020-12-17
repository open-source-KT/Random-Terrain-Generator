#shader vertex
#version 330 core

layout (location = 0) in vec4 Position;
layout (location = 1) in vec3 a_normal;
layout (location = 2) in vec2 tex_coords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 proj;

uniform mat3 u_norm_model;

out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoords;

void main()
{
    gl_Position = proj * view * model * Position;
    FragPos = vec3(model * Position); //Fragment position in world space
    Normal = u_norm_model * a_normal;
    TexCoords = tex_coords;
};


#shader fragment
#version 330 core


out vec4 FragColor;

struct Material {
    sampler2D diffuse;
    sampler2D specular;
    float shininess;
};

struct Light {
    vec3 direction;
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    
};


in vec3 Normal;
in vec3 FragPos;  
in vec2 TexCoords;

uniform Material material;
uniform vec3 u_viewPos;
uniform Light light;


void main()
{   
    vec3 ambient = vec3(texture(material.diffuse,TexCoords))*light.ambient;
   
    vec3 norm = normalize(Normal); 
    //The lighting calculations we used so far expect the light direction to be a direction from the fragment 
    //towards the light source, but people generally prefer to specify a directional light as a global direction pointing from the light source so we have to negate
    vec3 lightDir = normalize(-light.direction); 
    float diff = max(dot(norm, lightDir), 0.0); 
    vec3 diffuse = (diff*vec3(texture(material.diffuse,TexCoords))) * light.diffuse;    

    vec3 viewDir = normalize(u_viewPos-FragPos);
    vec3 reflectDir = reflect(-lightDir,norm);             
    
    float spec = pow(max(dot(viewDir,reflectDir),0.0),material.shininess);
    vec3 specular = vec3(texture(material.specular,TexCoords)) * spec * light.specular;

    vec3 result = (ambient + diffuse + specular); 
    FragColor = vec4(result,1.0);
    
};
