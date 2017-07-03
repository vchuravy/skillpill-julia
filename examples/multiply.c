/*----------------------------------------------------------------------------//
*
* Purpose: This is a simple function to multiply a few numbers in C
*
*   Notes: To use this in julia, compile like so:
*              gcc -shared -O2 multiply.c -fPIC -o c_multiply.so
*
*-----------------------------------------------------------------------------*/

// Nothing fancy here...
double multiply(double A, double B){
    return A*B;
}
