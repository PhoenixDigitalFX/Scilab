//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

//url_split originally splitURL

[a,b,c,d]=url_split("https://www.scilab.org");
assert_checkequal(a, "https");
assert_checkequal(b, "www.scilab.org");
assert_checkequal(c, "");
assert_checkequal(d, "");

[a,b,c,d]=url_split("https://www.scilab.org/");
assert_checkequal(a, "https");
assert_checkequal(b, "www.scilab.org");
assert_checkequal(c, "/");
assert_checkequal(d, "");

[a,b,c,d]=url_split("https://www.scilab.org/products/scilab/environment");
assert_checkequal(a, "https");
assert_checkequal(b, "www.scilab.org");
assert_checkequal(c, "/products/scilab/environment");
assert_checkequal(d, "");

[a,b,c,d]=url_split("https://www.scilab.org/content/search?SearchText=plot");
assert_checkequal(a, "https");
assert_checkequal(b, "www.scilab.org");
assert_checkequal(c, "/content/search");
assert_checkequal(d, "SearchText=plot");

[a,b,c,d]=url_split("ftp://ftp.free.fr/pub/Distributions_Linux/debian/README");
assert_checkequal(a, "ftp");
assert_checkequal(b, "ftp.free.fr");
assert_checkequal(c, "/pub/Distributions_Linux/debian/README");
assert_checkequal(d, "");

[a,b,c,d]=url_split("https://encrypted.google.com");
assert_checkequal(a, "https");
assert_checkequal(b, "encrypted.google.com");
assert_checkequal(c, "");
assert_checkequal(d, "");

[a,b,c,d,e,f,g]=url_split("https://plop:ae@encrypted.google.com:443/full/path?query=true#myFragment");
assert_checkequal(a, "https");
assert_checkequal(b, "encrypted.google.com");
assert_checkequal(c, "/full/path");
assert_checkequal(d, "query=true");
assert_checkequal(e, "plop:ae");
assert_checkequal(f, int32(443)); // port
assert_checkequal(g, "myFragment"); // fragment

// Badly formatted URL
assert_checkerror("url_split(''http://plop@ae:sylvestre.ledru.info:80'');", [], 999);

// No protocol
[proto, server, path, query, username, port, frag] = url_split("www.scilab.org");
assert_checkequal(proto, "");
assert_checkequal(server, "");
assert_checkequal(path, "www.scilab.org");
assert_checkequal(query, "");
assert_checkequal(username, "");
assert_checkequal(port, int32(0));
assert_checkequal(frag, "");

// Relative URL
[proto, server, path, query, username, port, frag] = url_split("./index.html");
assert_checkequal(proto, "");
assert_checkequal(server, "");
assert_checkequal(path, "./index.html");
assert_checkequal(query, "");
assert_checkequal(username, "");
assert_checkequal(port, int32(0));
assert_checkequal(frag, "");

