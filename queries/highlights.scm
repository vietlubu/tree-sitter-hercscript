; Hercules Script Syntax Highlighting
; Simplified - only query actual nodes and string literals

; Comments
(comment) @comment

; Keywords - Control Flow
"if" @keyword.control
"else" @keyword.control
"for" @keyword.control
"while" @keyword.control
"do" @keyword.control
"switch" @keyword.control
"case" @keyword.control
"default" @keyword.control
"break" @keyword.control
"continue" @keyword.control
"return" @keyword.control
"goto" @keyword.control

; Script definition keyword
"script" @keyword

; Labels
(label) @label

; Built-in script commands - Dialog (for function calls with parentheses)
((identifier) @function.builtin
  (#match? @function.builtin "^(mes|mesf|next|next2|close|close2|menu|select|prompt|input|callfunc|callsub|getarg)$"))

; Built-in script commands - Player/Character
((identifier) @function.builtin
  (#match? @function.builtin "^(warp|areawarp|warpchar|warpparty|warpguild|heal|itemheal|percentheal|jobchange|jobname|resetlvl|resetstatus|resetskill|skillpointcount|changebase|changesex|changecharsex|disguise|undisguise|setlook|changelook|emotion|specialeffect|specialeffect2|misceffect)$"))

; Built-in script commands - Items
((identifier) @function.builtin
  (#match? @function.builtin "^(getitem|getitem2|rentitem|getnameditem|makeitem|makeitem2|delitem|delitem2|countitem|countitem2|getitemname|getitemslots|getiteminfo|setiteminfo|checkweight|checkweight2|enable_items|disable_items|itemskill|produce|cooking|consumeitem|delequip|equip|autoequip|unequip|getequipid|getequipname|getequipisequiped|getequipisenableref|getequipisidentify|getequiprefinerycnt|getequipweaponlv|getequippercentrefinery|getequipcardcnt|getequipcardid|successrefitem|failedrefitem|downrefitem|successremovecards|failedremovecards|repair|repairall)$"))

; Built-in script commands - Quest
((identifier) @function.builtin
  (#match? @function.builtin "^(setquest|erasequest|completequest|questprogress|questactive|changequest|questinfo|setquestinfo|showevent)$"))

; Built-in script commands - Status/Skills
((identifier) @function.builtin
  (#match? @function.builtin "^(statusup|statusup2|bonus|bonus2|bonus3|bonus4|bonus5|autobonus|autobonus2|autobonus3|skill|addtoskill|guildskill|getskilllv|getgdskilllv|basicskillcheck|sc_start|sc_start2|sc_start4|sc_end|getstatus|getscrate|skilleffect|npcskilleffect|areamobuseskill|npcskill)$"))

; Built-in script commands - NPC/Monster
((identifier) @function.builtin
  (#match? @function.builtin "^(monster|areamonster|killmonster|killmonsterall|getmobdrops|clone|summon|mobcount|getmonsterinfo|addmonsterdrop|delmonsterdrop|guardian|guardianinfo|bg_monster|bg_monster_set_team|strmobinfo)$"))

; Built-in script commands - Map/Area
((identifier) @function.builtin
  (#match? @function.builtin "^(mapannounce|areaannounce|mapwarp|areawarp|getmapflag|setmapflag|removemapflag|getmapinfo|pvpon|pvpoff|gvgon|gvgoff|maprespawnguildid|checkcell|setcell|setwall|delwall|getmapxy|cleanmap|cleanarea|navigateto)$"))

; Built-in script commands - Party/Guild
((identifier) @function.builtin
  (#match? @function.builtin "^(getpartyname|getpartymember|getpartyleader|getguildname|getguildmaster|getguildmasterid|getguildmember|guildchangegm|guildgetexp|requestguildinfo|agitstart|agitend|agitcheck|agitstart2|agitend2|agitcheck2|flagemblem)$"))

; Built-in script commands - Storage/Shop
((identifier) @function.builtin
  (#match? @function.builtin "^(openstorage|guildopenstorage|callshop|npcshopitem|npcshopadditem|npcshopdelitem|npcshopattach|openshop|sellitem|stopselling|setcurrency|tradertype|purchaseok|shopcount|buyingstore|searchstores)$"))

; Built-in script commands - Timers/Events
((identifier) @function.builtin
  (#match? @function.builtin "^(addtimer|deltimer|addtimercount|gettimer|initnpctimer|stopnpctimer|startnpctimer|setnpctimer|getnpctimer|attachnpctimer|detachnpctimer|doevent|donpcevent|sleep|sleep2|awake)$"))

; Built-in script commands - System/Util
((identifier) @function.builtin
  (#match? @function.builtin "^(announce|getusers|getmapusers|getareausers|getareadropitem|getexp|end|debugmes|logmes|atcommand|charcommand|dispbottom|query_sql|query_logsql|escape_sql|freeloop|bindatcmd|unbindatcmd|has_permission|can_use_command|add_group_command|setbattleflag|getbattleflag)$"))

; Built-in script commands - Character Info
((identifier) @function.builtin
  (#match? @function.builtin "^(strcharinfo|strnpcinfo|getcharid|charid2rid|rid2name|readparam|setparam|getnpcid|getlook|getsavepoint|getinventorylist|getcartinvestorylist|getskilllist|playerattached|attachrid|detachrid|isloggedin|getcharip)$"))

; Built-in script commands - Instances/BG
((identifier) @function.builtin
  (#match? @function.builtin "^(instance_create|instance_destroy|instance_attachmap|instance_detachmap|instance_attach|instance_id|instance_set_timeout|instance_init|instance_announce|instance_npcname|instance_mapname|instance_set_respawn|instance_warpall|instance_check_party|instance_check_guild|has_instance|has_instance2|bg_create_team|bg_team_setxy|bg_warp|bg_leave|bg_destroy|bg_get_data|bg_getareausers|bg_updatescore|bg_join_team|bg_match_over|waitingroom2bg|waitingroom2bg_single)$"))

; Built-in script commands - Pet/Homunculus/Mercenary
((identifier) @function.builtin
  (#match? @function.builtin "^(pet|bpet|getpetinfo|petskillbonus|petrecovery|petloot|petskillattack|petskillsupport|petstat|makepet|gethominfo|homevolution|hommutate|morphembryo|checkhomcall|homshuffle|mercenary_create|mercenary_heal|mercenary_sc_start|mercenary_get_calls|mercenary_get_faith|mercenary_set_calls|mercenary_set_faith|getmercinfo)$"))

; Built-in script commands - Misc
((identifier) @function.builtin
  (#match? @function.builtin "^(rand|set|setd|getd|goto|return|enablenpc|disablenpc|hideoffnpc|hideonnpc|movenpc|npcspeed|npcwalkto|npcstop|setnpcdistance|getnpcdir|setnpcdir|getnpcclass|setnpcdisplay|cutin|viewpoint|nude|progressbar|progressbar_unit|showdigit|sit|stand|issit|gettime|gettimetick|gettimestr|night|day|isnight|savepoint|checkoption|setoption|setcart|checkcart|setfalcon|checkfalcon|setmount|checkmount|checkwug|isequipped|isequippedcnt|cardscnt|getrefine|getvariableofnpc|getvariableofpc|setarray|cleararray|copyarray|deletearray|getarraysize|getarrayindex|getelementofarray|getargcount|is_function|getunittype|setunitdata|getunitdata|getunitname|setunitname|getunits|unitwalk|unitkill|unitwarp|unitattack|unitstop|unittalk|unitemote|unitskilluseid|unitskillusepos|waitingroom|delwaitingroom|kickwaitingroomall|enablewaitingroomevent|disablewaitingroomevent|getwaitingroomstate|warpwaitingpc|warpportal|pushpc|marriage|wedding|divorce|ispartneron|getpartnerid|getchildid|getmotherid|getfatherid|warppartner|openmail|openauction|checkvending|checkchatting|checkidle|checkbound|getitembound|getitembound2|countbound|playbgm|playbgmall|soundeffect|soundeffectall|npctalk|message|servicemessage|globalmes|channelmes|addchannelhandler|removechannelhandler|packageitem|searchitem|groupranditem|mergeitem|montransform|makerune|hascashmount|setcashmount|showscript|hateffect|camerainfo|changecamera|itempreview|enchantitem|rodex_sendmail|rodex_sendmail2|rodex_sendmail_acc|rodex_sendmail_acc2|airship_respond|openstylist|expandInventory|expandInventoryAck|expandInventoryResult|getInventorySize|readbook|setfont|achievement_progress|clan_join|clan_leave|clan_master|getcalendartime|setitemscript)$"))

; Built-in script commands - String functions
((identifier) @function.builtin
  (#match? @function.builtin "^(getstrlen|charisalpha|charat|isstr|getdatatype|data_to_string|string_to_data|chr|ord|setchar|insertchar|delchar|strtoupper|strtolower|charisupper|charislower|substr|explode|implode|sprintf|sscanf|strpos|replacestr|countstr|compare|strcmp)$"))

; Built-in script commands - Math functions
((identifier) @function.builtin
  (#match? @function.builtin "^(sqrt|pow|log10|distance|min|max|md5|swap|atoi|axtoi|strtol)$"))

; Built-in script commands - Queue
((identifier) @function.builtin
  (#match? @function.builtin "^(queue|queuesize|queueadd|queueremove|queueopt|queuedel|queueiterator|qicheck|qiget|qiclear)$"))

; Built-in functions in function calls - Dialog
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(mes|mesf|next|next2|close|close2|menu|select|prompt|input|callfunc|callsub|getarg)$"))

; Built-in functions in function calls - Player/Character
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(warp|areawarp|warpchar|warpparty|warpguild|heal|itemheal|percentheal|jobchange|jobname|resetlvl|resetstatus|resetskill|skillpointcount|changebase|changesex|changecharsex|disguise|undisguise|setlook|changelook|emotion|specialeffect|specialeffect2|misceffect)$"))

; Built-in functions in function calls - Items
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(getitem|getitem2|rentitem|getnameditem|makeitem|makeitem2|delitem|delitem2|countitem|countitem2|getitemname|getitemslots|getiteminfo|setiteminfo|checkweight|checkweight2|enable_items|disable_items|itemskill|produce|cooking|consumeitem|delequip|equip|autoequip|unequip|getequipid|getequipname|getequipisequiped|getequipisenableref|getequipisidentify|getequiprefinerycnt|getequipweaponlv|getequippercentrefinery|getequipcardcnt|getequipcardid|successrefitem|failedrefitem|downrefitem|successremovecards|failedremovecards|repair|repairall)$"))

; Built-in functions in function calls - Quest
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(setquest|erasequest|completequest|questprogress|questactive|changequest|questinfo|setquestinfo|showevent)$"))

; Built-in functions in function calls - Status/Skills
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(statusup|statusup2|bonus|bonus2|bonus3|bonus4|bonus5|autobonus|autobonus2|autobonus3|skill|addtoskill|guildskill|getskilllv|getgdskilllv|basicskillcheck|sc_start|sc_start2|sc_start4|sc_end|getstatus|getscrate|skilleffect|npcskilleffect|areamobuseskill|npcskill)$"))

; Built-in functions in function calls - NPC/Monster
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(monster|areamonster|killmonster|killmonsterall|getmobdrops|clone|summon|mobcount|getmonsterinfo|addmonsterdrop|delmonsterdrop|guardian|guardianinfo|bg_monster|bg_monster_set_team|strmobinfo)$"))

; Built-in functions in function calls - Map/Area
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(mapannounce|areaannounce|mapwarp|areawarp|getmapflag|setmapflag|removemapflag|getmapinfo|pvpon|pvpoff|gvgon|gvgoff|maprespawnguildid|checkcell|setcell|setwall|delwall|getmapxy|cleanmap|cleanarea|navigateto)$"))

; Built-in functions in function calls - Party/Guild
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(getpartyname|getpartymember|getpartyleader|getguildname|getguildmaster|getguildmasterid|getguildmember|guildchangegm|guildgetexp|requestguildinfo|agitstart|agitend|agitcheck|agitstart2|agitend2|agitcheck2|flagemblem)$"))

; Built-in functions in function calls - Storage/Shop
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(openstorage|guildopenstorage|callshop|npcshopitem|npcshopadditem|npcshopdelitem|npcshopattach|openshop|sellitem|stopselling|setcurrency|tradertype|purchaseok|shopcount|buyingstore|searchstores)$"))

; Built-in functions in function calls - Timers/Events
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(addtimer|deltimer|addtimercount|gettimer|initnpctimer|stopnpctimer|startnpctimer|setnpctimer|getnpctimer|attachnpctimer|detachnpctimer|doevent|donpcevent|sleep|sleep2|awake)$"))

; Built-in functions in function calls - System/Util
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(announce|getusers|getmapusers|getareausers|getareadropitem|getexp|end|debugmes|logmes|atcommand|charcommand|dispbottom|query_sql|query_logsql|escape_sql|freeloop|bindatcmd|unbindatcmd|has_permission|can_use_command|add_group_command|setbattleflag|getbattleflag)$"))

; Built-in functions in function calls - Character Info
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(strcharinfo|strnpcinfo|getcharid|charid2rid|rid2name|readparam|setparam|getnpcid|getlook|getsavepoint|getinventorylist|getcartinvestorylist|getskilllist|playerattached|attachrid|detachrid|isloggedin|getcharip)$"))

; Built-in functions in function calls - Instances/BG
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(instance_create|instance_destroy|instance_attachmap|instance_detachmap|instance_attach|instance_id|instance_set_timeout|instance_init|instance_announce|instance_npcname|instance_mapname|instance_set_respawn|instance_warpall|instance_check_party|instance_check_guild|has_instance|has_instance2|bg_create_team|bg_team_setxy|bg_warp|bg_leave|bg_destroy|bg_get_data|bg_getareausers|bg_updatescore|bg_join_team|bg_match_over|waitingroom2bg|waitingroom2bg_single)$"))

; Built-in functions in function calls - Pet/Homunculus/Mercenary
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(pet|bpet|getpetinfo|petskillbonus|petrecovery|petloot|petskillattack|petskillsupport|petstat|makepet|gethominfo|homevolution|hommutate|morphembryo|checkhomcall|homshuffle|mercenary_create|mercenary_heal|mercenary_sc_start|mercenary_get_calls|mercenary_get_faith|mercenary_set_calls|mercenary_set_faith|getmercinfo)$"))

; Built-in functions in function calls - Misc
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(rand|set|setd|getd|goto|return|enablenpc|disablenpc|hideoffnpc|hideonnpc|movenpc|npcspeed|npcwalkto|npcstop|setnpcdistance|getnpcdir|setnpcdir|getnpcclass|setnpcdisplay|cutin|viewpoint|nude|progressbar|progressbar_unit|showdigit|sit|stand|issit|gettime|gettimetick|gettimestr|night|day|isnight|savepoint|checkoption|setoption|setcart|checkcart|setfalcon|checkfalcon|setmount|checkmount|checkwug|isequipped|isequippedcnt|cardscnt|getrefine|getvariableofnpc|getvariableofpc|setarray|cleararray|copyarray|deletearray|getarraysize|getarrayindex|getelementofarray|getargcount|is_function|getunittype|setunitdata|getunitdata|getunitname|setunitname|getunits|unitwalk|unitkill|unitwarp|unitattack|unitstop|unittalk|unitemote|unitskilluseid|unitskillusepos|waitingroom|delwaitingroom|kickwaitingroomall|enablewaitingroomevent|disablewaitingroomevent|getwaitingroomstate|warpwaitingpc|warpportal|pushpc|marriage|wedding|divorce|ispartneron|getpartnerid|getchildid|getmotherid|getfatherid|warppartner|openmail|openauction|checkvending|checkchatting|checkidle|checkbound|getitembound|getitembound2|countbound|playbgm|playbgmall|soundeffect|soundeffectall|npctalk|message|servicemessage|globalmes|channelmes|addchannelhandler|removechannelhandler|packageitem|searchitem|groupranditem|mergeitem|montransform|makerune|hascashmount|setcashmount|showscript|hateffect|camerainfo|changecamera|itempreview|enchantitem|rodex_sendmail|rodex_sendmail2|rodex_sendmail_acc|rodex_sendmail_acc2|airship_respond|openstylist|expandInventory|expandInventoryAck|expandInventoryResult|getInventorySize|readbook|setfont|achievement_progress|clan_join|clan_leave|clan_master|getcalendartime|setitemscript)$"))

; Built-in functions in function calls - String functions
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(getstrlen|charisalpha|charat|isstr|getdatatype|data_to_string|string_to_data|chr|ord|setchar|insertchar|delchar|strtoupper|strtolower|charisupper|charislower|substr|explode|implode|sprintf|sscanf|strpos|replacestr|countstr|compare|strcmp)$"))

; Built-in functions in function calls - Math functions
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(sqrt|pow|log10|distance|min|max|md5|swap|atoi|axtoi|strtol)$"))

; Built-in functions in function calls - Queue
(function_stmt
  (identifier) @function.builtin
  (#match? @function.builtin "^(queue|queuesize|queueadd|queueremove|queueopt|queuedel|queueiterator|qicheck|qiget|qiclear)$"))



; NPC definitions
(npc_name) @string.special
(npc_sprite) @type
(npc_area) @number

; Position - map name highlighted
(position
  map: (identifier) @constant.builtin)
(position) @constant

; Variables and identifiers
(identifier) @variable

; Literals
(string) @string
(number) @number

; Operators (as nodes, not literals)
(compareop) @operator
(logicalop) @operator
(bitwiseop) @operator
(plusop) @operator
(mulop) @operator
(ternary) @operator
(assignment_stmt) @operator

; Punctuation - only literals that exist in grammar
";" @punctuation.delimiter
"," @punctuation.delimiter
":" @punctuation.special
"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket

; Control flow structures (for context)
(if_stmt) @context
(switch_stmt) @context
(for_stmt) @context
(while_stmt) @context
(do_while_stmt) @context
(case_stmt) @context
(block) @context
