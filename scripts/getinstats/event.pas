Procedure OnFlagGrab(ID, TeamFlag : Byte; GrabbedInBase : Boolean);
Begin
	SavePlayerStat(ID);
End;

Procedure OnFlagReturn(ID, TeamFlag : Byte);
Begin
	SavePlayerStat(ID);
	SaveTeamsStat;
End;

Procedure OnFlagScore(ID, TeamFlag : Byte);
Begin
	SavePlayerStat(ID);
	SaveTeamsStat;
End;

Procedure OnJoinGame(ID, Team : Byte);
Begin
	SavePlayerStat(ID);
	SaveMapStat;
	SaveTeamsStat;
End;

Procedure OnJoinTeam(ID, Team : Byte);
Begin
	SavePlayerStat(ID);
	SaveMapStat;
	SaveTeamsStat;
End;

Procedure OnLeaveGame(ID, Team : Byte; Kicked : Boolean);
Begin
	SavePlayerStat(ID);
	SaveMapStat;
	SaveTeamsStat;
End;

Procedure OnMapChange(NewMap : string);
Begin
	SaveMapStat;
End;

Procedure OnPlayerKill(Killer, Victim : Byte; Weapon : String);
Begin
	SavePlayerStat(Killer);
	SavePlayerStat(Victim);
	SaveTeamsStat;
End;

Procedure OnPlayerRespawn(ID : Byte);
Begin
	SavePlayerStat(ID);
End;

Procedure OnWeaponChange(ID, PrimaryNum, SecondaryNum : Byte);
Begin
	SavePlayerStat(ID);
End;