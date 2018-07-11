// by ALIAS
// 	nul = [_obj_center,_radius,_flares_rounds,_flares_freq] execVM "ALartillery\alias_flares.sqf";

// TO DO flares with less particles and brighter

	private ["_rel_Pos","_poz","_xx ","_yy","_dire","_color","_poz_x_ini","_poz_y_ini","_radius_art_p","_obj_art"];
	_obj_art		=_this select 0;
	_radius_art		=_this select 1;
	_no_flares		=_this select 2;
	_freq_flares	=_this select 3;

	_radius_art_p	=3; // edit this value if you want to change the distance between chosen player and flares		

switch (_obj_art) do {
    case "mp_alias": {
		nul = [] execVM "ALartillery\alias_hunt.sqf";
		sleep 1;
		while {_no_flares>0} do {
		_color = ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"] call BIS_fnc_selectRandom;		
		_dire	= [random _radius_art_p*-1,random _radius_art_p*-1] call BIS_fnc_selectRandom;
		_xx 	= (getpos hunt_alias select 0)+_dire;
		_dire	= [random _radius_art_p*-1,random _radius_art_p*-1] call BIS_fnc_selectRandom;
		_yy 	= (getpos hunt_alias select 1)+_dire;
		_rel_Pos= [_xx, _yy, 150+random 100];
		_flob 	= _color createvehicle _rel_Pos;
		_flob setVelocity [+0.5,+1,+1];
		_no_flares=_no_flares-1;
		sleep _freq_flares;
		};	
	};
	case "area_alias": { 
		_poz_x_ini = getMarkerPos _obj_art select 0;
		_poz_y_ini = getMarkerPos _obj_art select 1;	
		while {_no_flares>0} do {
		_color = ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"] call BIS_fnc_selectRandom;				
		_dire	=	[-1,1] call BIS_fnc_selectRandom;
		_xx 	= _poz_x_ini+(random _radius_art) * _dire;
		_dire	=	[-1,1] call BIS_fnc_selectRandom;
		_yy 	= _poz_y_ini+(random _radius_art) * _dire;
		_rel_Pos= [_xx, _yy, 150+random 100];
		_flob 	= _color createvehicle _rel_Pos;
		_flob setVelocity [+0.5,+1,+1];
		_no_flares=_no_flares-1;
		sleep _freq_flares;	
		};
	
	};
	default { 
		while {_no_flares>0} do {
		_color = ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"] call BIS_fnc_selectRandom;			
		_marker_exp=_obj_art call BIS_fnc_selectRandom;
		if (_marker_exp in allMapMarkers) then {_rel_Pos= [getMarkerPos _marker_exp select 0,getMarkerPos _marker_exp select 1, 150+random 100];}
			else {_rel_Pos= [getPos _marker_exp select 0,getPos _marker_exp select 1, 150+random 100];};
		_flob 	= _color createvehicle _rel_Pos;
		_flob setVelocity [+0.5,+1,+1];
		_no_flares=_no_flares-1;
		sleep _freq_flares;	
		};
	};
};	
	
while {_no_flares>0} do {
	_color = ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"] call BIS_fnc_selectRandom;
	_dire	=	[-1,1] call BIS_fnc_selectRandom;
	_xx 	= _poz_x_ini+(random _radius_art) * _dire;
	_yy 	= _poz_y_ini+(random _radius_art) * _dire;
	_rel_Pos= [_xx, _yy, 150+random 100];	
	_flob 	= _color createvehicle _rel_Pos;
	_flob setVelocity [+0.5,+1,+1];
	_no_flares=_no_flares-1;
	sleep _freq_flares;
	// 20
};