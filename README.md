# glfw-wayland
A collection of not-yet-upstreamed GLFW Wayland patches. Mostly focues on improving the Minecraft experience.

Patches taken from https://github.com/BoyOrigin/glfw-wayland, but improved:
* Patches on top of latest GLFW git
* Window icon support
* Proper window decorations on GNOME (needs patched libdecor)

# Minecraft
For use with Minecraft on versions 1.21.x, use https://github.com/awumii/minecraft-wayland-icon-fix.   
Older versions should work out of the box.
> ⚠️ Don't forget to set a native library override. Use `-Dorg.lwjgl.glfw.libname=/path/to/libglfw.so.3.5` OR use **PrismLauncher** for easy checkbox.  

![launcher](.github/native.png)

# Libdecor (GNOME)
GNOME doesn't implement server-side decorations, so GLFW uses `libdecor` to implement its own client-side decorations. This should provide proper window decorations for GLFW windows, however... Minecraft initializes GLFW on a seperate "Render thread" in the JVM, and libdecor-gtk plugin will crash, falling back to libdecor-cairo plugin instead, providing basic and ugly window decorations. I have provided a patch in the `libdecor/` directory, with a PKGBUILD for Arch users to easily replace the original libdecor. For other distributions, you'll have to figure out how compile it manually. I cannot provide a .so because unlike GLFW, this one is not statically linked.
# Installation (Arch Linux)
This will install the patched glfw as a system library.
```bash
git clone https://github.com/awumii/glfw-wayland
cd glfw-wayland
makepkg -si
```

# Installation outside Arch Linux
## Prebuilt .so
Download the "stable" release from the Releases tab.  
You can also download nightly builds from https://github.com/awumii/glfw-wayland/actions

## Manual
* Clone this repository
* Run `./patch.sh`