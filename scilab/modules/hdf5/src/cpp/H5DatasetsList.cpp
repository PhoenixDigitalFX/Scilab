/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2012 - Scilab Enterprises - Calixte DENIZET
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

#include "H5DatasetsList.hxx"
#include "H5Group.hxx"

namespace org_modules_hdf5
{

H5DatasetsList::H5DatasetsList(H5Group & _parent) : H5NamedObjectsList<H5Dataset>(_parent, H5G_DATASET, "H5 Dataset")
{

}

H5DatasetsList::~H5DatasetsList()
{

}
}
