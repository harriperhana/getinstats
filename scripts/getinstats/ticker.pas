Procedure AppOnIdle(Ticks : Integer);
Begin
	If Ticks mod (60 * 1) = 0 Then
	Begin
	    SaveMapTimer;
	End;
	If Ticks mod (60 * 5) = 0 Then
    Begin
        SavePlayersStat;
        SaveTeamsStat;
        SaveMapStat;
    End;
End;