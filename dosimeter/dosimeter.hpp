class dosimeter_dialogue
{
	idd = -1;
	movingEnable = 1;
    enableSimulation = 1;
	controlsBackground[] = {};
  	objects[] = {};
	
	class controls 
	{
		class dosimeter_scan: RscButton
		{
			idc = 1600;
			text = "Scan";
			x = 0.3389219 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.053437 * safezoneW;
			h = 0.047 * safezoneH;
			action = "null = [fn] execVM ""ptg_rad_test.sqf"";"
		};
		class dosimeter_image: RscPicture
		{
			idc = 1200;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.286 * safezoneH;
			text = "dosimeter\dosimeter.paa";
		};
	};
};
