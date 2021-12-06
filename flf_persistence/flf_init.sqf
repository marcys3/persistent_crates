/*
 * Name:	flf_init
 * Date:	31/10/2021
 * Version: 1.0
 * Author:  Fluffy
 *
 * Description:
 * Init Fluffy persistence
 *
 * Parameter(s):
 * _box (OBJECT): - Box which will save content.
 */

params ["_box"];

if (!isServer) exitWith {};

//delete all content
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;


//add eventhandler
[_box, "flf_persistence\add_event_handler.sqf"] remoteExec ["execVM", 0, true];


//load content from DB
[_box] execVM "flf_persistence\flf_load_weapons.sqf";
[_box] execVM "flf_persistence\flf_load_magazines.sqf";
[_box] execVM "flf_persistence\flf_load_items.sqf";
[_box] execVM "flf_persistence\flf_load_gear.sqf";
