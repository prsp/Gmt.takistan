// by ALIAS
// nul = [_obj_center,_radius,_smokes_rounds,_smokes_freq] execVM "ALartillery\alias_smokes.sqf";

// TO DO smokes with less particles

	private ["_rel_Pos","_xx ","_yy","_dire","_color","_poz_x_ini","_poz_y_ini","_radius_art_p","_obj_art","_marker_exp"];
	_obj_art		=_this select 0;
	_radius_art		=_this select 1;
	_no_smokes		=_this select 2;
	_freq_smokes	=_this select 3;
	
	_radius_art_p	=3; // edit this value if you want to change the distance between chosen player and smokes	

switch (_obj_art) do {
    case "mp_alias": {
		nul = [] execVM "ALartillery\alias_hunt.sqf";
		sleep 1;
		while {_no_smokes>0} do {
		_color 	= ["SmokeShellGreen", "SmokeShellRed", "SmokeShellBlue", "SmokeShellWhite"] call BIS_fnc_selectRandom;		
		_dire	= [random _radius_art_p*-1,random _radius_art_p*-1] call BIS_fnc_selectRandom;
		_xx 	= (getpos hunt_alias select 0)+_dire;
		_dire	= [random _radius_art_p*-1,random _radius_art_p*-1] call BIS_fnc_selectRandom;
		_yy 	= (getpos hunt_alias select 1)+_dire;
		_rel_Pos= [_xx, _yy, 0];
		_smoke 	= _color createvehicle _rel_Pos;
		_no_smokes=_no_smokes-1;
		sleep _freq_smokes;
		};	
	};
	case "area_alias": { 
		_poz_x_ini = getMarkerPos _obj_art select 0;
		_poz_y_ini = getMarkerPos _obj_art select 1;	
		while {_no_smokes>0} do {
		_color 	= ["SmokeShellGreen", "SmokeShellRed", "SmokeShellBlue", "SmokeShellWhite"] call BIS_fnc_selectRandom;				
		_dire	=	[-1,1] call BIS_fnc_selectRandom;
		_xx 	= _poz_x_ini+(random _radius_art) * _dire;
		_dire	=	[-1,1] call BIS_fnc_selectRandom;
		_yy 	= _poz_y_ini+(random _radius_art) * _dire;
		_rel_Pos= [_xx, _yy, 20];
		_smoke 	= _color createvehicle _rel_Pos;
		_no_smokes=_no_smokes-1;
		sleep _freq_smokes;		
		};
	
	};
	default { 
		while {_no_smokes>0} do {
		_color 	= ["SmokeShellGreen", "SmokeShellRed", "SmokeShellBlue", "SmokeShellWhite"] call BIS_fnc_selectRandom;			
		_marker_exp=_obj_art call BIS_fnc_selectRandom;
		if (_marker_exp in allMapMarkers) then {_rel_Pos= [getMarkerPos _marker_exp select 0,getMarkerPos _marker_exp select 1, 0];}
			else {_rel_Pos= [getPos _marker_exp select 0,getPos _marker_exp select 1, 0];};
		_smoke 	= _color createvehicle _rel_Pos;
		_no_smokes=_no_smokes-1;
		sleep _freq_smokes;		
		};
	};
};