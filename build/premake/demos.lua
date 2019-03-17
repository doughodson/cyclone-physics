
project "demo-ballistic"
   targetname  "ballistic"       -- target filename
   targetdir   "../../bin"       -- destination dir for compiled binary target
   debugdir    "../../bin"       -- destination dir for debug info
   symbolspath "$(OutDir)$(TargetName).pdb"
   kind        "ConsoleApp"      -- creating a console app
   includedirs {
      CYCLONE_IncPath,
      "../../deps/src/freeglut-2.8.1/include",
   }
   libdirs     { "../../lib", "../../deps/lib" }
   defines     { "FREEGLUT_STATIC", "FREEGLUT_LIB_PRAGMAS=0" }
   files {
      "../../src/demos/*.*",
      "../../src/demos/ballistic/*.*",
   }
   if os.ishost("windows") then
      links { "lib-cyclone", "lib-freeglut2", "glu32", "opengl32", "winmm" }
   end
   if os.ishost("linux") then
      links { "lib-cyclone", "lib-freeglut2" }
   end

