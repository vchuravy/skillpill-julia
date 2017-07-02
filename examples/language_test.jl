#-------------language_test.jl-------------------------------------------------#
#
# Purpose: This program uses multiple languages in julia (C, FORTRAN)
#
#   Notes: To use this program, please compile the following:
#              multiply.f90
#              multiply.c
#          Compile instructions can be found at the start of each file
#
#------------------------------------------------------------------------------#

# This function multiplies a and b into c by using the created FORTRAN library
function call_fortran()
    a = Cdouble[1.0]
    b = Cdouble[2.0]
    c = Cdouble[0.0]
    ccall((:multiply_, "/home/james/projects/skillpill-julia/examples/fortran_multiply"),
       Void,(Ptr{Float64},Ptr{Float64},Ptr{Float64}),a,b,c)

    println(c[1])
end

# This function multiplies a and b into c by using the created C library
function call_c()
    a = Cdouble[1.0]
    b = Cdouble[3.0]
    c = Cdouble[0.0]
    ccall((:multiply_, "/home/james/projects/skillpill-julia/examples/c_multiply"),
       Void,(Ptr{Float64},Ptr{Float64},Ptr{Float64}),a,b,c)

    println(c[1])

end

call_fortran()
call_c()
