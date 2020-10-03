/*
 * The oc_timeVarManager is a controller for time trackable global variables and should be in all
 * rooms that contain animations of any sort.
 * 
 * This instance should be first created to ensure animations don't crash when referencing global
 * variables.
 */
 
// ---------------------------------------------------------------------------------------------------
#region Init Variables
// ---------------------------------------------------------------------------------------------------

global.secondsPassed = 0
global.second = 0


#endregion
// ---------------------------------------------------------------------------------------------------