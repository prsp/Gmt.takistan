/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//----------------------------------------Remove fatigue effects FOR MULTIPLAYER---------------------------------------------

DAC_Basic_Value = 0;execVM "DAC\DAC_Config_Creator.sqf";


//EOS SYSTEM
[]execVM "eos\OpenMe.sqf";

//[] execVM "cleanup.sqf";

null = [[monitor1,monitor2],["s1","s2","s3","s4"]] execVM "LFC\Feedinit.sqf";

initAmbientSounds = [] execVM "initAmbientSounds.sqf";

call_bomber = false;
publicVariable "call_bomber";

slide_1 = false;
publicVariable "slide_1";


waitUntil {sleep 1;slide_1};
//[slide,true,40,20,7,10] execvm "AL_slide\rock_slide.sqf";
[slide_2,true,60,40,7,10] execvm "AL_slide\rock_slide.sqf";