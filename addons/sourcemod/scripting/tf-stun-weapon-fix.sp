#include <sourcemod>
#include <tf2>

#pragma semicolon 1
#pragma newdecls required

#define EF_NODRAW	0x020

public Plugin myinfo = 
{
	name = "TF2 Stun Weapon Fix", 
	author = "Mikusch", 
	description = "Fixes full stuns not unhiding the active weapon after the stun ends", 
	version = "1.0.0", 
	url = "https://github.com/Mikusch/tf-stun-weapon-fix"
};

public void TF2_OnConditionRemoved(int client, TFCond condition)
{
	if (condition == TFCond_Dazed)
	{
		int weapon = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
		SetEntProp(weapon, Prop_Send, "m_fEffects", GetEntProp(weapon, Prop_Send, "m_fEffects") & ~EF_NODRAW);
	}
}
