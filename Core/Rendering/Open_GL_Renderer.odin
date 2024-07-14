package Rendering

import c "core:c"
import fmt "core:fmt"
import ogl "vendor:OpenGL"
import glfw "vendor:GLFW"
import util "../Utils"
import input "../Input"

WindowStats : Window_Init_Stats = {
    width = 800, 
    height = 600, 
    window_handle = "LearnOpenGL", 
    vsync = true
}


window : glfw.WindowHandle  = nil

set_up_openGL_Renderer :: proc() -> int
{
    // Initialize GLFW
        if(glfw.Init() != true)
        {
            util.print_message("Failed to initialize GLFW")
            return -1
        }
        defer glfw.Terminate()
   
    // Create Window
        window = glfw.CreateWindow(WindowStats.width, WindowStats.height, WindowStats.window_handle, nil, nil)
        defer glfw.DestroyWindow(window)

        //Create Context
        {
            glfw.MakeContextCurrent(window)
        }

        if window == nil
        {
            util.print_message("Failed to create Window")
            return -1
        }

    // 
   
    // Enable VSync
        if WindowStats.vsync
        {
            glfw.SwapInterval(1)
        }


    // Set Callbacks
        {  
            glfw.SetKeyCallback(window, input.key_callback)
            glfw.SetFramebufferSizeCallback(window, size_callback)
        }
    
   
    // Load OpenGL Versions
        {
            ogl.load_up_to(int(GL_MAJOR_VERSION),int(GL_MINOR_VERSION),glfw.gl_set_proc_address)
        }
    
    // initialization of the renderer
        renderer_init()
        util.print_message("Renderer rendering...")
    // Main Loop
        for(!glfw.WindowShouldClose(window) && input.running)
        {
            glfw.PollEvents()

            
            game_update()

            draw()

            glfw.SwapBuffers(window)
        }
        defer util.print_message("Godbye, Renderer!")
    renderer_exit()

   

    return 0
}

// size_callback is a callback function that adjusts the OpenGL viewport.
size_callback :: proc "c" (window: glfw.WindowHandle, width, height: i32) 
{
	// Set the OpenGL viewport size
	ogl.Viewport(0, 0, width + 20, height + 20)
}



renderer_init :: proc()
{
	should_update = true
}

draw :: proc()
{
	// Set the opengl clear color
	// 0-1 rgba values
	ogl.ClearColor(0,0,0,0)
	// Clear the screen with the set clearcolor
	ogl.Clear(ogl.COLOR_BUFFER_BIT)

  

	// Own drawing code here
}

renderer_exit :: proc()
{
	should_update = false
}
