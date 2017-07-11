#-------------verlet.jl--------------------------------------------------------#
#
# Purpose: To implement the verlet force integrator
#
#------------------------------------------------------------------------------#

using Plots

# For this force integrator, we need the particle's current position and it's
#     previous position. We'll assume that it can only move in 1D for now.
type Particle
    pos::Float64
    prev_pos::Float64
    acc::Float64
end

function drop_ball(height::Float64, timestep::Float64)
    time = 0.0

    ball = Particle(height, height, -10.0)
    while ball.pos > 0.0
        curr_pos = ball.pos
        ball.pos = 2*ball.pos - ball.prev_pos +ball.acc*timestep*timestep
        ball.prev_pos = curr_pos
        time += timestep
        println(ball.pos)
    end

    println(time)
end

drop_ball(5.0, 0.1)
