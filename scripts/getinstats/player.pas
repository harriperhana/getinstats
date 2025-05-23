Function BoolToInt(const Value : Boolean) : String;
Begin
	If Value Then
		Result := '1'
	Else
		Result := '0';
End;

Function SavePlayerStat(const ID: integer) : Boolean;
Var PlayerStat : String;
Begin
	PlayerStat :=
		'name=' + GetPlayerStat(ID, 'Name') + #13#10 +
		'hwid=' + GetPlayerStat(ID, 'HWID') + #13#10 +
		'ip=' + GetPlayerStat(ID, 'IP') + #13#10 +
		'human=' + BoolToInt(GetPlayerStat(ID, 'Human')) + #13#10 +
		'ping=' + IntToStr(GetPlayerStat(ID, 'Ping')) + #13#10 +
		'team=' + IntToStr(GetPlayerStat(ID, 'Team')) + #13#10 +
		'kills=' + IntToStr(GetPlayerStat(ID, 'Kills')) + #13#10 +
		'deaths=' + IntToStr(GetPlayerStat(ID, 'Deaths')) + #13#10 +
		'flags=' + IntToStr(GetPlayerStat(ID, 'Flags')) + #13#10 +
		'flagger=' + BoolToInt(GetPlayerStat(ID, 'Flagger')) + #13#10 +
		'alive=' + BoolToInt(GetPlayerStat(ID, 'Alive')) + #13#10 +
		'primary=' + IntToStr(GetPlayerStat(ID, 'Primary')) + #13#10 +
		'secondary=' + IntToStr(GetPlayerStat(ID, 'Secondary')) + #13#10 +
		'ammo=' + IntToStr(GetPlayerStat(ID, 'Ammo')) + #13#10 +
		'secammo=' + IntToStr(GetPlayerStat(ID, 'SecAmmo')) + #13#10 +
		'grenades=' + IntToStr(GetPlayerStat(ID, 'Grenades')) + #13#10 +
		'health=' + IntToStr(GetPlayerStat(ID, 'Health')) + #13#10 +
		'vest=' + IntToStr(GetPlayerStat(ID, 'Vest')) + #13#10 +
		'jets=' + IntToStr(GetPlayerStat(ID, 'Jets')) + #13#10 +
		'active=' + BoolToInt(GetPlayerStat(ID, 'Active')) + #13#10 +
		'time=' + IntToStr(GetPlayerStat(ID, 'Time'));
	WriteFile('scripts/getinstats/data/player/' + GetPlayerStat(ID, 'HWID'), PlayerStat);
	Result := True;
End;

Procedure SavePlayersStat;
Var ID : Byte;
Begin
	For ID := 1 To 32 Do
		SavePlayerStat(ID);
End;