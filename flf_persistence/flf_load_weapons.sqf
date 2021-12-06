/*
 * Name:	flf_load_weapons
 * Date:	31/10/2021
 * Version: 2.0
 * Author:  Fluffy
 *
 * Description:
 * Load weapons from profilenamespace
 *
 * Parameter(s):
 * _box (OBJECT): - AmmoBox.
 *
 */

params ["_box"];
private ["_content","_selected_weapon","_weapon_count","_name_box"];

if (!isServer) exitWith {};

_name_box = vehicleVarName _box;
//load weapons from DB
_content = profileNamespace getVariable [format [_name_box + "weapons", _name_box], []];
_weapon_count = count _content;
// format [["gun1","silencer","laser","optics",["magazine",bullets],["magazine",bullets],"bipod"],[gun2],[gun3]]


//iterate through each array at a time and add weapons
for [{private _i = 0}, {_i < _weapon_count}, {_i = _i + 1}] do {
	_selected_weapon = _content # _i;
	systemChat format ["%1",_selected_weapon];
	_box addWeaponWithAttachmentsCargoGlobal [_selected_weapon, 1];

};
