/*
 * Name:	flf_save_weapons
 * Date:	31/10/2021
 * Version: 2.0
 * Author:  Fluffy
 *
 * Description:
 * Saves weapons to profilenamespace
 *
 * Parameter(s):
 * _box (OBJECT): - Box which will save content.
 */


params ["_box"];

_box addEventHandler ["ContainerClosed", {
	params ["_container", "_unit"];
	[_container, "flf_persistence\flf_save_content.sqf"] remoteExec ["execVM", 0, true];
}];