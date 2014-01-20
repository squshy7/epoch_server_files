/*
	Custom Marker Requirements:
	
	Spawn markers: The area covered by the marker will be used as the patrol and spawning area.
	
		1. Marker shape must be Ellipse (Could be rectangular but the function will consider the marker as elliptical regardless)
		2. Marker should have identical x and y dimensions. If they are different, the smaller dimension will be used instead.
	
	Blacklist markers: If a player is within this area, they will not be selected as a target for dynamic AI spawns.
	
		1. Marker shape may be Ellipse or Rectangle
		2. Marker dimensions should cover the area to be blacklisted.
	
	Example Marker (Note: the marker name must be unique! In this example, it's named "dzaicustomspawntest"):
	
	_this = createMarker ["dzaicustomspawntest", [6650.9883, 9411.541, -6.1035156e-005]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Flag";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [200, 200];
	_this setMarkerAlpha 0;
	_dzaicustomspawntest = _this;		//_dzaicustomspawntest must be a unique name
	
	Note: This marker is used in the example found in the custom_spawns config files.
*/

//----------------------------Add your custom markers below this line ----------------------------

  _this = createMarker ["squadspawn1", [1838.5762, 4068.0356, -1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn1 = _this;
  
  _this = createMarker ["squadspawn2", [1742.5697, 3980.2256]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn2 = _this;
  
  _this = createMarker ["squadspawn3", [1918.2493, 4048.1619, -3.0517578e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn3 = _this;
  
  _this = createMarker ["squadspawn4", [1867.7517, 4002.3953, -4.5776367e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn4 = _this;
  
  _this = createMarker ["squadspawn5", [1989.9346, 3971.8662, -4.5776367e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn5 = _this;
  
  _this = createMarker ["squadspawn6", [1913.4283, 3956.2817, -3.0517578e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn6 = _this;
  
  _this = createMarker ["squadspawn7", [2027.7633, 4012.2456, -3.0517578e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn7 = _this;
  
  _this = createMarker ["squadspawn8", [1934.5334, 4078.1309]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn8 = _this;
  
  _this = createMarker ["squadspawn9", [1791.8076, 4176.0742, -4.5776367e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn9 = _this;
  
  _this = createMarker ["squadspawn10", [1643.3612, 3968.7705, 1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn10 = _this;
  
  _this = createMarker ["squadspawn11", [1768.1602, 3902.728, 0.30424488]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn11 = _this;
  
  _this = createMarker ["squadspawn12", [1750.0673, 3596.5417]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn12 = _this;
  
  _this = createMarker ["squadspawn13", [1728.4802, 3630.8103]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn13 = _this;
  
  _this = createMarker ["squadspawn14", [1724.1251, 3729.8237]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn14 = _this;
  
  _this = createMarker ["squadspawn15", [1018.3035, 4112.3555]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn15 = _this;
  
  _this = createMarker ["squadspawn16", [1050.1508, 4218.8149]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn16 = _this;
  
  _this = createMarker ["squadspawn17",[1173.327, 4179.5342, 1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn17 = _this;
  
  _this = createMarker ["squadspawn18", [1294.9941, 4176.709]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn18 = _this;
  
  _this = createMarker ["squadspawn19", [1504.2111, 4041.6245, 1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn19 = _this;
  
  _this = createMarker ["squadspawn20", [1850.9684, 3757.9624, -9.1552734e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn20 = _this;
  
  _this = createMarker ["squadspawn21", [1553.2997, 3881.2097, -9.1552734e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn21 = _this;
  
  _this = createMarker ["squadspawn22", [1549.5074, 3700.2153, -2.2888184e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn22 = _this;
  
  _this = createMarker ["squadspawn23", [1631.0029, 4155.2217]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn23 = _this;
  
  _this = createMarker ["squadspawn24", [1716.3734, 3820.1084]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn24 = _this;
  
  _this = createMarker ["squadspawn25", [2059.2363, 3782.4648, 4.5776367e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [50, 50];
  _this setMarkerAlpha 0;
  _squadspawn25 = _this;
  
  _this = createMarker ["guardspawn1", [987.01398, 4167.1445, -1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [1, 1];
  _this setMarkerAlpha 0;
  _guardspawn1 = _this;
  
  _this = createMarker ["guardspawn2", [1757.4183, 3548.9392, 1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [1, 1];
  _this setMarkerAlpha 0;
  _guardspawn2 = _this;
  
  _this = createMarker ["guardspawn3", [1746.7865, 3542.9536, -1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [1, 1];
  _this setMarkerAlpha 0;
  _guardspawn3 = _this;
  
  _this = createMarker ["guardspawn4", [2106.2417, 3792.4236, -1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [1, 1];
  _this setMarkerAlpha 0;
  _guardspawn4 = _this;
  
  _this = createMarker ["guardspawn5", [2105.8284, 3805.0532, 1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [1, 1];
  _this setMarkerAlpha 0;
  _guardspawn5 = _this;
  
  _this = createMarker ["guardspawn6", [1809.8346, 4172.1138, 1.5258789e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [1, 1];
  _this setMarkerAlpha 0;
  _guardspawn6 = _this;
  
  _this = createMarker ["guardspawn7", [1822.5499, 4164.4248, 3.0517578e-005]];
  _this setMarkerShape "ELLIPSE";
  _this setMarkerType "Flag";
  _this setMarkerBrush "Solid";
  _this setMarkerSize [1, 1];
  _this setMarkerAlpha 0;
  _guardspawn7 = _this;