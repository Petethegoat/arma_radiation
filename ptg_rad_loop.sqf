#define RAD_UPDATE_FREQUENCY 0.1;

_source = _this select 0;
_units = _this select 1;
_radius = triggerArea _source select 0;
{
	while {triggeractivated _source} do
	{
		_distance = [_source, _x] call fnc_rad_getRange;
		[_source, _radius, _distance, _x] call fnc_rad_doEffects;
		[_source, _radius, _distance, _x] call fnc_rad_doDamage;
		sleep RAD_UPDATE_FREQUENCY;
	};
} forEach _units;