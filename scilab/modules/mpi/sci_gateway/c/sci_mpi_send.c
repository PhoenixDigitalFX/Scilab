/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2011-2011 - DIGITEO - Sylvestre LEDRU
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
#include "sci_mpi.h"
#include "api_scilab.h"
#include "gw_mpi.h"
#include "Scierror.h"
#include "localization.h"
#include "sci_malloc.h"
#include "serialization.h"
#include "getOptionalComm.h"

#define TAG 0

int sci_mpi_send(char *fname, void* pvApiCtx)
{
    SciErr sciErr;
    int iRet = 0;
    int *piAddr = NULL;
    int *piAddr2 = NULL;

    int *piBuffer = NULL;
    int iBufferSize = 0;
    double NodeID = 0;
    MPI_Comm comm = NULL;

    CheckInputArgument(pvApiCtx, 2, 3);
    CheckOutputArgument(pvApiCtx, 0, 1);

    // return the communicator from optional argument "comm"
    // if no optional "comm" is given, return MPI_COMM_WORLD
    comm = getOptionalComm(pvApiCtx);
    if (comm == NULL)
    {
        Scierror(999, _("%s: Wrong type for input argument #%s: An MPI communicator expected.\n"), fname, "comm");
        return 0;
    }

    if (comm == MPI_COMM_NULL)
    {
        if (createScalarBoolean(pvApiCtx, nbInputArgument(pvApiCtx) + 1, 0))
        {
            Scierror(999, _("%s: Memory allocation error.\n"), fname);
            return 0;
        }

        AssignOutputVariable(pvApiCtx, 1) = nbInputArgument(pvApiCtx) + 1;
        ReturnArguments(pvApiCtx);
        return 0;
    }

    sciErr = getVarAddressFromPosition(pvApiCtx, 2, &piAddr2);
    if (sciErr.iErr)
    {
        printError(&sciErr, 0);
        Scierror(999, _("%s: Can not read input argument #%d.\n"), fname, 1);
        return 0;
    }

    if (getScalarDouble(pvApiCtx, piAddr2, &NodeID))
    {
        Scierror(999, _("%s: Wrong type for input argument #%d: A scalar integer value expected.\n"), fname, 1);
        return 0;
    }

    sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddr);
    if (sciErr.iErr)
    {
        printError(&sciErr, 0);
        Scierror(999, _("%s: Can not read input argument #%d.\n"), fname, 2);
        return 0;
    }

    //convert data from Scilab to MPI
    iRet = serialize_to_mpi(pvApiCtx, piAddr, &piBuffer, &iBufferSize);
    if (iRet)
    {
        Scierror(999, _("Unable to serialize data\n"));
        return 0;
    }

    //send data
    iRet = MPI_Send(piBuffer, iBufferSize, MPI_INT, (int)NodeID, TAG, comm);
    FREE(piBuffer);
    if (iRet != MPI_SUCCESS)
    {
        char error_string[MPI_MAX_ERROR_STRING];
        int length_of_error_string;
        MPI_Error_string(iRet, error_string, &length_of_error_string);
        Scierror(999, _("%s: Could not send the variable to the node %d: %s\n"), fname, NodeID, error_string);
        return 0;
    }

    if (createScalarBoolean(pvApiCtx, nbInputArgument(pvApiCtx) + 1, !iRet))
    {
        Scierror(999, _("%s: Memory allocation error.\n"), fname);
        return 0;
    }

    AssignOutputVariable(pvApiCtx, 1) = nbInputArgument(pvApiCtx) + 1;
    ReturnArguments(pvApiCtx);
    return 0;
}
