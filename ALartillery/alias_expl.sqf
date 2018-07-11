// by ALIAS
// nul = [_obj_center,_radius,_expl_rounds,_expl_freq] execVM "ALartillery\alias_expl.sqf";

	private ["_rel_Pos","_xx ","_yy","_art_voice","_dire","_target_art","_marker_exp","_poz_x_ini","_poz_y_ini","_radius_art_p"];
	_target_art		=_this select 0;
	_radius_art		=_this select 1;
	_nr_art			=_this select 2;
	_freq_art		=_this select 3;

	_radius_art_p	=100; // edit this value if you want to change the distance between chosen player and explosions
	
	_art_voice = "land_helipadempty_f" createVehicle getpos player;
	
switch (_target_art) do {
    case "mp_alias": {
		nul = [] execVM "ALartillery\alias_hunt.sqf";
		sleep 1;
		while {_nr_art>0} do {
		_dire	= [(50+random _radius_art_p)*-1,(50+random _radius_art_p)*1] call BIS_fnc_selectRandom;
		_xx 	= (getpos hunt_alias select 0)+_dire;
		_dire	=  [(50+random _radius_art_p)*-1,(50+random _radius_art_p)*1] call BIS_fnc_selectRandom;
		_yy 	= (getpos hunt_alias select 1)+_dire;
//		hint str _dire;
		_rel_Pos= [_xx, _yy, 50];
		_art_voice setPos _rel_Pos;
		_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
		[[_art_voice, _fluier], "say3d", true] call BIS_fnc_MP;
		sleep 3 + random 0.5;		
		_bomb = "Bomb_03_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];
		sleep 0.5+random 0.5;	_bombi= "M_Mo_82mm_AT_LG" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
		_nr_art=_nr_art-1;
		sleep _freq_art;
		};	
		deleteVehicle _art_voice;
	};
	case "area_alias": { 
		_poz_x_ini = getMarkerPos _target_art select 0;
		_poz_y_ini = getMarkerPos _target_art select 1;	
		while {_nr_art>0} do {
		_dire	=	[-1,1] call BIS_fnc_selectRandom;
		_xx 	= _poz_x_ini+(random _radius_art) * _dire;
		_dire	=	[-1,1] call BIS_fnc_selectRandom;
		_yy 	= _poz_y_ini+(random _radius_art) * _dire;
		_rel_Pos= [_xx, _yy, 50];
		_art_voice setPos _rel_Pos;
		_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
		[[_art_voice, _fluier], "say3d", true] call BIS_fnc_MP;
		sleep 3 + random 0.5;		
		_bomb = "Bomb_03_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];
		sleep 0.5+random 0.5;	_bombi= "M_Mo_82mm_AT_LG" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
		_nr_art=_nr_art-1;
		sleep _freq_art;		
		};
	
	};
	default { 
		while {_nr_art>0} do {
		_marker_exp=_target_art call BIS_fnc_selectRandom;
		if (_marker_exp in allMapMarkers) then {_rel_Pos= [getMarkerPos _marker_exp select 0,getMarkerPos _marker_exp select 1, 50];_art_voice setPos _rel_Pos;}
			else {_rel_Pos= [getPos _marker_exp select 0,getPos _marker_exp select 1, 50];_art_voice setPos _rel_Pos;};
		_art_voice setPos _rel_Pos;
		_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
		[[_art_voice, _fluier], "say3d", true] call BIS_fnc_MP;
		sleep 3 + random 0.5;		
		_bomb = "Bomb_03_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];
		sleep 0.5+random 0.5;	_bombi= "M_Mo_82mm_AT_LG" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
		_nr_art=_nr_art-1;
		sleep _freq_art;		
		};
	};
};