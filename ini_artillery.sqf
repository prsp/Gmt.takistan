// by ALIAS
// nul = [alias_target,smokes_rounds,flares_rounds,expl_rounds] execvm "ALartillery\alias_artillery.sqf";
// Tutorial: WIP

/*
* Script MP and SP compatible
alias_target	- object name, array of markers and/or objects, or player in SP or MP
smokes_rounds	- integer
flares_rounds	- integer
expl_rounds		- integer

=============== alias_target VALUES can be on of the following
"mp_alias" 			- if is a scenario where you want explosions to follow one of the alive players
"area_alias" 		- area defined by a marker called area_alias with radius of 200m where smokes and/or flares and/or explosions will be spawned
["marke_1",obj_1]	- array of markers or objects where you want to spawn explosions, insert as many as you want but make sure markers and objects exists on map

======= Example Usage ====================
> Smokes only
	- 20 rounds, in area with center in a marker called area_alias
		nul = ["area_alias",20,0,0] execvm "ALartillery\alias_artillery.sqf";
	- 20 smoke rounds around a random player
		nul = ["mp_alias",20,0,0] execvm "ALartillery\alias_artillery.sqf";
	- 20 rounds in a random location from array
		nul = [["l1",t1,t2],20,0,0] execvm "ALartillery\alias_artillery.sqf";

> Flares only
	- 30 rounds, in area with center in a marker called area_alias
		nul = ["area_alias",0,30,0] execvm "ALartillery\alias_artillery.sqf";
	- 30 smoke rounds around a random player
		nul = ["mp_alias",0,30,0] execvm "ALartillery\alias_artillery.sqf";
	- 30 rounds in a random location from array
		nul = [["l1",t1,t2],0,30,0] execvm "ALartillery\alias_artillery.sqf";

> Explosive shells only 
	- 10 rounds, in area with center in a marker called area_alias
		nul = ["area_alias",0,0,10] execvm "ALartillery\alias_artillery.sqf";
	- 10 rounds around a random player
		nul = ["mp_alias",0,0,10] execvm "ALartillery\alias_artillery.sqf";
	- 30 rounds in a random location from array
		nul = [["l1",t1,t2],0,0,30] execvm "ALartillery\alias_artillery.sqf";

> All (smokes, flares and explosions)
	- in area defined by marker called area_alias will be spawned 30 smokes, 20 flares, 50 explosions
		nul = ["area_alias",30,25,50] execvm "ALartillery\alias_artillery.sqf";
*/

nul = ["mp_alias" ,10,0,30] execvm "ALartillery\alias_artillery.sqf";