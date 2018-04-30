#-------------julia-fractal.jl-------------------------------------------------#
#
# Purpose: This file tests the creation of the julia fractal in julia for fun
#
#------------------------------------------------------------------------------#

# We will need a few libraries for visualization
using PyPlot

# Function to calculate and output julia fractal to image
function create_fractal(cutoff::Float64, step::Float64, c_val::Float64, 
                        res::Int64, range::Float64)
    # Setting up the array to be used
    carr = Array{Float64}(res, res)

    # For now, let's just assume that the imaginary and real ranges are from 
    #     -range < x < range
    for i = 1:res
        for j = 1:res
            z = complex((i/res)*range - range/2.0,(j/res)*range - range/2.0)
            c = complex(0,c_val)
            n = 255
            while (abs(z) < cutoff && n > 5)
                z = z*z + c
                n -= 5
            end
            carr[i,j] = n/255.0;
        end
    end

    return carr

end

# Fuction to scan through C values
function c_scan(cutoff::Float64, step::Float64, res::Int64,
                range::Float64, max_c::Float64, c_step::Float64)

    id = 0
    for i = 0:c_step:max_c
        println(i)
        carr = create_fractal(cutoff, step, i, res, range)
        figure(figsize = (10,10))
        imshow(carr, cmap=ColorMap("Blues"))
        subplots_adjust(top = 1, bottom = 0, right = 1, left = 0, 
                        hspace = 0, wspace = 0)
        savefig(string("c_scan", lpad(id, 5, 0), ".png"))
        id += 1
    end
end

# Function to zoom in on fractal
function fractal_zoom(cutoff::Float64, step::Float64, c_val::Float64,
                      res::Int64, max_range::Float64, 
                      min_range::Float64)
    id = 0
    range = max_range
    while range > min_range
        println(range)
        carr = create_fractal(cutoff, step, c_val, res, range)
        figure(figsize = (10,10))
        imshow(carr, cmap=ColorMap("Blues"))
        subplots_adjust(top = 1, bottom = 0, right = 1, left = 0, 
                        hspace = 0, wspace = 0)
        savefig(string("fractal_zoom", lpad(id, 5, 0), ".png"))
        id += 1
        range -= range*0.05
    end
end

fractal_zoom(10.0, 0.1, 1.0, 1024, 1.0, 0.0001)

#c_scan(10.,5., 1024, 3.0, 1.0, 0.025)
