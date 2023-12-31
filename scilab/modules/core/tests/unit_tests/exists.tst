// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
// Copyright (C) 2010 - DIGITEO - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

//exists

// []
assert_checkequal(exists([]),[]);
assert_checkequal(exists([],"a"), []);
assert_checkequal(exists([],"l"), []);
assert_checkequal(exists([],"n"), []);

a=1;
assert_checkequal(exists('a'), 1);
clear a;
assert_checkequal(exists('a'), 0);

a=1; b=1;
assert_checkequal(exists(['a', 'b']), [1, 1]);
assert_checkequal(exists(['a'; 'b']), [1; 1]);
assert_checkequal(exists(['a', 'b'; 'a', 'b']), [1, 1; 1, 1]);
clear b;
assert_checkequal(exists(['a', 'b']), [1, 0]);
assert_checkequal(exists(['a'; 'b']), [1; 0]);
assert_checkequal(exists(['b', 'a']), [0, 1]);
assert_checkequal(exists(['b'; 'a']), [0; 1]);
assert_checkequal(exists(['a', 'b'; 'a', 'b']), [1, 0; 1, 0]);
clear a;
assert_checkequal(exists(['a', 'b']), [0, 0]);
assert_checkequal(exists(['a'; 'b']), [0; 0]);
assert_checkequal(exists(['a', 'b'; 'a', 'b']), [0, 0; 0, 0]);

function __check_exists__(x, scope)
  assert_checkequal(exists("a", scope), 1);
endfunction

function __check_exists2__(x, scope)
    a=42; b=42;
    assert_checkequal(exists(['a', 'b'], scope), [1, 1]);
    assert_checkequal(exists(['a'; 'b'], scope), [1; 1]);
    assert_checkequal(exists(['a', 'b'; 'a' 'b'], scope), [1, 1; 1, 1]);
endfunction

function __check_not_exists__(x, scope)
  assert_checkequal(exists("a", scope), 0);
endfunction

function __check_not_exists2__(x, scope)
    a=51; b=51;
    assert_checkequal(exists(['a', 'b'], scope), [0, 0]);
    assert_checkequal(exists(['a'; 'b'], scope), [0; 0]);
    assert_checkequal(exists(['a', 'b'; 'a', 'b'], scope), [0, 0; 0, 0]);
endfunction

// Define a ONLY in calling scope
a = 42; b=42;
__check_exists__([], "all");
__check_exists__([], "nolocal");
__check_not_exists__([], "local");
clear a; clear b;

// Define a ONLY in function local scope
__check_exists__(a = 42, "all");
__check_exists__(a = 42, "local");
__check_not_exists__(a = 42, "nolocal");
__check_exists2__([], "all");
__check_exists2__([], "local");
__check_not_exists2__([], "nolocal");

// Define a BOTH in calling and local scope
a = 42; b=42;
__check_exists__(a = 51, "all");
__check_exists__(a = 51, "local");
__check_exists__(a = 51, "nolocal");
__check_exists2__([], "all");
__check_exists2__([], "local");
__check_exists2__([], "nolocal");
clear a; clear b;
