/*
*  Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
*  Copyright (C) 2010-2010 - DIGITEO - Bruno JOFRET
*  Copyright (C) 2011 - DIGITEO - Antoine ELIAS
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
#include <sstream>
#include <math.h>
#include <iomanip>
#include "symbol.hxx"
#include "cell.hxx"
#include "double.hxx"
#include "list.hxx"
#include "colon.hxx"
#include "tostring_common.hxx"
#include "core_math.h"
#include "list.hxx"
#include "configvariable.hxx"
#include "types_tools.hxx"

namespace types
{
/**
** Constructor & Destructor (public)
*/
Cell::Cell()
{
    int piDims[2] = {0, 0};
    createCell(2, piDims, nullptr, false);
}

Cell::Cell(int _iRows, int _iCols, InternalType** data, bool _bInit)
{
    int piDims[2] = {_iRows, _iCols};
    createCell(2, piDims, data, _bInit);
}

Cell::Cell(int _iDims, const int* _piDims, InternalType** data, bool _bInit)
{
    createCell(_iDims, _piDims, data, _bInit);
}

bool Cell::getMemory(long long* _piSize, long long* _piSizePlusType)
{
    *_piSize = 0;
    *_piSizePlusType = 0;
    InternalType** p = get();
    for (int i = 0; i < getSize(); i++)
    {
        long long piS, piSPT;
        if (p[i]->getMemory(&piS, &piSPT))
        {
            *_piSize += piS;
            *_piSizePlusType += piSPT;
        }
    }
    *_piSizePlusType += sizeof(Cell);
    return true;
}

void Cell::createCell(int _iDims, const int* _piDims, InternalType** data, bool _bInit)
{
    InternalType** pIT = NULL;
    create(_piDims, _iDims, &pIT, NULL);
    if(m_iSizeMax == 0 || _bInit == false)
    {
        return;
    }

    if (data == nullptr)
    {
        types::Double* pDbl = Double::Empty();
        for (int i = 0; i < m_iSizeMax; i++)
        {
            m_pRealData[i] = pDbl;
            m_pRealData[i]->IncreaseRef();
        }
    }
    else
    {
        for (int i = 0; i < m_iSizeMax; i++)
        {
            m_pRealData[i] = data[i];
            m_pRealData[i]->IncreaseRef();
        }
    }

#ifndef NDEBUG
    Inspector::addItem(this);
#endif
}

Cell::~Cell()
{
    if (isDeletable() == true)
    {
        for (int i = 0; i < m_iSizeMax; i++)
        {
            m_pRealData[i]->DecreaseRef();
            m_pRealData[i]->killMe();
        }
    }

    delete[] m_pRealData;
#ifndef NDEBUG
    Inspector::removeItem(this);
#endif
}

/**
** Private Copy Constructor and data Access
*/
Cell::Cell(Cell *_oCellCopyMe)
{
    InternalType** pIT = NULL;
    create(_oCellCopyMe->getDimsArray(), _oCellCopyMe->getDims(), &pIT, NULL);
    for (int i = 0 ; i < getSize() ; i++)
    {
        m_pRealData[i] = NULL;
    }

    for (int i = 0 ; i < getSize() ; i++)
    {
        set(i, _oCellCopyMe->get(i)->clone());
    }
#ifndef NDEBUG
    Inspector::addItem(this);
#endif
}

bool Cell::transpose(InternalType *& out)
{
    if (isScalar())
    {
        out = clone();
        return true;
    }

    if (m_iDims == 2)
    {
        // dont fill the Cell, transpose will do it.
        Cell * pC = new Cell(getCols(), getRows(), nullptr, false);
        Transposition::transpose(getRows(), getCols(), m_pRealData, pC->get());
        for(int i = 0; i < getSize(); ++i)
        {
            // Transposition::transpose doesn't increase the ref.
            pC->get(i)->IncreaseRef();
        }

        out = pC;
        return true;
    }

    return false;
}

Cell* Cell::set(int _iRows, int _iCols, InternalType* _pIT)
{
    if (_iRows < getRows() && _iCols < getCols())
    {
        return set(_iCols * getRows() + _iRows, _pIT);
    }
    return NULL;
}

Cell* Cell::set(int _iRows, int _iCols, const InternalType* _pIT)
{
    if (_iRows < getRows() && _iCols < getCols())
    {
        return set(_iCols * getRows() + _iRows, _pIT);
    }
    return NULL;
}

Cell* Cell::set(int _iIndex, InternalType* _pIT)
{
    if (_iIndex >= m_iSize)
    {
        return NULL;
    }

    // corner case when inserting twice
    if (m_pRealData[_iIndex] == _pIT)
    {
        return this;
    }

    typedef Cell* (Cell::*set_t)(int, InternalType*);
    Cell* pIT = checkRef(this, (set_t)&Cell::set, _iIndex, _pIT);
    if (pIT != this)
    {
        return pIT;
    }

    if (m_pRealData[_iIndex] != NULL)
    {
        m_pRealData[_iIndex]->DecreaseRef();
        m_pRealData[_iIndex]->killMe();
    }

    _pIT->IncreaseRef();
    m_pRealData[_iIndex] = _pIT;
    return this;
}

Cell* Cell::set(int _iIndex, const InternalType* _pIT)
{
    if (_iIndex >= m_iSize)
    {
        return NULL;
    }

    typedef Cell* (Cell::*set_t)(int, const InternalType*);
    Cell* pIT = checkRef(this, (set_t)&Cell::set, _iIndex, _pIT);
    if (pIT != this)
    {
        return pIT;
    }

    if (m_pRealData[_iIndex] != NULL)
    {
        m_pRealData[_iIndex]->DecreaseRef();
        m_pRealData[_iIndex]->killMe();
    }

    const_cast<InternalType*>(_pIT)->IncreaseRef();
    m_pRealData[_iIndex] = const_cast<InternalType*>(_pIT);

    return this;
}

Cell* Cell::set(InternalType** _pIT)
{
    typedef Cell* (Cell::*set_t)(InternalType**);
    Cell* pIT = checkRef(this, (set_t)&Cell::set, _pIT);
    if (pIT != this)
    {
        return pIT;
    }

    for (int i = 0; i < m_iSize; i++)
    {
        if (i >= m_iSize)
        {
            return NULL;
        }

        if (m_pRealData[i] != NULL)
        {
            m_pRealData[i]->DecreaseRef();
            m_pRealData[i]->killMe();
        }

        _pIT[i]->IncreaseRef();
        m_pRealData[i] = _pIT[i];
    }

    return this;
}

/**
** Clone
** Create a new Struct and Copy all values.
*/
Cell* Cell::clone()
{
    return new Cell(this);
}

InternalType* Cell::getNullValue()
{
    return Double::Empty();
}

Cell* Cell::createEmpty(int _iDims, int* _piDims, bool /*_bComplex*/)
{
    return new Cell(_iDims, _piDims);
}

InternalType* Cell::copyValue(InternalType* _pData)
{
    _pData->IncreaseRef();
    return _pData;
}

void Cell::deleteAll()
{
    for (int i = 0 ; i < getSize() ; i++)
    {
        m_pRealData[i]->DecreaseRef();
        m_pRealData[i]->killMe();
    }

    delete[] m_pRealData;
    m_pRealData = NULL;
}

void Cell::deleteImg()
{
    return;
}

bool Cell::isEmpty()
{
    if (getDims() == 2 && getRows() == 0 && getCols() == 0)
    {
        return true;
    }
    return false;
}

bool Cell::operator==(const InternalType& it)
{
    if (const_cast<InternalType &>(it).isCell() == false)
    {
        return false;
    }

    Cell* pC = const_cast<InternalType &>(it).getAs<Cell>();

    for (int i = 0 ; i < getDims() ; i++)
    {
        if (pC->getDimsArray()[i] != getDimsArray()[i])
        {
            return false;
        }
    }

    for (int i = 0 ; i < getSize() ; i++)
    {
        if (*get(i) != *pC->get(i))
        {
            return false;
        }
    }
    return true;
}

bool Cell::operator!=(const InternalType& it)
{
    return !(*this == it);
}

List* Cell::extractCell(typed_list* _pArgs)
{
    InternalType* pIT = extract(_pArgs);
    if (pIT == NULL || pIT->isCell() == false)
    {
        return NULL;
    }

    List* pList = new List();

    Cell* pCell = pIT->getAs<Cell>();
    for (int i = 0 ; i < pCell->getSize() ; i++)
    {
        pList->append(pCell->get(i));
    }
    pCell->killMe();
    return pList;
}

Cell* Cell::insertCell(typed_list* _pArgs, InternalType* _pSource)
{
    Cell* pCell = new Cell(1, 1);
    pCell->set(0, _pSource);
    Cell* pOut = insert(_pArgs, pCell)->getAs<Cell>();
    pCell->killMe();
    return pOut;
}

Cell* Cell::insertNewCell(typed_list* _pArgs, InternalType* _pSource)
{
    Cell* pCell = new Cell(1, 1);
    pCell->set(0, _pSource);
    Cell* pOut = pCell->insertNew(_pArgs)->getAs<Cell>();
    return pOut;
}

InternalType** Cell::allocData(int _iSize)
{
    InternalType** pData = new InternalType*[_iSize];
    for (int i = 0 ; i < _iSize ; i++)
    {
        pData[i] = NULL;
    }
    return pData;
}

void Cell::deleteData(InternalType* _pData)
{
    if (_pData)
    {
        _pData->killMe();
    }
}

Cell* Cell::createEmpty()
{
    return new Cell();
}
}
