// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 1312 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1312
//
// <-- Short Description -->
//    

// <-- TEST WITH GRAPHIC -->

sx=170;
sy=450;
hc=10:30:sy;

figure("position",[10 10 sx sy],..
    "backgroundcolor",rand(1,3));


h1=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""push-button"")",..
    "fontangle","normal","fontsize",15,..
    "fontunits","points","fontweight","normal",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(1) 150 20],..
    "SliderStep",[1 5],..
    "String","AaaaAaA",..
    "Style", "pushbutton",..
    "Tag","pb",..
    "Units","pixels",..
    "Userdata","a1",..
    "Value",12);

h2=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""Radio-button"")",..
    "fontangle","oblique","fontsize",15,..
    "fontunits","points","fontweight","demi",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(2) 150 16],..
    "SliderStep",[1 5],..
    "String","BbBBbb",..
    "Style", "radiobutton",..
    "Tag","rb",..
    "Units","points",..
    "Userdata","a2",..
    "Value",12);

h3=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""Check-Box"")",..
    "fontangle","oblique","fontsize",15,..
    "fontunits","points","fontweight","demi",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(3) 150 14],..
    "SliderStep",[1 5],..
    "String","CcCcCcCc",..
    "Style", "checkbox",..
    "Tag","pb",..
    "Units","pixels",..
    "Userdata","a3",..
    "Value",12);
h4=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""Edit"")",..
    "fontangle","oblique","fontsize",15,..
    "fontunits","pixels","fontweight","normal",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(4) 150 20],..
    "SliderStep",[1 5],..
    "String","DdDddDDd",..
    "Style", "edit",..
    "Tag","ed",..
    "Units","pixels",..
    "Userdata","a4",..
    "Value",12);

h5=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""Text"")",..
    "fontangle","oblique","fontsize",15,..
    "fontunits","points","fontweight","demi",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(5) 150 20],..
    "SliderStep",[1 5],..
    "String","EEeeEEeee",..
    "Style", "text",..
    "Tag","te",..
    "Units","pixels",..
    "Userdata","a5",..
    "Value",12);

h6=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""Slider"")",..
    "fontangle","oblique","fontsize",15,..
    "fontunits","points","fontweight","demi",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(6) 150 20],..
    "SliderStep",[1 5],..
    "String","FffFFfFFf",..
    "Style", "slider",..
    "Tag","sl",..
    "Units","pixels",..
    "Userdata","a6",..
    "Value",7);

h7=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""Frame"")",..
    "fontangle","normal","fontsize",15,..
    "fontunits","points","fontweight","bold",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(7) 150 20],..
    "SliderStep",[1 5],..
    "String","GgGgggG",..
    "Style", "frame",..
    "Tag","fr",..
    "Units","pixels",..
    "Userdata","a7",..
    "Value",12);

h8=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "String","H1|hH2|Hhh3|hH",..
    "Style", "popupmenu",..
    "callback","disp(""Pop-Menu"")",..
    "fontangle","oblique","fontsize",15,..
    "fontunits","points","fontweight","demi",..
    "ListboxTop",2,..
    "Max",12,"Min",2,..
    "Position",[10 hc(8) 150 20],..
    "SliderStep",[1 5],..
    "String","H1|hH2|Hhh3|hH",..
    "Tag","pm",..
    "Units","pixels",..
    "Userdata","a9",..
    "Value",1);

h9=uicontrol(gcf(),"backgroundcolor",rand(1,3),..
    "callback","disp(""List-box"")",..
    "fontangle","normal","fontsize",15,..
    "fontunits","points","fontweight","bold",..
    "ListboxTop",2,..
    "Max",12,"Min",-2,..
    "Position",[10 hc(9) 150 70],..
    "SliderStep",[1 5],..
    "String","Ii1|IIi2|I3|i4",..
    "Style", "listbox",..
    "Tag","lb",..
    "Units","pixels",..
    "Userdata","a8",..
    "Value",[1 2 3 4]);

delete(gcf());