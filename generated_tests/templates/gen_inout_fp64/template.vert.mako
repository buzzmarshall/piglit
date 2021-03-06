/* [config]
 * expect_result: fail
 * glsl_version: ${glsl_version}
% if glsl_version == '1.50':
 * require_extensions: GL_ARB_gpu_shader_fp64
 * [end config]
 *
 * GL_ARB_gpu_shader_fp64 spec states:
 *
 *     "Vertex shader inputs can only be single-precision
 *      floating-point scalars, vectors, or matrices, or signed and
 *      unsigned integers and integer vectors.  Vertex shader inputs
 *      can also form arrays of these types, but not structures."
% else:
 * [end config]
% endif
 */

#version ${glsl_version_int}
% if glsl_version == '1.50':
#extension GL_ARB_gpu_shader_fp64 : require
% endif

in ${type_name} vertex;

void main()
{
	gl_Position = vec4(vertex${extra_params});
}

