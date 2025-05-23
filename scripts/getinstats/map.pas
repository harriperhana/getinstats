Function SaveMapStat() : Boolean;
Var MapStat : String;
Begin
	MapStat :=
		'style=' + IntToStr(GameStyle) + #13#10 +
		'name=' + CurrentMap + #13#10 +
		'left=' + IntToStr(TimeLeft) + #13#10 +
		'players=' + IntToStr(NumPlayers) + #13#10 +
		'humans=' + IntToStr(NumPlayers - NumBots) + #13#10 +
		'bots=' + IntToStr(NumBots);
	WriteFile('scripts/getinstats/data/map', MapStat);
	Result := True;
End;