/*
 * Name:	flf_save_content
 * Date:	06/12/2021
 * Version: 3.1
 * Author:  Fluffy
 *
 * Description:
 * Saves crate content to profilenamespace
 *
 * Parameter(s):
 * _box (OBJECT): - Box which will save content.
 */


params ["_box"];
private ["_name_box","_content_weapons","_content_magazines","_content_items"];

if (!isServer) exitWith {};

_name_box = vehicleVarName _box;

//Get box content
_content_weapons = weaponsItemsCargo _box;
_content_magazines = getMagazineCargo _box; 
_content_items = getItemCargo _box; 
// format [all_types_array, all_counts_array]. Eg: [["a", "b"], [3, 2]]

//get uniforms, vests, headgear and backpacks
_backpacks_full_array = getBackpackCargo _box;
_backpacks_classnames = _backpacks_full_array # 0;


profileNamespace setVariable [format [_name_box + "weapons", _name_box], +_content_weapons];
//[["gun1","silencer","laser","optics",["magazine",bullets],["magazine",bullets],"bipod"]]

profileNamespace setVariable [format [_name_box + "magazines", _name_box], +_content_magazines];

profileNamespace setVariable [format [_name_box + "items", _name_box], +_content_items];

profileNamespace setVariable [format [_name_box + "backpacks", _name_box], +_backpacks_full_array];