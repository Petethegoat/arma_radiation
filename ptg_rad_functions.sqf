#define RAD_HELMET ["H_HelmetCrew_I"]
#define RAD_HELMET_PROTECTION [5]

#define RAD_VEST ["V_PlateCarrierIA1_dgtl"]
#define RAD_VEST_PROTECTION [5]

#define RAD_VEHICLE ["I_MRAP_03_F"]
#define RAD_VEHICLE_PROTECTION [10]

#define RAD_THRESHOLD 10

fnc_rad_doDamage =
{
	_source = _this select 0;
	_radius = _this select 1;
	_distance = _this select 2;
	_unit = _this select 3;
	
	_distance = [_source, _unit] call fnc_rad_getRange;
	_protection = _unit call fnc_rad_getProtection;
	
	_damage = _unit getVariable ["rad_damage", 0];
	_damage = _damage + ((_radius - _distance) / _radius) / (_protection + 1);
	_unit setVariable ["rad_damage", _damage, true];	
};

fnc_rad_doEffects =
{
	_source = _this select 0;
	_radius = _this select 1;
	_distance = _this select 2;
	_unit = _this select 3;
	
	_fg = _unit getVariable ["rad_fg", 0];
	_fg ppEffectAdjust [(_radius - _distance) / _radius, 0.5, 4];
	_fg ppEffectCommit 0;
};

fnc_rad_getRange =
{
	_source = _this select 0;
	_unit = _this select 1;
	
	_source distance _unit;
};

fnc_rad_getProtection =
{
	_protection = 0;

	_helmet = headgear _this;
	_vest = vest _this;
	_vehicle = vehicle _this;
	
	{
		if(_helmet == _x) then
		{
			_protection = _protection + (RAD_HELMET_PROTECTION select _forEachIndex);
		};
	} forEach RAD_HELMET;
	
	{
		if(_vest == _x) then
		{
			_protection = _protection + (RAD_VEST_PROTECTION select _forEachIndex);
		};
	} forEach RAD_VEST;
	
	if(_vehicle != _this) then
	{
		{
			if(typeof _vehicle == _x) then
			{
				_protection = _protection + (RAD_VEHICLE_PROTECTION select _forEachIndex);
			};
		} forEach RAD_VEHICLE;
	};
	
	_protection
};

fnc_rad_getAffected =
{
	{
		if(_x isKindOf "CAManBase") then
		{
			_x call fnc_rad_getProtection;
		}
		else
		{
			{
				_x call fnc_rad_getProtection;
			}forEach(crew _x);
		};

	}forEach(list _this);
};