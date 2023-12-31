/*
 *  Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 *  Copyright (C) 2015 - Scilab Enterprises - Calixte DENIZET
 *
 *  This file must be used under the terms of the CeCILL.
 *  This source file is licensed as described in the file COPYING, which
 *  you should have received as part of this distribution.  The terms
 *  are also available at
 *  https://www.cecill.info/licences/Licence_CeCILL_V2.1-en.txt
 *
 */

#include <string>

#include "config/cnes/CNESException.hxx"
#include "config/cnes/ToolConfiguration.hxx"
#include "XMLtools.hxx"

namespace slint
{

namespace CNES
{

ToolConfiguration ToolConfiguration::createFromXml(const std::wstring & path)
{
    xmlDoc * doc = slint::XMLtools::readXML(path);
    xmlNode * root = xmlDocGetRootElement(doc);

    std::string name((const char *)root->name);
    if (name == "toolConfiguration")
    {
        ToolConfiguration toolConfiguration(ToolConfigurationType::createFromXmlNode(root));
        xmlFreeDoc(doc);

        return toolConfiguration;
    }
    else
    {
        xmlFreeDoc(doc);
        throw CNESException(L"Invalid tool configuration file");
    }
}

} // namespace CNES

} // namespace slint
