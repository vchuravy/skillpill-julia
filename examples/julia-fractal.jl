#-------------julia-fractal.jl-------------------------------------------------#
#
# Purpose: This file tests the creation of the julia fractal in julia for fun
#
#------------------------------------------------------------------------------#

# We will need a few libraries for visualization
using Images, ImageView

# Function to calculate and output julia fractal to image
function create_fractal(cutoff::Float64, step::Float64, c_val::Float64, 
                        res::Int64)
    # Setting up the array to be used
    carr = Array{Float64}(res, res)

    # For now, let's just assume that the imaginary and real ranges are from 
    #     -2 < x < 2
    for i = 1:res
        for j = 1:res
            z = complex((i/res)*4 - 2,(j/res)*4 - 2)
            c = complex(0,c_val)
            n = 255
            while (abs(z) < cutoff && n > 5)
                z = z*z + c
                n -= 5
            end
            carr[i,j] = n/255.0;
        end
    end

    imshow(carr)
end

create_fractal(10.,5.,0.5, 1024)
