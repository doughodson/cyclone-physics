
-- cyclone library
project "lib-cyclone"
   targetname  "cyclone"          -- target filename
   targetdir   "../../lib"        -- destination dir for compiled binary target
   debugdir    "../../lib"        -- destination dir for debug info
   symbolspath "$(OutDir)$(TargetName).pdb"
   kind        "StaticLib"        -- creating static library
   includedirs { CYCLONE_IncPath }
   files {
      "../../include/**.*",
      "../../src/*.cpp",
   }

