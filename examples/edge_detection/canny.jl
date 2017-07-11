#-------------canny.jl---------------------------------------------------------#
#
# Purpose: To implement Canny Edge Detection in Julia
#
#------------------------------------------------------------------------------#

# First, we need to use the appropriate packages
using Images  # All filtering and image stuff
using ImageView # imshow for showing images, must be run in REPL
using TestImages # Standart example images in julia

# simple implementation of canny edge detection using in-built Julia functions
function simple_edge_detection()
    img = testimage("fabio_color_256")
    img_edge = canny(img)
    save(string("fabio_edges.png"), img_edge)
end

simple_edge_detection()
