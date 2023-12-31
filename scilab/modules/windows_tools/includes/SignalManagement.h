/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2016 - 2016 - Scilab Enterprises - Clement DAVID
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

#ifndef __SIGNAL_MGMT_H__
#define __SIGNAL_MGMT_H__

#include "dynlib_windows_tools.h"

/**
 * Install a timeout on the process (watchdog behavior)
 * @param timeoutDelay delay in seconds (0 will disable the timeout)
 */
WINDOWS_TOOLS_IMPEXP void timeout_process_after(int timeoutDelay);

#endif /* __SIGNAL_MGMT_H__ */
