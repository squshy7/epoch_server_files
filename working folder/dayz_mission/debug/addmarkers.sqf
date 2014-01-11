// Major mission marker
while{MissionGo == 1} do { //refresh marker script by *hs-s.com | waTTe - www.banditparty.de
    _MainMarker = createMarker ["MainMarker", Ccoords];
    _MainMarker setMarkerColor "ColorRed";	//Set the color of the marker
    _MainMarker setMarkerShape "ELLIPSE";	//Set the shape of the marker
    _MainMarker setMarkerBrush "Grid";	//Set the style of the marker
    _MainMarker setMarkerAlpha 0.75;	//Set the transparency of the marker
    _MainMarker setMarkerSize [250,250];	//Set the size of the marker
sleep 25;
	deleteMarker _MainMarker;
};
