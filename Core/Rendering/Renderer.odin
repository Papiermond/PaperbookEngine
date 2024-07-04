package Rendering

import c "core:c"
import fmt "core:fmt"
import utils "../Utils"
import GS "../GameStates"

@(private)
API : renderAPi = .OpenGL


running : b32 = true
should_update : b32 = false

GL_MAJOR_VERSION : c.int : 4
GL_MINOR_VERSION : c.int : 6




render_setup :: proc() -> int
{
    switch API
    {
        case .OpenGL:
            return set_up_openGL_Renderer()
        case .Vulkan:
            return set_up_vulkan()
        case .DirectX:
            return set_up_d3d11()
        case:
            utils.print_message("no API Selected")
            return -1
    }
    return -1
}

game_update :: proc()
{
    GS.Update()
}



