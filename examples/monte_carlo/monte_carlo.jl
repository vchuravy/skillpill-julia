#-------------monte_carlo.jl---------------------------------------------------#
#
# Purpose: A simple monte carlo script to integrate x^2 in a given range
#
#------------------------------------------------------------------------------#

# A function to integrate x^2 in a given range with num number of points
function monte_carlo(range::Float64, num::Int64)
    count = 0
    for i = 1:num
        x_pos = rand() * range - range * 0.5
        y_pos = rand() * 0.25 * range * range 

        if (y_pos < x_pos*x_pos)
            count += 1
        end
    end

    #println("The integral of x^2 between ", -range*0.5, " and ", 
            #range*0.5, " is ", (count / num) *0.25*range*range*range)
end

monte_carlo(6.0, 10000)
