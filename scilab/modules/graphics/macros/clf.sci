// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
// Copyright (C) 2012 - 2016 - Scilab Enterprises
// Copyright (C) 2017 - 2019 - Samuel GOUGEON
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function clf(varargin)

    nbArg = size(varargin);
    protected = ["atomsFigure" "scilab_demo_fig" "m2sci_gui"];

    if nbArg==0 then
        h = gcf()
        if or(h.tag==protected)
            h = []
            fid = winsid()
            for id = fid($:-1:1)
                f = scf(id);
                if and(f.tag~=protected)
                    h = f
                    break
                end
            end
            if h==[]
                h = scf()
            end
        end
        job = "clear"

    elseif nbArg==1 then
        if type(varargin(1))==1 then     // win num given
            num = varargin(1)
            h = [];
            for k = 1:size(num,"*")
                h = [h ; findobj("figure_id",num(k))];
            end
            job = "clear"
        elseif type(varargin(1))==9 then // handle given
            h = varargin(1);
            job = "clear"
        elseif type(varargin(1))==10 then // job given
            h = gcf()
            job = varargin(1)
        end

    elseif nbArg==2 then
        if type(varargin(1))==1 then     // win num given
            num = varargin(1)
            h = [];
            for k = 1:size(num,"*")
                h = [h ; findobj("figure_id",num(k))];
            end
        elseif type(varargin(1))==9 then // handle given
            h = varargin(1);
        end
        job = varargin(2);

    else
        msg = _("%s: Wrong number of input argument(s): %d to %d expected.")
        error(msprintf(msg, "clf", 0, 2))
    end

    if and(job<>["clear","reset"]) then
        msg = _("%s: Wrong value for input argument #%d: ''clear'' or ''reset'' expected.")
        error(msprintf(msg, "clf", nbArg))
    end

    nbHandles = size(h,"*");
    if nbHandles == 0 then
        return
    end

    // check that all the handles are figures or uicontrol frames
    for k = 1:nbHandles
        curFig = h(k);
        if curFig.type <> "Figure" & (curFig.type <> "uicontrol" | curFig.style <> "frame")
            msg = _("%s: Wrong type for input argument #%d: A vector of ''Figure'' or ''Frame'' handle expected.")
            error(msprintf(msg, "clf", 1))
        end
    end

    // Creation of a template figure, to get native menus to preserve or reset
    if or(h.type=="Figure") & get(get(0),"showhiddenhandles")=="on"
        tmpfig = figure("visible","off")
        menus = tmpfig.children(tmpfig.children.type=="uimenu")
    else
        menus = []
    end

    // delete childrens
    for k = 1:nbHandles
        curFig = h(k)

        if or(curFig.tag==protected) then
            continue
        end
        //
        if curFig.type == "uicontrol" then
            haveAxes = %F;
            for kChild = 1:size(curFig.children, "*")
                if curFig.children(kChild).type=="Axes" then
                    haveAxes = %T;
                    break
                end
            end
            delete(curFig.children);
            if haveAxes then
                newaxes(curFig);
            end
        else
            // Forces drawlater
            immediateMode = curFig.immediate_drawing;
            curFig.immediate_drawing = "off";
            curFig.info_message = "";            // Clears the infobar message
            curFig.event_handler_enable = "off"; // Disables the event handler
            // Deletes children, but manages native menus
            clf_clear_children(curFig, job, menus);
            // Restores the drawlater entry status:
            curFig.immediate_drawing = immediateMode;
        end
    end
    if isdef("tmpfig","l") then
        close(tmpfig)
    end

    // reset figures to default values if needed
    if (job == "reset") then
        defaultFig = gdf();
        // This literal list should be replaced with a getproperties(gdf())
        // when such a function will be available:
        allprops = [
        "children"
        "figure_position"
        "figure_size"
        "axes_size"
        "auto_resize"
        "viewport"
        "figure_name"
        "figure_id"
        "info_message"
        "color_map"
        "pixel_drawing_mode"
        "anti_aliasing"
        "immediate_drawing"
        "background"
        "visible"
        "rotation_style"
        "event_handler"
        "event_handler_enable"
        "user_data"
        "resizefcn"
        "closerequestfcn"
        "resize"
        "toolbar"
        "toolbar_visible"
        "menubar"
        "menubar_visible"
        "infobar_visible"
        "dockable"
        "layout"
        "layout_options"
        "default_axes"
        "icon"
        "tag"
        ];
        excluded0 = ["children" "figure_id" "dockable" "menubar" "toolbar" "immediate_drawing"]
        excluded0 = [excluded0 "layout" "layout_options"] // https://gitlab.com/scilab/scilab/-/issues/14955
        for k = 1: nbHandles
            curFig = h(k);
            if curFig.type == "uicontrol" | or(curFig.tag == protected) then
                continue
            end

            // Forces drawlater mode
            curFig.immediate_drawing = "off";

            // properties to set
            excluded = excluded0
            if isDocked(curFig)            // https://gitlab.com/scilab/scilab/-/issues/11476
                excluded = [excluded "figure_position" "figure_size" "axes_size"]
            end
            defaultProps = setdiff(allprops, excluded);

            // Settings
            for i = 1:size(defaultProps,"*")
                defaultValue = get(defaultFig, defaultProps(i));
                if (defaultProps(i) <> "figure_position" | defaultValue <> [-1,-1]) then
                    // don't reset figure pos is defaultValue is [-1,-1]
                    set(curFig, defaultProps(i), defaultValue);
                end
            end
            set(curFig, "immediate_drawing", defaultFig.immediate_drawing)
        end
    end
endfunction

// --------------------------------------------------------------------------

function clf_clear_children(h, job, menus)
    // internal only called for Figures (not for frames)
    c = curFig.children
    if  menus==[] then
        delete(c)  // native menus are not seen and not deleted
    else
        // Native menus must be preserved
        labels = menus.label
        tmp = c.type <> "uimenu"
        delete(c(tmp)) // But a default axes might have been recreated
        c = curFig.children
        for i = length(c):-1:1
            if c(i).type <> "uimenu"    // Possible default axes
                continue
            end
            tmp = c(i).label
            j = find(c(i).label==menus.label)
            if j==[]
                delete(c(i))    // Not native menu
            else
                // We keep the menu. We possibly reset it
                if job=="reset"
                    // the template menu is inserted as children(1):
                    // hm = copy(menus(j), h)   // yields an error
                    // swap_handles(hm,c(i))
                    // delete(curFig.children(1))
                    // => How to restore default native menus?
                end
            end
        end
    end
endfunction
