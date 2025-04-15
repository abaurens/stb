-- stb

require("premake", ">=5.0.0-beta6")

project "stb"
  kind "None"
  language "C"
  cdialect "C11"
  systemversion "latest"

  files {
    "premake5.lua",
    "stb/**.h",
    "stb/**.c",
  }

  usage "PUBLIC"
    includedirs { "./stb" }

project "stb-image"
  kind "StaticLib"
  language "C"
  cdialect "C11"
  staticruntime "On"
  systemversion "latest"

  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "%{prj.name}")

  --uses { "stb" }
  
  defines {
    "STB_IMAGE_IMPLEMENTATION",
    --"STB_IMAGE_STATIC"
  }

  files {
    "premake5.lua",

    "stb/stb_image.h",
    "src/stb_image.c",
  }

  usage "PUBLIC"
    uses { "stb" }

  usage "INTERFACE"
    links { "stb-image" }