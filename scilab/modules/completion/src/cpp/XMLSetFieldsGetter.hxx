/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2013 - Scilab Enterprises - Calixte DENIZET
 *
 * Copyright (C) 2012 - 2016 - Scilab Enterprises
 *
 * This file is hereby licensed under the terms of the GNU GPL v2.0,
 * pursuant to article 5.3.4 of the CeCILL v.2.1.
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.
 * For more information, see the COPYING file which you should have received
 * along with this program.
 *
 */

#ifndef __XMLSETFIELDSGETTER_HXX__
#define __XMLSETFIELDSGETTER_HXX__

#include <string>
#include <cstring>

#include "FieldsGetter.hxx"
#include "XMLFieldsGetter.hxx"
#include "xmlObjects.h"

extern "C"
{
#include "sci_malloc.h"
#include "os_string.h"
}

using namespace org_modules_xml;

namespace org_modules_completion
{

/**
 * @file
 * @author Calixte DENIZET <calixte.denizet@scilab.org>
 *
 * Class to manage the retrievment of the fields name of a XML object
 */
class XMLSetFieldsGetter : public XMLFieldsGetter
{

public :
    XMLSetFieldsGetter() { }

    virtual ~XMLSetFieldsGetter() { }

    virtual const char ** getFieldsName(const std::string & typeName, int * mlist, char ** fieldPath, const int fieldPathLen, int * fieldsSize) const;

    static const char ** getFieldsName(const XMLNodeSet * set, char ** fieldPath, const int fieldPathLen, int * fieldsSize);
};
}

#endif
