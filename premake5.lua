-- stb

project "stb"
  kind "None"
  language "C"
  cdialect "C11"
  systemversion "latest"

  IncludeDir["stb"] = "%{wks.location}/libs/stb"

  includedirs {}

  files {
    "premake5.lua",
    "**.h",
    "**.c",
  }

project "stb-image"
  kind "StaticLib"
  language "C"
  cdialect "C11"
  staticruntime "On"
  systemversion "latest"

  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "%{prj.name}")

  includedirs {
    "%{IncludeDir.stb}/stb"
  }

  defines {
    "STB_IMAGE_IMPLEMENTATION",
    "STB_IMAGE_STATIC"
  }

  files {
    "premake5.lua",

    "stb/stb_image.h",
    "src/stb_image.c",
  }
