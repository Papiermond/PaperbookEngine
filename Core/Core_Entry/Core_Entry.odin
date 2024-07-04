package Core

import ogl  "vendor:OpenGL"
import fmt "core:fmt"
import util "../Utils"
import "../Input"
import render "../Rendering"


Core_Init::proc()
{
        util.print_message("Starting...")
        if(Setup() != 0)
        {
                util.print_message("Setup failed")
                return
        }
}




Setup :: proc() -> int
{
        util.print_message("Running Setup...")

       if render.render_setup() != 0 
        {
                return -1
        }
        return 0
       
}





