function data()
  return {  
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING", 
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
			{
				name = 'jay_',
				role = 'CREATOR',
				text = 'Modell',
				tfnetId = 28954,
			},
					    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },  
		},
		params = {		
			{
				key = "shimmns708Gedreht",
				name = _("Gedreht_aktiv"),
				values = { "No", "Yes", },
				tooltip = _("option_sahimms_900_1_desc"),
				defaultIndex = 1,
			},
			{
				key = "soundCheck",
				name = _("sound_check"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,	
			},
		},
		tags = { "Europe", "Vehicle", "Freight", "Wagon" },
		dependencies = {},
		}, 
		
		runFn = function (settings, modParams)
		local params = modParams[getCurrentModId()]
		
			local hidden = {	
				["axbenet_gedreht.mdl"] = true,
				["db_gedreht.mdl"] = true,
				["db2_gedreht.mdl"] = true,
				["db3_gedreht.mdl"] = true,
				["db4_gedreht.mdl"] = true,
				["dbCargo_gedreht.mdl"] = true,
				["dbRailship_gedreht.mdl"] = true,
				["dbRailshipAlt_gedreht.mdl"] = true,
				["delacher_gedreht.mdl"] = true,
				["dr_gedreht.mdl"] = true,
				["fsAlt_gedreht.mdl"] = true,
				["fsModern_gedreht.mdl"] = true,
				["fsNeu_gedreht.mdl"] = true,
				["nacco_gedreht.mdl"] = true,
				["ns_gedreht.mdl"] = true,
				["obb_gedreht.mdl"] = true,
				["railCargoAustria_gedreht.mdl"] = true,
				["railCargoAustriaEx_gedreht.mdl"] = true,
				["sbb_gedreht.mdl"] = true,
				["sbbAlt_gedreht.mdl"] = true,
				["sj_gedreht.mdl"] = true,
				["twa_gedreht.mdl"] = true,
				["twaAlt_gedreht.mdl"] = true,
				["gers_gedreht.mdl"] = true,
				["tiphook_gedreht.mdl"] = true,
				["tiphook2_gedreht.mdl"] = true,
				["vtg_gedreht.mdl"] = true,
				["vtg02_gedreht.mdl"] = true,
			}
		
		local modelFilter = function(fileName, data)				
				local modelName = fileName:match('/shimmns708_([^/]*.mdl)')
				or fileName:match('/shfimmns_([^/]*.mdl)')							
				return (modelName==nil or hidden[modelName]~=true)				
			end  
		
		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]					
			if params["shimmns708Gedreht"] == 0 then
				addFileFilter("model/vehicle", modelFilter)		
			end
		else
			addFileFilter("model/vehicle", modelFilter)	
		end	
		

		local function metadataHandler(fileName, data)
			if params.soundCheck == 0 then
				if fileName:match('/vehicle/waggon/shimmns708/shimmns708_([^/]*.mdl)') 
				or fileName:match('/vehicle/waggon/sfhimmns/shfimmns_([^/]*.mdl)') 
				or fileName:match('/vehicle/waggon/sfhimmns/gedreht/shfimmns_([^/]*.mdl)') 
				or fileName:match('/vehicle/waggon/shimmns708/gedreht/shimmns708_([^/]*.mdl)') 
				then
					data.metadata.railVehicle.soundSet.name = "waggon_freight_old"
				end
			end
			return data
		end

		addModifier( "loadModel", metadataHandler )
	end,
}
end
