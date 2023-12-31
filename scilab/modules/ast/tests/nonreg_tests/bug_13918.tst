// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enteprises - Antoine ELIAS
// Copyright (C) 2016 - Scilab Enteprises - Piere-Aime AGNEL
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 13918 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13918
//
// <-- Short Description -->
// invalid operation on hypermatrix must call overload functions

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

//error msg
msg1 = _("Undefined operation for the given operands.\n");
msg2 = _("check or define function %s for overloading.\n");

//define hypermatrix
a3 = rand(2, 2, 2);
a2 = rand(2, 2);


//addition
//double + double
assert_checkerror("a3 + a2", msprintf(msg1 + "%s", msprintf(msg2, "%s_a_s")));
assert_checkerror("a2 + a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_a_s")));

//poly + double
assert_checkerror("a3 * %s + a2", msprintf(msg1 + "%s", msprintf(msg2, "%p_a_s")));
assert_checkerror("a2 + a3 * %s", msprintf(msg1 + "%s", msprintf(msg2, "%s_a_p")));

//sparse + double
assert_checkerror("sparse(a2) + a3", msprintf(msg1 + "%s", msprintf(msg2, "%sp_a_s")));
assert_checkerror("a3 + sparse(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%s_a_sp")));

// and
//double & double
// Converted first to boolean before & operation after https://codereview.scilab.org/#/c/18387/
assert_checkerror("a3 & a2", msprintf(msg1 + "%s", msprintf(msg2, "%b_h_b")));
assert_checkerror("a2 & a3", msprintf(msg1 + "%s", msprintf(msg2, "%b_h_b")));

//int & int
assert_checkerror("int8(a3) & int8(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%i_h_i")));
assert_checkerror("int8(a2) & int8(a3)", msprintf(msg1 + "%s", msprintf(msg2, "%i_h_i")));

// divide
//double / double
assert_checkerror("a2 / a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_r_s")));
assert_checkerror("a3 / a2", msprintf(msg1 + "%s", msprintf(msg2, "%s_r_s")));

//sparse / double
assert_checkerror("sparse(a2) / a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_r_s")));
assert_checkerror("a3 / sparse(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%s_r_s")));

// dotdivide
//double ./ double
assert_checkerror("a3 ./ a2", msprintf(msg1 + "%s", msprintf(msg2, "%s_d_s")));
assert_checkerror("a2 ./ a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_d_s")));

//double ./ sparse
assert_checkerror("a3 ./ sparse(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%s_d_sp")));

//sparse ./ double
assert_checkerror("sparse(a2) ./ a3", msprintf(msg1 + "%s", msprintf(msg2, "%sp_d_s")));

//poly ./ double
assert_checkerror("(a2 * %s) ./ a3", msprintf(msg1 + "%s", msprintf(msg2, "%p_d_s")));
assert_checkerror("(a3 * %s) ./ a2", msprintf(msg1 + "%s", msprintf(msg2, "%p_d_s")));

//dotmult
//double .* double
assert_checkerror("a3 .* a2", msprintf(msg1 + "%s", msprintf(msg2, "%s_x_s")));
assert_checkerror("a2 .* a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_x_s")));

// sparse .* double
assert_checkerror("sparse(a2) .* a3", msprintf(msg1 + "%s", msprintf(msg2, "%sp_x_s")));

//double .* sparse
assert_checkerror("a3 .* sparse(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%s_x_sp")));

// poly .* double
assert_checkerror("(a2 * %s) .* a3", msprintf(msg1 + "%s", msprintf(msg2, "%p_x_s")));
assert_checkerror("(a3 * %s) .* a2", msprintf(msg1 + "%s", msprintf(msg2, "%p_x_s")));

//double .* poly
assert_checkerror("a2 .* (a3 * %s)", msprintf(msg1 + "%s", msprintf(msg2, "%s_x_p")));
assert_checkerror("a3 .* (a2 * %s)", msprintf(msg1 + "%s", msprintf(msg2, "%s_x_p")));

// ldivide

//double \ double
assert_checkerror("a3 \ a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_l_s")));
assert_checkerror("a2 \ a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_l_s")));
assert_checkerror("a3 \ a2", msprintf(msg1 + "%s", msprintf(msg2, "%s_l_s")));

//multiplication
//double * double
assert_checkerror("a3 * a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_m_s")));
assert_checkerror("a3 * a2", msprintf(msg1 + "%s", msprintf(msg2, "%s_m_s")));
assert_checkerror("a2 * a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_m_s")));

//sparse * double
assert_checkerror("sparse(a2) * a3", msprintf(msg1 + "%s", msprintf(msg2, "%sp_m_s")));

//double * sparse
assert_checkerror("a3 * sparse(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%s_m_sp")));

// or
//double | double
// Converted first to boolean before | operation after https://codereview.scilab.org/#/c/18387/
assert_checkerror("a3 | a2", msprintf(msg1 + "%s", msprintf(msg2, "%b_g_b")));
assert_checkerror("a2 | a3", msprintf(msg1 + "%s", msprintf(msg2, "%b_g_b")));

//int | int
// Converted first to boolean before | operation after https://codereview.scilab.org/#/c/18387/
assert_checkerror("int8(a3) | int8(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%i_g_i")));
assert_checkerror("int8(a2) | int8(a3)", msprintf(msg1 + "%s", msprintf(msg2, "%i_g_i")));

//subtraction
//double - double
assert_checkerror("a3 - a2", msprintf(msg1 + "%s", msprintf(msg2, "%s_s_s")));
assert_checkerror("a2 - a3", msprintf(msg1 + "%s", msprintf(msg2, "%s_s_s")));

//poly - poly
assert_checkerror("(a3 * %s) - (a2 * %s)", msprintf(msg1 + "%s", msprintf(msg2, "%p_s_p")));
assert_checkerror("(a2 * %s) - (a3 * %s)", msprintf(msg1 + "%s", msprintf(msg2, "%p_s_p")));


//poly - double
assert_checkerror("(a3 * %s) - a2", msprintf(msg1 + "%s", msprintf(msg2, "%p_s_s")));
assert_checkerror("(a2 * %s) - a3", msprintf(msg1 + "%s", msprintf(msg2, "%p_s_s")));

//double - poly
assert_checkerror("a3 - (a2 * %s)", msprintf(msg1 + "%s", msprintf(msg2, "%s_s_p")));
assert_checkerror("a2 - (a3 * %s)", msprintf(msg1 + "%s", msprintf(msg2, "%s_s_p")));

//double - sparse
assert_checkerror("a3 - sparse(a2)", msprintf(msg1 + "%s", msprintf(msg2, "%s_s_sp")));

//sparse - double
assert_checkerror("sparse(a2) - a3", msprintf(msg1 + "%s", msprintf(msg2, "%sp_s_s")));
