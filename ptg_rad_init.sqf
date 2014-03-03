if !(isDedicated) then
{
	waitUntil{!IsNull Player};
	if(local player) then
	{
		waitUntil{time > 1};
		[] call compile preprocessFile "ptg_rad_functions.sqf";
		
		_fg = ppEffectCreate ["filmGrain", 2000];
		_fg ppEffectEnable true;
		_fg ppEffectAdjust [0.00, 0.5, 4];
		_fg ppEffectCommit 0;
		player setVariable["rad_fg", _fg, true];
		
		player setVariable["rad_damage", 0, true];
	};
};  