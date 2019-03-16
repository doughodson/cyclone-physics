
--
-- If premake command is not supplied an action (target compiler), exit!
--
-- Targets of interest:
--     vs2017     Visual Studio 2017
--     gmake      Linux
--
if (_ACTION == nil) then
    return
end

CYCLONE_IncPath = "../../include"

workspace "cyclone-physics"

   -- destination directory for generated solution/project files
   location ("../" .. _ACTION)

   -- C++ code in all projects
   language "C++"

   -- common include directories (all configurations/all projects)
   includedirs { CYCLONE_IncPath }

   --
   -- Build (solution) configuration options:
   --     Release        (Runtime library is Multi-threaded DLL)
   --     Debug          (Runtime library is Multi-threaded Debug DLL)
   --
   configurations { "Release", "Debug" }

   if (_ACTION == "gmake") then
      buildoptions { "-std=c++17" }
      links { "stdc++fs", "pthread" }
   end

   -- common release configuration flags and symbols
   filter { "configurations:Release" }
      optimize "On"
      if (_ACTION ~= "gmake") then
         -- favor speed over size
         buildoptions { "/Ot" }
         defines { "WIN32", "NDEBUG" }
      end

   -- common debug configuration flags and symbols
   filter { "configurations:Debug" }
      symbols "On"
      if (_ACTION ~= "gmake") then
         defines { "WIN32", "_DEBUG" }
      end

-- cyclone library
project "cyclone"
   kind "StaticLib"
   targetdir ("../../lib/")
   files {
      "../../include/**.*",
      "../../src/*.cpp",
   }
   targetname "cyclone"

project "demo-ballistic"
   kind "ConsoleApp"
   targetdir ("../../bin/")
   files {
      "../../src/demos/*.*",
      "../../src/demos/ballistic/*.*",
   }
   links { "cyclone" }
   targetname "ballistic"
