/*
 * Name:	flf_load_items
 * Date:	22/10/2021
 * Version: 1.0
 * Author:  Fluffy
 *
 * Description:
 * Load items from profilenamespace
 *
 * Parameter(s):
 * _PARAM1 (TYPE): - DESCRIPTION.
 * _PARAM2 (TYPE): - DESCRIPTION.
 */


params ["_box"];
private ["_content","_items","_ammount","_selected_item","_selected_ammount","_item_count","_name_box"];

if (!isServer) exitWith {};

_name_box = vehicleVarName _box;

//load magazines from DB
_content = profileNamespace getVariable [format [_name_box + "items", _name_box], []];
_item_count = count (_content select 1);
// format [all_types_array, all_counts_array]. Eg: [["a", "b"], [3, 2]]
_items = _content # 0;
_ammount = _content # 1;

//iterate through each array at a time and add weapons
for [{private _i = 0}, {_i < _item_count}, {_i = _i + 1}] do {
	_selected_item = _items # _i;
	_selected_ammount = _ammount # _i;	
	_box addItemCargoGlobal [_selected_item,_selected_ammount];
};