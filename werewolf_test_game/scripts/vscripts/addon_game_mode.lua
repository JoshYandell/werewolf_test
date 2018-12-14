-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Create the game mode when we activate. Set max players for teams that aren't neutrals, which is team 4. This will likely need to be adjusted to get best results.
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
	GameRules:SetCustomGameTeamMaxPlayers(1, 1)
	GameRules:SetCustomGameTeamMaxPlayers(2, 1)
	GameRules:SetCustomGameTeamMaxPlayers(6, 1)
	GameRules:SetCustomGameTeamMaxPlayers(7, 1)
	GameRules:SetCustomGameTeamMaxPlayers(8, 1)
	GameRules:SetCustomGameTeamMaxPlayers(9, 1)
	GameRules:SetCustomGameTeamMaxPlayers(10, 1)
	GameRules:SetCustomGameTeamMaxPlayers(11, 1)
	GameRules:SetCustomGameTeamMaxPlayers(12, 1)
	GameRules:SetCustomGameTeamMaxPlayers(13, 1)
end

function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end