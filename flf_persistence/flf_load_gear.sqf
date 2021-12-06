/*
 * Name:	flf_load_items
 * Date:	22/10/2021
 * Version: 1.0
 * Author:  Fluffy
 *
 * Description:
 * Load gear from profilenamespace
 *
 * Parameter(s):
 * _PARAM1 (TYPE): - DESCRIPTION.
 * _PARAM2 (TYPE): - DESCRIPTION.
 */


params ["_box"];
private ["_content","_items","_ammount","_selected_gear","_item_count","_name_box"];

if (!isServer) exitWith {};

_name_box = vehicleVarName _box;

//load gear from DB
_content_backpack = profileNamespace getVariable [format [_name_box + "backpacks", _name_box], []];
// format [all_types_array]. Eg: ["a","b","c"]

_backpack_count = count (_content_backpack select 1);
// format [all_types_array, all_counts_array]. Eg: [["a", "b"], [3, 2]]
_backpack = _content_backpack # 0;
_ammount = _content_backpack # 1;

	if (_backpack_count > 0) then {
//iterate through each array at a time and add backpacks
for [{private _i = 0}, {_i < _backpack_count}, {_i = _i + 1}] do {
	_selected_backpack = _backpack # _i;
	_selected_ammount = _ammount # _i;	
	_box addBackpackCargoGlobal [_selected_backpack,_selected_ammount];
	};
};