# Create a custom command that runs the Python script
# ${generator_script} to generate tests.
#
# A list of the files generated will be output to the file
# ${file_list}.  This can be used to run the custom command by itself,
# and is also used by the build system to tell when the files need to
# be rebuilt.
#
# The custom command will automatically depend on ${generator_script}.
# Additional dependencies can be supplied using additional arguments.
function(piglit_make_generated_tests file_list generator_script)
	# Add a custom command which executes ${generator_script}
	# during the build.
	add_custom_command(
		OUTPUT ${file_list}
		COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/${generator_script} > ${file_list}
		DEPENDS ${generator_script} ${ARGN}
		VERBATIM)
endfunction(piglit_make_generated_tests custom_target generator_script)

# Generators for OpenGL tests
piglit_make_generated_tests(
	builtin_packing_tests.list
	gen_builtin_packing_tests.py
	templates/gen_builtin_packing_tests/vs_unpack.shader_test.mako
	templates/gen_builtin_packing_tests/vs_pack.shader_test.mako
	templates/gen_builtin_packing_tests/fs_unpack.shader_test.mako
	templates/gen_builtin_packing_tests/fs_pack.shader_test.mako
	templates/gen_builtin_packing_tests/const_pack.shader_test.mako
	templates/gen_builtin_packing_tests/const_unpack.shader_test.mako
	)
piglit_make_generated_tests(
	builtin_uniform_tests.list
	gen_builtin_uniform_tests.py
	builtin_function.py)
piglit_make_generated_tests(
	constant_array_size_tests.list
	gen_constant_array_size_tests.py
	builtin_function.py)
piglit_make_generated_tests(
	const_builtin_equal_tests.list
	gen_const_builtin_equal_tests.py
	templates/gen_const_builtin_equal_tests/template.shader_test.mako
	)
piglit_make_generated_tests(
	tes_input_tests.list
	gen_tes_input_tests.py)
piglit_make_generated_tests(
	tcs_input_tests.list
	gen_tcs_input_tests.py)
piglit_make_generated_tests(
	interpolation_tests.list
	gen_interpolation_tests.py
	templates/gen_interpolation_tests/template.shader_test.mako
	)
piglit_make_generated_tests(
	non-lvalue_tests.list
	gen_non-lvalue_tests.py
	templates/gen_non-lvalue_tests/assignment.glsl_parser_test.mako
	templates/gen_non-lvalue_tests/out-parameter.glsl_parser_test.mako
	)
piglit_make_generated_tests(
	texture_query_lod_tests.list
	gen_texture_query_lod_tests.py
	templates/gen_texture_query_lod_tests/template.glsl_parser_test.mako
	)
piglit_make_generated_tests(
	shader_bit_encoding_tests.list
	gen_shader_bit_encoding_tests.py
	templates/gen_shader_bit_encoding_tests/template.shader_test.mako
	)
piglit_make_generated_tests(
	uniform-initializer_tests.list
	gen_uniform_initializer_tests.py
	templates/gen_uniform_initializer_tests/fs-initializer.shader_test.mako
	templates/gen_uniform_initializer_tests/vs-initializer.shader_test.mako
	templates/gen_uniform_initializer_tests/fs-initializer-from-const.shader_test.mako
	templates/gen_uniform_initializer_tests/vs-initializer-from-const.shader_test.mako
	templates/gen_uniform_initializer_tests/fs-initializer-set-by-API.shader_test.mako
	templates/gen_uniform_initializer_tests/vs-initializer-set-by-API.shader_test.mako
	templates/gen_uniform_initializer_tests/fs-initializer-set-by-other-stage.shader_test.mako
	templates/gen_uniform_initializer_tests/vs-initializer-set-by-other-stage.shader_test.mako
	)
piglit_make_generated_tests(
	interpolation-qualifier-built-in-variable.list
	interpolation-qualifier-built-in-variable.py
	templates/interpolation-qualifier-built-in-variable/fs-vs-unused.shader_test.mako
	templates/interpolation-qualifier-built-in-variable/vs-unused.shader_test.mako
	templates/interpolation-qualifier-built-in-variable/fs-unused.shader_test.mako
	templates/interpolation-qualifier-built-in-variable/vs-fs-flip.shader_test.mako
	templates/interpolation-qualifier-built-in-variable/vs-fs.shader_test.mako
	)
piglit_make_generated_tests(
	texture_lod_tests.list
	gen_texture_lod_tests.py
	templates/gen_texture_lod_tests/tex_grad.vert.mako
	templates/gen_texture_lod_tests/tex_grad.frag.mako
	templates/gen_texture_lod_tests/frag_lod.glsl_parser_test.mako
	)
piglit_make_generated_tests(
	gpu_shader4_tests.list
	gen_gpu_shader4_tests.py
	templates/gen_gpu_shader4_tests/binary.frag.mako       templates/gen_gpu_shader4_tests/texel_fetch.vert.mako   templates/gen_gpu_shader4_tests/tex.vert.mako
	templates/gen_gpu_shader4_tests/binary_op.frag.mako    templates/gen_gpu_shader4_tests/tex.frag.mako           templates/gen_gpu_shader4_tests/unary.frag.mako
	templates/gen_gpu_shader4_tests/binary_op.vert.mako    templates/gen_gpu_shader4_tests/tex_grad.frag.mako      templates/gen_gpu_shader4_tests/unary_op.frag.mako
	templates/gen_gpu_shader4_tests/binary.vert.mako       templates/gen_gpu_shader4_tests/tex_grad.vert.mako      templates/gen_gpu_shader4_tests/unary_op.vert.mako
	templates/gen_gpu_shader4_tests/ternary.frag.mako      templates/gen_gpu_shader4_tests/tex_lod.frag.mako       templates/gen_gpu_shader4_tests/unary.vert.mako
	templates/gen_gpu_shader4_tests/ternary.vert.mako      templates/gen_gpu_shader4_tests/tex_lod.vert.mako       templates/gen_gpu_shader4_tests/vec_compare.frag.mako
	templates/gen_gpu_shader4_tests/tex_bias.frag.mako     templates/gen_gpu_shader4_tests/texture_size.frag.mako  templates/gen_gpu_shader4_tests/vec_compare.vert.mako
	templates/gen_gpu_shader4_tests/texel_fetch.frag.mako  templates/gen_gpu_shader4_tests/texture_size.vert.mako
	)
piglit_make_generated_tests(
	outerproduct_invalid_params.list
	gen_outerproduct_invalid_params.py
	templates/gen_outerproduct_invalid_params/template.vert.mako
	)
piglit_make_generated_tests(
	outerproduct_tests.list
	gen_outerproduct_tests.py
	templates/gen_outerproduct_tests/template.shader_test.mako
	)

piglit_make_generated_tests(
	builtin_uniform_tests_fp64.list
	gen_builtin_uniform_tests_fp64.py
	builtin_function_fp64.py)
piglit_make_generated_tests(
	constant_array_size_tests_fp64.list
	gen_constant_array_size_tests_fp64.py
	builtin_function_fp64.py)
piglit_make_generated_tests(
	inout_fp64.list
	gen_inout_fp64.py
	templates/gen_inout_fp64/template.frag.mako
	templates/gen_inout_fp64/template.vert.mako
	)
piglit_make_generated_tests(
	flat_interpolation_qualifier.list
	gen_flat_interpolation_qualifier.py
	templates/gen_flat_interpolation_qualifier/compiler.mako
	templates/gen_flat_interpolation_qualifier/template.frag.mako
	)
piglit_make_generated_tests(
	conversion.list
	gen_conversion.py
	templates/gen_conversion/base.mako
	templates/gen_conversion/compiler.frag.mako
	templates/gen_conversion/compiler.geom.mako
	templates/gen_conversion/compiler.vert.mako
	templates/gen_conversion/compiler_base.mako
	templates/gen_conversion/execution-zero-sign.frag.shader_test.mako
	templates/gen_conversion/execution-zero-sign.geom.shader_test.mako
	templates/gen_conversion/execution-zero-sign.vert.shader_test.mako
	templates/gen_conversion/execution.frag.shader_test.mako
	templates/gen_conversion/execution.geom.shader_test.mako
	templates/gen_conversion/execution.vert.shader_test.mako
	templates/gen_conversion/execution_base.mako
	templates/gen_conversion/shader-zero-sign.frag.mako
	templates/gen_conversion/shader-zero-sign.geom.mako
	templates/gen_conversion/shader-zero-sign.vert.mako
	templates/gen_conversion/shader.frag.mako
	templates/gen_conversion/shader.geom.mako
	templates/gen_conversion/shader.vert.mako
	templates/gen_conversion/shader_base.mako
	)
piglit_make_generated_tests(
	shader_intel_conservative_rasterization.list
	gen_shader_intel_conservative_rasterization.py)
piglit_make_generated_tests(
	shader_precision_tests.list
	gen_shader_precision_tests.py
	builtin_function.py
	templates/gen_shader_precision_tests/vs.mako
	templates/gen_shader_precision_tests/fs.mako
	templates/gen_shader_precision_tests/gs.mako)
piglit_make_generated_tests(
	shader_image_load_store_tests.list
	gen_shader_image_load_store_tests.py)
piglit_make_generated_tests(
	shader_image_nv_image_formats_tests.list
	gen_shader_image_nv_image_formats_tests.py)
piglit_make_generated_tests(
	variable_index_read_tests.list
	gen_variable_index_read_tests.py
	templates/gen_variable_index_read_tests/vs.shader_test.mako
	templates/gen_variable_index_read_tests/fs.shader_test.mako
	templates/gen_variable_index_read_tests/helpers.mako)
piglit_make_generated_tests(
	gen_extensions_defined.list
	gen_extensions_defined.py
	templates/gen_extensions_defined/enabled.glsl.mako
	templates/gen_extensions_defined/disabled.glsl.mako
	templates/gen_extensions_defined/undefined-require.glsl.mako
	modules/glsl.py)
piglit_make_generated_tests(
	vp-tex.list
	gen_vp_tex.py
	templates/gen_vp_tex/helpers.mako
	templates/gen_vp_tex/arbvp.mako
	templates/gen_vp_tex/nvvp3.mako
	templates/gen_vp_tex/nvvp3_2.mako)
piglit_make_generated_tests(
	variable_index_write_tests.list
	gen_variable_index_write_tests.py
	templates/gen_variable_index_write_tests/vs.shader_test.mako
	templates/gen_variable_index_write_tests/fs.shader_test.mako
	templates/gen_variable_index_write_tests/helpers.mako)
piglit_make_generated_tests(
	vs_in_fp64.list
	gen_vs_in_fp64.py
	templates/gen_vs_in_fp64/columns.shader_test.mako
	templates/gen_vs_in_fp64/regular.shader_test.mako)
piglit_make_generated_tests(
	shader_framebuffer_fetch_tests.list
	gen_shader_framebuffer_fetch_tests.py)
piglit_make_generated_tests(
	intel_shader_integer_functions2_tests.list
	gen_intel_shader_integer_functions2_tests.py
	templates/gen_intel_shader_integer_functions2_tests/absoluteDifference.shader_test.mako
	templates/gen_intel_shader_integer_functions2_tests/addSaturate.shader_test.mako
	templates/gen_intel_shader_integer_functions2_tests/countLeadingZeros.shader_test.mako
	templates/gen_intel_shader_integer_functions2_tests/multiply32x16.shader_test.mako
	templates/gen_intel_shader_integer_functions2_tests/subtractSaturate.shader_test.mako)
piglit_make_generated_tests(
	inout_64bit.list
	gen_inout_64bit_tests.py)

# OpenCL Test generators
piglit_make_generated_tests(
	builtin_cl_int_tests.list
	gen_cl_int_builtins.py)
piglit_make_generated_tests(
	cl_store_tests.list
	gen_cl_store_tests.py)
piglit_make_generated_tests(
	cl_vstore_tests.list
	gen_cl_vstore_tests.py)
piglit_make_generated_tests(
	cl_vload_tests.list
	gen_cl_vload_tests.py)
piglit_make_generated_tests(
	builtin_cl_math_tests.list
	gen_cl_math_builtins.py)
piglit_make_generated_tests(
	builtin_cl_relational_tests.list
	gen_cl_relational_builtins.py)
piglit_make_generated_tests(
	builtin_cl_common_tests.list
	gen_cl_common_builtins.py)
piglit_make_generated_tests(
	builtin_cl_shuffle_tests.list
	gen_cl_shuffle_builtins.py)
piglit_make_generated_tests(
	builtin_cl_shuffle2_tests.list
	gen_cl_shuffle2_builtins.py)

# Create a custom target for generating OpenGL tests
# This is not added to the default target, instead it is added
# as a dependency of gen-tests if OpenGL or OpenGLES{2,3} tests
# are enabled
add_custom_target(gen-gl-tests
	DEPENDS builtin_packing_tests.list
			outerproduct_tests.list
			outerproduct_invalid_params.list
			builtin_uniform_tests.list
			constant_array_size_tests.list
			const_builtin_equal_tests.list
			builtin_packing_tests.list
			tcs_input_tests.list
			tes_input_tests.list
			interpolation_tests.list
			non-lvalue_tests.list
			texture_query_lod_tests.list
			texture_lod_tests.list
			shader_bit_encoding_tests.list
			uniform-initializer_tests.list
			interpolation-qualifier-built-in-variable.list
			builtin_uniform_tests_fp64.list
			constant_array_size_tests_fp64.list
			inout_fp64.list
			flat_interpolation_qualifier.list
			conversion.list
			shader_precision_tests.list
			shader_framebuffer_fetch_tests.list
			shader_image_load_store_tests.list
			shader_image_nv_image_formats_tests.list
			intel_shader_integer_functions2_tests.list
			shader_intel_conservative_rasterization.list
			variable_index_read_tests.list
			gen_extensions_defined.list
			vp-tex.list
			variable_index_write_tests.list
			vs_in_fp64.list
			gpu_shader4_tests.list
			inout_64bit.list
)

# Create a custom target for generating OpenCL tests
# This is not added to the default target, instead it is added
# as a dependency of gen-tests if OpenCL tests are enabled
add_custom_target(gen-cl-tests
	DEPENDS builtin_cl_int_tests.list
			builtin_cl_math_tests.list
			builtin_cl_relational_tests.list
			builtin_cl_common_tests.list
			builtin_cl_shuffle_tests.list
			builtin_cl_shuffle2_tests.list
			cl_store_tests.list
			cl_vstore_tests.list
			cl_vload_tests.list
)

# Add a "gen-tests" target that can be used to generate all the
# tests without doing any other compilation.
add_custom_target(gen-tests ALL COMMENT "meta-target for other test generators")

# Add gen-gl-tests as a dependency of the gen-tests if OpenGL or OpenGL ES {2,3}
# are requested. there are no GLES1 tests to generate
if(${PIGLIT_BUILD_GL_TESTS} OR ${PIGLIT_BUILD_GLES2_TESTS} OR ${PIGLIT_BUILD_GLES3_TESTS})
	add_dependencies(gen-tests gen-gl-tests)
endif(${PIGLIT_BUILD_GL_TESTS} OR ${PIGLIT_BUILD_GLES2_TESTS} OR ${PIGLIT_BUILD_GLES3_TESTS})

# Add gen-cl-tests as a dependency of the gen-tests if OpenCL is requested
if(${PIGLIT_BUILD_CL_TESTS})
	add_dependencies(gen-tests gen-cl-tests)
endif(${PIGLIT_BUILD_CL_TESTS})
