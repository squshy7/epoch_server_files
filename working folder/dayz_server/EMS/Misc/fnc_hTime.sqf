private["_low_value","_high_value","_rand","_return"];
_low_value = _this select 0;
_high_value = _this select 1;

_rand = round(random (_high_value - _low_value));
_return = _low_value + _rand;

_return
