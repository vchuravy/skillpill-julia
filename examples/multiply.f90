!!------------multiply.f90----------------------------------------------------!!
!!
!! Purpose: This is a simple subroutine for multiplication in fortran
!!
!!   Notes: This is pretty much only for demonstration purposes
!!          To use in julia code, compile like so:
!!              gfortran -shared -O2 multiply.f90 -fPIC -o fortran_multiply.so
!!
!!----------------------------------------------------------------------------!!

!! We'll be using subroutines intead of functions (because ehy not?)
subroutine multiply(A, B, C)
    REAL*8 :: A, B, C
    C = A * B
    return
end
