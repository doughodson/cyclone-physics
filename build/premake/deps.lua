
-- freeglut 2.8.1 library
FreeGlut2Path = "../../deps/src/freeglut-2.8.1/"
project "lib-freeglut2"
   targetname  "freeglut2"       -- target binary filename
   targetdir   "../../deps/lib"  -- destination dir for compiled binary target
   debugdir    "../../deps/lib"  -- destination dir for debug info
   symbolspath "$(OutDir)$(TargetName).pdb"
   kind        "StaticLib"       -- creating static library
   defines { "FREEGLUT_STATIC", "FREEGLUT_LIB_PRAGMAS=0" }
   includedirs {
      FreeGlut2Path.."include"
   }
   files {
      FreeGlut2Path.."src/*.c",
      FreeGlut2Path.."src/*.h",
      FreeGlut2Path.."include/GL/*.h"
   }
   excludes {
      FreeGlut2Path.."src/freeglut_xinput.c"
   }
   if os.ishost("windows") then
      disablewarnings {
         "4133",  -- incompatible types
         "4996",  -- deprecated declarations
         "4477",  -- format string
         "4018",  -- signed/unsigned mismatch
      }
   end

-- freeglut 3.0.0 library
FreeGlut3Path = "../../deps/src/freeglut-3.0.0/"
project "lib-freeglut3"
   targetname  "freeglut3"       -- target binary filename
   targetdir   "../../deps/lib"  -- destination dir for compiled binary target
   debugdir    "../../deps/lib"  -- destination dir for debug info
   symbolspath "$(OutDir)$(TargetName).pdb"
   kind        "StaticLib"       -- creating static library
   defines { "FREEGLUT_STATIC", "NEED_XPARSEGEOMETRY_IMPL", "FREEGLUT_LIB_PRAGMAS=0" }
   includedirs {
      FreeGlut3Path.."include",
      FreeGlut3Path.."src",
   }
   if os.ishost("windows") then
      files {
         FreeGlut3Path.."src/mswin/*.c",
         FreeGlut3Path.."src/*.*",
         FreeGlut3Path.."include/**.*",
         FreeGlut3Path.."src/util/*.*",
      }
      excludes {
         FreeGlut3Path.."src/gles_stubs.c",
         FreeGlut3Path.."src/freeglutdll.def.in",
      }
      disablewarnings {
         "4018",  -- signed/unsigned mismatch
         "4996",  -- deprecated declarations
         "4133",  -- incompatible types
         "4477",  -- format string
         "4293",  -- shift count negative or too big
      }
   end
   if os.ishost("linux") then
      files {
         FreeGlut3Path.."src/x11/*.c",
         FreeGlut3Path.."src/*.*",
         FreeGlut3Path.."include/**.*",
         FreeGlut3Path.."src/util/*.*",
      }
      excludes {
         FreeGlut3Path.."src/gles_stubs.c",
         FreeGlut3Path.."src/freeglutdll.def.in",
      }
   end
