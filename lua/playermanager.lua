

Hooks:PostHook(PlayerManager,"check_skills","ach_init_pm",function(self)
	self._message_system:unregister(Message.OnWeaponFired,"advancedcrosshair_OnWeaponFired")
	self._message_system:unregister(Message.OnEnemyShot,"advancedcrosshair_OnEnemyShot")
	
	self._message_system:register(Message.OnWeaponFired,"advancedcrosshair_OnWeaponFired",
		function(weapon_unit,result)
			local weapon_base = weapon_unit:base()
			if weapon_base and weapon_base._setup and weapon_base._setup.user_unit and weapon_base._setup.user_unit == managers.player:local_player() then 
				AdvancedCrosshair:AddBloom()
			end
		end
	)
	self._message_system:register(Message.OnEnemyShot,"ach_OnEnemyShot",function(unit,attack_data,...) 
		if attack_data and attack_data.attacker_unit and (attack_data.attacker_unit == self:local_player()) then 
			AdvancedCrosshair:OnEnemyHit(unit,attack_data,...)
		end
	end)
end)
