/*
 * Author: ACRE2Team
 * SHORT DESCRIPTION
 *
 * Arguments:
 * 0: ARGUMENT ONE <TYPE>
 * 1: ARGUMENT TWO <TYPE>
 *
 * Return Value:
 * RETURN VALUE <TYPE>
 *
 * Example:
 * [ARGUMENTS] call acre_COMPONENT_fnc_FUNCTIONNAME
 *
 * Public: No
 */

/*
 *  This function sets the current channel
 *
 *  Type of Event:
 *      Data
 *  Event:
 *      setCurrentChannel
 *  Event raised by:
 *      - Several functions
 *
 *  Parsed parameters:
 *      0:  Radio ID
 *      1:  Event (-> "setCurrentChannel")
 *      2:  Eventdata (-> Number (New Channel))
 *      3:  Radiodata
 *      4:  Remote Call (-> false)
 *
 *  Returned parameters:
 *      nothing
*/
#include "script_component.hpp"

params ["_radioId", "_event", "_eventData", "_radioData"];

//TODO: If eventData is -1 -> manual mode

// First, we check how many channels are available in total
private _channelCount = count (HASH_GET(_radioData, "channels")) - 1;

// Then we define our upper and lower limits
// And write the new channel to the radioData hash
private _newChannel = (0 max _eventData) min _channelCount;
HASH_SET(_radioData,"currentChannel",_newChannel);
