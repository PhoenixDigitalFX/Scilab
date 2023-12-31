// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2002-2004 - INRIA - Vincent COUVERT
// Copyright (C) 2012 - 2016 - Scilab Enterprises
// Copyright (C) 2020 - Samuel GOUGEON
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function [scitree,trad,txt,crp] = m2sci(mtlbtree, nam, Recmode, prettyprintoutput)
    // This function translates Matlab interpreted code tree of a function to Scilab
    // Input arguments:
    //  - mtlbtree: tree (returned by macr2tree) representing Matlab function compiled code
    //  - nam: name of Matlb function
    //  - Recmode: boolean flag for recursive conversion if TRUE
    //  - prettyprintoutput: boolean flag for pretty printed output file if TRUE
    // Output arguments:
    //  - scitree: Scilab equivalent for mtlbtree
    //  - trad: code of function sci_<nam>
    //  - txt: Scilab equivalent function code (function declaration and variables initialisation)
    //  - crp: Scilab equivalent function code (function body)

    [lhs,rhs] = argn(0)
    if rhs==1 then
        error(gettext("Wrong number of inputs."))
    end
    if rhs==2 then Recmode = %f,end

    lcount = 1;

    // Level of clause indentation (used for getting temporary variables and for updating varslist)
    // if there is not a clause then size of level = 1 and the value is 0 (level=0)
    // add one size at level each time a new clause is found
    // if just one clause then size of level = 2,  the value of level(2) : the index of clause part for the first clause (1 for 'if' statements, 2 for first 'elseif' statements, 3 for first 'elseif' statements,...)
    // if there are 2 clauses, then size of level = 3, the value of level(3) : the index of clause part for the second clause (1 for if statements, 2 for first elseif statements, 3 for second elseif statements,...)
    // for example : level = [0,4,1] : in this case there are 2 clauses the index for the first clause (i.e level(2)) is 4 (4 for second 'elseif' statements), the index for the second clause (i.e level(3)) is 1 (1 for 'if' statements)
    // the first components of level (i.e level(1)) is always 0 (because in the zero level there is no clause, so there is no 'if' no 'elseif' no 'else')
    level = 0

    // Parameters declaration
    sciparam()

    // Scilab variable types
    Double   = 1;
    Polynomial = 2;
    Boolean  = 4;   // Boolean type can also be 6
    Sparse   = 5;   // Including Sparse boolean
    Int      = 8;
    Handle   = 9;
    String   = 10;
    Cell     = 17;
    Struct   = 16;
    Function = 12;  // Pseudo-type, gathering property = Macro | Builtin
    Macro    = 13;
    Builtin  = 130;
    Unknown  = -1;   // Unknown type or property or dimension
    SupToOne = -2;   // Dimension >1
    NotNull  = -3;   // Dimension >0
    Complex  = 1;     // "Complex"
    Real     = 0;     // "Real"
    Char     = 11;  // Property for String type
    TypeNames = struct("1","Double", "2","Polynomial", "4","Boolean",..
        "5","Sparse", "8","Int", "9","Handle", "10","String", ..
        "12","Function", "16","Struct", "17","Cell", "-1","Unknown");
    PropertyNames = struct("-1","Unknown","4","Boolean","5","Sparse","13","Macro",..
        "130","Builtin","0","Real","1","Complex","10","String","11","Char");
    Units = ["pixels","centimeters","points","inches","normalized"]
    Colon = Variable(":", Infer(list(Unknown,1),Type(Double,Real)))

    global %graphics
    %graphics = struct()
    %graphics.type = Double
    %graphics.units = "pixels"

    // Translated function input arguments
    macrhs = size(mtlbtree.inputs)
    global("varslist")
    varslist = list()
    for k = 1:macrhs
        if funptr(mtlbtree.inputs(k).name)<>0 then // Matlab variable name corresponding to a Scilab function name
            varslist($+1) = M2scivar("%"+mtlbtree.inputs(k).name,mtlbtree.inputs(k).name,Infer())
            mtlbtree.inputs(k).name = "%"+mtlbtree.inputs(k).name,
        elseif mtlbtree.inputs(k).name=="varargin" then
            varslist($+1) = M2scivar("varargin","varargin",Infer(list(Unknown,Unknown),Type(Cell,Unknown)))
        else
            varslist($+1) = M2scivar(mtlbtree.inputs(k).name,mtlbtree.inputs(k).name,Infer())
        end
    end
    // Add predefined variables in the defined variables
    varslist($+1) = M2scivar("%i","%i",Infer(list(1,1),Type(Double,Complex)))
    varslist($+1) = M2scivar("%i","%j",Infer(list(1,1),Type(Double,Complex)))
    varslist($+1) = M2scivar("%nan","NaN",Infer(list(1,1),Type(Double,Real)))
    varslist($+1) = M2scivar("%nan","nan",Infer(list(1,1),Type(Double,Real)))
    varslist($+1) = M2scivar("%inf","Inf",Infer(list(1,1),Type(Double,Real)))
    varslist($+1) = M2scivar("%inf","inf",Infer(list(1,1),Type(Double,Real)))
    varslist($+1) = M2scivar("%pi","pi",Infer(list(1,1),Type(Double,Real)))
    varslist($+1) = M2scivar("%eps","eps",Infer(list(1,1),Type(Double,Real)))
    varslist($+1) = M2scivar(":", ":", Infer(list(1,Unknown),Type(Unknown,Unknown)))
    varslist($+1) = M2scivar("$", "$", Infer(list(1,1),Type(Double,Real)))
    varslist($+1) = M2scivar("varargout","%varargout",Infer(list(Unknown,Unknown),Type(Cell,Unknown)))

    // Translated function output arguments
    maclhs = size(mtlbtree.outputs)
    for k = 1:maclhs
        if funptr(mtlbtree.outputs(k).name)<>0 then
            varslist($+1) = M2scivar("%"+mtlbtree.outputs(k).name,mtlbtree.outputs(k).name,Infer(list(0,0),Type(Double,Real)))
            mtlbtree.outputs(k).name = "%"+mtlbtree.outputs(k).name
        else
            varslist($+1) = M2scivar(mtlbtree.outputs(k).name,mtlbtree.outputs(k).name,Infer(list(0,0),Type(Double,Real)))
        end
    end

    // Translation
    [scitree,crp] = mtlbtree2sci(mtlbtree,prettyprintoutput)

    dcl = []
    // Add special code
    // If nargin or nargout function is used
    if isdefinedvar("%nargin") | isdefinedvar("%nargout") then
        dcl = ["";gettext("// Number of arguments in function call");"[%nargout,%nargin] = argn(0)"]
    end

    // Initial value of lhs arguments
    // If they are not initialized by input value, they are initialized with []
    ini = []
    for k = 1:size(mtlbtree.outputs)
        found = %F
        for l = 1:size(mtlbtree.inputs)
            if mtlbtree.inputs(l).name==mtlbtree.outputs(k).name then
                found = %T
            end
        end
        if ~found then
            if mtlbtree.outputs(k).name<>"varargout" then
                ini = [ini;mtlbtree.outputs(k).name+" = [];"]
            else
                ini = [ini;mtlbtree.outputs(k).name+" = list();"]
            end
        end
    end

    // Graphics init
    //graph_ini = [gettext("// Graphics initialisation");"global %graphics";"%graphics.type = 1";"%graphics.units = ""pixels"""];
    graph_ini = []
    if ini<>[] then
        ini = ["";gettext("// Output variables initialisation (not found in input variables)");ini]
    end
    //ini = [ini;" ";graph_ini]

    // Info on macros variables
    if verbose_mode<0 then
        write(%io(2),gettext("TESTING M2SCI: creating varslist file..."))
        n = size(varslist)
        info = []

        for k = 1:n
            info = [info;"//"+varslist(k).sciname+infer2txt(varslist(k).infer)];
        end
        infofilename = res_path+nam+"_varslist.dia.ref";
        if verbose_mode==-2 then
            write(%io(2),info)
        end
        infofile = mopen(infofilename,"w");
        mputl(info,infofile);
        mclose(infofile);
    end

    // Add function header
    if ~batch then
        rhsexpr = "("
        for k = 1:macrhs
            rhsexpr = rhsexpr+varslist(k).sciname
            if k<macrhs then
                rhsexpr = rhsexpr+","
            end
        end
        rhsexpr = rhsexpr+")"
        hdr = "function ["
        for k = 1:size(mtlbtree.outputs)
            hdr = hdr+mtlbtree.outputs(k).name
            if k<>size(mtlbtree.outputs) then
                hdr = hdr+","
            end
        end
        hdr = hdr+"] = "+nam+rhsexpr;
        txt = [hdr;ini;dcl]
    else
        txt = [ini;dcl]
    end

    // Generate associated translation function
    if batch then
        trad = [
        "function [tree] = sci_"+fnam+"(tree)"
        msprintf(gettext("// Generated by M2SCI\n// Conversion function for Matlab %s\n// Input: tree = Matlab funcall tree\n// Output: tree = Scilab equivalent for tree"),fnam)
        ""
        "tree = Funcall(""exec"",1,Rhs_tlist(tree.name),tree.lhs)"
        ]
    else
        trad = [
        "function [tree] = sci_"+nam+"(tree)"
        msprintf(gettext("// Copyright INRIA (Generated by M2SCI)\n// Conversion function for Matlab %s()\n// Input: tree = Matlab funcall tree\n// Output: tree = Scilab equivalent for tree"),nam)
        ]

        if maclhs==0 then // Function with no outputs
            // Do nothing
        elseif maclhs==1 then // Function with one output
            [boolval,index] = isdefinedvar(M2scivar(mtlbtree.outputs(1).name,strsubst(mtlbtree.outputs(1).name,"%",""),Infer()))
            if boolval then
                dims = sci2exp(varslist(index).dims)
                vtype = varslist(index).vtype
                prop = varslist(index).property
            else
                dims = "list(Unknown,Unknown)"
                vtype = Unknown
                prop = Unknown
            end

            select vtype
            case Boolean  then vtype = "Boolean"
            case Int      then vtype = "Int"
            case Double   then vtype = "Double"
            case Sparse   then vtype = "Sparse"
            case Polynomial then vtype = "Polynomial"
            case String   then vtype = "String"
            case Handle   then vtype = "Handle"
            case Function then vtype = "Function"
            case Struct   then vtype = "Struct"
            case Cell     then vtype = "Cell"
            case Unknown  then vtype = "Unknown"
            end

            select prop
            case Unknown    then prop = "Unknown"
            case Real       then prop = "Real"
            case Complex    then prop = "Complex"
            case Sparse     then prop = "Sparse"
            case Char       then prop = "Char"
            case Macro      then prop = "Macro"
            case Builtin    then prop = "Builtin"
            case Polynomial then prop = "Polynomial"
            end

            typ = "Type("+vtype+","+prop+")"

            if mtlbtree.outputs($).name<>"varargout" then
                trad = [trad;"tree.lhs(1).dims = "+dims;"tree.lhs(1).type = "+typ]
            else
                trad = [trad;
                "for k = 1:lhs"
                "  tree.lhs(k).dims = list(Unknown,Unknown)"
                "  tree.lhs(k).vtype = Unknown"
                "  tree.lhs(k).property = Unknown"
                "end"
                ]
            end
        else  // Function with more than 1 output
            dims = list();
            vtype = [];
            prop = []
            for k = 1:maclhs
                [boolval,index] = isdefinedvar(M2scivar(mtlbtree.outputs(k).name,strsubst(mtlbtree.outputs(k).name,"%",""),Infer()))
                if boolval then
                    dims(k) = varslist(index).dims
                    vtype = [vtype;varslist(index).vtype]
                    prop = [prop;varslist(index).property]
                else
                    dims(k) = list(Unknown,Unknown)
                    vtype = [vtype;Unknown]
                    prop = [prop;Unknown]
                end
            end

            dimstemp = sci2exp(dims)
            dims = ["dims = "+dimstemp(1);dimstemp(2:$)]
            vtype = "vtype = "+sci2exp(vtype)
            prop = "prop = "+sci2exp(prop)
            trad = [trad;
            gettext("//  dims(i,:) is the ith output argument dimensions vector")
            dims
            gettext("//  dims(i,:) is the ith output argument dimensions vector")
            vtype
            gettext("//  prop(i) is the ith output argument property")
            prop]
            if mtlbtree.outputs($).name<>"varargout" then
                trad = [trad;
                "for k = 1:lhs"
                "  tree.lhs(k).dims = dims(k)"
                "  tree.lhs(k).vtype = vtype(k)"
                "  tree.lhs(k).property = prop(k)"
                "end"
                ]
            else
                trad = [trad;
                "for k = 1:min(size(dims),lhs)"
                "  tree.lhs(k).dims = dims(k)"
                "  tree.lhs(k).vtype = vtype(k)"
                "  tree.lhs(k).property = prop(k)"
                "end"
                gettext("// Inference for varargout")
                "for k = min(size(dims),lhs)+1:lhs"
                "  tree.lhs(k).dims = list(Unknown,Unknown)"
                "  tree.lhs(k).vtype = Unknown"
                "  tree.lhs(k).property = Unknown"
                "end"
                ]
            end
        end
    end
    trad = [trad;"endfunction"]
    clearglobal varslist
    clearglobal %graphics
endfunction

// ---------------------------------------------------------------------------

function txt = infer2txt(infer)
    txt = []
    dims = []
    if typeof(infer)=="infer" then
        for l = 1:size(infer.dims)
            dims = [dims,string(infer.dims(l))]
        end
    else
        error(gettext("Not yet implemented."))
    end
    dims = strcat(dims," ")

    tp = infer.type.vtype
    if or(tp==[Boolean,6]) then
        tp = "Boolean"
    elseif tp==Int then
        tp = "Int"
    elseif tp==Double then
        tp = "Double"
    elseif tp==Polynomial then
        tp = "Polynomial"
    elseif tp==String then
        tp = "String"
    elseif tp==Handle then
        tp = "Handle"
    elseif tp==Function then
        tp = "Function"
    elseif tp==Struct then
        tp = "Struct"
        for k = 1:size(infer.contents.index)
            if typeof(infer.contents.index(k))<>"list" then
                txt = [txt;expression2code(list(infer.contents.index(k)))+infer2txt(infer.contents.data(k))]
            else
                txt = [txt;expression2code(infer.contents.index(k))+infer2txt(infer.contents.data(k))]
            end
        end
    elseif tp==17 then
        tp = "Cell"
        for k = 1:size(infer.contents.index)
            if typeof(infer.contents.index(k))<>"list" then
                txt = [txt;expression2code(list(infer.contents.index(k)))+infer2txt(infer.contents.data(k))]
            else
                txt = [txt;expression2code(infer.contents.index(k))+infer2txt(infer.contents.data(k))]
            end
        end
    else
        tp = "Unknown"
    end
    p = infer.type.property
    select p
    case Real
        prop = "Real"
    case Complex
        prop = "Complex"
    case Sparse
        prop = "Sparse"
    case String
        prop = "String"
    case Char
        prop = "Char"
    case Macro
        prop = "Macro"
    case Builtin
        prop = "Builtin"
    else
        if type(p)==10 & ..
           or(p==["int8" "int16" "int32" "int64" ..
                  "uint8" "uint16" "uint32" "uint64" ..
                  "Figure" "Axes"])
            prop = p
        else
            prop = "Unknown"
        end
    end
    txt = ["|"+dims+"|"+tp+"|"+prop;txt]
endfunction
