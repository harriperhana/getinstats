Procedure AppOnIdle(Ticks : Integer);
Begin
	If Ticks mod (60 * 1) = 0 Then
	Begin
		SaveMapStat;
		SavePlayersStat;
		SaveTeamsStat;
	End;
End;