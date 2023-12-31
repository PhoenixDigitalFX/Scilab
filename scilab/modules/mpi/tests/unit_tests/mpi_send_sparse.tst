// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010-2010 - DIGITEO - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- MPI TEST -->
// <-- NOT FIXED --> 6.0.2 -> 6.0.2
//

MPI_Init();
rnk =    MPI_Comm_rank();
sizeNodes =    MPI_Comm_size();

assert_checkequal(MPI_Comm_size(), 2);

SLV = rnk;                // handy shortcuts, master is rank 0
Master = ~ SLV;            // slaves are all other

if Master
    for slaveId = 1:sizeNodes-1
        value = sprand(100, 100, 0.01) + sprand(100, 100, 0.01) * %i;
        MPI_Send(value, slaveId)
    end

    for slaveId = 1:sizeNodes-1
        tag=0
        valueBack=MPI_Recv(slaveId, tag);
        [ij,v,mn]=spget(value);
        value = sparse(ij,v+1+%i,mn);
        assert_checkequal(size(valueBack),size(value));
        // Cannot check the values. See bug #10119
    end

else
    rankSource=0;
    tag=0;
    value=MPI_Recv(rankSource, tag)
    [ij,v,mn]=spget(value);
    value = sparse(ij,v+1+%i,mn);
    // Send back to the master
    MPI_Send(value,0)

end

MPI_Finalize()
exit();
