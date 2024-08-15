fx_version "cerulean"

description "fzd_lib"
author ".fuzzed"
version '1.0.0'

lua54 'yes'

game "gta5"

client_script "client/import.lua"
server_script "server/import.lua"

shared_scripts {
  "@ox_lib/init.lua",

  -- UNCOMMENT THIS IF YOU WANT TO USE QBX CORE
  -- "@qbx_core/modules/playerdata.lua",
  -- "@qbx_core/modules/lib.lua",

  -- UNCOMMENT THIS IF YOU WANT TO USE ND CORE
  -- "@ND_Core/init.lua",
}

files {
  "client/**/*",
  'config/shared.lua',
}