// by ALIAS

private ["_k_unit","_grp"];

if (!isServer) exitWith {};

_origin = _this select 0;
_no		= _this select 1;

if (_no>0) then 
{
_nr_k = 0;

while {_nr_k<_no} do 
{	
	_grp = createGroup civilian;
	_type_k = ["C_Man_casual_6_F_afro","C_man_1_1_F","C_Man_casual_1_F_asia","C_man_1_3_F","C_man_polo_1_F","C_man_polo_1_F_afro","C_Man_casual_3_F_asia","C_man_polo_1_F_asia","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_Man_casual_4_F_euro","C_man_polo_3_F","C_man_polo_3_F_afro","C_Man_casual_5_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_hunter_1_F","C_Orestes","C_Nikos","C_Nikos","C_man_sport_2_F_afro","C_man_sport_3_F_asia"] call BIS_fnc_selectRandom;
	_type_k createUnit [getMarkerPos _origin, _grp, "k_unit = this; [k_unit,10,true,true] execvm 'Scripts\kam.sqf'", 0.3,"FORM"];
	_nr_k = _nr_k +1;
	//hint str _nr_k;
	sleep 1;
};
};