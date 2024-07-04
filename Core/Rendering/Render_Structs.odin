package Rendering

import c "core:c"

renderAPi :: enum
{
    OpenGL,
    Vulkan,
    DirectX
}

Window_Init_Stats :: struct
{
    width : c.int,
    height: c.int,
    window_handle : cstring,
    vsync : b32
}