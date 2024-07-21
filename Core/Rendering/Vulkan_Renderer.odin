package Rendering

import vul "vendor:vulkan"
import glfw "vendor:GLFW"
import glm "core:math"
import fmt "core:fmt"
import utils "../Utils"
import input "../Input"
import util "../Utils"

@private
Window_Stats : Window_Init_Stats = {
    width = 800, 
    height = 600, 
    window_handle = "LearnOpenGL", 
    vsync = true
}
window_V : glfw.WindowHandle  = nil

// Vulkan code starts here
set_up_vulkan :: proc() -> int
{
   // utils.print_message("Vulkan is not implemented yet")
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
        vul.load_proc_addresses(glfw.gl_set_proc_address)
    }
// initialization of the renderer
    renderer_init()
    util.print_message("Renderer rendering...")
// Main Loop
    for(!glfw.WindowShouldClose(window) && input.running)
    {
        glfw.PollEvents()
        game_update()
        draw_v()
    glfw.SwapBuffers(window)
    }
    defer util.print_message("Godbye, Renderer!")
    renderer_exit()
    return 0
}
draw_v :: proc()
{
	// Set the opengl clear color
	// 0-1 rgba values
	// Clear the screen with the set clearcolor
	// Own drawing code here
}




