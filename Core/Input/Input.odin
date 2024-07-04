package Input

import fmt  "core:fmt"
import glfw "vendor:GLFW"
 running : b32 = true



// key_callback is a callback function that exits the program when the escape key is pressed.
key_callback :: proc "c" (window: glfw.WindowHandle, key, scancode, action, mods: i32)
{
	
	// Exit program on escape pressed
	if key == glfw.KEY_ESCAPE 
    {
		running = false
	}
}