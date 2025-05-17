Function SaveMapStat() : Boolean;
Var MapStat : String;
Begin
	MapStat :=
		'style=' + IntToStr(GameStyle) + #13#10 +
		'current=' + CurrentMap + #13#10 +
		'next=' + NextMap + #13#10 +
		'players=' + IntToStr(NumPlayers) + #13#10 +
		'bots=' + IntToStr(NumBots) + #13#10 +
		'spectators=' + IntToStr(Spectators);
	WriteFile('scripts/getinstats/map/stat', MapStat);
	Result := True;
End;

Function SaveMapTimer() : Boolean;
Var MapTimer : String;
Begin
	MapTimer :=
		'left=' + IntToStr(TimeLeft) + #13#10 +
		'limit=' + IntToStr(TimeLimit * 60);
	WriteFile('scripts/getinstats/map/timer', MapTimer);
	Result := True;
End;