return {
    active = true,
	on = {
		devices = { 
		    'ComputerSwitch',
		    'ComputerWatt'
		}
	},
		data = { 
		    wattcnt1 = { initial = 0 }
	},
	execute = function(domoticz, ComputerSwitch)
		--domoticz.log('.. Computer Switch .. was changed')
		SwitchState = domoticz.devices(18).state
		WattUsage = domoticz.devices(23).state

	    if domoticz.data.wattcnt1 < 7 and SwitchState == 'On' and WattUsage <= '1.5' and WattUsage > '0.0' then
	            domoticz.data.wattcnt1 = domoticz.data.wattcnt1 + 1
	       elseif SwitchState == 'On' and domoticz.data.wattcnt1 >= 15 then  
	          domoticz.log('Switch State: ' ..SwitchState)
		        domoticz.log('WattUsage: ' ..tostring(WattUsage))
		        domoticz.log('Counter, usage below Threshold: ' ..tostring(domoticz.data.wattcnt1))
                domoticz.devices('ComputerSwitch').switchOff()
                domoticz.data.wattcnt1 = 0
	            domoticz.log('.. Computer Switch .. was changed to OFF')
	            
	    end
    end
   -- Poweroff A NEO Coolcam Switch if the consumption is less then 1.5 watts.
   -- Attached is a Sabrent charger(multiport).

}
