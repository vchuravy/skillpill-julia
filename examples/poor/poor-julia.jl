#-------------poor-julia.jl----------------------------------------------------#
#
# Purpose: This code is supposed to be slow in julia
#
#------------------------------------------------------------------------------#

type Loc
    x::Array{Float64}
    y::Array{Float64}
end

# this integrates the area of a circle
function monte_carlo(num, rad)
    pos = Loc([0.0],[0.0])
    count = 0
    for i = 1:num
        push!(pos.x, rand())
        push!(pos.y, rand())
        if (pos.x[i] * pos.x[i] + pos.y[i] * pos.y[i] < rad*rad)
            count += 1.0
        end
    end

    println("The area of your circle is: ", (count / num) * rad*rad*4)
    
end

