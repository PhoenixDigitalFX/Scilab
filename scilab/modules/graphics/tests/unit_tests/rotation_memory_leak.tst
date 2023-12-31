// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Jean-Baptiste SILVY <jean-baptiste.silvy@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// non regression bug for graphic memory leak

memoryIncrease = [];

for k=1:10 // 10 times to be sure Java GC runs
    plot3d();
    a = gca();

    beginFreeMemory = getmemory();

    // rotate for a long time and find if there are memory leaks
    for i = 1:3600,
        a.rotation_angles(2) = i;
    end

    endFreeMemory = getmemory();

    // not much should have been allocated.
    memoryIncrease(k) = beginFreeMemory - endFreeMemory;
    delete(gcf())
end

// let say that the rotation should not use more than 10 Meg
if (mean(memoryIncrease) > 10000) then pause; end


