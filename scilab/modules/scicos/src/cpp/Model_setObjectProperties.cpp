/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2014-2016 - Scilab Enterprises - Clement DAVID
 * Copyright (C) 2017 - ESI Group - Clement DAVID
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

#include <algorithm>
#include <string>
#include <vector>
#include <cstring> // for memcpy

#include "Model.hxx"
#include "utilities.hxx"

#include "model/BaseObject.hxx"
#include "model/Annotation.hxx"
#include "model/Diagram.hxx"
#include "model/Block.hxx"
#include "model/Link.hxx"
#include "model/Port.hxx"

extern "C" {
#include "sci_types.h"
}

// Check the model at runtime (children / parent ; block / ports)
#define SANITY_CHECK 0

namespace org_scilab_modules_scicos
{

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, double v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        model::Port* o = static_cast<model::Port*>(baseObject);
        switch (p)
        {
            case FIRING:
                return o->setFiring(v);
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, int v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        model::Block* o = static_cast<model::Block*>(baseObject);
        switch (p)
        {
            case SIM_FUNCTION_API:
                return o->setSimFunctionApi(v);
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        model::Diagram* o = static_cast<model::Diagram*>(baseObject);
        switch (p)
        {
            case DEBUG_LEVEL:
                return o->setDebugLevel(v);
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        model::Link* o = static_cast<model::Link*>(baseObject);
        switch (p)
        {
            case COLOR:
                return o->setColor(v);
            case KIND:
                return o->setKind(v);
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        model::Port* o = static_cast<model::Port*>(baseObject);
        switch (p)
        {
            case PORT_KIND:
                return o->setKind(v);
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, bool v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        model::Port* o = static_cast<model::Port*>(baseObject);
        switch (p)
        {
            case IMPLICIT:
                return o->setImplicit(v);
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, ScicosID v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        model::Annotation* o = static_cast<model::Annotation*>(baseObject);
        switch (p)
        {
            case PARENT_DIAGRAM:
                return o->setParentDiagram(v);
            case PARENT_BLOCK:
                return o->setParentBlock(v);
            case RELATED_TO:
                return o->setRelatedTo(v);
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        model::Block* o = static_cast<model::Block*>(baseObject);
        switch (p)
        {
            case PARENT_DIAGRAM:
                return o->setParentDiagram(v);
            case PARENT_BLOCK:
                return o->setParentBlock(v);
            case LABEL:
                return o->setLabel(v);
            case PORT_REFERENCE:
                return o->setPortReference(v);
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        model::Link* o = static_cast<model::Link*>(baseObject);
        switch (p)
        {
            case PARENT_DIAGRAM:
                return o->setParentDiagram(v);
            case PARENT_BLOCK:
                return o->setParentBlock(v);
            case LABEL:
                return o->setLabel(v);
            case SOURCE_PORT:
#if SANITY_CHECK
            {
                ScicosID oppositePort = ScicosID();
                getObjectProperty(o, DESTINATION_PORT, oppositePort);
                if (v != ScicosID() && oppositePort == v)
                {
                    abort();
                }
            }
#endif /* SANITY CHECK */
            return o->setSourcePort(v);
            case DESTINATION_PORT:
#if SANITY_CHECK
            {
                ScicosID oppositePort = ScicosID();
                getObjectProperty(o, SOURCE_PORT, oppositePort);
                if (v != ScicosID() && oppositePort == v)
                {
                    abort();
                }
            }
#endif /* SANITY CHECK */
            return o->setDestinationPort(v);
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        model::Port* o = static_cast<model::Port*>(baseObject);
        switch (p)
        {
            case SOURCE_BLOCK:
                return o->setSourceBlock(v);
            case CONNECTED_SIGNALS:
                return o->setConnectedSignals(std::vector<ScicosID> (1, v));
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, std::string v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        model::Annotation* o = static_cast<model::Annotation*>(baseObject);
        switch (p)
        {
            case DESCRIPTION:
                return o->setDescription(v);
            case FONT:
                return o->setFont(v);
            case FONT_SIZE:
                return o->setFontSize(v);
            case STYLE:
                return o->setStyle(v);
            case UID:
                return o->setUID(v);
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        model::Block* o = static_cast<model::Block*>(baseObject);
        switch (p)
        {
            case INTERFACE_FUNCTION:
                return o->setInterfaceFunction(v);
            case SIM_FUNCTION_NAME:
                return o->setSimFunctionName(v);
            case SIM_BLOCKTYPE:
                return o->setSimBlocktype(v);
            case STYLE:
                return o->setStyle(v);
            case DESCRIPTION:
                return o->setDescription(v);
            case UID:
                return o->setUID(v);
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        model::Diagram* o = static_cast<model::Diagram*>(baseObject);
        switch (p)
        {
            case TITLE:
                return o->setTitle(v);
            case PATH:
                return o->setPath(v);
            case VERSION_NUMBER:
                return o->setVersionNumber(v);
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        model::Link* o = static_cast<model::Link*>(baseObject);
        switch (p)
        {
            case STYLE:
                return o->setStyle(v);
            case DESCRIPTION:
                return o->setDescription(v);
            case UID:
                return o->setUID(v);
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        model::Port* o = static_cast<model::Port*>(baseObject);
        switch (p)
        {
            case STYLE:
                return o->setStyle(v);
            case LABEL:
                return o->setLabel(v);
            case UID:
                return o->setUID(v);
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, const std::vector<double>& v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        model::Annotation* o = static_cast<model::Annotation*>(baseObject);
        switch (p)
        {
            case GEOMETRY:
                return o->setGeometry(v);
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        model::Block* o = static_cast<model::Block*>(baseObject);
        switch (p)
        {
            case GEOMETRY:
                return o->setGeometry(v);
            case EXPRS:
                return o->setExprs(v);
            case STATE:
                return o->setState(v);
            case DSTATE:
                return o->setDState(v);
            case ODSTATE:
                return o->setODState(v);
            case RPAR:
                return o->setRpar(v);
            case OPAR:
                return o->setOpar(v);
            case EQUATIONS:
                return o->setEquations(v);
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        model::Diagram* o = static_cast<model::Diagram*>(baseObject);
        switch (p)
        {
            case PROPERTIES:
                return o->setProperties(v);
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        model::Link* o = static_cast<model::Link*>(baseObject);
        switch (p)
        {
            case CONTROL_POINTS:
                return o->setControlPoints(v);
            case THICK:
                return o->setThick(v);
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, const std::vector<int>& v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        model::Block* o = static_cast<model::Block*>(baseObject);
        switch (p)
        {
            case SIM_DEP_UT:
                return o->setSimDepUT(v);
            case NZCROSS:
                return o->setNZcross(v);
            case NMODE:
                return o->setNMode(v);
            case IPAR:
                return o->setIpar(v);
            case COLOR:
                return o->setChildrenColor(v);
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        model::Diagram* o = static_cast<model::Diagram*>(baseObject);
        switch (p)
        {
            case COLOR:
                return o->setColor(v);
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        model::Port* o = static_cast<model::Port*>(baseObject);
        switch (p)
        {
            case DATATYPE:
                return o->setDataType(this, v);
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, const std::vector<bool>& /*v*/)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, const std::vector<std::string>& v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        model::Block* o = static_cast<model::Block*>(baseObject);
        switch (p)
        {
            case DIAGRAM_CONTEXT:
                return o->setContext(v);
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        model::Diagram* o = static_cast<model::Diagram*>(baseObject);
        switch (p)
        {
            case DIAGRAM_CONTEXT:
                return o->setContext(v);
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    return FAIL;
}

update_status_t Model::setObjectProperty(model::BaseObject* object, object_properties_t p, const std::vector<ScicosID>& v)
{
    model::BaseObject* baseObject = object;
    if (baseObject == nullptr)
    {
        return FAIL;
    }
    kind_t k = object->kind();

    if (k == ANNOTATION)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == BLOCK)
    {
        model::Block* o = static_cast<model::Block*>(baseObject);
        switch (p)
        {
            case INPUTS:
#if SANITY_CHECK
                for (ScicosID port : v)
                {
                    model::BaseObject* p = getObject(port);

                    ScicosID parent = ScicosID();
                    getObjectProperty(p, SOURCE_BLOCK, parent);
                    if (parent != ScicosID() && parent != baseObject->id())
                    {
                        abort();
                    }
                }
#endif /* SANITY_CHECK */
                return o->setIn(v);
            case OUTPUTS:
#if SANITY_CHECK
                for (ScicosID port : v)
                {
                    model::BaseObject* p = getObject(port);

                    ScicosID parent = ScicosID();
                    getObjectProperty(p, SOURCE_BLOCK, parent);
                    if (parent != ScicosID() && parent != baseObject->id())
                    {
                        abort();
                    }
                }
#endif /* SANITY_CHECK */
                return o->setOut(v);
            case EVENT_INPUTS:
#if SANITY_CHECK
                for (ScicosID port : v)
                {
                    model::BaseObject* p = getObject(port);

                    ScicosID parent = ScicosID();
                    getObjectProperty(p, SOURCE_BLOCK, parent);
                    if (parent != ScicosID() && parent != baseObject->id())
                    {
                        abort();
                    }
                }
#endif /* SANITY_CHECK */
                return o->setEin(v);
            case EVENT_OUTPUTS:
#if SANITY_CHECK
                for (ScicosID port : v)
                {
                    model::BaseObject* p = getObject(port);

                    ScicosID parent = ScicosID();
                    getObjectProperty(p, SOURCE_BLOCK, parent);
                    if (parent != ScicosID() && parent != baseObject->id())
                    {
                        abort();
                    }
                }
#endif /* SANITY_CHECK */
                return o->setEout(v);
            case CHILDREN:
#if SANITY_CHECK
                for (ScicosID child : v)
                {
                    if (child == ScicosID())
                    {
                        continue;
                    }

                    model::BaseObject* c = getObject(child);

                    // Check hierarchy
                    ScicosID parent = ScicosID();
                    getObjectProperty(c, PARENT_BLOCK, parent);
                    if (parent != baseObject->id())
                    {
                        abort();
                    }

                    ScicosID parentDiagram = ScicosID();
                    getObjectProperty(o, PARENT_DIAGRAM, parentDiagram);
                    ScicosID parentParentDiagram  = ScicosID();
                    getObjectProperty(parent, BLOCK, PARENT_DIAGRAM, parentParentDiagram);
                    if (parentDiagram != parentParentDiagram)
                    {
                        abort();
                    }
                    
                    // Check port connections
                    if (c->kind() == BLOCK)
                    {
                        std::vector<ScicosID> ports;
                        for (object_properties_t prop : { INPUTS, OUTPUTS, EVENT_INPUTS, EVENT_OUTPUTS } )
                        {
                            getObjectProperty(c, prop, ports);
                            for (ScicosID port : ports)
                            {
                                ScicosID signal = ScicosID();
                                getObjectProperty(port, PORT, CONNECTED_SIGNALS, signal);
                                if (signal == ScicosID())
                                    continue;

                                if (std::find(v.begin(), v.end(), signal) == v.end())
                                    abort();
                            }
                        }
                    }

                    // Check link connection
                    if (c->kind() == LINK)
                    {
                        ScicosID src = ScicosID();
                        getObjectProperty(c, SOURCE_PORT, src);
                        ScicosID srcBlock = ScicosID();
                        getObjectProperty(src, PORT, SOURCE_BLOCK, srcBlock);
                        ScicosID dest = ScicosID();
                        getObjectProperty(c, DESTINATION_PORT, dest);
                        ScicosID destBlock = ScicosID();
                        getObjectProperty(dest, PORT, SOURCE_BLOCK, destBlock);

                        // a connected port as unset block
                        if (src != ScicosID() && srcBlock == ScicosID())
                            abort();
                        if (dest != ScicosID() && destBlock == ScicosID())
                            abort();

                        // a connected port should be in the same layer as its link
                        if (srcBlock != ScicosID())
                            if (std::find(v.begin(), v.end(), srcBlock) == v.end())
                                abort();
                        if (destBlock != ScicosID())
                            if (std::find(v.begin(), v.end(), destBlock) == v.end())
                                abort();
                    }
                }
#endif /* SANITY_CHECK */
                return o->setChildren(v);
            default:
                break;
        }
    }
    else if (k == DIAGRAM)
    {
        model::Diagram* o = static_cast<model::Diagram*>(baseObject);
        switch (p)
        {
            case CHILDREN:
#if SANITY_CHECK
                for (ScicosID child : v)
                {
                    if (child == ScicosID())
                    {
                        continue;
                    }

                    model::BaseObject* c = getObject(child);

                    // Check hierarchy
                    ScicosID parent = ScicosID();
                    getObjectProperty(c, PARENT_BLOCK, parent);
                    if (parent != ScicosID() && parent != baseObject->id())
                    {
                        abort();
                    }

                    getObjectProperty(c, PARENT_DIAGRAM, parent);
                    if (parent != ScicosID() && parent != baseObject->id())
                    {
                        abort();
                    }
                    
                    // Check port connections
                    if (c->kind() == BLOCK)
                    {
                        std::vector<ScicosID> ports;
                        for (object_properties_t prop : { INPUTS, OUTPUTS, EVENT_INPUTS, EVENT_OUTPUTS } )
                        {
                            getObjectProperty(c, prop, ports);
                            for (ScicosID port : ports)
                            {
                                ScicosID signal = ScicosID();
                                getObjectProperty(port, PORT, CONNECTED_SIGNALS, signal);
                                if (signal == ScicosID())
                                    continue;

                                if (std::find(v.begin(), v.end(), signal) == v.end())
                                    abort();
                            }
                        }
                    }

                    // Check link connection
                    if (c->kind() == LINK)
                    {
                        ScicosID from = ScicosID();
                        getObjectProperty(c, SOURCE_PORT, from);
                        ScicosID fromBlock = ScicosID();
                        getObjectProperty(from, PORT, SOURCE_BLOCK, fromBlock);
                        ScicosID to = ScicosID();
                        getObjectProperty(c, DESTINATION_PORT, to);
                        ScicosID toBlock = ScicosID();
                        getObjectProperty(to, PORT, SOURCE_BLOCK, toBlock);

                        // a connected port as unset block
                        if (from != ScicosID() && fromBlock == ScicosID())
                            abort();
                        if (to != ScicosID() && toBlock == ScicosID())
                            abort();

                        // a connected port should be in the same layer as its link
                        if (fromBlock != ScicosID())
                            if (std::find(v.begin(), v.end(), fromBlock) == v.end())
                                abort();
                        if (toBlock != ScicosID())
                            if (std::find(v.begin(), v.end(), toBlock) == v.end())
                                abort();
                    }
                }
#endif /* SANITY_CHECK */
                return o->setChildren(v);
            default:
                break;
        }
    }
    else if (k == LINK)
    {
        switch (p)
        {
            default:
                break;
        }
    }
    else if (k == PORT)
    {
        model::Port* o = static_cast<model::Port*>(baseObject);
        switch (p)
        {
            case CONNECTED_SIGNALS:
                return o->setConnectedSignals(v);

            default:
                break;
        }
    }
    return FAIL;
}

} /* namespace org_scilab_modules_scicos */


