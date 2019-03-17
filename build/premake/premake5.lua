
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

   --
   -- Build (solution) configuration options:
   --     Release        (Runtime library is Multi-threaded DLL)
   --     Debug          (Runtime library is Multi-threaded Debug DLL)
   --
   configurations { "Release", "Debug" }

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
      --targetsuffix "_d"
      if (_ACTION ~= "gmake") then
         defines { "WIN32", "_DEBUG" }
      end

   dofile "deps.lua"
   dofile "cyclone.lua"
   dofile "demos.lua"

