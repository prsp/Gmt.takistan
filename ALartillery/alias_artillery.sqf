// by ALIAS
// nul = [obj_center,radius,smokes,smokes_rounds,smokes_freq,flares,flares_rounds,flares_freq,expl_shell,expl_rounds,expl_freq] execvm "ALartillery\alias_artillery.sqf";

// TO DO error management

if (!isserver) exitWith {};

private ["_smokes","_flares","_expl_shell","_radius"];

_obj_center     =_this select 0;
_smokes_rounds	=_this select 1;
_flares_rounds	=_this select 2;
_expl_rounds	=_this select 3;

// default values
_radius			=300; 			// edit this value if you want a different radius
_smokes_freq	=40;			// edit this if you want a different delay between smokes
_flares_freq	=20;			// edit this if you want a different delay between flares
_expl_freq		=1;				// edit this if you want a different delay between explosions


if (_smokes_rounds>0) then {
	nul = [_obj_center,_radius,_smokes_rounds,_smokes_freq] execVM "ALartillery\alias_smokes.sqf";
};

if (_flares_rounds>0) then {
	nul = [_obj_center,_radius,_flares_rounds,_flares_freq] execVM "ALartillery\alias_flares.sqf";
};

if (_expl_rounds>0) then {
	nul = [_obj_center,_radius,_expl_rounds,_expl_freq] execVM "ALartillery\alias_expl.sqf";
};