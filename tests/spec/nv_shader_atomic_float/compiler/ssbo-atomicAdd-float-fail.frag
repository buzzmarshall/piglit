// [config]
// expect_result: fail
// glsl_version: 1.50
// require_extensions: GL_ARB_shader_storage_buffer_object GL_NV_shader_atomic_float
// [end config]
//
// The extension is supported by the implementation, but it is not enabled in
// the shader.  This should fail to compile.

#version 150
#extension GL_ARB_shader_storage_buffer_object: require

buffer bufblock {
       float a;
};

out vec4 color;

void main()
{
	color = vec4(atomicAdd(a, 1.7));
}
