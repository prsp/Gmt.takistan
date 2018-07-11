//INTRO

titleText ["", "BLACK IN", 20];

0 fadeSound 0;
//0 fadeMusic 0;
enableRadio false;
enableEnvironment false;
clearRadio;

//playMusic "LeadTrack01a_F";


//Establish Shot

private ["_colorWest", "_colorEast"];
    
_colorWest = WEST call BIS_fnc_sideColor;
_colorEast = EAST call BIS_fnc_sideColor;
    
{
	//camUseNVG true;
	//true setCamUseTi 0;
    _x set [3, 0.33]
} forEach [_colorWest, _colorEast];

introShot = [
    markerPos "Tower", // Target position
    "U.S. ARMY BASE AIRFIELD, TAKISTAN", // SITREP text
    200, // 200m altitude
    300, // 300m radius
    290, // 290 degrees viewing angle
    0, // anti-clockwise movement
    []
] spawn BIS_fnc_establishingShot;
waitUntil {scriptDone introShot};

sleep 7;
titleText ["GOOD LUCK...", "PLAIN"];

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

enableSaving [FALSE,FALSE];
player enableFatigue FALSE;

params[ "_unit" ];

if ( isPlayer _unit && { !local _unit } ) exitWith {};

if ( isPlayer _unit ) then {
	_unit removeAllEventHandlers 'HandleDamage';
};

_unit addEventHandler [ "HandleDamage", {
	params ["_unit", "_hitSelection", "_damage","_source","_projectile","_hitPartIndex", "_instigator", "_hitPoint"];
	
	private _incomingDamage = _damage;
	private _oldDamage = 0;
	if (_hitSelection isEqualTo "") then {_oldDamage = damage _unit} else {_oldDamage = _unit getHit _hitSelection};
	private _newDamage = _damage - _oldDamage max 0;
	private _playerHealth = damage _unit;

	// Do any other damage calculations here
	// _damage is the previous damage plus any new damage and will be applied
	// as the total damage the unit has for this selection once this EH returns
	if (_newDamage > 0) then {
		// Reduce the new damage to 1/4 the amount
		_damage = _oldDamage + (_newDamage * 0.25);
	};
	
	// For players ignore damage if they are incapacitated and pass damage to bis revive handler
	if ( isPlayer _unit ) then {
		if ( lifeState _unit == "INCAPACITATED" ) then {
			//if we are incapacitated take no damage
			_damage = 0;
		} else {
			_this set[ 2, _damage ];
			
			_damage = _this call bis_fnc_reviveEhHandleDamage;
		};
	};
	
	_damage
	
}];

enableEngineArtillery false;
if (player isKindOf "B_support_Mort_f") then {
	enableEngineArtillery true;
};
