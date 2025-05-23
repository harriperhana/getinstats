Function SaveTeamsStat() : Boolean;
Var TeamStat : String;
Begin
	TeamStat :=
		'id=1' + #13#10 +
		'players=' + IntToStr(AlphaPlayers) + #13#10 +
		'score=' + IntToStr(AlphaScore);
	WriteFile('scripts/getinstats/data/team/1', TeamStat);
	TeamStat :=
		'id=2' + #13#10 +
		'players=' + IntToStr(BravoPlayers) + #13#10 +
		'score=' + IntToStr(BravoScore);
	WriteFile('scripts/getinstats/data/team/2', TeamStat);
	TeamStat :=
		'id=3' + #13#10 +
		'players=' + IntToStr(CharliePlayers) + #13#10 +
		'score=' + IntToStr(CharlieScore);
	WriteFile('scripts/getinstats/data/team/3', TeamStat);
	TeamStat :=
		'id=4' + #13#10 +
		'players=' + IntToStr(DeltaPlayers) + #13#10 +
		'score=' + IntToStr(DeltaScore);
	WriteFile('scripts/getinstats/data/team/4', TeamStat);
	Result := True;
End;