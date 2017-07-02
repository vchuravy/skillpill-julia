/*----------------------------------------------------------------------------//
*
* Purpose: This is a simple function to multiply a few numbers in C
*
*   Notes: To use this in julia, compile like so:
*              gcc -shared -O2 multiply.f90 -fPIC -o c_multiply.so
*
*-----------------------------------------------------------------------------*/

// Nothing fancy here...
void mutliply(double A, double B, double &C){
    C = A*B;
}
