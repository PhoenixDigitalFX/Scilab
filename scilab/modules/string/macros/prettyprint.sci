// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2010 - Calixte Denizet
// Copyright (C) 2012 - 2016 - Scilab Enterprises
// Copyright (C) 2019 - Samuel GOUGEON
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function str = prettyprint(a, exportFormat, delimiter, processByElement, isWrapped)
    // Provides a representation of a Scilab object to the TeX, LaTeX, MathML or HTML formats
    //
    // Syntax
    // str = prettyprint(a) // Show the variable a with the default format (LaTeX)
    // str = prettyprint(a,exportFormat) // Show the variable a with the specified format
    // str = prettyprint(a,exportFormat, delim) // As above but change the delimiter
    // str = prettyprint(a,exportFormat, delim, processByElement) // As above but process each element independently
    // str = prettyprint(a,exportFormat, delim, processByElement, isWrapped) // As above Add the special keyword of Tex or LaTeX export
    //
    // Parameters
    // a: is a Scilab variable
    //exportFormat: is the format, if omitted 'latex' is used by default, it can be 'latex', 'tex' or 'mathml'.
    // delimiter: is a string indicating the delimiter to use for the resulting matrix, it's only used if isWrapped is true. The delimiter can be '(', '{', '[', '|', '||' or ')'
    //processByElement: is a boolean to indicate if the resulting matrix must be converted into a single string.
    //isWrapped: is a boolean to indicate if the result must be wrapped inside delimiters ('$' for latex and tex or nothing for mathml) to be used with xstring or xtitle
    //str: the representation of the variable a
    //If the type of a is not handled, then an error is returned. If a user wants to handle the type foo when exporting with latex, he must define the function foo2latex.
    //
    // Description
    // Taking a variable, the prettyprint function will provide a formatted representation of it.
    // Formats can be TeX, LaTeX or MathML.
    // They can be used in third party applications but also within Scilab with the most of the
    // <link linkend="math_rendering_features_in_graphic">Scilab graphic features</link>.
    // The following types are handled by this function:
    //  <itemizedlist>
    //    <listitem><para>Real / Complex matrices</para></listitem>
    //    <listitem><para>Polynomial types</para></listitem>
    //    <listitem><para>Boolean</para></listitem>
    //    <listitem><para>Integer</para></listitem>
    //    <listitem><para>String</para></listitem>
    //    <listitem><para>Tlist</para></listitem>
    //    <listitem><para>Rationnal</para></listitem>
    //    <listitem><para>Cell</para></listitem>
    //  </itemizedlist>
    //
    // Examples
    // str = prettyprint(rand(3,3)) // Return the LaTeX representation of a 3,3 matrix
    // xstring(0.2,0.2,str) // Show the representation in a graphic Windows
    //
    // prettyprint(rand(3,4),"mathml") // Return the MathML representation of a 3,4 matrix
    // prettyprint(rand(3,4),"mathml","[") // Return the MathML representation of a 3,4 matrix with '[' as delimiter
    //
    // s=poly(0,'s'); G=[1,s;1+s^2,3*s^3];
    // xstring(0.2,0.2,prettyprint(G*s-1)); // Show a polynomial through a LaTeX representation
    //
    // See also
    // math_rendering_features_in_graphic
    // xtitle
    // axes_properties
    // label_properties
    // legend_properties
    // text_properties
    // xstringb
    // xstringl
    // xstring
    //
    // Authors
    // Calixte Denizet
    // Samuel Gougeon

    if argn(2)<1 | argn(2)>5
        error(msprintf(gettext("%s: Wrong number of input argument(s): %d to %d expected."),"prettyprint",1,4));
    end

    if ~isdef("exportFormat","l")    , exportFormat = "latex", end
    if ~isdef("delimiter","l")       , delimiter = "("       , end
    if ~isdef("processByElement","l"), processByElement = %F,  end
    if ~isdef("isWrapped","l")       , isWrapped = %T,         end

    if type(exportFormat) <> 10 then
        error(msprintf(gettext("%s: Wrong type for input argument #%d: String expected.\n"),"prettyprint",2));
    end
    exportFormat = convstr(exportFormat)
    html4 = exportFormat=="html4"
    if html4
        exportFormat = "html"
    end
    tmp = ["(" "[" "|" "||" "{" "_" ""]
    if type(delimiter) <> 10 | ..
        (and(delimiter <> tmp) & and(part(delimiter,1)<>tmp)) then
        error(msprintf(gettext("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"), "prettyprint", 3, "''('' ''['' ''|'' ''||'' ''{'' ''_'' ''''"));
    end
    if type(processByElement) <> 4 then
        error(msprintf(gettext("%s: Wrong type for argument #%d: Boolean expected.\n"),"prettyprint",4));
    end
    if type(isWrapped) <> 4 then
        error(msprintf(gettext("%s: Wrong type for argument #%d: Boolean expected.\n"),"prettyprint",5));
    end

    // -----------
    try
        execstr("[plus,minus,img,op,cp,ow,cw,d2s]=" + exportFormat + "conf()");
    catch
        error(msprintf(gettext("%s: Wrong export format: %s"),"prettyprint",exportFormat));
    end

    if exportFormat=="html"
        dest = strsubst(fileparts(TMPDIR),"\","/")
        if ~isfile(dest+"closeBrace.png")
            // We copy all delimiters icons in TMPDIR/..
            f = ["openBrace"  "openBracket"  "openParen" ..
                 "closeBrace" "closeBracket" "closeParen"]+".png"
            src = SCI+"/modules/gui/images/icons/";
            for s = f
                copyfile(src+s, dest+s)
            end
        end
    end

    typ = type(a);

    select typ
    case 1 then
        // Real or complex number
        if or(isinf(a) | isnan(a)) | norm(imag(a)) > %eps * norm(real(a)) then
            str = comp2str(a,plus,minus,img,d2s);
        else
            str = comp2str(real(a),plus,minus,img,d2s);
        end

    case 2 then
        // Polynomial type
        x = varn(a);
        C = coeff(a);
        [m,n] = size(a);
        maxd = max(0,max(degree(a)));
        str = emptystr(a);
        for i = 0:maxd do
            execstr("expo=" + exportFormat + "exp(x,i)");
            A = C(1:m,(1 + i * n):((i + 1) * n));
            if or(isinf(a) | isnan(a)) | norm(imag(A)) > %eps * norm(real(A)) then
                str = str + comp2coef(A,expo,plus,minus,img,op,cp,d2s);
            else
                str = str + comp2coef(real(A),expo,plus,minus,img,op,cp,d2s);
            end
        end
        L = length(plus);
        for i = 1:m do
            for j = 1:n do
                if part(str(i,j),1:L) == plus then
                    str(i,j) = part(str(i,j),L + 1:length(str(i,j)));
                end
            end
        end
        // The null polynomial is represented by '' so we must replace it by '0z'
        if exportFormat=="mathml"
            str(str == "") = d2s(0) + "<mi>" + x + "</mi>";
        else
            str(str == "") = d2s(0) + x;
        end

    case 4 then
        // Boolean type
        str = "F" + emptystr(a);
        str(a) = "T";
        execstr("str=" + exportFormat + "exp(str,1)");

    case 8 then
        // Int type
        str = d2s(a);

    case 10 then
        // String type
        if or(exportFormat == ["tex" "latex"])
            a = strsubst(a, "\", "\backslash\!")
            a = strsubst(a, "$", "\$")
            a = strsubst(a, "%", "\%")
            a = strsubst(a, "&", "\&")
            a = strsubst(a, "{", "\{")
            a = strsubst(a, "}", "\}")
            a = strsubst(a, "~", "\sim\!")
            a = strsubst(a, "^", "\^\;\,")
            a = strsubst(a, "<", "\!<\!")
            a = strsubst(a, ">", "\!>\!")
            // a = strsubst(a, "_", "\_ ")  // not required
            // a = strsubst(a, "#", "\#")   // not required
            if ~processByElement | isWrapped
                a = "\mathsf{\text{" + a + "}}" // default protection of spaces
                // Otherwise: we let the user choose the type of text
                // encapsulation
            end
        elseif exportFormat == "mathml"
            a = strsubst(a, "<", "&lt;")
            // " ' and & do not need protection
            execstr("a = " + exportFormat + "exp(a,1)");
        elseif exportFormat == "html"
            a = strsubst(a, "&", "&amp;")
            a = strsubst(a, "<", "&lt;")
        end
        str = a;

    case 16 then
        // Tlist type
        t = a(1);
        select t(1)
            // Rationnal type
        case "r" then
            num = prettyprint(a("num"), exportFormat, "(", %T, %F);
            den = prettyprint(a("den"), exportFormat, "(", %T, %F);
            execstr("str = rational2" + exportFormat + "(num, den)");
            // Linear state space type
        case "lss" then
            execstr("str = lss2" + exportFormat + "(a)");
            if exportFormat=="html"
                return
            end
        else
            str = unknown_type(t(1),a,exportFormat);
            return;
        end

    case 17  then
        tof = typeof(a);
        select tof
        case "ce" then
            // Cell type
            dim = double(size(a));
            L = length(dim);
            if L >= 3 then
                str = unknown_type("ce", a, exportFormat);
                return;
            end
            str = emptystr(dim(1),dim(2));
            iswrapped = exportFormat=="html"
            for i = 1:dim(1) do
                for j = 1:dim(2) do
                    str(i,j) = prettyprint(a{i,j}, exportFormat, delimiter, %F, iswrapped);
                end
            end
        else
            str = unknown_type(tof, a, exportFormat);
            return;
        end
    else
        str = unknown_type(typeof(a), a, exportFormat);
        return
    end

    [m,n] = size(a);
    if (m*n <> 1 & ~processByElement) // | (exportFormat=="html" & isWrapped) then
        execstr("str=" + exportFormat + "matrix(str,''" + delimiter + "'')");
    end
    if isWrapped then
        str = ow + str + cw;
    end
endfunction

// ----------------------------------------------------------------------------

// MATHML
// ======
//This function gives different elements of configuration
//plus is '+', minus is '-', img is sqrt(-1), op and cp are opening ang closing
//parenthesis (useful to generate complex coeff in polynomials), ow and cw are
//opening and closing delimiters used to wrap the expression to be displayed
//with xstring or xtitle, d2s is the function used to convert double into mathml.
function [plus,minus,img,op,cp,ow,cw,d2s] = mathmlconf()
    plus = "<mo>+</mo>";
    minus = "<mo>-</mo>";
    img = "<mi>i</mi>";
    op = "<mfenced separator=""""><mrow>";
    cp = "</mrow></mfenced>";
    ow = "";
    cw = "";
    d2s = mathmldbl2str;
endfunction

//This function generates var^n (useful for polynomials)
function str = mathmlexp(var,n)
    if n >= 2 then
        str = "<msup><mi>" + var + "</mi><mn>" + string(n) + "</mn></msup> ";
    elseif n == 1 then
        str = "<mi>" + var + "</mi>";
    else
        str = "";
    end
endfunction

//This function creates a fraction with the given numerator and denominator
function str = rational2mathml(num,den)
    nl = ascii(10)
    str = "<mfrac>" + nl + ..
            "<mrow>" + nl + num + nl + "</mrow>" + nl + ..
            "<mrow>" + nl + den + nl + "</mrow>" + nl + ..
          "</mfrac>";
endfunction

//This function converts a double into a mathml string
//Negative and positive are handled and the scientific notation too
function str = mathmldbl2str(x)
    if x == %inf then
        str = "<mi>∞</mi>";
    elseif x == -%inf then
        str = "<mo>-</mo><mi>∞</mi>";
    elseif isnan(x) then
        str = "<mi>NaN</mi>";
    else
        str= strsubst(string(x),"-","<mo>-</mo><mn>");
        if type(x) <> 8
            if strindex(str,"D") <> [] then
                str = strsubst(str,"+","<mo>+</mo><mn>");
                str = strsubst(str,"D","</mn><mo>&#x00D7;</mo><msup><mn>10</mn><mrow>");
                if x > 0 then
                    str = "<mn>" + str;
                end
                str = str + "</mn></mrow></msup>";
            elseif x >= 0 then
                str = "<mn>" + str + "</mn>";
            else
                str = str + "</mn>";
            end
        else
            k = x>=0
            if k~=[]
                str(k) =  "<mn>" + str(k)
            end
            str = str + "</mn>"
        end
    end
endfunction

//This function generates a matrix with the given delimiter
function str = mathmlmatrix(mat,delimiter)
    if argn(2) == 1 then
        delimiter = "(";
    end
    nl = ascii(10)
    select delimiter
    case "[" then
        com = "<mfenced open=""["" close=""]"">";
    case "(" then
        com = "<mfenced open=""("" close="")"">";
    case "|" then
        com = "<mfenced open=""&#x2223;"" close=""&#x2223;"">";
    case "{" then
        com = "<mfenced open=""{"" close=""}"">";
    case "||" then
        com = "<mfenced open=""&#x2225;"" close=""&#x2225;"">";
    case "" then
        com = "<mfenced open="""" close="""">";
    else
        com = "<mfenced open=""("" close="")"">";
    end
    [m,n] = size(mat);
    str = nl + com + nl + "<mtable>";
    for i=1:m do
        str = str + nl + "<mtr>" + nl + ..
              "<mtd>" + strcat(mat(i,:),"</mtd>"+nl+"<mtd>") + "</mtd>" + nl + ..
              "</mtr>";
    end
    str = str + nl + "</mtable>" + nl + "</mfenced>" + nl;
endfunction

//This function handles the syslin
function str = lss2mathml(sys)
    nl = ascii(10);
    ptp = "<mo>(</mo><mi>t</mi><mo>)</mo>";
    if sys(7) == "c" then
        der = "<mrow><mover><mi>X</mi><mo>.</mo></mover>" + ptp + "</mrow>";
    else
        der = "<mrow><mover><mi>X</mi><mo>+</mo></mover>" + ptp + "</mrow>"
    end
    str = "<mfenced close="""" open=""{"">" + nl + ..
          "<mtable columnalign=""right center left"">" + nl + ..
          "<mtr>" + ..
          "<mtd>" + der + "</mtd><mtd><mo>=</mo></mtd>" + ..
          "<mtd>" + prettyprint(sys(2),"mathml","(",%F,%F) + ..
          "<mrow><mi>X</mi>" + ptp + "</mrow><mo>+</mo>" + ..
          prettyprint(sys(3),"mathml","(",%F,%F) + ..
          "<mrow><mi>U</mi>" + ptp + "</mrow></mtd></mtr>" + nl + ..
          "<mtr><mtd><mrow><mi>Y</mi>" + ptp + "</mrow></mtd>" + ..
          "<mtd><mo>=</mo></mtd>" + ..
          "<mtd>" + prettyprint(sys(4),"mathml","(",%F,%F) + "<mrow><mi>X</mi>" + ptp + "</mrow>";
    try
        if norm(sys(5),1) == 0 then
            str = str + "</mtd></mtr>"
        else
            str = str + "<mo>+</mo>" + prettyprint(sys(5),"mathml","(",%F,%F) + ..
            "<mrow><mi>U</mi>" + ptp + "</mrow></mtd></mtr>"
        end
    catch
        str = str + "<mo>+</mo>" + prettyprint(sys(5),"mathml","(",%F,%F) + ..
            "<mrow><mi>U</mi>" + ptp + "</mrow></mtd></mtr>"
    end
    str = str + nl + "</mtable>" + nl + "</mfenced>" + nl;
endfunction

// ----------------------------------------------------------------------------

// HTML
// ====
function [plus,minus,img,op,cp,ow,cw,d2s] = htmlconf()
    plus = " + ";
    minus = " - ";
    img = "i";
    op = "(";
    cp = ")";
    ow = "";
    cw = "";
    d2s = htmldbl2str;
endfunction

//This function generates var^n (useful for polynomials)
function str = htmlexp(var,n)
    if n >= 2 then
        str = var  + "<sup>" + msprintf("%d\n",n) + "</sup> "
    elseif n == 1 then
        str = var
    else
        str = ""
    end
endfunction

//This function creates a fraction with the given numerator and denominator
function str = rational2html(num,den)
    str = "<table align=""center"" cellspacing=""0"" cellpadding=""1"" border=""0"">" + ..
             "<tr><td>" + num + "</td></tr>" + ..
             "<tr><td><hr></td></tr>" + ..
             "<tr><td>" + den + "</td></tr>" + ..
           "</table>";
endfunction

//This function converts a double into a mathml string
//Negative and positive are handled and the scientific notation too
function str = htmldbl2str(x)
    if x == %inf then
        str = "∞";
    elseif x == -%inf then
        str = "- ∞";
    elseif isnan(x) then
        str = "NaN";
    else
        str = string(x)
        if type(x) <> 8 & strindex(str,"D") <> []
            str = strsubst(str,"D+","D");
            str = strsubst(str,"D","&#x00D7;10<sup>");
            str = str + "</sup>";
        end
    end
endfunction

//This function generates a matrix with the given delimiter
function str = htmlmatrix(mat, delimiter, isWrapped)
    nl = ascii(10)
    mat = "<td>" + mat + "</td>"
    mat = "<tr align=""center"">" + nl + ..
          strcat(mat,nl,"c") + nl + "</tr>" + nl;
    str = strcat(mat) + "</table>" + nl
    //
    if isWrapped then
        // We put the opening <table with all required attributes
        // Otherwise only the closing </table> is set (above)
        tmp = "7px"
        if part(delimiter,1)=="(", tmp = "5px", end
        tmp = "style=""padding: 5px 10px; " + ..
              "background: " + ..
                "url(file:///" + dest + "open€€.png) left top, " + ..
                "url(file:///" + dest + "close€€.png) right top; " + ..
              "background-size: " + tmp + " 100%; background-repeat:no-repeat; "
        tmp2 = "style=""border-left:hidden; border-right:hidden; "
        tmp3 = "<table valign=""middle"" cellspacing=""0"" cellpadding=""3"" "+..
               "style=""display:inline-table;"">" + nl

        if grep(delimiter,"(")<>[]
            tmp = strsubst(tmp, "€€", "Paren")
            tmp3 = strsubst(tmp3, "style=""", tmp)
        elseif grep(delimiter,"[")<>[]
            tmp = strsubst(tmp, "€€", "Bracket")
            tmp3 = strsubst(tmp3, "style=""", tmp)
        elseif grep(delimiter,"{")<>[]
            tmp = strsubst(tmp, "€€", "Brace")
            tmp3 = strsubst(tmp3, "style=""", tmp)
        elseif grep(delimiter,"||")<>[]
            tmp = strsubst(tmp2, "hidden", "double 3px")
            tmp3 = strsubst(tmp3, "style=""", tmp)
        elseif grep(delimiter,"|")<>[]
            if grep(delimiter,"_")<>[]
                tmp = strsubst(tmp2, "hidden", "solid 2px")
            else
                tmp = strsubst(tmp2, "hidden", "solid 1px")
            end
            tmp3 = strsubst(tmp3, "style=""", tmp)
        end
        str = nl + tmp3 + str
        if grep(delimiter,"_")<>[] then
            str = strsubst(str, "<table ", ..
                                "<table border=""1"" ");
            str = strsubst(str, "style=""",..
             "style=""border-collapse:collapse; border-style:solid; border-width:0px; ");
        end
    end     // if isWrapped
endfunction

//This function handles the syslin
function str = lss2html(sys)
    ptp = "(t)";
    nl = ascii(10);
    if html4
        delim = "|"
        str = "<table style=""display:inline-table; border-left: solid 1px; border-right:hidden;"">" + nl
    else
        delim = "("
        str = "<table style=""display:inline-table; padding: 5px 10px; "+..
            "background: url(file:///" + dest + "openBrace.png) left top; "+..
            "background-size: 7px 100%; background-repeat:no-repeat;"">" + nl
    end
    // In messagebox(msg) (HTML 4), "nowrap" is not taken into account
    //  => we must put all elements in separated <td> along each row.

    // Row #1
    str = str + "<tr>" + nl + "<td nowrap style=""white-space:nowrap"">" + nl
    if sys(7) == "c" then
        der = "<table><tr><td>dX<br><hr>dt</td><td>" + ptp + "</td></tr></table>"
    else
        der = "X<sup>+</sup>" + ptp
    end
    str = str + der + nl + "</td>" + nl + "<td>=</td>" + nl
    if ~html4 then
        str = str + "<td nowrap=""nowrap"" style=""white-space:nowrap"">" + nl
        str = str + prettyprint(sys(2), "html", delim, %F, %T) + " X" + ptp + " + " + nl
        str = str + prettyprint(sys(3), "html", delim, %F, %T) + " U" + ptp + nl
        str = str + "</td>" + nl + "</tr>" + nl
    else
        str = str + "<td align=""right"">" + nl
        str = str + prettyprint(sys(2), "html", delim, %F, %T) + nl
        str = str + "</td>" + nl
        str = str + "<td>X" + ptp + "&nbsp;&nbsp;+ " + "</td>" + nl
        str = str + "<td align=""right"">" + nl
        str = str + prettyprint(sys(3), "html", delim, %F, %T) + nl
        str = str + "</td>" + nl
        str = str + "<td>U" + ptp + "</td>" + nl
        str = str + "</tr>" + nl
    end
    // Row #2
    str = str + "<tr>" + nl + "<td nowrap style=""white-space:nowrap"">" + nl
    str = str + "Y" + ptp + "</td>" + nl + "<td>=</td>" + nl
    str = str + "<td nowrap=""nowrap"" style=""white-space:nowrap"">" + nl
    str = str + prettyprint(sys(4),"html",delim, %F, %T)
    hasD = %T
    try
        hasD = norm(sys(5),1) <> 0
    end
    if ~html4 then
        str = str + " X" + ptp + nl
        if hasD then
            str = str + " + " + nl
            str = str + prettyprint(sys(5), "html", delim, %F, %T) + " U" + ptp + nl
        end
    else
        str = str + nl + "</td>" + nl + "<td>X" + ptp
        if ~hasD then
            str = str + "</td>" + nl + "<td></td><td></td>" + nl
        else
            str = str + "&nbsp;&nbsp;+ " + "</td>" + nl
            str = str + "<td align=""right"">" + nl
            str = str + prettyprint(sys(5), "html", delim, %F, %T) + "</td>" + nl
            str = str + "<td>U" + ptp + "</td>" + nl
        end
    end
    // Closures
    str = str + "</tr>" + nl + "</table>" + nl
endfunction

// ----------------------------------------------------------------------------

// LATEX
// =====
function [plus,minus,img,op,cp,ow,cw,d2s] = latexconf()
    plus = "+";
    minus = "-";
    img = "i";
    op = "(";
    cp = ")";
    ow = "$";
    cw = "$";
    d2s = latexdbl2str;
endfunction

function str = latexexp(var,n)
    if n >= 2 then
        str = var + "^{" + string(n) + "}";
    elseif n == 1 then
        str = var;
    else
        str = "";
    end
    if typ==2 then
        str = str + " " // Makes easier wrapping long polynomials
    end
endfunction

function str = rational2latex(num,den)
    str = "{\frac{" + num + "}{" + den + "}}"
endfunction

function str = latexdbl2str(x)
    if x == %inf then
        str = "{\infty}";
    elseif x == -%inf then
        str = "{-\infty}";
    elseif isnan(x) then
        str = "{\mathrm{NaN}}";
    else
        str = string(x);
        if type(x)~=8 & strindex(str,"D") <> [] then
            str = strsubst(str,"D+","D");
            str = strsubst(str,"D","\!\times\!10^{");
            str = str + "}";
        end
    end
endfunction

function str = lss2latex(sys)
    if sys(7) == "c" then
        der = "\dot{X}(t)";
    else
        der = "\stackrel{+}{X}(t)"
    end
    str = "{\left\{\begin{array}{rcl}" + der + "&=&" + ..
            prettyprint(sys(2),"latex","(",%F,%F) + " X(t)+" + ..
            prettyprint(sys(3),"latex","(",%F,%F) + "U(t)\cr " + ..
            "Y(t) &=& " + prettyprint(sys(4),"latex","(",%F,%F) + " X(t) ";
    try
        if norm(sys(5),1) == 0 then
            str = str + "\end{array}\right.}";
        else
            str = str + " + " + prettyprint(sys(5),"latex","(",%F,%F) + " U(t)\end{array}\right.}";
        end
    catch
        str = str + " + " + prettyprint(sys(5),"latex","(",%F,%F) + " U(t)\end{array}\right.}";
    end
endfunction

function str = latexmatrix(mat,delimiter)
    if argn(2) == 1 then
        delimiter = "(";
    end
    select delimiter
    case "[" then
        com = "bmatrix";
    case "(" then
        com = "pmatrix";
    case "|" then
        com = "vmatrix";
    case "" then
        com = "matrix";
    case "{" then
        com = "Bmatrix";
    case "||" then
        com = "Vmatrix";
    else
        com = "pmatrix";
    end
    [m,n] = size(mat);
    str = "{\begin{" + com + "}";
    if m*n == 0 then

        str = str + "\ ";
    else
        for i=1:m do
            str = str + strcat(mat(i,:),"&") + "\cr ";
        end
    end
    str = str + "\end{" + com + "}}";
endfunction

// ----------------------------------------------------------------------------

// TEX
// ===
function [plus,minus,img,op,cp,ow,cw,d2s] = texconf()
    [plus,minus,img,op,cp,ow,cw,d2s] = latexconf()
endfunction

function str = texexp(var,n)
    str = latexexp(var,n);
endfunction

function str = rational2tex(num,den)
    str = "{{" + num + "}\over{" + den + "}}"
endfunction

function str = texdbl2str(x)
    if x == %inf then
        str = "{\infty}";
    elseif x == -%inf then
        str = "{-\infty}";
    elseif isnan(x) then
        str = "{\rm{NaN}}";
    else
        str = string(x);
        if strindex(str,"D") <> [] then
            str = strsubst(str,"D+","D");
            str = strsubst(str,"D","\!\times\!10^{");
            str = str + "}";
        end
    end
endfunction

function str = lss2tex(sys)
    if sys(7) == "c" then
        der = "\dot{X}(t)";
    else
        der = "{\buildrel + \over X(t)}"
    end
    str = "{\left\{\eqalign{" + der + " &= " + ..
          prettyprint(sys(2),"tex","(",%F,%F) + " X(t)+" + ..
          prettyprint(sys(3),"tex","(",%F,%F) + "U(t)\cr " + ..
          "Y(t) &= " + prettyprint(sys(4),"tex","(",%F,%F) + " X(t) ";
    try
        if norm(sys(5),1) == 0 then
            str = str + "}\right.}";
        else
            str = str + " + " + prettyprint(sys(5),"tex","(",%F,%F) + " U(t)}\right.}";
        end
    catch
        str = str + " + " + prettyprint(sys(5),"tex","(",%F,%F) + " U(t)}\right.}";
    end
endfunction

function str = texmatrix(mat,delimiter)
    if argn(2) == 1 then
        delimiter = "(";
    end
    select delimiter
    case "[" then
        com = "bmatrix";
    case "(" then
        com = "pmatrix";
    case "|" then
        com = "vmatrix";
    case "" then
        com = "matrix";
    case "{" then
        com = "Bmatrix";
    case "||" then
        com = "Vmatrix";
    else
        com = "pmatrix";
    end
    [m,n] = size(mat);
    str = "{\" + com + "{";
    if m*n == 0 then
        str = str + "\ ";
    else
        for i=1:m do
            str = str + strcat(mat(i,:),"&") + "\cr ";
        end
    end
    str = str + "}}";
endfunction

// ----------------------------------------------------------------------------

//This function converts a complex (or a double) into a string in using the
//function d2s (double2string) fixed by mathmlconf or latexconf.
function str = comp2str(z,plus,minus,img,d2s)
    [m,n] = size(z);
    if m*n <> 1 then
        str = emptystr(z);
        for i=1:m do
            for j=1:n do
                str(i,j) = comp2str(z(i,j),plus,minus,img,d2s);
            end
        end
        return;
    end
    re = real(z);
    im = imag(z);
    if re == 0 & im == 0 then
        str = d2s(0);
        return;
    end;
    if re == 0 then
        if im == 1 then
            str = img;
        elseif im == -1 then
            str = minus + img;
        else
            str = d2s(im) + img;
        end
    elseif im == 0 then
        if re > 0 then
            str = d2s(re);
        else
            str = d2s(re);
        end
    elseif im > 0 | im<>im then
        if im == 1 then
            str = d2s(re) + plus + img;
        else
            str = d2s(re) + plus + d2s(im) + img;
        end
    else
        if im == -1 then
            str = d2s(re) + minus + img;
        else
            str = d2s(re) + d2s(im) + img;
        end
    end
endfunction

//This function convert a complex into a coefficient (parenthesis are eventually
// added around the coeff, if var=='' (i.e. var^0), no parenthesis are added.
function str = comp2coef(z,var,plus,minus,img,op,cp,d2s)
    [m,n] = size(z);
    if m*n <> 1 then
        str = emptystr(z);
        for i=1:m do
            for j=1:n do
                str(i,j) = comp2coef(z(i,j),var,plus,minus,img,op,cp,d2s);
            end
        end
        return;
    end
    // Scalar case
    re = real(z);
    im = imag(z);
    if var <> "" & var <> " " then
        if re <> 0 & im <> 0 then
            if re < 0 then
                str = minus + op + comp2str(-z,plus,minus,img,d2s) + cp + var;
            else
                str = plus + op + comp2str(z,plus,minus,img,d2s) + cp + var;
            end
        elseif re == 0 & im == 0 then
            str = "";
        elseif re == 1 & im == 0 then
            str = plus + var;
        elseif re == -1 & im == 0 then
            str = minus + var;
        elseif re > 0 | im > 0 then
            str = plus + comp2str(z,plus,minus,img,d2s) + var;
        else
            str = comp2str(z,plus,minus,img,d2s) + var;
        end
    else
        if re == 0 & im == 0 then
            str = "";
        else
            str = comp2str(z,plus,minus,img,d2s);
        end
    end
endfunction

// ----------------------------------------------------------------------------

function str = unknown_type(typ,a,exportFormat)
    try
        execstr("str=" + typ + "2" + exportFormat + "(a)");
    catch
        error(msprintf(gettext("%s: Type %s is not handled : Define the function %s2%s."),"prettyprint",typ,typ,exportFormat))
    end
endfunction
