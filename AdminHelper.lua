if not getMoonloaderVersion then
	return print("This script requires MoonLoader to be installed")
end

script_name("AdminHelper")
script_author("Anthony_Ward")
script_version("0.8.1")
script_properties("work-in-run")
require("lib.moonloader")

local var_0_0 = require("lib.samp.events")
local var_0_1 = require("vkeys")
local var_0_2 = require("inicfg")
local var_0_3 = require("imgui")
local var_0_4 = require("matrix3x3")
local var_0_5 = require("vector3d")
local var_0_6 = require("memory")
local var_0_7 = require("imgui_addons")
local var_0_8 = require("encoding")
local var_0_9 = require("cjson")
local var_0_10 = require("effil")
local var_0_11 = require("ffi")
local var_0_12 -- Конфиг перемещения (AirBrake)
local var_0_13 -- FastReport
local var_0_14 = 0.5 -- Чит (AirBrake)
local var_0_15 = 1 -- Чит (FastWalk)
local var_0_20 = os.clock() -- Функционал (не так быстро)
local var_0_22 = false -- Чит (EYE)
local var_0_23 = false  -- Конфиг (EYE)
local var_0_24 = false -- Чит (Rideonwater)
local var_0_25 = 1 -- SpectetMenu (как понял кнопки и сама меню)
local var_0_26 = "Mute" -- Пеналти, выдача быстрых наказаний + настройка их
local var_0_27 = false -- Всё что связанно с инвизом
local var_0_28 = false -- Всё что связанно с реконом
local var_0_29 = {
	cmd = {
		"unjail",
		"unmute",
		"runmute",
		"spcar",
		"help",
		"offunmute",
		"offunjail",
		"offunwarn",
		"unban",
		"skick",
		"spawn",
		"slap",
		"uncuff",
		"kick",
		"warn",
		"unwarn",
		"arm",
		"setfuel",
		"offwarn",
		"setskin",
		"ban",
		"offban",
		"sban",
		"mute",
		"offmute",
		"jail",
		"offjail",
		"rmute"
	},
	help = {
		"/unjail [id]",
		"/unmute [id]",
		"/runmute [id]",
		"/spcar [id]",
		"/help [id]",
		"/offunmute [id]",
		"/offunjail [id]",
		"/offunwarm [id]",
		"/unban [НикНейм]",
		"/skick [id]",
		"/spawn [id]",
		"/slap [id]",
		"/uncuff [id]",
		"/kick [id] [причина]",
		"/warn [id] [причина]",
		"/unwarn [id] [причина]",
		"/arm [id] [кол-во]",
		"/setfuel [id] [кол-во]",
		"/offwarn [НикНейм] [причина]",
		"/setskin [id] [id скина]",
		"/ban [id] [кол-во] [причина]",
		"/offban [НикНейм] [кол-во] [причина]",
		"/sban [id] [кол-во] [причина]",
		"/mute [id] [кол-во] [причина]",
		"/offmute [НикНейм] [кол-во] [причина]",
		"/jail [id] [кол-во] [причина]",
		"/offjail [НикНейм] [кол-во] [причина]",
		"/rmute [id] [кол-во] [причина]"
	}
} -- Всё что связанно с формами от администрации в AdminChat
local var_0_30 = {
	"suka",
	"Suka",
	"SUKA",
	"blyat",
	"Blyat",
	"BLYAT",
	"govno",
	"Govno",
	"GOVNO",
	"zalupa",
	"Zalupa",
	"ZALUPA",
	"penis",
	"Penis",
	"PENIS",
	"chlen",
	"Chlen",
	"CHLEN",
	"pidor",
	"Pidor",
	"PIDOR",
	"pidr",
	"Pidr",
	"PIDR",
	"gondon",
	"Gondon",
	"GONDON",
	"ebal",
	"Ebal",
	"EBAL",
	"shlyha",
	"Shlyha",
	"SHLYHA",
	"admin",
	"Admin",
	"ADMIN",
	"aDMIN",
	"matb",
	"Matb",
	"MATb",
	"loh",
	"Loh",
	"LOH",
	"lox",
	"Lox",
	"LOX",
	"idiot",
	"Idiot",
	"IDIOT",
	"chmo",
	"Chmo",
	"CHMO",
	"hui",
	"Hui",
	"HUI",
	"xyes",
	"Xyes",
	"XYES",
	"xui",
	"Xui",
	"XUI",
	"xue",
	"Xue",
	"XUE",
	"hue",
	"Hue",
	"HUE",
	"dayn",
	"Dayn",
	"DAYN",
	"daun",
	"Daun",
	"DAUN",
	"blyad",
	"Blyad",
	"BLYAD",
	"yebok",
	"Yebok",
	"YEBOK",
	"sos",
	"Sos",
	"SOS",
	"mraz",
	"Mraz",
	"MRAZ",
	"pizd",
	"Pizd",
	"PIZD",
	"jopa",
	"Jopa",
	"JOPA",
	"zhopa",
	"Zhopa",
	"ZHOPA",
	"mama",
	"Mama",
	"MAMA",
	"otec",
	"Otec",
	"OTEC",
	"baty",
	"Baty",
	"BATY",
	"mamk",
	"Mamk",
	"MAMK",
	"dermo",
	"Dermo",
	"DERMO",
	"online",
	"Online",
	"ONLINE",
	"cheat",
	"Cheat",
	"CHEAT",
	"santrope",
	"Santrope",
	"SANTROPE",
	"gnida",
	"Gnida",
	"GNIDA",
	"uebo",
	"Uebo",
	"UEBO",
	"nah",
	"Nah",
	"NAH",
	"nax",
	"Nax",
	"NAX",
	"hax",
	"Hax",
	"HAX",
	"pedo",
	"Pedo",
	"PEDO",
	"droch",
	"Droch",
	"DROCH",
	"dodik",
	"Dodik",
	"DODIK",
	"fuck",
	"Fuck",
	"FUCK",
	"sex",
	"Sex",
	"SEX"
} -- Проверка на корректность (Nick_Name)
local var_0_31 = {
	before = {
		"Kyivstar",
		"Tele2",
		"Mobile TeleSystems",
		"MTS PJSC",
		"\"MTS\"",
		"CORBINA",
		"SkyNet",
		"State Enterprise Scientific and Telecommunication Centre \"Ukrainian",
		"Telefonica",
		"Beltelecom",
		"Vimpelcom",
		"Vimpel",
		"SkyMobile",
		"NUR Telecom",
		"Nurtelecom",
		"Rostelecom",
		"Sibirtelecom",
		"Ufanet",
		"Elsat Ltd",
		"Juzhnye telefonnye",
		"Vysokie Tehnologii",
		"Erline",
		"Vodafone",
		"Wana Corporate",
		"Beeline",
		"Megafon",
		"MegaFon",
		"Povolzhe network",
		"TRANSTELECOM",
		"TransTeleCom",
		"TTK-Retail",
		"Orion Telecom",
		"Intertelecom",
		"Hilal Al",
		"EarthLink",
		"Teleconnect",
		"Saudi Telecom",
		"YOTA",
		"Kazakhtelecom",
		"JSC \"ER",
		"MGTS",
		"TRK Cable TV",
		"Uzbektelecom",
		"Uzbektelekom",
		"CityLink",
		"Omskie kabelnye seti",
		"ALTEL",
		"BTcom",
		"MOLDTELECOM",
		"Teneta Telekom",
		"2Day Telecom",
		"Tel LLC",
		"Bashinformsvyaz",
		"Uralsvyazinform",
		"uralsvyazinform",
		"Zelenaya Tochka",
		"Sotrudnik",
		"VolgaTelecom",
		"Volia ",
		"X-city Customers and Private",
		"NPK Home",
		"Joint stock company \"For\"",
		"Alfa Telecom",
		"Ltd. \"SPA\"Impulse",
		"Courier Plus",
		"Moldtelecom",
		"NETKOM",
		"KUBANGSM",
		"Ucom",
		"Unitary enterprise A1",
		"Net By Net",
		"MegaMax",
		"Buknet",
		"Grand Ltd",
		"Balkar Telecommunications Company",
		"Everest more spec",
		"Sun Communications",
		"Merezha",
		"Enterprise TRK",
		"ATV-PLUS",
		"Pervomaysk",
		"KCell",
		"TNS Plus",
		"lifecell",
		"Lifecell",
		"ISP Granat",
		"Mobile Telecom",
		"TELESYSTEM",
		"JSC TT Mobile",
		"Cjsc Indigo Tajikistan",
		"ITL LLC",
		"M247",
		"Transtelecom",
		"Linkservice",
		"DATAGROUP",
		"Branch in Mordovian Republic Open Joint",
		"CentreTTK",
		"Pinskiy internet Provider Limited",
		"Kyrgyztelecom",
		"McLaut",
		"Flex Ltd",
		"New Information Systems PP",
		"Russian company LLC",
		"Russian Company LLC",
		"BRAS Huawei ME60",
		"TATTELECOM",
		"CJSC Mobicom",
		"Lovitel LLC",
		"Lancom Ltd",
		"DigitalOcean",
		"Aljeel Aljadeed For Technology",
		"UPC.pl",
		"P4 Sp. z o.o."
	},
	after = {
		"Киевстар",
		"Теле2",
		"МТС",
		"МТС",
		"МТС",
		"Корбина Телеком",
		"SkyNet",
		"UARNET",
		"Telefonica",
		"Белтелеком",
		"Вымпелком",
		"Вымпелком",
		"SkyMobile",
		"Нуртелеком",
		"Нуртелеком",
		"Ростелеком",
		"Ростелеком",
		"Уфанет",
		"Elsat",
		"Южные Телесети",
		"Высокие Технологии",
		"Erline",
		"Vodafone",
		"Wana Corporate",
		"Билайн",
		"Мегафон",
		"Мегафон",
		"Мегафон",
		"Транстелеком",
		"Транстелеком",
		"Транстелеком",
		"Орион Телеком",
		"Интертелеком",
		"Hilal Al-Rafidain",
		"EarthLink",
		"Телеконнект",
		"Saudi Telecom",
		"YOTA",
		"Казактелеком",
		"ЭР-Телеком",
		"МГТС",
		"TRK Cable TV",
		"Узбектелеком",
		"Узбектелеком",
		"CityLink",
		"Омские кабельные сети",
		"ALTEL",
		"BTcom",
		"Moldtelecom",
		"Тенета Телеком",
		"2Day Telecom",
		"Kar-Tel",
		"Башинформсвязь",
		"Уралсвязьинформ",
		"Уралсвязьинформ",
		"Зеленая точка",
		"Сотрудник",
		"Волгателеком",
		"Воля",
		"X-City",
		"HomeNet",
		"К-Телеком",
		"Альфа Телеком",
		"SPA Impulse",
		"Курьер Плюс",
		"Moldtelecom",
		"Netcom",
		"KubanGSM",
		"Ucom",
		"A1",
		"NetByNet",
		"Мегамакс",
		"Buknet",
		"Grand",
		"Ростелеком",
		"Everestcom",
		"Sun Communications",
		"Мережа",
		"ТРК",
		"ТРК",
		"СКС Первомайск",
		"KCell",
		"Билайн",
		"LifeCell",
		"LifeCell",
		"Гранат",
		"Теле2",
		"ТелеСистем",
		"Мегафон",
		"TCell",
		"ITL",
		"M247",
		"Транстелеком",
		"LinkService",
		"Datagroup",
		"Сибирьтелеком",
		"Транстелеком",
		"ASPINSKINT",
		"Кыргызтелеком",
		"McLaut-Invest",
		"Флекс",
		"EuroNet",
		"Russian Company",
		"Russian Company",
		"BRAS Huawei ME60",
		"Таттелеком",
		"Мегафон",
		"Ловит",
		"ЛанКом",
		"DigitalOcean",
		"Alriyada",
		"UPC Polska",
		"Play"
	}
} -- Конфиг PPV
local var_0_32 = false -- Конфиг биндера
local var_0_35 = {
	time = {},
	nick = {},
	reason = {}
} -- Конфиг нового ScoreBoard
local var_0_36 = {
	nick1 = {},
	nick2 = {}
} -- Не понятно, подключений нету в коде (даже в исходнике)

var_0_11.cdef("struct stKillEntry\n{\n\tchar\t\t\t\t\tszKiller[25];\n\tchar\t\t\t\t\tszVictim[25];\n\tuint32_t\t\t\t\tclKillerColor; // D3DCOLOR\n\tuint32_t\t\t\t\tclVictimColor; // D3DCOLOR\n\tuint8_t\t\t\t\t\tbyteType;\n} __attribute__ ((packed));\n\nstruct stKillInfo\n{\n\tint\t\t\t\t\t\tiEnabled;\n\tstruct stKillEntry\t\tkillEntry[5];\n\tint \t\t\t\t\tiLongestNickLength;\n  \tint \t\t\t\t\tiOffsetX;\n  \tint \t\t\t\t\tiOffsetY;\n\tvoid\t\t\t    \t*pD3DFont; // ID3DXFont\n\tvoid\t\t    \t\t*pWeaponFont1; // ID3DXFont\n\tvoid\t\t   \t    \t*pWeaponFont2; // ID3DXFont\n\tvoid\t\t\t\t\t*pSprite;\n\tvoid\t\t\t\t\t*pD3DDevice;\n\tint \t\t\t\t\tiAuxFontInited;\n    void \t\t    \t\t*pAuxFont1; // ID3DXFont\n    void \t\t\t    \t*pAuxFont2; // ID3DXFont\n} __attribute__ ((packed));\n")

local var_0_37 = {
	170,
	171,
	172,
	173,
	174,
	175,
	176,
	177,
	178,
	179,
	180,
	181,
	182,
	183,
	184,
	185,
	186,
	187,
	188,
	189,
	190,
	191
} -- ЧИт (АвтоФлип)
local var_0_38 = {
	"Игрок на паузе: %d+:%d+",
	"Игрок на паузе: %d++ мин."
} -- Непонятно зачем (игрок на паузе и.т.д)
local var_0_39 = {
	name = {},
	id = {},
	newname = {},
	timer = {}
} -- Конфиг смена ников
local var_0_40 = {
	playername = {},
	playerid = {},
	suspectname = {},
	suspectid = {},
	reason = {},
	complete = {},
	timer = {}
} -- Конфиг (FastReport)
local var_0_41 = {
	nick = {},
	id = {},
	report = {},
	timer = {},
	complete = {},
	answer = {}
} -- Непонятно зачем (почти дубль FastReport)

var_0_8.default = "cp1251"
u8 = var_0_8.UTF8
reduceZoom = true

local var_0_45 = var_0_11.cast("int (__thiscall*)(void*, float*, int, bool)", 6177408)
local var_0_46 = require("fAwesome5")
local var_0_47
local var_0_48 = var_0_3.ImGlyphRanges({
	var_0_46.min_range,
	var_0_46.max_range
})

function var_0_3.BeforeDrawFrame()
	if var_0_47 == nil then
		local var_2_0 = var_0_3.ImFontConfig()

		var_2_0.MergeMode = true
		var_0_47 = var_0_3.GetIO().Fonts:AddFontFromFileTTF("moonloader/resource/fonts/fa-solid-900.ttf", 14, var_2_0, var_0_48)
	end
end

function im_colored_text_with_shadow(arg_3_0, arg_3_1)
	local var_3_0 = var_0_3.GetCursorPos()

	var_0_3.SetCursorPos(var_0_3.ImVec2(var_3_0.x + 1, var_3_0.y + 1))
	var_0_3.TextColored(var_0_3.ImVec4(0, 0, 0, 1), arg_3_1)
	var_0_3.SetCursorPos(var_3_0)
	var_0_3.TextColored(arg_3_0, arg_3_1)
end

function var_0_3.TextColoredRGB(arg_4_0, arg_4_1)
	local var_4_0 = var_0_3.GetWindowWidth()
	local var_4_1 = var_0_3.GetStyle().Colors
	local var_4_2 = var_0_3.ImVec4

	local function var_4_3(arg_5_0)
		local var_5_0 = bit.band(bit.rshift(arg_5_0, 24), 255)
		local var_5_1 = bit.band(bit.rshift(arg_5_0, 16), 255)
		local var_5_2 = bit.band(bit.rshift(arg_5_0, 8), 255)
		local var_5_3 = bit.band(arg_5_0, 255)

		return var_5_0, var_5_1, var_5_2, var_5_3
	end

	local function var_4_4(arg_6_0)
		if arg_6_0:sub(1, 6):upper() == "SSSSSS" then
			local var_6_0 = var_4_1[1].x
			local var_6_1 = var_4_1[1].y
			local var_6_2 = var_4_1[1].z
			local var_6_3 = tonumber(arg_6_0:sub(7, 8), 16) or var_4_1[1].w * 255

			return var_4_2(var_6_0, var_6_1, var_6_2, var_6_3 / 255)
		end

		local var_6_4 = type(arg_6_0) == "string" and tonumber(arg_6_0, 16) or arg_6_0

		if type(var_6_4) ~= "number" then
			return
		end

		local var_6_5, var_6_6, var_6_7, var_6_8 = var_4_3(var_6_4)

		return var_0_3.ImColor(var_6_5, var_6_6, var_6_7, var_6_8):GetVec4()
	end

	;(function(arg_7_0)
		for iter_7_0 in arg_7_0:gmatch("[^\r\n]+") do
			local var_7_0 = {}
			local var_7_1 = {}
			local var_7_2 = 1

			iter_7_0 = iter_7_0:gsub("{(......)}", "{%1FF}")

			while iter_7_0:find("{........}") do
				local var_7_3, var_7_4 = iter_7_0:find("{........}")
				local var_7_5 = var_4_4(iter_7_0:sub(var_7_3 + 1, var_7_4 - 1))

				if var_7_5 then
					var_7_0[#var_7_0], var_7_0[#var_7_0 + 1] = iter_7_0:sub(var_7_2, var_7_3 - 1), iter_7_0:sub(var_7_4 + 1, #iter_7_0)
					var_7_1[#var_7_1 + 1] = var_7_5
					var_7_2 = var_7_3
				end

				iter_7_0 = iter_7_0:sub(1, var_7_3 - 1) .. iter_7_0:sub(var_7_4 + 1, #iter_7_0)
			end

			local var_7_6 = var_0_3.CalcTextSize(iter_7_0)

			if arg_4_1 == 2 then
				var_0_3.NewLine()
				var_0_3.SameLine(var_4_0 / 2 - var_7_6.x / 2)
			elseif arg_4_1 == 3 then
				var_0_3.NewLine()
				var_0_3.SameLine(var_4_0 - var_7_6.x - 5)
			end

			if var_7_0[0] then
				for iter_7_1 = 0, #var_7_0 do
					var_0_3.TextColored(var_7_1[iter_7_1] or var_4_1[1], var_7_0[iter_7_1])
					var_0_3.SameLine(nil, 0)
				end

				var_0_3.NewLine()
			else
				var_0_3.Text(iter_7_0)
			end
		end
	end)(arg_4_0)
end

function var_0_3.CustomButton(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	local var_8_0 = var_0_3.Col

	var_0_3.PushStyleColor(var_8_0.Button, arg_8_1)
	var_0_3.PushStyleColor(var_8_0.ButtonHovered, arg_8_2)
	var_0_3.PushStyleColor(var_8_0.ButtonActive, arg_8_3)

	arg_8_4 = arg_8_4 or var_0_3.ImVec2(0, 0)

	local var_8_1 = var_0_3.Button(arg_8_0, arg_8_4)

	var_0_3.PopStyleColor(3)

	return var_8_1
end

local var_0_49 = require("semver") -- Непонятно для чего данная библиотека

var_0_3.HotKey = require("imgui_addons").HotKey

local var_0_50 = "AdminHelper" -- Быстрое название
local var_0_51 = 0 -- Непонятно для чего это нужно
local var_0_52 = {} -- Связано с подгрузкой пользователей
local var_0_53 = {} -- Связано с подгрузкой пользователей тоже
local var_0_54 = {
	settings = {
		renderHotKeyType = 0,
		headerText = "Admins Online",
		headerFontColor = 4294967295,
		headerPosY = 450,
		listFontFlags = 5,
		renderLevel = false,
		headerFontFlags = 5,
		renderTime = 3000,
		headerFontSize = 9,
		headerPosX = 450,
		isRenderEnabledByDefault = false,
		notificationsAboutJoinsAndQuits = true,
		headerFontName = "Arial",
		hideOnScreenshot = false,
		listFontSize = 9,
		renderID = true,
		listFontName = "Arial",
		renderHotKey = {
			v = {
				113
			}
		}
	},
	lists = {
		{
			port = 7777,
			isbuiltin = true,
			color = 4294967295,
			ip = "127.0.0.1",
			title = u8("Список"),
			users = {
				"Radrigo_Lancheze",
				"Anthony_Ward"
			}
		}
	}
} -- Подгрузка и настройка тулса
local var_0_55 = {}
local var_0_56 = {
	u8("Напоминание [/ask | /rep]"),
	u8("Респавн транспорта"),
	u8("Мясорубка"),
	u8("Прятки"),
	u8("Русская рулетка"),
	u8("Поливалка"),
	u8("Догони и передай"),
	u8("Поиск спонсора")
}
local var_0_57 = {
	u8("Внедорожники"),
	u8("Седаны"),
	u8("Универсалы"),
	u8("Спорткары"),
	u8("Кабриолеты"),
	u8("Лоурайдер"),
	u8("Мотоциклы"),
	u8("Велосипеды"),
	u8("Промышленные"),
	u8("Государственные"),
	u8("Уникальные"),
	u8("Самолеты"),
	u8("Вертолеты"),
	u8("Лодки"),
	u8("Радиоуправляемые"),
	u8("Прицепы")
}
local var_0_58 = {
	offroad = {
		"Landstalker",
		"BF Injection",
		"Monster",
		"Patriot",
		"Rancher",
		"Sandking",
		"Mesa",
		"Rancher Lure",
		"Monster A",
		"Monster B",
		"Bandito",
		"Dune",
		"Huntley"
	},
	sedan = {
		"Bravura",
		"Sentinel",
		"Manana",
		"Esperanto",
		"Washington",
		"Premier",
		"Previon",
		"Admiral",
		"Glendale",
		"Oceanic",
		"Hermes",
		"Virgo",
		"Greenwood",
		"Elegant",
		"Nebula",
		"Majestic",
		"Buccaneer",
		"Fortune",
		"Cadrona",
		"Willard",
		"Vincent",
		"Clover",
		"Intruder",
		"Primo",
		"Tampa",
		"Sunrise",
		"Merit",
		"Sultan",
		"Elegy",
		"Stafford",
		"Emperor",
		"Glendale Shit"
	},
	universal = {
		"Perennial",
		"Moonbeam",
		"Solair",
		"Regina",
		"Stratum"
	},
	sportcar = {
		"Buffalo",
		"Infernus",
		"Cheetah",
		"Banshee",
		"Turismo",
		"Sabre",
		"ZR-350",
		"Hotring Racer",
		"Hotring Racer A",
		"Hotring Racer B",
		"Blista Compact",
		"Super GT",
		"Bullet",
		"Uranus",
		"Jester",
		"Flash",
		"Euros",
		"Club",
		"Alpha",
		"Phoenix"
	},
	cabriolet = {
		"Stallion",
		"Comet",
		"Feltzer",
		"Windsor"
	},
	lowrider = {
		"Voodoo",
		"Remington",
		"Slamvan",
		"Blade",
		"Tahoma",
		"Savanna",
		"Tornado"
	},
	motobike = {
		"Pizzaboy",
		"PCJ-600",
		"Faggio",
		"Freeway",
		"Sanchez",
		"Quad",
		"FCR-900",
		"NRG-500",
		"BF-400",
		"Wayfarer"
	},
	bike = {
		"BMX",
		"Bike",
		"Mountain Bike"
	},
	industrial = {
		"Linerunner",
		"Trashmaster",
		"Pony",
		"Mule",
		"Bobcat",
		"Rumpo",
		"Packer",
		"Flatbed",
		"Yankee",
		"Topfun Van",
		"Walton",
		"Burrito",
		"Boxville",
		"Benson",
		"Tanker",
		"Roadtrain",
		"Cement Truck",
		"Tractor",
		"Sadler",
		"Utility Van",
		"Yosemite",
		"DFT-30",
		"Newsvan",
		"Picador",
		"Sadler Shit",
		"Boxville"
	},
	government = {
		"Firetruck",
		"Ambulance",
		"Taxi",
		"Enforcer",
		"Bus",
		"Rhino",
		"Barracks",
		"Coach",
		"Cabbie",
		"FBI Rancher",
		"HPV1000",
		"FBI Truck",
		"Firetruck LA",
		"Police Car (LSPD)",
		"Police Car (SFPD)",
		"Police Car (LVPD)",
		"Police Ranger",
		"S.W.A.T."
	},
	unic = {
		"Bloodring Banger",
		"Dumper",
		"Stretch",
		"Mr. Whoopee",
		"Securicar",
		"Hotknife",
		"Romero",
		"Tram",
		"Caddy",
		"Camper",
		"Baggage",
		"Dozer",
		"Journey",
		"Towtruck",
		"Forklift",
		"Combine Harvester",
		"Freight (Train)",
		"Brownstreak (Train)",
		"Vortex",
		"Hustler",
		"Kart",
		"Mower",
		"Sweeper",
		"Tug",
		"Hotdog"
	},
	air = {
		"Skimmer",
		"Rustler",
		"Beagle",
		"Cropduster",
		"Stuntplane",
		"Shamal",
		"Hydra",
		"Nevada",
		"AT400",
		"Andromada",
		"Dodo"
	},
	helicopter = {
		"Leviathan",
		"Hunter",
		"Seasparrow",
		"Sparrow",
		"Maverick",
		"SAN News Maverick",
		"Police Maverick",
		"Cargobob",
		"Raindance"
	},
	boat = {
		"Predator",
		"Squallo",
		"Speeder",
		"Reefer",
		"Tropic",
		"Coastguard",
		"Dinghy",
		"Marquis",
		"Jetmax",
		"Launch"
	},
	rc = {
		"RC Bandit",
		"RC Baron",
		"RC Raider",
		"RC Goblin",
		"RC Tiger",
		"RC Cam"
	},
	truck = {
		"Article Trailer",
		"Article Trailer 2",
		"Freight Flat Trailer (Train)",
		"Streak Trailer (Train)",
		"Petrol Trailer",
		"Freight Box Trailer (Train)",
		"Article Trailer 3",
		"Baggage Trailer A",
		"Baggage Trailer B",
		"Tug Stairs Trailer",
		"Farm Trailer",
		"Utility Trailer"
	}
}
local var_0_59 = {
	u8("Черный"),
	u8("Белый"),
	u8("Синий"),
	u8("Темно-синий"),
	u8("Голубой"),
	u8("Бирюзовый"),
	u8("Серый"),
	u8("Красный"),
	u8("Бордовый"),
	u8("Зеленый"),
	u8("Хаки"),
	u8("Кислотно-зеленый"),
	u8("Темно-зеленый"),
	u8("Жёлтый"),
	u8("Оранжевый"),
	u8("Розовый"),
	u8("Коричневый"),
	u8("Фиолетовый")
}
local var_0_60 = {
	u8("Черный"),
	u8("Белый"),
	u8("Синий"),
	u8("Темно-синий"),
	u8("Голубой"),
	u8("Бирюзовый"),
	u8("Серый"),
	u8("Красный"),
	u8("Бордовый"),
	u8("Зеленый"),
	u8("Хаки"),
	u8("Кислотно-зеленый"),
	u8("Темно-зеленый"),
	u8("Жёлтый"),
	u8("Оранжевый"),
	u8("Розовый"),
	u8("Коричневый"),
	u8("Фиолетовый")
}
local var_0_61 = var_0_3.ImInt(0)
local var_0_62 = {
	offroad = var_0_3.ImInt(0),
	sedan = var_0_3.ImInt(0),
	universal = var_0_3.ImInt(0),
	sportcar = var_0_3.ImInt(0),
	cabriolet = var_0_3.ImInt(0),
	lowrider = var_0_3.ImInt(0),
	motobike = var_0_3.ImInt(0),
	bike = var_0_3.ImInt(0),
	industrial = var_0_3.ImInt(0),
	government = var_0_3.ImInt(0),
	unic = var_0_3.ImInt(0),
	air = var_0_3.ImInt(0),
	helicopter = var_0_3.ImInt(0),
	boat = var_0_3.ImInt(0),
	rc = var_0_3.ImInt(0),
	truck = var_0_3.ImInt(0)
}
local var_0_63 = var_0_3.ImInt(0)
local var_0_64 = var_0_3.ImInt(0)
local var_0_65 = var_0_3.ImInt(0)
local var_0_66 = {
	u8("Кастет"),
	u8("Клюшка для гольфа"),
	u8("Полицейская дубинка"),
	u8("Бейсбольная бита"),
	u8("Лопата"),
	u8("Кий"),
	u8("Катана"),
	u8("Двухсторонний дилдо"),
	u8("Дилдо"),
	u8("Вибратор"),
	u8("Серебрянный вибратор"),
	u8("Букет цветов"),
	u8("Трость"),
	u8("Пистолет 9мм"),
	u8("Пистолет 9мм с глушителем"),
	u8("Пистолет Дезерт Игл"),
	u8("Обычный дробовик"),
	u8("Обрез"),
	u8("Скорострельный дробовик"),
	u8("Узи"),
	u8("MP5"),
	u8("Автомат Калашникова"),
	u8("Винтовка M4"),
	u8("Tec-9"),
	u8("Охотничье ружье"),
	u8("Снайперская винтовка"),
	u8("Баллончик с краской"),
	u8("Огнетушитель"),
	u8("Фотоаппарат"),
	u8("Парашют")
}
local var_0_67 = {
	u8(" Наблюдаю за указанным вами игроком."),
	u8(" Слежу за указанным вами игроком."),
	u8(" Наблюдаю."),
	u8(" Слежу."),
	u8(" Проверим."),
	u8(" Приветствую, начинаю работу по вашей жалобе."),
}
local var_0_68 = {
	one = {
		"Вы отправили жалобу на",
		"Вы пожаловались на",
		"Вы жалуетесь на",
		"Вы оформили жалобу на",
		"Вы пожаловались на",
		"У вас жалоба на"
	},
	two = {
		"наблюдаю за ним.",
		"наблюдаю.",
		"наблюдаю за игроком.",
		"слежу за ним.",
		"слежу.",
		"слежу за игроком.",
		"проверим."
	}
}
local var_0_69 = var_0_3.ImInt(0)
local var_0_70 = {
	"Anthony_Ward",
	"A.Ward"
}
local var_0_71 = {
	buffer = var_0_3.ImBuffer(256),
	buffer_2 = var_0_3.ImBuffer(256),
	buffer_3 = var_0_3.ImBuffer(256),
	buffer2 = var_0_3.ImBuffer(256),
	buffer2_2 = var_0_3.ImBuffer(256),
	buffer2_3 = var_0_3.ImBuffer(256),
	buffer3 = var_0_3.ImBuffer(256),
	buffer3_2 = var_0_3.ImBuffer(256),
	buffer3_3 = var_0_3.ImBuffer(256),
	buffer4 = var_0_3.ImBuffer(256),
	buffer4_2 = var_0_3.ImBuffer(256),
	buffer4_3 = var_0_3.ImBuffer(256),
	buffer5 = var_0_3.ImBuffer(256),
	buffer5_2 = var_0_3.ImBuffer(256),
	buffer5_3 = var_0_3.ImBuffer(256),
	buffer6 = var_0_3.ImBuffer(256),
	buffer6_2 = var_0_3.ImBuffer(256),
	buffer6_3 = var_0_3.ImBuffer(256),
	buffer7 = var_0_3.ImBuffer(256),
	buffer7_2 = var_0_3.ImBuffer(256),
	buffer7_3 = var_0_3.ImBuffer(256),
	buffer8 = var_0_3.ImBuffer(256),
	buffer8_2 = var_0_3.ImBuffer(256),
	buffer8_3 = var_0_3.ImBuffer(256),
	buffer9 = var_0_3.ImBuffer(256),
	buffer9_2 = var_0_3.ImBuffer(256),
	buffer9_3 = var_0_3.ImBuffer(256),
	buffer10 = var_0_3.ImBuffer(256),
	buffer10_2 = var_0_3.ImBuffer(256),
	buffer10_3 = var_0_3.ImBuffer(256),
	buffer11 = var_0_3.ImBuffer(256),
	buffer11_2 = var_0_3.ImBuffer(256),
	buffer11_3 = var_0_3.ImBuffer(256),
	buffer12 = var_0_3.ImBuffer(256),
	buffer12_2 = var_0_3.ImBuffer(256),
	buffer12_3 = var_0_3.ImBuffer(256),
	buffer13 = var_0_3.ImBuffer(256),
	buffer13_2 = var_0_3.ImBuffer(256),
	buffer13_3 = var_0_3.ImBuffer(256),
	buffer14 = var_0_3.ImBuffer(256),
	buffer14_2 = var_0_3.ImBuffer(256),
	buffer14_3 = var_0_3.ImBuffer(256),
	buffer15 = var_0_3.ImBuffer(256),
	buffer15_2 = var_0_3.ImBuffer(256),
	buffer15_3 = var_0_3.ImBuffer(256),
	buffer16 = var_0_3.ImBuffer(256),
	buffer16_2 = var_0_3.ImBuffer(256),
	buffer16_3 = var_0_3.ImBuffer(256),
	buffer17 = var_0_3.ImBuffer(256),
	buffer17_2 = var_0_3.ImBuffer(256),
	buffer17_3 = var_0_3.ImBuffer(256),
	buffer18 = var_0_3.ImBuffer(256),
	buffer18_2 = var_0_3.ImBuffer(256),
	buffer18_3 = var_0_3.ImBuffer(256),
	buffer19 = var_0_3.ImBuffer(256),
	buffer19_2 = var_0_3.ImBuffer(256),
	buffer19_3 = var_0_3.ImBuffer(256),
	buffer20 = var_0_3.ImBuffer(256),
	buffer20_2 = var_0_3.ImBuffer(256),
	buffer20_3 = var_0_3.ImBuffer(256)
}
local var_0_72 = {
	comboaskrep = var_0_3.ImBuffer(256),
	askrep = var_0_3.ImBuffer(256),
	askrep2 = var_0_3.ImBuffer(256),
	askrep3 = var_0_3.ImBuffer(256),
	comborespawncar = var_0_3.ImBuffer(256),
	respawncar = var_0_3.ImBuffer(256),
	respawncar2 = var_0_3.ImBuffer(256),
	respawncar3 = var_0_3.ImBuffer(256),
	combomyasorubka = var_0_3.ImBuffer(256),
	myasorubka = var_0_3.ImBuffer(256),
	myasorubka2 = var_0_3.ImBuffer(256),
	combopryatki = var_0_3.ImBuffer(256),
	pryatki = var_0_3.ImBuffer(256),
	pryatki2 = var_0_3.ImBuffer(256),
	comboruletka = var_0_3.ImBuffer(256),
	ruletka = var_0_3.ImBuffer(256),
	ruletka2 = var_0_3.ImBuffer(256),
	combopolivalka = var_0_3.ImBuffer(256),
	polivalka = var_0_3.ImBuffer(256),
	polivalka2 = var_0_3.ImBuffer(256)
}
local var_0_73 = 0
local var_0_74 = 0
local var_0_75 = false
local var_0_76
local var_0_77
local var_0_78 = false
local var_0_79 = {
	winnick,
	var1,
	lvl
}
local var_0_80 = 1
local var_0_82 = {
	menu = var_0_3.ImBool(false),
	stats = var_0_3.ImBool(false),
	statshud = var_0_3.ImBool(false),
	announce = var_0_3.ImBool(false),
	binder = var_0_3.ImBool(false),
	penalty = var_0_3.ImBool(false),
	cmd = var_0_3.ImBool(false),
	settings = var_0_3.ImBool(false),
	cheats = var_0_3.ImBool(false),
	acar = var_0_3.ImBool(false),
	ahgun = var_0_3.ImBool(false),
	farchat = var_0_3.ImBool(false),
	ppv = var_0_3.ImBool(false),
	acheck = var_0_3.ImBool(false),
	ipaccounts = var_0_3.ImBool(false),
	announce_dogoni = var_0_3.ImBool(false),
	announce_needsponsor = var_0_3.ImBool(false),
	announce_edit = var_0_3.ImBool(false),
	log = var_0_3.ImBool(false),
	mpwin = var_0_3.ImBool(false),
	changename = var_0_3.ImBool(false),
	fastreport = var_0_3.ImBool(false),
	rtools = var_0_3.ImBool(false),
	binds = var_0_3.ImBool(false),
	offstats = var_0_3.ImBool(false),
	anamestore = var_0_3.ImBool(false),
	connections = var_0_3.ImBool(false),
	ears = var_0_3.ImBool(false),
	vip_fastad = var_0_3.ImBool(false),
	spectatemenu = var_0_3.ImBool(false),
	response = var_0_3.ImBool(false),
	scoreboard = var_0_3.ImBool(false),
	invishud = var_0_3.ImBool(false)
}
local var_0_83 = var_0_3.ImBuffer(256)
local var_0_84 = var_0_3.ImBuffer(256)
local var_0_85 = var_0_3.ImBuffer(256)
local var_0_86 = var_0_3.ImBuffer(256)
local var_0_87 = var_0_3.ImBuffer(256)
local var_0_88 = var_0_3.ImBuffer(256)
local var_0_89 = var_0_3.ImBuffer(256)
local var_0_90 = var_0_3.ImBuffer(256)
local var_0_91 = var_0_3.ImBool(false)
local var_0_92 = var_0_3.ImBool(false)
local var_0_93 = var_0_3.ImBool(false)
local var_0_94 = var_0_3.ImBool(false)
local var_0_95 = var_0_3.ImBool(false)
local var_0_96 = {
	anticheatF = var_0_3.ImBool(false),
	adminchatF = var_0_3.ImBool(false),
	hungryF = var_0_3.ImBool(false),
	reconF = var_0_3.ImBool(false),
	newsF = var_0_3.ImBool(false),
	reklamaF = var_0_3.ImBool(false),
	publicF = var_0_3.ImBool(false),
	dl = var_0_3.ImBool(false),
	reconmenu = var_0_3.ImBool(false)
}
local var_0_97 = "147804330"
local var_0_98 = "1259415805:AAHZAqVJmOqZqAXJR0CaoEq3g70WoQDFdyI"
local var_0_99
local var_0_100 = {
	achat = false,
	localchat = false,
	report = false,
	allchat = false
}
local var_0_101 = var_0_3.ImInt(0)
local var_0_102 = var_0_3.ImInt(0)

function addUser(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(var_0_52) do
		if iter_9_1.nickname == arg_9_1 then
			if var_0_54.settings.notificationsAboutJoinsAndQuits and var_0_93.v == true then
				if iter_9_1.nickname ~= vipclient.v1 and iter_9_1.nickname ~= vipclient.v2 and iter_9_1.nickname ~= vipclient.v3 and iter_9_1.nickname ~= vipclient.v4 and iter_9_1.nickname ~= vipclient.v5 and iter_9_1.nickname ~= vipclient.v6 and iter_9_1.nickname ~= developer.v1 and iter_9_1.nickname ~= tester.v1 then
					alert("{FFFFFF}Пользователь {acacac}" .. iter_9_1.nickname .. "[" .. arg_9_0 .. "]{FFFFFF} присоединился к серверу.")
				end

				if iter_9_1.nickname == vipclient.v1 or iter_9_1.nickname == vipclient.v2 or iter_9_1.nickname == vipclient.v3 or iter_9_1.nickname == vipclient.v4 or iter_9_1.nickname == vipclient.v5 or iter_9_1.nickname == vipclient.v6 then
					alert("{FCFF00}VIP Пользователь {FF0000}" .. iter_9_1.nickname .. "[" .. arg_9_0 .. "]{FCFF00} присоединился к серверу.")
				end

				if iter_9_1.nickname == tester.v1 then
					alert("{26AF00}Тестер {FF0000}" .. iter_9_1.nickname .. "[" .. arg_9_0 .. "]{26AF00} присоединился к серверу.")
				end

				if iter_9_1.nickname == developer.v1 then
					alert("{C0008B}Разработчик скрипта {FF0000}" .. iter_9_1.nickname .. "[" .. arg_9_0 .. "]{C0008B} присоединился к серверу.")
				end
			end

			table.insert(var_0_53, {
				nickname = iter_9_1.nickname,
				id = arg_9_0,
				listid = iter_9_1.listid
			})
		end
	end
end

function removeUser(arg_10_0)
	for iter_10_0, iter_10_1 in ipairs(var_0_53) do
		if iter_10_1.id == arg_10_0 then
			if var_0_54.settings.notificationsAboutJoinsAndQuits and var_0_93.v == true and vipclient.v1 ~= nil and vipclient.v2 ~= nil and vipclient.v3 ~= nil and vipclient.v4 ~= nil and vipclient.v5 ~= nil and vipclient.v6 ~= nil then
				if iter_10_1.nickname ~= vipclient.v1 and iter_10_1.nickname ~= vipclient.v2 and iter_10_1.nickname ~= vipclient.v3 and iter_10_1.nickname ~= vipclient.v4 and iter_10_1.nickname ~= vipclient.v5 and iter_10_1.nickname ~= vipclient.v6 and iter_10_1.nickname ~= developer.v1 and iter_10_1.nickname ~= tester.v1 then
					alert("{FFFFFF}Пользователь {acacac}" .. iter_10_1.nickname .. "[" .. arg_10_0 .. "]{FFFFFF} покинул сервер.")
				end

				if iter_10_1.nickname == vipclient.v1 or iter_10_1.nickname == vipclient.v2 or iter_10_1.nickname == vipclient.v3 or iter_10_1.nickname == vipclient.v4 and iter_10_1.nickname == vipclient.v5 and iter_10_1.nickname == vipclient.v6 then
					alert("{FCFF00}VIP Пользователь {FF0000}" .. iter_10_1.nickname .. "[" .. arg_10_0 .. "]{FCFF00} покинул сервер.")
				end

				if iter_10_1.nickname == tester.v1 then
					alert("{26AF00}Тестер {FF0000}" .. iter_10_1.nickname .. "[" .. arg_10_0 .. "]{26AF00} покинул сервер.")
				end

				if iter_10_1.nickname == developer.v1 then
					alert("{C0008B}Разработчик скрипта {FF0000}" .. iter_10_1.nickname .. "[" .. arg_10_0 .. "]{C0008B} покинул сервер.")
				end
			end

			table.remove(var_0_53, iter_10_0)

			break
		end
	end
end

local var_0_103 = var_0_3.ImBool(false)
local var_0_104 = var_0_3.ImBuffer("Arial", 256)
local var_0_105 = var_0_3.ImInt(9)
local var_0_106 = 5
local var_0_107 = var_0_3.ImBuffer("Arial", 256)
local var_0_108 = var_0_3.ImInt(9)
local var_0_109 = 5
local var_0_110 = var_0_3.ImFloat3(1, 1, 1)
local var_0_111 = var_0_3.ImBuffer("Admins Online", 32)
local var_0_112 = var_0_3.ImInt(450)
local var_0_113 = var_0_3.ImInt(450)
local var_0_114 = renderCreateFont("Arial", 9, 5)
local var_0_115 = renderCreateFont("Arial", 9, 5)
local var_0_116 = var_0_3.ImInt(3000)
local var_0_117 = 0
local var_0_118 = 0
local var_0_119 = false
local var_0_120 = false
local var_0_121 = os.clock()
local var_0_122 = os.clock()
local var_0_123 = os.clock()

function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then
		return
	end

	while not isSampAvailable() do
		wait(100)
	end

	local var_11_0 = 12216136

	initializeRender()

	if not doesDirectoryExist(getWorkingDirectory() .. "\\config\\AdminHelper") then
		createDirectory(getWorkingDirectory() .. "\\config\\AdminHelper")
	end

	configIni = var_0_2.load(nil, "AdminHelper/config")

	if configIni == nil then
		var_0_2.save({
			config = {
				timewarning = 120000,
				nofall = false,
				fisheye = false,
				clickwarp = false,
				WHtype = "off",
				statsposX = 1284,
				reconcar = true,
				nochatanim = false,
				admlvl = 1,
				statsposY = 427,
				binder = true,
				wallhack = false,
				fr = true,
				speedhackspd = 15,
				killlistid = false,
				autoplus = true,
				checker = true,
				coup = false,
				nickformat = 0,
				frclistcolor = false,
				ipcheck = true,
				airbrake = false,
				rideonwater = false,
				sendsupport = true,
				NoBikeFall = false,
				turn = false,
				jumpcar = false,
				godmode = false,
				infiniteammo = false,
				antistun = false,
				frcomplete = false,
				namewarning = true,
				fastwalk = false,
				scoreboard = false,
				speedhack = false,
				autosupport = true,
				autoflip = false,
				statshud = true,
				highjump = false
			}
		}, "AdminHelper/config")
	end

	statsIni = var_0_2.load(nil, "AdminHelper/stats")

	if statsIni == nil then
		var_0_2.save({
			stats = {
				mute1 = 0,
				jail0 = 0,
				jail3 = 0,
				warnall = 0,
				warn1 = 0,
				jail4 = 0,
				warn0 = 0,
				report0 = 0,
				mute4 = 0,
				mute0 = 0,
				warn5 = 0,
				ban5 = 0,
				ban6 = 0,
				kick0 = 0,
				kick2 = 0,
				jail5 = 0,
				warn3 = 0,
				StatsDayNorm = 150,
				warn2 = 0,
				kick4 = 0,
				kick6 = 0,
				muteall = 0,
				report5 = 0,
				jailall = 0,
				report6 = 0,
				jail6 = 0,
				report3 = 0,
				banall = 0,
				jail2 = 0,
				kickall = 0,
				warn4 = 0,
				week = 0,
				kick5 = 0,
				kick1 = 0,
				ban0 = 0,
				ban2 = 0,
				ban4 = 0,
				warn6 = 0,
				ban3 = 0,
				mute6 = 0,
				report4 = 0,
				ban1 = 0,
				report1 = 0,
				statsswitch = false,
				report2 = 0,
				mute2 = 0,
				reportall = 0,
				kick3 = 0,
				mute5 = 0,
				jail1 = 0,
				mute3 = 0,
				StatsWeekNorm = 1050
			}
		}, "AdminHelper/stats")
	end

	farchatIni = var_0_2.load(nil, "AdminHelper/farchat")

	if farchatIni == nil then
		var_0_2.save({
			farchat = {
				pagesize = 13,
				messagesize = 500,
				positionX = 10,
				date = false,
				positionY = 340,
				distance = true,
				enable = false
			}
		}, "AdminHelper/farchat")
	end

	announceIni = var_0_2.load(nil, "AdminHelper/announce")

	if announceIni == nil then
		var_0_2.save({
			announcesettings = {
				comboannouncera = u8("Напоминание [/ask | /rep]"),
				announcera = u8("Появились вопросы по игре? - /ask"),
				announcera2 = u8("Если увидели нарушителя - /rep"),
				announcera3 = u8("Рекомендуем сменить NonRP ник на RP формат: Имя_Фамилия | /mm > 8"),
				comboannouncerc = u8("Респавн транспорта"),
				announcerc = u8("Через 2 минуты произойдет респавн незанятого транспорта."),
				announcerc2 = u8("Во избежание спавна вашего транспорта, рекомендуем его занять."),
				announcerc3 = u8("Приятной игры и отличного настроения на Online RP ;)"),
				comboannouncem = u8("Мясорубка"),
				announcem = u8("Сейчас пройдет мероприятие 'Мясорубка', готовьте /gomp"),
				announcem2 = u8("После ТП сразу стройтесь у стены, или спавн."),
				comboannounceh = u8("Прятки"),
				announceh = u8("Сейчас пройдет мероприятие 'Прятки', готовьте /gomp"),
				announceh2 = u8("После ТП сразу стройтесь у стены, или спавн."),
				comboannouncer = u8("Русская рулетка"),
				announcer = u8("Сейчас пройдет мероприятие 'Русская рулетка', готовьте /gomp"),
				announcer2 = u8("После ТП сразу стройтесь у стены, или спавн."),
				comboannouncep = u8("Поливалка"),
				announcep = u8("Сейчас пройдет мероприятие 'Поливалка', готовьте /gomp"),
				announcep2 = u8("После ТП сразу разбегайтесь. Кто упал с крыши - проиграл.")
			}
		}, "AdminHelper/announce")
	end

	binderIni = var_0_2.load(nil, "AdminHelper/binder")

	if binderIni == nil then
		var_0_2.save({
			binder = {
				CTRL2 = "Администрация не вмешивается в игровой процесс.",
				ALT3_2 = "Если есть доказательства, оформите жалобу.",
				CTRL8_2 = "Администрация не разглашает данную информацию.",
				CTRL8 = "Приятной Вам игры и отличного настроения на GRAND MOBILE 17 :)",
				CTRL7 = "Наблюдаю за указанным вами игроком.",
				CTRL0 = "Нарушитель был наказан. Приятной игры на GRAND MOBILE 17 :)",
				CTRL6_2 = "Приятной Вам игры и хорошего настроения ;)",
				ALT4_3 = "Игрок был наказан. Приятной Вам игры!",
				CTRL4_2 = "Жалоба рассмотрена, нарушитель наказан. Приятной Вам игры!",
				ALT1 = "При наличии доказательств оформите жалобу.",
				CTRL1 = "Отличного настроения и времяпровождения на GRAND MOBILE 17 :)",
				ALT2_3 = "Актуальные новости проекта в дискорд: discord.gg/grnd.",
				ALT1_3 = "Игрок не нарушает. Есть доказательства? Оформите жалобу.",
				CTRL7_3 = "Администрация не предоставляет данную информацию.",
				ALT2 = "Есть доказательства? Оформите жалобу.",
				CTRL9_3 = "Напишите в любой чат, если вы тут.",
				ALT2_2 = "Работаю над вашей жалобой.",
				CTRL8_3 = "Вы тут? Ответ в любой чат.",
				CTRL0_2 = "Ники РП формата меняются через: донат услуги.",
				ALT3_3 = "Ники РП формата (?Имя_Фамилия) меняются через: донат услуги.",
				ALT4_2 = "Ник РП формата вы можете изменить через: донат услуги.",
				ALT1_2 = "О недоработке вы можете сообщить в технический раздел.",
				CTRL9_2 = "О данной недоработке вы можете сообщить в тех.раздел.",
				ALT8_3 = "Cледите за новостями в дискорде: discord.gg/grnd.",
				ALT5_3 = "Актуальные новости в дискорде: discord.gg/grnd.",
				CTRL6 = "Не увидел нарушений. Оформите жалобу (с док-вами).",
				ALT3 = "Чтобы обжаловать наказание, напишите жалобу на форум.",
				ALT6_3 = "Не согласны с наказанием? Оформите жалобу на форум.",
				CTRL1_3 = "Если вы тут, напишите в любой чат.",
				CTRL4 = "Пожалуйста, не оффтопьте. Далее - бан чата.",
				ALT6 = "Данная информация не предоставляется игрокам.",
				ALT7 = "Если не согласны с наказанием, напишите жалобу.",
				ALT7_2 = "Пишите в репорт что Вы хотели, либо в дискорде: discord.gg/grnd.",
				ALT7_3 = "Не оффтопьте. Далее будет бан чата.",
				CTRL5_3 = "Нарушений не увидел. Оформите жалобу, если есть док-ва.",
				CTRL5 = "Слежу за указанным вами игроком.",
				ALT8 = "Прекратите оффтопить, далее будет бан чата.",
				ALT8_2 = "Пишите то, что хотели, сюда, либо в дискорде: discord.gg/grnd.",
				ALT5 = "Пишите сюда, либо в дискорд: discord.gg/grnd.",
				ALT9_2 = "Администрация не вмешивается в процесс игры.",
				ALT9_3 = "Администрация не вмешивается в РП процесс.",
				ALT6_2 = "О данной проблеме вы можете сообщить в тех.раздел.",
				ALT0 = "",
				CTRL0_3 = "",
				CTRL6_3 = "",
				ALT4 = "",
				ALT9 = "",
				CTRL3_3 = "",
				ALT0_2 = "",
				ALT5_2 = "",
				CTRL1_2 = "",
				CTRL7_2 = "",
				ALT0_3 = "",
				CTRL3_2 = "",
				CTRL3 = "",
				CTRL2_2 = "",
				CTRL4_3 = "",
				CTRL9 = "",
				CTRL2_3 = "",
				CTRL5_2 = ""
			}
		}, "AdminHelper/binder")
	end

	bindsIni = var_0_2.load(nil, "AdminHelper/binds")

	if bindsIni == nil then
		var_0_2.save({
			binds = {
				menu = encodeJson({
					VK_MENU,
					VK_T
				}),
				fastreport = encodeJson({
					VK_Q
				}),
				changename = encodeJson({
					VK_F3
				}),
				fastpm = encodeJson({
					VK_MENU,
					VK_G
				}),
				fastre = encodeJson({
					VK_MENU,
					VK_H
				}),
				rtools = encodeJson({
					VK_R
				}),
				update = encodeJson({
					VK_MENU,
					VK_Q
				}),
				reoff = encodeJson({
					VK_MENU,
					VK_E
				}),
				pm = encodeJson({
					VK_NUMPAD7
				}),
				re = encodeJson({
					VK_NUMPAD8
				}),
				map = encodeJson({
					VK_MENU,
					VK_M
				}),
				wallhack = encodeJson({
					VK_F5
				}),
				invisible = encodeJson({
					VK_I
				})
			}
		}, "AdminHelper/binds")
	end

	penaltyIni = var_0_2.load(nil, "AdminHelper/penalty")

	if penaltyIni == nil then
		var_0_2.save({
			cmd = {
				"dm",
				"dmzz",
				"dmcar",
				"gunzz",
				"db",
				"pg",
				"tk",
				"sk",
				"nrpdrive",
				"pomeha",
				"relog",
				"afkonroad",
				"afkwoesc",
				"offtop",
				"mg",
				"flood",
				"caps",
				"osk",
				"oskrod"
			},
			time = {
				"30",
				"60",
				"20",
				"30",
				"30",
				"30",
				"45",
				"40",
				"25",
				"-",
				"-",
				"-",
				"-",
				"15",
				"20",
				"15",
				"10",
				"30",
				"180"
			},
			reason = {
				"DM",
				"DM in ZZ",
				"DM Car",
				"Gun in ZZ",
				"DB",
				"PG",
				"TK",
				"SK",
				"NonRP Drive",
				"Помеха",
				"Relog",
				"Afk On Road",
				"Afk w/o esc",
				"Offtop",
				"MG",
				"Flood",
				"Caps",
				"Оск. игроков",
				"Оск. родных"
			},
			penalty = {
				"Jail",
				"Jail",
				"Jail",
				"Jail",
				"Jail",
				"Jail",
				"Jail",
				"Jail",
				"Jail",
				"Kick",
				"Kick",
				"Kick",
				"Kick",
				"Mute",
				"Mute",
				"Mute",
				"Mute",
				"Mute",
				"Mute"
			}
		}, "AdminHelper/penalty")
	end

	warningsIni = var_0_2.load(nil, "AdminHelper/warnings")

	if warningsIni == nil then
		var_0_2.save({
			whitelist = {
				"Empty_Slot"
			}
		}, "AdminHelper/warnings")
	end

	if configIni == nil or statsIni == nil or announceIni == nil or binderIni == nil or penaltyIni == nil or farchatIni == nil or bindsIni == nil or warningsIni == nil then
		sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}INI файл(ы) не найден(ы), он(и) был(и) автоматически создан(ы).", -1)
	end

	configIni = var_0_2.load(nil, "AdminHelper/config")
	statsIni = var_0_2.load(nil, "AdminHelper/stats")
	announceIni = var_0_2.load(nil, "AdminHelper/announce")
	binderIni = var_0_2.load(nil, "AdminHelper/binder")
	penaltyIni = var_0_2.load(nil, "AdminHelper/penalty")
	farchatIni = var_0_2.load(nil, "AdminHelper/farchat")
	bindsIni = var_0_2.load(nil, "AdminHelper/binds")
	warningsIni = var_0_2.load(nil, "AdminHelper/warnings")

	if configIni.config.Tofftopask ~= nil then
		configIni.config.Tofftopask = nil
		configIni.config.Tmatask = nil
		configIni.config.Tcapsask = nil

		var_0_2.save(configIni, "AdminHelper/config")
	end

	if configIni.config.NoBikeFall == nil then
		configIni.config.NoBikeFall = false

		var_0_2.save(configIni, "AdminHelper/config")
	end

	if bindsIni.binds.rtools == nil then
		bindsIni.binds.rtools = encodeJson({
			VK_R
		})
	end

	if bindsIni.binds.invisible = nil then
		bindsIni.binds.invisible = encodeJson({
			VK_I
		})

		var_0_2.save(bindsIni, "AdminHelper/binds")
	end

	HotKeys = {
		menu = {
			v = decodeJson(bindsIni.binds.menu)
		},
		fastreport = {
			v = decodeJson(bindsIni.binds.fastreport)
		},
		rtools = {
			v = decodeJson(bindsIni.binds.rtools)
		},
		changename = {
			v = decodeJson(bindsIni.binds.changename)
		},
		fastpm = {
			v = decodeJson(bindsIni.binds.fastpm)
		},
		fastre = {
			v = decodeJson(bindsIni.binds.fastre)
		},
		update = {
			v = decodeJson(bindsIni.binds.update)
		},
		reoff = {
			v = decodeJson(bindsIni.binds.reoff)
		},
		pm = {
			v = decodeJson(bindsIni.binds.pm)
		},
		re = {
			v = decodeJson(bindsIni.binds.re)
		},
		map = {
			v = decodeJson(bindsIni.binds.map)
		},
		wallhack = {
			v = decodeJson(bindsIni.binds.wallhack)
		},
		invisible = {
			v = decodeJson(bindsIni.binds.invisible)
		}
	}
	checks = {
		sendsupport_check = var_0_3.ImBool(configIni.config.sendsupport),
		autoplus_check = var_0_3.ImBool(configIni.config.autoplus),
		binder_check = var_0_3.ImBool(configIni.config.binder),
		acarsit_check = var_0_3.ImBool(true),
		ahgunmyID_check = var_0_3.ImBool(false),
		farchat_date = var_0_3.ImBool(farchatIni.farchat.date),
		farchat_distance = var_0_3.ImBool(farchatIni.farchat.distance),
		reconcar = var_0_3.ImBool(configIni.config.reconcar),
		autotogphone = var_0_3.ImBool(configIni.config.autotogphone),
		fisheye = var_0_3.ImBool(configIni.config.fisheye),
		statshud = var_0_3.ImBool(configIni.config.statshud),
		frcomplete = var_0_3.ImBool(configIni.config.frcomplete),
		frclistcolor = var_0_3.ImBool(false),
		killlistid = var_0_3.ImBool(configIni.config.killlistid),
		namewarning = var_0_3.ImBool(configIni.config.namewarning),
		scoreboard = var_0_3.ImBool(configIni.config.scoreboard),
	}
	buffers = {
		ahgun_ammo = var_0_3.ImBuffer(256),
		farchat_posx = var_0_3.ImBuffer(256),
		farchat_posy = var_0_3.ImBuffer(256),
		farchat_pagesize = var_0_3.ImBuffer(256),
		farchat_messagesize = var_0_3.ImBuffer(256),
		fastad_text = var_0_3.ImBuffer(256),
		fastad_repeat = var_0_3.ImBuffer(256),
		PenaltyCommand = var_0_3.ImBuffer(256),
		PenaltyTime = var_0_3.ImBuffer(256),
		PenaltyReason = var_0_3.ImBuffer(256),
		PenaltyPenalty = var_0_3.ImBuffer(256),
		timewarning = var_0_3.ImBuffer(256),
		response = var_0_3.ImBuffer(1100),
		RTAnswer = var_0_3.ImBuffer(256),
		StatsDayNorm = var_0_3.ImBuffer(6),
		StatsWeekNorm = var_0_3.ImBuffer(6)
	}

	if statsIni.stats.StatsDayNorm == nil then
		statsIni.stats.StatsDayNorm = 150
		statsIni.stats.StatsWeekNorm = 1050

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	admlvl = configIni.config.admlvl
	var_0_92.v = configIni.config.fr
	var_0_93.v = configIni.config.checker
	var_0_82.statshud.v = configIni.config.statshud
	saved_posX, saved_posY = configIni.config.statsposX, configIni.config.statsposY
	var_0_94.v = configIni.config.ipcheck
	var_0_69.v = configIni.config.nickformat
	whVisible = configIni.config.WHtype
	defaultState = configIni.config.WallHack
	airbrake = configIni.config.airbrake
	var_0_22 = configIni.config.fisheye

	local var_11_2 = configIni.config.timewarning / 1000 / 60

	buffers.timewarning.v = tostring(var_11_2)
	reportall = statsIni.stats.reportall
	muteall = statsIni.stats.muteall
	jailall = statsIni.stats.jailall
	warnall = statsIni.stats.warnall
	banall = statsIni.stats.banall
	kickall = statsIni.stats.kickall
	statsswitch = statsIni.stats.statsswitch
	buffers.StatsDayNorm.v = tostring(statsIni.stats.StatsDayNorm)
	buffers.StatsWeekNorm.v = tostring(statsIni.stats.StatsWeekNorm)
	statistic = {
		report0 = statsIni.stats.report0,
		report1 = statsIni.stats.report1,
		report2 = statsIni.stats.report2,
		report3 = statsIni.stats.report3,
		report4 = statsIni.stats.report4,
		report5 = statsIni.stats.report5,
		report6 = statsIni.stats.report6,
		mute0 = statsIni.stats.mute0,
		mute1 = statsIni.stats.mute1,
		mute2 = statsIni.stats.mute2,
		mute3 = statsIni.stats.mute3,
		mute4 = statsIni.stats.mute4,
		mute5 = statsIni.stats.mute5,
		mute6 = statsIni.stats.mute6,
		jail0 = statsIni.stats.jail0,
		jail1 = statsIni.stats.jail1,
		jail2 = statsIni.stats.jail2,
		jail3 = statsIni.stats.jail3,
		jail4 = statsIni.stats.jail4,
		jail5 = statsIni.stats.jail5,
		jail6 = statsIni.stats.jail6,
		kick0 = statsIni.stats.kick0,
		kick1 = statsIni.stats.kick1,
		kick2 = statsIni.stats.kick2,
		kick3 = statsIni.stats.kick3,
		kick4 = statsIni.stats.kick4,
		kick5 = statsIni.stats.kick5,
		kick6 = statsIni.stats.kick6,
		warn0 = statsIni.stats.warn0,
		warn1 = statsIni.stats.warn1,
		warn2 = statsIni.stats.warn2,
		warn3 = statsIni.stats.warn3,
		warn4 = statsIni.stats.warn4,
		warn5 = statsIni.stats.warn5,
		warn6 = statsIni.stats.warn6,
		ban0 = statsIni.stats.ban0,
		ban1 = statsIni.stats.ban1,
		ban2 = statsIni.stats.ban2,
		ban3 = statsIni.stats.ban3,
		ban4 = statsIni.stats.ban4,
		ban5 = statsIni.stats.ban5,
		ban6 = statsIni.stats.ban6
	}
	buffers.farchat_posx.v = tostring(farchatIni.farchat.positionX)
	buffers.farchat_posy.v = tostring(farchatIni.farchat.positionY)
	buffers.farchat_pagesize.v = tostring(farchatIni.farchat.pagesize)
	buffers.farchat_messagesize.v = tostring(farchatIni.farchat.messagesize)
	farchat_pagesize = buffers.farchat_pagesize.v
	farchat_messagesize = buffers.farchat_messagesize.v
	pagesize = farchatIni.farchat.pagesize
	bubbleBox = ChatBox(pagesize, var_0_38)
	bubbleBox.active = farchatIni.farchat.enable

	if bubbleBox.active == true then
		bubbleBox:toggle(bubbleBox.active)
	end

	var_0_56[1] = announceIni.announcesettings.comboannouncera
	var_0_56[2] = announceIni.announcesettings.comboannouncerc
	var_0_56[3] = announceIni.announcesettings.comboannouncem
	var_0_56[4] = announceIni.announcesettings.comboannounceh
	var_0_56[5] = announceIni.announcesettings.comboannouncer
	var_0_56[6] = announceIni.announcesettings.comboannouncep
	var_0_72.comboaskrep.v = announceIni.announcesettings.comboannouncera
	var_0_72.askrep.v = announceIni.announcesettings.announcera
	var_0_72.askrep2.v = announceIni.announcesettings.announcera2
	var_0_72.askrep3.v = announceIni.announcesettings.announcera3
	var_0_72.comborespawncar.v = announceIni.announcesettings.comboannouncerc
	var_0_72.respawncar.v = announceIni.announcesettings.announcerc
	var_0_72.respawncar2.v = announceIni.announcesettings.announcerc2
	var_0_72.respawncar3.v = announceIni.announcesettings.announcerc3
	var_0_72.comborespawncar.v = announceIni.announcesettings.comboannouncerc
	var_0_72.respawncar.v = announceIni.announcesettings.announcerc
	var_0_72.respawncar2.v = announceIni.announcesettings.announcerc2
	var_0_72.respawncar3.v = announceIni.announcesettings.announcerc3
	var_0_72.combomyasorubka.v = announceIni.announcesettings.comboannouncem
	var_0_72.myasorubka.v = announceIni.announcesettings.announcem
	var_0_72.myasorubka2.v = announceIni.announcesettings.announcem2
	var_0_72.combopryatki.v = announceIni.announcesettings.comboannounceh
	var_0_72.pryatki.v = announceIni.announcesettings.announceh
	var_0_72.pryatki2.v = announceIni.announcesettings.announceh2
	var_0_72.comboruletka.v = announceIni.announcesettings.comboannouncer
	var_0_72.ruletka.v = announceIni.announcesettings.announcer
	var_0_72.ruletka2.v = announceIni.announcesettings.announcer2
	var_0_72.combopolivalka.v = announceIni.announcesettings.comboannouncep
	var_0_72.polivalka.v = announceIni.announcesettings.announcep
	var_0_72.polivalka2.v = announceIni.announcesettings.announcep2
	var_0_71.buffer.v = u8(binderIni.binder.CTRL1)
	var_0_71.buffer_2.v = u8(binderIni.binder.CTRL1_2)
	var_0_71.buffer_3.v = u8(binderIni.binder.CTRL1_3)
	var_0_71.buffer2.v = u8(binderIni.binder.CTRL2)
	var_0_71.buffer2_2.v = u8(binderIni.binder.CTRL2_2)
	var_0_71.buffer2_3.v = u8(binderIni.binder.CTRL2_3)
	var_0_71.buffer3.v = u8(binderIni.binder.CTRL3)
	var_0_71.buffer3_2.v = u8(binderIni.binder.CTRL3_2)
	var_0_71.buffer3_3.v = u8(binderIni.binder.CTRL3_3)
	var_0_71.buffer4.v = u8(binderIni.binder.CTRL4)
	var_0_71.buffer4_2.v = u8(binderIni.binder.CTRL4_2)
	var_0_71.buffer4_3.v = u8(binderIni.binder.CTRL4_3)
	var_0_71.buffer5.v = u8(binderIni.binder.CTRL5)
	var_0_71.buffer5_2.v = u8(binderIni.binder.CTRL5_2)
	var_0_71.buffer5_3.v = u8(binderIni.binder.CTRL5_3)
	var_0_71.buffer6.v = u8(binderIni.binder.CTRL6)
	var_0_71.buffer6_2.v = u8(binderIni.binder.CTRL6_2)
	var_0_71.buffer6_3.v = u8(binderIni.binder.CTRL6_3)
	var_0_71.buffer7.v = u8(binderIni.binder.CTRL7)
	var_0_71.buffer7_2.v = u8(binderIni.binder.CTRL7_2)
	var_0_71.buffer7_3.v = u8(binderIni.binder.CTRL7_3)
	var_0_71.buffer8.v = u8(binderIni.binder.CTRL8)
	var_0_71.buffer8_2.v = u8(binderIni.binder.CTRL8_2)
	var_0_71.buffer8_3.v = u8(binderIni.binder.CTRL8_3)
	var_0_71.buffer9.v = u8(binderIni.binder.CTRL9)
	var_0_71.buffer9_2.v = u8(binderIni.binder.CTRL9_2)
	var_0_71.buffer9_3.v = u8(binderIni.binder.CTRL9_3)
	var_0_71.buffer10.v = u8(binderIni.binder.CTRL0)
	var_0_71.buffer10_2.v = u8(binderIni.binder.CTRL0_2)
	var_0_71.buffer10_3.v = u8(binderIni.binder.CTRL0_3)
	var_0_71.buffer11.v = u8(binderIni.binder.ALT1)
	var_0_71.buffer11_2.v = u8(binderIni.binder.ALT1_2)
	var_0_71.buffer11_3.v = u8(binderIni.binder.ALT1_3)
	var_0_71.buffer12.v = u8(binderIni.binder.ALT2)
	var_0_71.buffer12_2.v = u8(binderIni.binder.ALT2_2)
	var_0_71.buffer12_3.v = u8(binderIni.binder.ALT2_3)
	var_0_71.buffer13.v = u8(binderIni.binder.ALT3)
	var_0_71.buffer13_2.v = u8(binderIni.binder.ALT3_2)
	var_0_71.buffer13_3.v = u8(binderIni.binder.ALT3_3)
	var_0_71.buffer14.v = u8(binderIni.binder.ALT4)
	var_0_71.buffer14_2.v = u8(binderIni.binder.ALT4_2)
	var_0_71.buffer14_3.v = u8(binderIni.binder.ALT4_3)
	var_0_71.buffer15.v = u8(binderIni.binder.ALT5)
	var_0_71.buffer15_2.v = u8(binderIni.binder.ALT5_2)
	var_0_71.buffer15_3.v = u8(binderIni.binder.ALT5_3)
	var_0_71.buffer16.v = u8(binderIni.binder.ALT6)
	var_0_71.buffer16_2.v = u8(binderIni.binder.ALT6_2)
	var_0_71.buffer16_3.v = u8(binderIni.binder.ALT6_3)
	var_0_71.buffer17.v = u8(binderIni.binder.ALT7)
	var_0_71.buffer17_2.v = u8(binderIni.binder.ALT7_2)
	var_0_71.buffer17_3.v = u8(binderIni.binder.ALT7_3)
	var_0_71.buffer18.v = u8(binderIni.binder.ALT8)
	var_0_71.buffer18_2.v = u8(binderIni.binder.ALT8_2)
	var_0_71.buffer18_3.v = u8(binderIni.binder.ALT8_3)
	var_0_71.buffer19.v = u8(binderIni.binder.ALT9)
	var_0_71.buffer19_2.v = u8(binderIni.binder.ALT9_2)
	var_0_71.buffer19_3.v = u8(binderIni.binder.ALT9_3)
	var_0_71.buffer20.v = u8(binderIni.binder.ALT0)
	var_0_71.buffer20_2.v = u8(binderIni.binder.ALT0_2)
	var_0_71.buffer20_3.v = u8(binderIni.binder.ALT0_3)
	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	nick = sampGetPlayerNickname(id)
	json_url = "https://raw.githubusercontent.com/Setkh/AdminHelper/master/version.json"
	url = "t.me/Setkh"
	prefixx = "AdminHelper"

	autoupdate("https://raw.githubusercontent.com/Setkh/AdminHelper/master/version.json", "[" .. string.upper(thisScript().name) .. "]: ", "https://raw.githubusercontent.com/Setkh/AdminHelper/master/version.json")
	loadData()
	rebuildFonts()
	rebuildUsers()
	apply_custom_style()
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Скрипт успешно загрузился. Версия: " .. thisScript().version .. ". Разработчик: " .. thisScript().authors[1], 106729)
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Для открытия меню используйте команду: /ah (комбинация ALT + T)", 106729)

	developer = {
		v1 = "Miron_Setkh"
	}

	if nick:find(developer.v1) then
		sampAddChatMessage("{51fffa}[AdminHelper] {FF0000}" .. nick .. "{d5dedd}, добро пожаловать! Вы авторизовались как {FF0000}разработчик.", 106729)
	end

	tester = {
		v1 = "Alberto_Red"
	}

	if nick:find(tester.v1) then
		sampAddChatMessage("{51fffa}[AdminHelper] {26AF00}" .. nick .. "{d5dedd}, добро пожаловать! Вы авторизовались как {26AF00}тестер.", 106729)
	end

	vipclient = {
		v1 = "Dmitry_Nekrasov",
		v6 = "Empty_Slot",
		v3 = "Sebastian_Nekrasov",
		v5 = "Name_Less",
		v2 = "Leonardo_Suarez",
		v4 = "Santiago_Costa"
	}

	if nick:find(vipclient.v1) or nick:find(vipclient.v2) or nick:find(vipclient.v3) or nick:find(vipclient.v4) or nick:find(vipclient.v5) or nick:find(vipclient.v6) then
		sampAddChatMessage("{51fffa}[AdminHelper] {FCFF00}" .. nick .. "{d5dedd}, добро пожаловать! Вы авторизовались как {FCFF00}VIP {d5dedd}пользователь.", 106729)
	end

	kill = var_0_11.cast("struct stKillInfo*", sampGetKillInfoPtr())
	announce = lua_thread.create_suspended(announce_function)
	announce2 = lua_thread.create_suspended(announce2_function)
	announce3 = lua_thread.create_suspended(announce3_function)
	announce4 = lua_thread.create_suspended(announce4_function)
	announce5 = lua_thread.create_suspended(announce5_function)
	announce6 = lua_thread.create_suspended(announce6_function)
	announce7 = lua_thread.create_suspended(announce7_function)
	announce8 = lua_thread.create_suspended(announce8_function)
	fastreport = lua_thread.create_suspended(fastreport_function)
	fastreportmain = lua_thread.create_suspended(fastreportmain_function)
	fastpmth = lua_thread.create_suspended(fastpm_function)
	fastreth = lua_thread.create_suspended(fastre_function)
	cmdlist = lua_thread.create_suspended(cmdlist_function)
	checker = lua_thread.create_suspended(checker_function)
	givegiftfunc = lua_thread.create_suspended(givegift_function)
	autoOfunc = lua_thread.create_suspended(autoO_function)
	spawncar = lua_thread.create_suspended(spawncar_function)
	ahgun = lua_thread.create_suspended(ahgun_function)

	sampRegisterChatCommand("invis", function()
		var_0_27 = not var_0_27

		if var_0_27 then
			var_0_82.invishud.v = true

			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Невидимость активирована.", 16776960)
		else
			var_0_82.invishud.v = false

			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Невидимость деактивирована.", 16776960)
		end
	end)
	sampRegisterChatCommand("sgo", function(arg_13_0)
		local var_13_0 = string.match(arg_13_0, "(%d+)")

		if var_13_0 == nil and var_0_28 ~= true then
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /sgo [id]", -1)
		else
			var_0_27 = true
			var_0_82.invishud.v = true

			if var_0_28 then
				sampSendChat("/sg")
			else
				sampSendChat("/go " .. var_13_0)
			end
		end
	end)
	sampRegisterChatCommand("stp", function()
		if var_0_28 then
			local var_14_0, var_14_1, var_14_2, var_14_3 = sampGetStreamedOutPlayerPos(spectate_id)

			if getActiveInterior() == 0 then
				if var_14_0 then
					sampSendChat("/reoff")
					lua_thread.create(function()
						wait(500)

						if getActiveInterior() == 0 then
							var_0_27 = true
							var_0_82.invishud.v = true

							wait(500)
							setCharCoordinates(PLAYER_PED, var_14_1 + 1, var_14_2 + 1, var_14_3)
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Вы тихо телепортировались к " .. sampGetPlayerNickname(spectate_id) .. "[" .. spectate_id .. "]", 16776960)
						else
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Нельзя телепортироваться из интерьера.", 16776960)
						end
					end)
				else
					local var_14_4, var_14_5 = sampGetCharHandleBySampPlayerId(spectate_id)

					if var_14_4 and doesCharExist(var_14_5) then
						local var_14_6, var_14_7, var_14_8 = getCharCoordinates(var_14_5)

						sampSendChat("/reoff")
						lua_thread.create(function()
							wait(500)

							if getActiveInterior() == 0 then
								var_0_27 = true
								var_0_82.invishud.v = true

								wait(500)
								setCharCoordinates(PLAYER_PED, var_14_6 + 1, var_14_7 + 1, var_14_8)
								sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Вы тихо телепортировались к " .. sampGetPlayerNickname(spectate_id) .. "[" .. spectate_id .. "]", 16776960)
							else
								sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Нельзя телепортироваться из интерьера.", 16776960)
							end
						end)
					end
				end
			else
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Нельзя телепортироваться в интерьер.", 16776960)
			end
		else
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Доступно только при слежке.", 16776960)
		end
	end)
	sampRegisterChatCommand("pcheck", function()
		for iter_17_0 = 0, sampGetMaxPlayerId() do
			if sampIsPlayerConnected(iter_17_0) then
				local var_17_0 = false
				local var_17_1 = true
				local var_17_2 = sampGetPlayerNickname(iter_17_0)
				local var_17_3 = iter_17_0

				for iter_17_1 = 1, #warningsIni.whitelist do
					if var_17_2:find(warningsIni.whitelist[iter_17_1]) then
						var_17_0 = true
					end
				end

				if var_17_0 == false then
					for iter_17_2 = 1, #var_0_30 do
						if var_17_2:find(var_0_30[iter_17_2]) then
							local var_17_4 = false

							sampAddChatMessage("{51fffa}[AH] {FF0000}[WARNING] {d5dedd}Вероятно, у " .. var_17_2 .. "[" .. var_17_3 .. "] некорректный никнейм.", -1)
						end
					end
				end
			end
		end

		if notfound == true then
			sampAddChatMessage("{51fffa}[AH] {d5dedd}Некорректных никнеймов не найдено.", -1)
		end
	end)
	sampRegisterChatCommand("ah", function()
		var_0_82.menu.v = not var_0_82.menu.v
		var_0_3.Process = var_0_82.menu.v
	end)

	local var_11_3 = {
		"wlist",
		"wl"
	}

	for iter_11_0, iter_11_1 in pairs(var_11_3) do
		sampRegisterChatCommand(iter_11_1, function(arg_19_0)
			var1 = string.match(arg_19_0, "(%d+)")

			if var1 == nil then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /(wl)ist [id]", -1)
			elseif sampIsPlayerConnected(var1) or var1:find(id) then
				table.insert(warningsIni.whitelist, sampGetPlayerNickname(var1))
				var_0_2.save(warningsIni, "AdminHelper/warnings")
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Пользователь " .. sampGetPlayerNickname(var1) .. "[" .. var1 .. "] добавлен в белый список.", -1)
			end
		end)
	end

	sampRegisterChatCommand("crr", function()
		local var_21_0 = 3
		local var_21_1 = os.time(os.date("!*t")) + var_21_0 * 60 * 60
		local var_21_2 = tonumber(os.date("%w", var_21_1))

		if var_21_2 == 0 then
			if configIni.config.admlvl <= 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report0 .. "] | До ежедневной нормы: " .. 150 - statistic.report0, 16776960)
			end

			if configIni.config.admlvl >= 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report0 .. "] | До ежедневной нормы: " .. 100 - statistic.report0, 16776960)
			end
		end

		if var_21_2 == 1 then
			if configIni.config.admlvl <= 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report1 .. "] | До ежедневной нормы: " .. 150 - statistic.report1, 16776960)
			end

			if configIni.config.admlvl >= 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report1 .. "] | До ежедневной нормы: [" .. 100 - statistic.report1 .. "]", 16776960)
			end
		end

		if var_21_2 == 2 then
			if configIni.config.admlvl <= 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report2 .. "] | До ежедневной нормы: " .. 150 - statistic.report2, 16776960)
			end

			if configIni.config.admlvl >= 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report2 .. "] | До ежедневной нормы: [" .. 100 - statistic.report2 .. "]", 16776960)
			end
		end

		if var_21_2 == 3 then
			if configIni.config.admlvl <= 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report3 .. "] | До ежедневной нормы: " .. 150 - statistic.report3, 16776960)
			end

			if configIni.config.admlvl >= 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report3 .. "] | До ежедневной нормы: " .. 100 - statistic.report3, 16776960)
			end
		end

		if var_21_2 == 4 then
			if configIni.config.admlvl <= 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report4 .. "] | До ежедневной нормы: " .. 150 - statistic.report4, 16776960)
			end

			if configIni.config.admlvl >= 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report4 .. "] | До ежедневной нормы: " .. 100 - statistic.report4, 16776960)
			end
		end

		if var_21_2 == 5 then
			if configIni.config.admlvl <= 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report5 .. "] | До ежедневной нормы: " .. 150 - statistic.report5, 16776960)
			end

			if configIni.config.admlvl >= 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report5 .. "] | До ежедневной нормы: " .. 100 - statistic.report5, 16776960)
			end
		end

		if var_21_2 == 6 then
			if configIni.config.admlvl <= 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report6 .. "] | До ежедневной нормы: " .. 150 - statistic.report6, 16776960)
			end

			if configIni.config.admlvl >= 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответов на репорт: [" .. statistic.report6 .. "] | До ежедневной нормы: " .. 100 - statistic.report6, 16776960)
			end
		end
	end)
	sampRegisterChatCommand("accs", function(arg_22_0)
		lua_thread.create(function()
			wait(0)

			var1 = string.match(arg_22_0, "(.+)")

			if var1 == nil then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /accs [id]", 16776960)
			else
				acc = 2

				sampSendChat("/getip " .. var1)
				wait(1000)

				if ipacc ~= nil then
					sampSendChat("/ipaccounts " .. ipacc .. " 1")
				end

				acc = 1
			end
		end)
	end)
	sampRegisterChatCommand("acar", function()
		var_0_82.acar.v = not var_0_82.acar.v
		var_0_3.Process = var_0_82.acar.v
	end)
	sampRegisterChatCommand("ahgun", function()
		var_0_82.ahgun.v = not var_0_82.ahgun.v
		var_0_3.Process = var_0_82.ahgun.v
	end)
	sampRegisterChatCommand("mpgun", function(arg_28_0)
		lua_thread.create(function()
			wait(0)

			if configIni.config.admlvl > 2 then
				var1 = string.match(arg_28_0, "(.+)")

				if var1 == nil then
					sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /mpgun [id]", 16776960)
				elseif var_0_73 == 0 then
					var_0_73 = 1

					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Выдаем оружие " .. var1 .. " id...", 16776960)
					wait(500)
					sampSendChat("/gun " .. var1 .. " 24 500")
					wait(1000)
					sampSendChat("/gun " .. var1 .. " 24 500")
					wait(1000)
					sampSendChat("/gun " .. var1 .. " 31 500")
					wait(1000)
					sampSendChat("/gun " .. var1 .. " 31 500")
					wait(1000)
					sampSendChat("/gun " .. var1 .. " 31 500")
					wait(500)
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Выдано.", 16776960)

					var_0_73 = 0
				else
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ожидайте, оружие игроку уже выдается.", 16776960)
				end
			else
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Команда доступна с 3-го уровня администратора.", 16776960)
			end
		end)
	end)
	sampRegisterChatCommand("mpwin", function(arg_30_0)
		var_0_79.var1 = string.match(arg_30_0, "(%d+)")

		if var_0_79.var1 == nil then
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /mpwin [id]", 16776960)
		elseif sampIsPlayerConnected(var_0_79.var1) then
			var_0_79.winnick = sampGetPlayerNickname(var_0_79.var1)
			var_0_79.lvl = sampGetPlayerScore(var_0_79.var1)
			var_0_82.mpwin.v = true
			var_0_3.Process = var_0_82.mpwin.v
		else
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Игрок не в сети.", -1)

			var_0_82.mpwin.v = false
			var_0_3.Process = var_0_82.mpwin.v
		end
	end)
	sampRegisterChatCommand("ppv", function(arg_31_0)
		if configIni.config.admlvl > 3 then
			lua_thread.create(function()
				wait(0)

				if os.clock() - var_0_20 <= 4 then
					sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Не так быстро.", 16776960)
				else
					var_0_20 = os.clock()
					var1 = string.match(arg_31_0, "(.+)")

					if var1 == nil then
						sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /ppv [id/nick]", 16776960)
					elseif not var1:find("%a+") then
						if sampIsPlayerConnected(var1) or var1:find(id) then
							openip = 1

							sampSendChat("/offstats " .. sampGetPlayerNickname(var1))
							wait(800)

							if ipreg ~= nil and iplast ~= nil then
								getAsync()
							else
								sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Не удалось получить IP адреса, повторите попытку.", 16776960)
							end
						else
							sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Игрок не в сети.", 16776960)

							if var_0_82.ppv.v then
								var_0_82.ppv.v = not var_0_82.ppv.v
							end
						end
					else
						openip = 1

						wait(1000)
						sampSendChat("/offstats " .. var1)
						wait(800)

						if ipreg ~= nil and iplast ~= nil then
							getAsync()
						else
							sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Не удалось получить IP адреса, повторите попытку.", 16776960)
						end
					end
				end
			end)
		else
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Доступно с 4-го уровня администратора.", 16776960)
		end
	end)
	sampRegisterChatCommand("appv", function(arg_33_0)
		if configIni.config.admlvl > 3 then
			lua_thread.create(function()
				wait(0)

				var1 = string.match(arg_33_0, "(.+)")

				if var1 == nil then
					sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /appv [id/nick]", 16776960)
				elseif not var1:find("%a+") then
					if sampIsPlayerConnected(var1) or var1:find(id) then
						openip = 1

						sampSendChat("/offstats " .. sampGetPlayerNickname(var1))
						wait(800)

						if ipreg ~= nil and iplast ~= nil then
							getAsync2()
						else
							sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Не удалось получить IP адреса, повторите попытку.", 16776960)
						end

						wait(100)

						if ppvnick ~= nil then
							if var1:find("%a+") then
								sampSendChat("/a Информация об IP адресах: " .. ppvnick .. " (1 - REG | 2 - LAST)")
							else
								sampSendChat("/a Информация об IP адресах: " .. ppvnick .. "[" .. var1 .. "] (1 - REG | 2 - LAST)")
							end

							wait(1000)
							sampSendChat("/a IP1: " .. quer.v1 .. ", " .. quer.v3 .. ", " .. quer.v5 .. ", " .. quer.v7)
							wait(1000)
							sampSendChat("/a IP2: " .. quer.v2 .. ", " .. quer.v4 .. ", " .. quer.v6 .. ", " .. quer.v8)
							wait(1000)
							sampSendChat("/a Расстояние между городами: " .. math.ceil(distances) .. " км")
						end
					else
						sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Игрок не в сети.", 16776960)

						if var_0_82.ppv.v then
							var_0_82.ppv.v = not var_0_82.ppv.v
						end
					end
				else
					openip = 1

					wait(1000)
					sampSendChat("/offstats " .. var1)
					wait(800)

					if ipreg ~= nil and iplast ~= nil then
						getAsync2()
					else
						sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Не удалось получить IP адреса, повторите попытку.", 16776960)
					end

					wait(100)

					if var1 ~= nil then
						sampSendChat("/a Информация об IP адресах: " .. var1 .. " (1 - REG | 2 - LAST)")
						wait(1000)
						sampSendChat("/a IP1: " .. quer.v1 .. ", " .. quer.v3 .. ", " .. quer.v5 .. ", " .. quer.v7)
						wait(1000)
						sampSendChat("/a IP2: " .. quer.v2 .. ", " .. quer.v4 .. ", " .. quer.v6 .. ", " .. quer.v8)
						wait(1000)
						sampSendChat("/a Расстояние между городами: " .. math.ceil(distances) .. " км")
					end
				end
			end)
		else
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Доступно с 4-го уровня администратора.", 16776960)
		end
	end)
	sampRegisterChatCommand("piss", function()
		sampSetSpecialAction(68)
	end)

	local var_11_4 = {
		"abase",
		"ab"
	}

	for iter_11_2, iter_11_3 in pairs(var_11_4) do
		sampRegisterChatCommand(iter_11_3, function(arg_36_0)
			var1 = string.match(arg_36_0, "(.+)")

			if var1 == nil then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /abase [id/nick]", 16776960)
			elseif not var1:find("%a+") then
				if sampIsPlayerConnected(var1) then
					achecknick = sampGetPlayerNickname(var1)
					var_0_82.acheck.v = true
					var_0_3.Process = var_0_82.acheck.v
				else
					sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Игрок не в сети.", 16776960)

					if var_0_82.acheck.v then
						var_0_82.acheck.v = not var_0_82.acheck.v
					end
				end
			else
				achecknick = var1
				var_0_82.acheck.v = true
				var_0_3.Process = var_0_82.acheck.v
			end
		end)
	end

	sampRegisterChatCommand("ahoff", function()
		thisScript():unload()
	end)
	sampRegisterChatCommand("sh", function(arg_40_0)
		var = string.match(arg_40_0, "(%d+)")

		if var == nil then
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /sh [1-1000] | (рекомендуется - 15)", 16776960)
		elseif tonumber(var) <= 1000 and tonumber(var) >= 1 then
			configIni.config.speedhackspd = arg_40_0

			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Скорость SpeedHack установлена на: " .. arg_40_0, 16776960)
			var_0_2.save(configIni, "AdminHelper/config")
		else
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /sh [1-1000] | (рекомендуется - 15)", 16776960)
		end
	end)
	sampRegisterChatCommand("aears", function()
		var_0_82.ears.v = not var_0_82.ears.v
		var_0_3.Process = var_0_82.ears.v
	end)
	sampRegisterChatCommand("fisheye", function()
		var_0_22 = not var_0_22
		configIni.config.fisheye = var_0_22
		checks.fisheye.v = configIni.config.fisheye

		var_0_2.save(configIni, "AdminHelper/config")

		if var_0_22 then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}FishEye активирован.", -1)
		else
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}FishEye деактивирован.", -1)
		end
	end)
	sampRegisterChatCommand("delstats", function()
		resetstats()
		sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Статистика успешно очищена.", 16776960)
	end)

	local var_11_5 = {
		"recon",
		"re",
		"sp"
	}

	for iter_11_4, iter_11_5 in pairs(var_11_5) do
		sampRegisterChatCommand(iter_11_5, function(arg_44_0)
			lua_thread.create(function()
				wait(0)

				var1 = string.match(arg_44_0, "(.+)")

				if var1 == nil then
					sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /re [id]", 16776960)
				elseif configIni.config.reconcar then
					if var_0_28 ~= true then
						if isCharInAnyCar(PLAYER_PED) then
							resultcar, recarid = sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(PLAYER_PED))

							local var_45_0, var_45_1 = sampGetCarHandleBySampVehicleId(recarid)
							local var_45_2, var_45_3, var_45_4 = getCarCoordinates(storeCarCharIsInNoSave(PLAYER_PED))

							if getDriverOfCar(var_45_1) == 1 then
								temppassenger = true
							else
								temppassenger = false
							end

							warpCharFromCarToCoord(PLAYER_PED, var_45_2, var_45_3, var_45_4)
							wait(150)
							sampSendChat("/re " .. var1)
						else
							recarid = nil
							temppassenger = nil

							sampSendChat("/re " .. var1)
						end
					else
						sampSendChat("/re " .. var1)
					end
				else
					sampSendChat("/re " .. var1)
				end
			end)
		end)
	end

	local var_11_6 = {
		"reoff",
		"spoff"
	}

	for iter_11_6, iter_11_7 in pairs(var_11_6) do
		sampRegisterChatCommand(iter_11_7, function()
			lua_thread.create(function()
				wait(0)

				if configIni.config.reconcar then
					if recarid ~= nil then
						sampSendChat("/reoff")
						wait(2500)

						if not isCharInAnyCar(PLAYER_PED) then
							local var_47_0, var_47_1 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

							if temppassenger then
								if var_47_0 then
									sampSendEnterVehicle(tonumber(recarid), true)
									wait(100)
									warpCharIntoCar(PLAYER_PED, var_47_1)
								elseif configIni.config.admlvl > 2 then
									autotpcar = true

									wait(100)
									sampSendChat("/gotocar " .. recarid)
									wait(2500)

									autotpcar = nil

									local var_47_2, var_47_3 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

									if var_47_2 then
										sampSendEnterVehicle(tonumber(recarid), true)
										wait(100)
										warpCharIntoCar(PLAYER_PED, var_47_3)
									end
								end
							elseif var_47_0 then
								sampSendEnterVehicle(tonumber(recarid), true)
								wait(100)

								for iter_47_0 = 0, getMaximumNumberOfPassengers(var_47_1) do
									if isCarPassengerSeatFree(var_47_1, iter_47_0) == true then
										warpCharIntoCarAsPassenger(PLAYER_PED, var_47_1, iter_47_0)

										return false
									end
								end
							elseif configIni.config.admlvl > 2 then
								autotpcar = true

								wait(100)
								sampSendChat("/gotocar " .. recarid)
								wait(2500)

								autotpcar = nil

								local var_47_4, var_47_5 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

								if var_47_4 then
									sampSendEnterVehicle(tonumber(recarid), true)
									wait(100)

									for iter_47_1 = 0, getMaximumNumberOfPassengers(var_47_5) do
										if isCarPassengerSeatFree(var_47_5, iter_47_1) == true then
											warpCharIntoCarAsPassenger(PLAYER_PED, var_47_5, iter_47_1)

											return false
										end
									end
								end
							end
						end

						recarid = nil
						temppassenger = nil
					else
						sampSendChat("/reoff")
					end
				else
					sampSendChat("/reoff")
				end
			end)
		end)
	end

	sampRegisterChatCommand("admlvl", function(arg_48_0)
		var1 = string.match(arg_48_0, "(%d+)")

		if var1 == nil or not var1:find("(%d+)") or tonumber(var1) < 1 or tonumber(var1) > 9 then
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /admlvl [1-9]", -1)
		else
			configIni.config.admlvl = var1

			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Установлен {85ffff}" .. var1 .. " {d5dedd}уровень администратора.", -1)
			var_0_2.save(configIni, "AdminHelper/config")
		end
	end)
	sampRegisterChatCommand("dmjail", function(arg_51_0)
		var1 = string.match(arg_51_0, "(%d+)")

		if var1 == nil then
			sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /dmjail [id]", -1)
		else
			lua_thread.create(function()
				wait(0)
				sampSendChat("/unjail " .. var1)
				wait(1000)
				sampSendChat("/jail " .. var1 .. " 60 DM in Kpz")
			end)
		end
	end)

	for iter_11_8 = 1, #penaltyIni.cmd do
		sampRegisterChatCommand(penaltyIni.cmd[iter_11_8], function(arg_53_0)
			variable = string.match(arg_53_0, "(.+)")

			if variable == nil then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /" .. penaltyIni.cmd[iter_11_8] .. " [id]", 16776960)
			elseif not tostring(penaltyIni.time[iter_11_8]):find("-") then
				sampSendChat("/" .. penaltyIni.penalty[iter_11_8] .. " " .. variable .. " " .. penaltyIni.time[iter_11_8] .. " " .. penaltyIni.reason[iter_11_8])
			else
				sampSendChat("/" .. penaltyIni.penalty[iter_11_8] .. " " .. variable .. " " .. penaltyIni.reason[iter_11_8])
			end
		end)
	end

	sampRegisterChatCommand("online", function()
		if #var_0_53 == 0 then
			return alert("В данный момент никто не подключен к серверу из тех пользователей, кто есть у вас в списках.")
		end

		alert("В данный момент на сервере находится {85ffff}" .. #var_0_53 .. " {FFFFFF}пользователь(-я, -ей) из ваших списков:")

		for iter_54_0, iter_54_1 in ipairs(var_0_53) do
			alert(iter_54_1.nickname .. "[" .. iter_54_1.id .. "]")
		end

		if #var_0_53 > 10 then
			alert("В данный момент на сервере находится {85ffff}" .. #var_0_53 .. " {FFFFFF}пользователь(-я, -ей) из ваших списков.")
		end
	end)

	local var_11_7 = require("moonloader").font_flag
	local var_11_8 = renderCreateFont("Arial", 12, var_11_7.BOLD + var_11_7.SHADOW)

	if var_0_82.statshud.v == false and var_0_82.invishud.v == false then
		var_0_3.Process = false
	end

	if defaultState and not nameTag then
		nameTagOn()
	end

	local var_11_9 = tonumber(number_week())

	if statsIni.stats.week ~= var_11_9 then
		resetstats()
	end

	local var_11_10 = sampGetBase() + 885672

	getLastUpdate()

	local var_11_11 = {
		"res",
		"response"
	}

	for iter_11_9, iter_11_10 in pairs(var_11_11) do
		sampRegisterChatCommand(iter_11_10, function(arg_55_0)
			local var_55_0 = string.match(arg_55_0, "(.+)")

			if var_55_0 == nil then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /res(ponse) [сообщение]", -1)
			else
				if tonumber(configIni.config.admlvl) ~= nil then
					sendTelegramNotification("[RESPONSE]\n\n" .. var_55_0 .. "\n\nОт: /" .. nick .. "\nЛвл админки: " .. admlvl .. "\nСервер: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1))
				else
					sendTelegramNotification("[RESPONSE]\n\n" .. var_55_0 .. "\n\nОт: /" .. nick .. "\nЛвл админки: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1))
				end

				sampAddChatMessage("{51fffa}[AH] {d5dedd}Response: {51fffa}" .. var_55_0, -1)
			end
		end)
	end

	lua_thread.create(get_telegram_updates)
	lua_thread.create(AH_WARNINGS)

	while true do
		wait(0)

		if configIni.config.scoreboard and sampIsScoreboardOpen() then
			sampToggleScoreboard(false)
		end

		if configIni.config.speedhack and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not sampIsDialogActive() then
			local var_11_12 = storeCarCharIsInNoSave(PLAYER_PED)
			local var_11_13 = getCarSpeed(var_11_12)

			if var_11_13 >= 0 and not isCarInAirProper(var_11_12) and isKeyDown(18) then
				setCarForwardSpeed(var_11_12, var_11_13 + configIni.config.speedhackspd)
			end
		end

		if var_0_24 and isCharInAnyCar(PLAYER_PED) then
			var_0_6.write(9867602, 1, 4)
		else
			var_0_6.write(9867602, 0, 4)
		end

		if configIni.config.autoflip and isCharInAnyCar(PLAYER_PED) then
			local var_11_14 = storeCarCharIsInNoSave(PLAYER_PED)
			local var_11_15 = getCarPitch(var_11_14)

			for iter_11_11 = 0, #var_0_37 do
				if math.ceil(var_11_15) == var_0_37[iter_11_11] then
					addToCarRotationVelocity(var_11_14, 0, 0.05, 0)
				end
			end
		end

		if configIni.config.coup and isKeyJustPressed(46) and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
			local var_11_16 = storeCarCharIsInNoSave(PLAYER_PED)
			local var_11_17, var_11_18, var_11_19 = getOffsetFromCarInWorldCoords(var_11_16, 0, 0, 0)

			setCarCoordinates(var_11_16, var_11_17, var_11_18, var_11_19)
		end

		if configIni.config.turn and isKeyJustPressed(8) and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
			local var_11_20, var_11_21, var_11_22 = getCarSpeedVector(storeCarCharIsInNoSave(PLAYER_PED))

			applyForceToCar(storeCarCharIsInNoSave(PLAYER_PED), -var_11_20 / 25, -var_11_21 / 25, -var_11_22 / 25, 0, 0, 0)

			local var_11_23, var_11_24, var_11_25, var_11_26 = getVehicleQuaternion(storeCarCharIsInNoSave(PLAYER_PED))
			local var_11_27 = {
				convertQuaternionToMatrix(var_11_26, var_11_23, var_11_24, var_11_25)
			}

			var_11_27[1] = -var_11_27[1]
			var_11_27[2] = -var_11_27[2]
			var_11_27[4] = -var_11_27[4]
			var_11_27[5] = -var_11_27[5]
			var_11_27[7] = -var_11_27[7]
			var_11_27[8] = -var_11_27[8]

			local var_11_28, var_11_29, var_11_30, var_11_31 = convertMatrixToQuaternion(var_11_27[1], var_11_27[2], var_11_27[3], var_11_27[4], var_11_27[5], var_11_27[6], var_11_27[7], var_11_27[8], var_11_27[9])

			setVehicleQuaternion(storeCarCharIsInNoSave(PLAYER_PED), var_11_29, var_11_30, var_11_31, var_11_28)
			setCarForwardSpeed(storeCarCharIsInNoSave(PLAYER_PED), 0)
		end

		if configIni.config.jumpcar and isKeyJustPressed(VK_CAPITAL) and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
			jumpcar_function()
		end

		if configIni.config.NoBikeFall and isCharInAnyCar(PLAYER_PED) then
			setCharCanBeKnockedOffBike(PLAYER_PED, true)
		elseif isCharInAnyCar(PLAYER_PED) then
			setCharCanBeKnockedOffBike(PLAYER_PED, false)
		end

		if configIni.config.scoreboard and isKeyJustPressed(VK_TAB) and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsDialogActive() then
			var_0_82.scoreboard.v = not var_0_82.scoreboard.v
		end

		if var_0_22 then
			if isCurrentCharWeapon(PLAYER_PED, 34) and isKeyDown(2) then
				if not var_0_23 then
					cameraSetLerpFov(70, 70, 1000, 1)

					var_0_23 = true
				end
			else
				cameraSetLerpFov(101, 101, 1000, 1)

				var_0_23 = false
			end
		end

		if bubbleBox.active then
			bubbleBox:draw(farchatIni.farchat.positionX, farchatIni.farchat.positionY)

			if isKeyDown(VK_MENU) and not sampIsChatInputActive() and not sampIsDialogActive() and getMousewheelDelta() ~= 0 then
				bubbleBox:scroll(getMousewheelDelta() * -1)
			end
		end

		if isPauseMenuActive() then
			var_0_92.v = false
			checks.autoplus_check.v = false
		else
			var_0_92.v = configIni.config.fr
			checks.autoplus_check.v = configIni.config.autoplus
		end

		if not isPauseMenuActive() then
			checko()
		end

		if HotKeys.menu.v[2] == nil then
			if isKeyJustPressed(HotKeys.menu.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() then
				var_0_82.menu.v = not var_0_82.menu.v
				var_0_3.Process = var_0_82.menu.v
				var_0_82.vip_fastad.v = false
				var_0_82.binds.v = false
				var_0_82.stats.v = false
				var_0_82.announce.v = false
				var_0_82.binder.v = false
				var_0_103.v = false
				var_0_82.cmd.v = false
				var_0_82.penalty.v = false
				var_0_82.settings.v = false
				var_0_82.cheats.v = false
				var_0_82.acar.v = false
				var_0_82.ahgun.v = false
				var_0_82.log.v = false
				var_0_82.farchat.v = false
			end
		elseif isKeyDown(HotKeys.menu.v[1]) and isKeyJustPressed(HotKeys.menu.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			var_0_82.menu.v = not var_0_82.menu.v
			var_0_3.Process = var_0_82.menu.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
			var_0_82.response.v = false
		end

		if var_0_28 and not sampIsChatInputActive() and not sampIsDialogActive() and isKeyJustPressed(VK_V) then
			var_0_82.spectatemenu.v = not var_0_82.spectatemenu.v

			if var_0_3.Process == false then
				var_0_3.Process = var_0_82.spectatemenu.v
			else
				var_0_3.Process = var_0_82.spectatemenu.v
			end
		end

		if HotKeys.changename.v[2] == nil then
			if isKeyJustPressed(HotKeys.changename.v[1]) and not sampIsChatInputActive() and not sampIsDialogActive() and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) then
				var_0_82.changename.v = not var_0_82.changename.v
				var_0_3.Process = var_0_82.changename.v
			end
		elseif isKeyDown(HotKeys.changename.v[1]) and isKeyJustPressed(HotKeys.changename.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			var_0_82.changename.v = not var_0_82.changename.v
			var_0_3.Process = var_0_82.changename.v
		end

		if HotKeys.fastreport.v[2] == nil then
			if isKeyJustPressed(HotKeys.fastreport.v[1]) and not sampIsChatInputActive() and not sampIsDialogActive() and not var_0_13 and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) then
				var_0_82.fastreport.v = not var_0_82.fastreport.v
				var_0_3.Process = var_0_82.fastreport.v
			end
		elseif isKeyDown(HotKeys.fastreport.v[1]) and isKeyJustPressed(HotKeys.fastreport.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() and not var_0_13 then
			var_0_82.fastreport.v = not var_0_82.fastreport.v
			var_0_3.Process = var_0_82.fastreport.v
		end

		if HotKeys.rtools.v[2] == nil and (not isKeyJustPressed(HotKeys.rtools.v[1]) or sampIsChatInputActive() or sampIsDialogActive() or var_0_13 or isKeyDown(VK_MENU) or isKeyDown(VK_SHIFT) or isKeyDown(VK_CONTROL) or true) then
			-- block empty
		elseif isKeyDown(HotKeys.rtools.v[1]) and isKeyJustPressed(HotKeys.rtools.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() and not var_0_13 then
			-- block empty
		end

		if HotKeys.fastpm.v[2] == nil then
			if isKeyJustPressed(HotKeys.fastpm.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() and fastpm ~= nil then
				sampSetChatInputEnabled(true)
				sampSetChatInputText("/pm " .. fastpm .. " ")
			end
		elseif isKeyDown(HotKeys.fastpm.v[1]) and isKeyJustPressed(HotKeys.fastpm.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() and fastpm ~= nil then
			sampSetChatInputEnabled(true)
			sampSetChatInputText("/pm " .. fastpm .. " ")
		end

		if HotKeys.fastre.v[2] == nil then
			if isKeyJustPressed(HotKeys.fastre.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() and fastpm ~= nil then
				sampSetChatInputEnabled(true)
				sampSetChatInputText("/re " .. fastpm .. " ")
			end
		elseif isKeyDown(HotKeys.fastre.v[1]) and isKeyJustPressed(HotKeys.fastre.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() and fastpm ~= nil then
			sampSetChatInputEnabled(true)
			sampSetChatInputText("/re " .. fastpm .. " ")
		end

		if HotKeys.update.v[2] == nil then
			if isKeyJustPressed(HotKeys.update.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() then
				sampSendChat("/update")
			end
		elseif isKeyDown(HotKeys.update.v[1]) and isKeyJustPressed(HotKeys.update.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			sampSendChat("/update")
		end

		if HotKeys.reoff.v[2] == nil then
			if isKeyJustPressed(HotKeys.reoff.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() then
				if recarid == nil then
					sampSendChat("/reoff")
				else
					lua_thread.create(function()
						wait(0)

						if configIni.config.reconcar then
							if recarid ~= nil then
								sampSendChat("/reoff")
								wait(2500)

								if not isCharInAnyCar(PLAYER_PED) then
									local var_56_0, var_56_1 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

									if temppassenger then
										if var_56_0 then
											sampSendEnterVehicle(tonumber(recarid), true)
											wait(100)
											warpCharIntoCar(PLAYER_PED, var_56_1)
										elseif configIni.config.admlvl > 2 then
											autotpcar = true

											wait(100)
											sampSendChat("/gotocar " .. recarid)
											wait(2500)

											autotpcar = nil

											local var_56_2, var_56_3 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

											if var_56_2 then
												sampSendEnterVehicle(tonumber(recarid), true)
												wait(100)
												warpCharIntoCar(PLAYER_PED, var_56_3)
											end
										end
									elseif var_56_0 then
										sampSendEnterVehicle(tonumber(recarid), true)
										wait(100)

										for iter_56_0 = 0, getMaximumNumberOfPassengers(var_56_1) do
											if isCarPassengerSeatFree(var_56_1, iter_56_0) == true then
												warpCharIntoCarAsPassenger(PLAYER_PED, var_56_1, iter_56_0)

												return false
											end
										end
									elseif configIni.config.admlvl > 2 then
										autotpcar = true

										wait(100)
										sampSendChat("/gotocar " .. recarid)
										wait(2500)

										autotpcar = nil

										local var_56_4, var_56_5 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

										if var_56_4 then
											sampSendEnterVehicle(tonumber(recarid), true)
											wait(100)

											for iter_56_1 = 0, getMaximumNumberOfPassengers(var_56_5) do
												if isCarPassengerSeatFree(var_56_5, iter_56_1) == true then
													warpCharIntoCarAsPassenger(PLAYER_PED, var_56_5, iter_56_1)

													return false
												end
											end
										end
									end
								end

								recarid = nil
								temppassenger = nil
							else
								sampSendChat("/reoff")
							end
						else
							sampSendChat("/reoff")
						end
					end)
				end
			end
		elseif isKeyDown(HotKeys.reoff.v[1]) and isKeyJustPressed(HotKeys.reoff.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			if recarid == nil then
				sampSendChat("/reoff")
			else
				lua_thread.create(function()
					wait(0)

					if configIni.config.reconcar then
						if recarid ~= nil then
							sampSendChat("/reoff")
							wait(2500)

							if not isCharInAnyCar(PLAYER_PED) then
								local var_57_0, var_57_1 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

								if temppassenger then
									if var_57_0 then
										sampSendEnterVehicle(tonumber(recarid), true)
										wait(100)
										warpCharIntoCar(PLAYER_PED, var_57_1)
									elseif configIni.config.admlvl > 2 then
										autotpcar = true

										wait(100)
										sampSendChat("/gotocar " .. recarid)
										wait(2500)

										autotpcar = nil

										local var_57_2, var_57_3 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

										if var_57_2 then
											sampSendEnterVehicle(tonumber(recarid), true)
											wait(100)
											warpCharIntoCar(PLAYER_PED, var_57_3)
										end
									end
								elseif var_57_0 then
									sampSendEnterVehicle(tonumber(recarid), true)
									wait(100)

									for iter_57_0 = 0, getMaximumNumberOfPassengers(var_57_1) do
										if isCarPassengerSeatFree(var_57_1, iter_57_0) == true then
											warpCharIntoCarAsPassenger(PLAYER_PED, var_57_1, iter_57_0)

											return false
										end
									end
								elseif configIni.config.admlvl > 2 then
									autotpcar = true

									wait(100)
									sampSendChat("/gotocar " .. recarid)
									wait(2500)

									autotpcar = nil

									local var_57_4, var_57_5 = sampGetCarHandleBySampVehicleId(tonumber(recarid))

									if var_57_4 then
										sampSendEnterVehicle(tonumber(recarid), true)
										wait(100)

										for iter_57_1 = 0, getMaximumNumberOfPassengers(var_57_5) do
											if isCarPassengerSeatFree(var_57_5, iter_57_1) == true then
												warpCharIntoCarAsPassenger(PLAYER_PED, var_57_5, iter_57_1)

												return false
											end
										end
									end
								end
							end

							recarid = nil
							temppassenger = nil
						else
							sampSendChat("/reoff")
						end
					else
						sampSendChat("/reoff")
					end
				end)
			end
		end

		if developer.v1:find(nick) and var_0_28 and isKeyJustPressed(VK_H) and not sampIsChatInputActive() and not sampIsDialogActive() then
			sampSendChat("/finvite " .. spectate_id)
		end

		if HotKeys.pm.v[2] == nil then
			if isKeyJustPressed(HotKeys.pm.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() then
				sampSetChatInputText("/pm ")
				sampSetChatInputCursor(4, 4)
				sampSetChatInputEnabled(true)
			end
		elseif isKeyDown(HotKeys.pm.v[1]) and isKeyJustPressed(HotKeys.pm.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			sampSetChatInputText("/pm ")
			sampSetChatInputCursor(4, 4)
			sampSetChatInputEnabled(true)
		end

		if HotKeys.re.v[2] == nil then
			if isKeyJustPressed(HotKeys.re.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() then
				sampSetChatInputText("/re ")
				sampSetChatInputCursor(4, 4)
				sampSetChatInputEnabled(true)
			end
		elseif isKeyDown(HotKeys.re.v[1]) and isKeyJustPressed(HotKeys.re.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			sampSetChatInputText("/re ")
			sampSetChatInputCursor(4, 4)
			sampSetChatInputEnabled(true)
		end

		if HotKeys.map.v[2] == nil then
			if isKeyJustPressed(HotKeys.map.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() then
				writeMemory(var_11_0 + 51, 1, 1, false)
				wait(0)
				writeMemory(var_11_0 + 348, 1, 1, false)
				writeMemory(var_11_0 + 349, 1, 5, false)

				if reduceZoom then
					writeMemory(var_11_0 + 100, 4, representFloatAsInt(300), false)
				end

				while isKeyDown(HotKeys.map.v[1]) do
					wait(80)
				end

				writeMemory(var_11_0 + 50, 1, 1, false)
			end
		elseif isKeyDown(HotKeys.map.v[1]) and isKeyJustPressed(HotKeys.map.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			writeMemory(var_11_0 + 51, 1, 1, false)
			wait(0)
			writeMemory(var_11_0 + 348, 1, 1, false)
			writeMemory(var_11_0 + 349, 1, 5, false)

			if reduceZoom then
				writeMemory(var_11_0 + 100, 4, representFloatAsInt(300), false)
			end

			while isKeyDown(HotKeys.map.v[1]) do
				wait(80)
			end

			writeMemory(var_11_0 + 50, 1, 1, false)
		end

		if HotKeys.wallhack.v[2] == nil then
			if wasKeyPressed(HotKeys.wallhack.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) then
				if defaultState then
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}WallHack активирован.", 16776960)

					defaultState = false

					nameTagOff()

					while isKeyDown(VK_F5) do
						wait(100)
					end
				else
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}WallHack активирован.", 16776960)

					defaultState = true

					if whVisible ~= "bones" and not nameTag then
						nameTagOn()
					end

					while isKeyDown(VK_F5) do
						wait(100)
					end
				end
			end
		elseif isKeyDown(HotKeys.wallhack.v[1]) and isKeyJustPressed(HotKeys.wallhack.v[2]) then
			if defaultState then
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}WallHack активирован.", 16776960)

				defaultState = false

				nameTagOff()

				while isKeyDown(HotKeys.wallhack.v[1]) and isKeyJustPressed(HotKeys.wallhack.v[2]) do
					wait(100)
				end
			else
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}WallHack активирован.", 16776960)

				defaultState = true

				if whVisible ~= "bones" and not nameTag then
					nameTagOn()
				end

				while isKeyDown(HotKeys.wallhack.v[1]) do
					wait(100)
				end
			end
		end

		if HotKeys.invisible.v[2] == nil then
			if wasKeyPressed(HotKeys.invisible.v[1]) and not isKeyDown(VK_MENU) and not isKeyDown(VK_SHIFT) and not isKeyDown(VK_CONTROL) and not sampIsChatInputActive() and not sampIsDialogActive() then
				var_0_27 = not var_0_27

				if var_0_27 then
					var_0_82.invishud.v = true
				else
					var_0_82.invishud.v = false
				end
			end
		elseif isKeyDown(HotKeys.invisible.v[1]) and isKeyJustPressed(HotKeys.invisible.v[2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			var_0_27 = not var_0_27

			if var_0_27 then
				var_0_82.invishud.v = true
			else
				var_0_82.invishud.v = false
			end
		end

		if configIni.config.rideonwater and isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not sampIsDialogActive() and isKeyJustPressed(VK_X) then
			var_0_24 = not var_0_24
		end

		if isKeyDown(VK_MENU) and isKeyJustPressed(VK_R) then
			fastreport:run()
		end

		if checks.binder_check.v == true or var_0_32 == true then
			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_1) then
				local var_11_39 = {
					binderIni.binder.CTRL1,
					binderIni.binder.CTRL1_2,
					binderIni.binder.CTRL1_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_39[math.random(1, #var_11_39)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_39[math.random(1, #var_11_39)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_39[math.random(1, #var_11_39)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_2) then
				local var_11_40 = {
					binderIni.binder.CTRL2,
					binderIni.binder.CTRL2_2,
					binderIni.binder.CTRL2_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_40[math.random(1, #var_11_40)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_40[math.random(1, #var_11_40)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_40[math.random(1, #var_11_40)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_3) then
				local var_11_41 = {
					binderIni.binder.CTRL3,
					binderIni.binder.CTRL3_2,
					binderIni.binder.CTRL3_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_41[math.random(1, #var_11_41)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_41[math.random(1, #var_11_41)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_41[math.random(1, #var_11_41)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_4) then
				local var_11_42 = {
					binderIni.binder.CTRL4,
					binderIni.binder.CTRL4_2,
					binderIni.binder.CTRL4_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_42[math.random(1, #var_11_42)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_42[math.random(1, #var_11_42)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_42[math.random(1, #var_11_42)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_5) then
				local var_11_43 = {
					binderIni.binder.CTRL5,
					binderIni.binder.CTRL5_2,
					binderIni.binder.CTRL5_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_43[math.random(1, #var_11_43)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_43[math.random(1, #var_11_43)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_43[math.random(1, #var_11_43)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_6) then
				local var_11_44 = {
					binderIni.binder.CTRL6,
					binderIni.binder.CTRL6_2,
					binderIni.binder.CTRL6_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_44[math.random(1, #var_11_44)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_44[math.random(1, #var_11_44)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_44[math.random(1, #var_11_44)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_7) then
				local var_11_45 = {
					binderIni.binder.CTRL7,
					binderIni.binder.CTRL7_2,
					binderIni.binder.CTRL7_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_45[math.random(1, #var_11_45)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_45[math.random(1, #var_11_45)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_45[math.random(1, #var_11_45)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_8) then
				local var_11_46 = {
					binderIni.binder.CTRL8,
					binderIni.binder.CTRL8_2,
					binderIni.binder.CTRL8_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_46[math.random(1, #var_11_46)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_46[math.random(1, #var_11_46)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_46[math.random(1, #var_11_46)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_9) then
				local var_11_47 = {
					binderIni.binder.CTRL9,
					binderIni.binder.CTRL9_2,
					binderIni.binder.CTRL9_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_47[math.random(1, #var_11_47)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_47[math.random(1, #var_11_47)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_47[math.random(1, #var_11_47)])
				end
			end

			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_0) then
				local var_11_48 = {
					binderIni.binder.CTRL0,
					binderIni.binder.CTRL0_2,
					binderIni.binder.CTRL0_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_48[math.random(1, #var_11_48)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_48[math.random(1, #var_11_48)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_48[math.random(1, #var_11_48)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_1) then
				local var_11_49 = {
					binderIni.binder.ALT1,
					binderIni.binder.ALT1_2,
					binderIni.binder.ALT1_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_49[math.random(1, #var_11_49)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_49[math.random(1, #var_11_49)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_49[math.random(1, #var_11_49)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_2) then
				local var_11_50 = {
					binderIni.binder.ALT2,
					binderIni.binder.ALT2_2,
					binderIni.binder.ALT2_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_50[math.random(1, #var_11_50)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_50[math.random(1, #var_11_50)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_50[math.random(1, #var_11_50)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_3) then
				local var_11_51 = {
					binderIni.binder.ALT3,
					binderIni.binder.ALT3_2,
					binderIni.binder.ALT3_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_51[math.random(1, #var_11_51)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_51[math.random(1, #var_11_51)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_51[math.random(1, #var_11_51)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_4) then
				local var_11_52 = {
					binderIni.binder.ALT4,
					binderIni.binder.ALT4_2,
					binderIni.binder.ALT4_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_52[math.random(1, #var_11_52)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_52[math.random(1, #var_11_52)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_52[math.random(1, #var_11_52)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_5) then
				local var_11_53 = {
					binderIni.binder.ALT5,
					binderIni.binder.ALT5_2,
					binderIni.binder.ALT5_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_53[math.random(1, #var_11_53)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_53[math.random(1, #var_11_53)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_53[math.random(1, #var_11_53)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_6) then
				local var_11_54 = {
					binderIni.binder.ALT6,
					binderIni.binder.ALT6_2,
					binderIni.binder.ALT6_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_54[math.random(1, #var_11_54)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_54[math.random(1, #var_11_54)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_54[math.random(1, #var_11_54)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_7) then
				local var_11_55 = {
					binderIni.binder.ALT7,
					binderIni.binder.ALT7_2,
					binderIni.binder.ALT7_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_55[math.random(1, #var_11_55)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_55[math.random(1, #var_11_55)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_55[math.random(1, #var_11_55)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_8) then
				local var_11_56 = {
					binderIni.binder.ALT8,
					binderIni.binder.ALT8_2,
					binderIni.binder.ALT8_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_56[math.random(1, #var_11_56)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_56[math.random(1, #var_11_56)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_56[math.random(1, #var_11_56)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_9) then
				local var_11_57 = {
					binderIni.binder.ALT9,
					binderIni.binder.ALT9_2,
					binderIni.binder.ALT9_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_57[math.random(1, #var_11_57)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_57[math.random(1, #var_11_57)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_57[math.random(1, #var_11_57)])
				end
			end

			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_0) then
				local var_11_58 = {
					binderIni.binder.ALT0,
					binderIni.binder.ALT0_2,
					binderIni.binder.ALT0_3
				}

				math.randomseed(os.time())

				if var_0_32 == false then
					if not sampIsDialogActive() then
						sampSetChatInputText("/pm  " .. var_11_58[math.random(1, #var_11_58)])
						sampSetChatInputCursor(4, 4)
						sampSetChatInputEnabled(true)
					else
						sampSetCurrentDialogEditboxText(var_11_58[math.random(1, #var_11_58)]:gsub("/pm (.+)", "%1"))
					end
				else
					buffers.RTAnswer.v = u8(var_11_58[math.random(1, #var_11_58)])
				end
			end
		end

		if autogive == 1 and isKeyJustPressed(VK_F2) then
			if os.clock() - timerok <= 9 then
				if ActAdmNick ~= nil and ActsAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil and ActParam2 == nil and ActParam3 == nil then
					if var_0_69.v == 1 then
						sampSendChat("/" .. ActCommand .. " " .. ActParam1 .. " | " .. ActsAdmNick)
					else
						sampSendChat("/" .. ActCommand .. " " .. ActParam1 .. " | " .. ActAdmNick)
					end

					ActAdmNick, ActsAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
					autogive = 0
				elseif ActAdmNick ~= nil and ActsAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil and ActParam2 ~= nil and ActParam3 == nil then
					if var_0_69.v == 1 then
						sampSendChat("/" .. ActCommand .. " " .. ActParam1 .. " " .. ActParam2 .. " | " .. ActsAdmNick)
					else
						sampSendChat("/" .. ActCommand .. " " .. ActParam1 .. " " .. ActParam2 .. " | " .. ActAdmNick)
					end

					ActAdmNick, ActsAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
					autogive = 0
				elseif ActAdmNick ~= nil and ActsAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil and ActParam2 ~= nil and ActParam3 ~= nil then
					if var_0_69.v == 1 then
						sampSendChat("/" .. ActCommand .. " " .. ActParam1 .. " " .. ActParam2 .. " " .. ActParam3 .. " | " .. ActsAdmNick)
					else
						sampSendChat("/" .. ActCommand .. " " .. ActParam1 .. " " .. ActParam2 .. " " .. ActParam3 .. " | " .. ActAdmNick)
					end

					ActAdmNick, ActsAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
					autogive = 0
				end

				if idappv ~= nil and ActAdmNick == nil then
					if waitappv ~= nil then
						sampProcessChatInput("/appv " .. idappv)

						idappv = nil
						waitappv = nil
						autogive = 0
					else
						idappv = nil
						waitappv = nil
						autogive = 0

						sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Другой администратор уже подтвердил запрос.", -1)
					end
				end

				if ido ~= nil and ActAdmNick == nil then
					autoOfunc:run()
				end

				if idmpgun ~= nil and ActAdmNick == nil then
					if var_0_73 == 0 then
						var_0_73 = 1

						lua_thread.create(function()
							wait(0)
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Выдаем оружие " .. idmpgun .. " id...", 16776960)
							wait(500)
							sampSendChat("/agun " .. idmpgun .. " 24 500")
							wait(1000)
							sampSendChat("/agun " .. idmpgun .. " 24 500")
							wait(1000)
							sampSendChat("/agun " .. idmpgun .. " 31 500")
							wait(1000)
							sampSendChat("/agun " .. idmpgun .. " 31 500")
							wait(1000)
							sampSendChat("/agun " .. idmpgun .. " 31 500")
							wait(500)
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Выдано.", 16776960)

							var_0_73 = 0
							idmpgun = nil
							autogive = 0
						end)
					else
						sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ожидайте, оружие игроку уже выдается.", 16776960)

						idmpgun = nil
						autogive = 0
					end
				end
			else
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Время ожидания истекло.", -1)

				ActAdmNick, ActsAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
				idappv = nil
				waitappv = nil
				nickido1, nickido, ido, texto = nil
				waito = nil
				idmpgun = nil
				autogive = 0
			end
		end

		if var_0_82.menu.v or var_0_82.changename.v or var_0_82.acar.v or var_0_82.ahgun.v or var_0_82.mpwin.v or var_0_82.ppv.v or var_0_82.acheck.v or var_0_82.ipaccounts.v or var_0_82.cheats.v or var_0_82.fastreport.v or var_0_82.rtools.v or var_0_82.stats.v or var_0_82.ears.v or var_0_82.vip_fastad.v or var_0_82.spectatemenu.v or var_0_82.scoreboard.v then
			var_0_3.ShowCursor = true
		elseif var_0_82.statshud.v or var_0_82.invishud.v then
			var_0_3.Process = true
			var_0_3.ShowCursor = false
		else
			var_0_3.Process = false
			var_0_3.ShowCursor = false
		end

		if var_0_82.ppv.v == false and var_0_82.acheck.v == false then
			var_0_82.ipaccounts.v = false
			var_0_82.offstats.v = false
			var_0_82.anamestore.v = false
			var_0_82.connections.v = false
		end

		if configIni.config.clickwarp and var_0_82.menu.v == false and var_0_82.changename.v == false and var_0_82.acar.v == false and var_0_82.ahgun.v == false and var_0_82.mpwin.v == false and var_0_82.ppv.v == false and var_0_82.acheck.v == false and var_0_82.ipaccounts.v == false and var_0_82.cheats.v == false and var_0_82.fastreport.v == false and var_0_82.rtools.v == false and var_0_82.stats.v == false and var_0_82.ears.v == false and var_0_82.vip_fastad.v == false and var_0_82.spectatemenu.v == false and var_0_82.scoreboard.v == false then
			warptp()
		end

		if configIni.config.wallhack == true and defaultState and whVisible ~= "names" then
			if not isPauseMenuActive() then
				for iter_11_13 = 0, sampGetMaxPlayerId() do
					if sampIsPlayerConnected(iter_11_13) then
						local var_11_59, var_11_60 = sampGetCharHandleBySampPlayerId(iter_11_13)
						local var_11_61 = sampGetPlayerColor(iter_11_13)
						local var_11_62, var_11_63, var_11_64, var_11_65 = explode_argb(var_11_61)
						local var_11_66 = join_argb(255, var_11_63, var_11_64, var_11_65)

						if var_11_59 and doesCharExist(var_11_60) and isCharOnScreen(var_11_60) then
							local var_11_67 = {
								3,
								4,
								5,
								51,
								52,
								41,
								42,
								31,
								32,
								33,
								21,
								22,
								23,
								2
							}

							for iter_11_14 = 1, #var_11_67 do
								pos1X, pos1Y, pos1Z = getBodyPartCoordinates(var_11_67[iter_11_14], var_11_60)
								pos2X, pos2Y, pos2Z = getBodyPartCoordinates(var_11_67[iter_11_14] + 1, var_11_60)
								pos1, pos2 = convert3DCoordsToScreen(pos1X, pos1Y, pos1Z)
								pos3, pos4 = convert3DCoordsToScreen(pos2X, pos2Y, pos2Z)

								renderDrawLine(pos1, pos2, pos3, pos4, 1, var_11_66)
							end

							for iter_11_15 = 4, 5 do
								pos2X, pos2Y, pos2Z = getBodyPartCoordinates(iter_11_15 * 10 + 1, var_11_60)
								pos3, pos4 = convert3DCoordsToScreen(pos2X, pos2Y, pos2Z)

								renderDrawLine(pos1, pos2, pos3, pos4, 1, var_11_66)
							end

							local var_11_68 = {
								53,
								43,
								24,
								34,
								6
							}

							for iter_11_16 = 1, #var_11_68 do
								posX, posY, posZ = getBodyPartCoordinates(var_11_68[iter_11_16], var_11_60)
								pos1, pos2 = convert3DCoordsToScreen(posX, posY, posZ)
							end
						end
					end
				end
			else
				nameTagOff()

				while isPauseMenuActive() do
					wait(0)
				end

				nameTagOn()
			end
		end

		if defaultState and whVisible == "names" and not isPauseMenuActive() then
			nameTagOn()
		end

		if defaultState == false and whVisible == "off" and not isPauseMenuActive() then
			nameTagOff()
		end

		if configIni.config.godmode == true then
			local var_11_69 = isCharInAnyCar(playerPed)
			local var_11_70

			if getCharHealth(PLAYER_PED) < 95 then
				setCharHealth(PLAYER_PED, 100)
				sampSendChat("/agm")
			end

			setCharProofs(PLAYER_PED, true, true, true, true, true)
			writeMemory(9867630, 1, 1, false)
			writeMemory(9867629, 1, 1, false)

			if var_11_69 then
				local var_11_71 = storeCarCharIsInNoSave(playerPed)

				setCarProofs(var_11_71, true, true, true, true, true)
				setCanBurstCarTires(var_11_71, false)

				if isCarUpsidedown(var_11_71) then
					setCarHealth(var_11_71, 1000)
				end
			end
		else
			local var_11_72 = isCharInAnyCar(playerPed)
			local var_11_73

			setCharProofs(PLAYER_PED, false, false, false, false, false)
			writeMemory(9867630, 1, 0, false)
			writeMemory(9867629, 1, 0, false)

			if var_11_72 then
				local var_11_74 = storeCarCharIsInNoSave(playerPed)

				setCarProofs(var_11_74, false, false, false, false, false)
				setCanBurstCarTires(var_11_74, true)

				if isCarUpsidedown(var_11_74) then
					setCarHealth(var_11_74, 1000)
				end
			end
		end

		if configIni.config.nofall == true and (isCharPlayingAnim(playerPed, "KO_SKID_BACK") or isCharPlayingAnim(playerPed, "FALL_COLLAPSE")) then
			local var_11_75, var_11_76, var_11_77 = getCharCoordinates(playerPed)

			setCharCoordinates(playerPed, var_11_75, var_11_76, var_11_77 - 1)
		end

		if configIni.config.nochatanim == true and isCharPlayingAnim(playerPed, "IDLE_CHAT") then
			local var_11_78, var_11_79, var_11_80 = getCharCoordinates(playerPed)

			setCharCoordinates(playerPed, var_11_78, var_11_79, var_11_80 - 1)
		end

		if configIni.config.highjump == true then
			writeMemory(9867628, 1, 1, false)
		else
			writeMemory(9867628, 1, 0, false)
		end

		if configIni.config.infiniteammo == true then
			writeMemory(9867640, 1, 1, false)
		else
			writeMemory(9867640, 1, 0, false)
		end

		if configIni.config.fastwalk == true then
			if fastwalkhud ~= nil and os.clock() - fastwalkhud <= 2.5 then
				renderFontDrawText(font3, "{8f0000}FastWalk speed: " .. var_0_15, 650, 670, 4294967295)
			end

			if isKeyJustPressed(VK_OEM_PLUS) and not sampIsChatInputActive() then
				if var_0_15 < 15 then
					var_0_15 = var_0_15 + 0.1
				end

				setPlayerNeverGetsTired(PLAYER_HANDLE, true)

				fastwalkhud = os.clock()
			end

			if isKeyJustPressed(VK_OEM_MINUS) and not sampIsChatInputActive() then
				if var_0_15 > 0.5 then
					var_0_15 = var_0_15 - 0.1
				end

				setPlayerNeverGetsTired(PLAYER_HANDLE, true)

				fastwalkhud = os.clock()
			end

			if isKeyJustPressed(VK_MULTIPLY) and var_0_13 == false and not sampIsChatInputActive() then
				var_0_15 = 1

				setPlayerNeverGetsTired(PLAYER_HANDLE, false)

				fastwalkhud = os.clock()
			end

			if var_0_15 ~= 1 then
				applySpeed()
			end
		end

		if var_0_96.dl.v then
			local var_11_81 = var_0_6.unprotect(var_11_10, 135)

			var_0_11.copy(var_0_11.cast("void*", var_11_10), "[id: %d, type: %d subtype: %d Health: %.1f]", 135)
			var_0_6.protect(var_11_10, var_11_81)
		else
			local var_11_82 = var_0_6.unprotect(var_11_10, 135)

			var_0_11.copy(var_0_11.cast("void*", var_11_10), "[id: %d, type: %d subtype: %d Health: %.1f preloaded: %u]\nDistance: %.2fm\nPassengerSeats: %u\ncPos: %.3f,%.3f,%.3f\nsPos: %.3f,%.3f,%.3f", 135)
			var_0_6.protect(var_11_10, var_11_82)
		end

		if configIni.config.airbrake then
			if airbrkhud ~= nil and os.clock() - airbrkhud <= 2.5 then
				renderFontDrawText(font3, "{8f0000}AirBrake speed: " .. var_0_14, 650, 670, 4294967295)
			end

			if var_0_13 == true and isKeyJustPressed(VK_MULTIPLY) and not sampIsChatInputActive() then
				var_0_14 = 1
				airbrkhud = os.clock()
			end

			if wasKeyPressed(VK_RSHIFT) and not sampIsChatInputActive() then
				var_0_13 = not var_0_13
				posX, posY, posZ = getCharCoordinates(playerPed)
				var_0_12 = {
					posX,
					posY,
					posZ,
					0,
					0,
					getCharHeading(playerPed)
				}
			end

			if var_0_13 then
				if wasKeyPressed(VK_E) and not sampIsChatInputActive() then
					if var_0_14 < 10 then
						var_0_14 = var_0_14 + 0.1
					end

					airbrkhud = os.clock()
				end

				if wasKeyPressed(VK_Q) and not sampIsChatInputActive() then
					if var_0_14 > 0.2 then
						var_0_14 = var_0_14 - 0.1
					end

					airbrkhud = os.clock()
				end

				if isCharInAnyCar(playerPed) then
					heading = getCarHeading(storeCarCharIsInNoSave(playerPed))
				else
					heading = getCharHeading(playerPed)
				end

				camCoordX, camCoordY, camCoordZ = getActiveCameraCoordinates()
				targetCamX, targetCamY, targetCamZ = getActiveCameraPointAt()
				angle = getHeadingFromVector2d(targetCamX - camCoordX, targetCamY - camCoordY)

				if isCharInAnyCar(playerPed) then
					difference = 0.79
				else
					difference = 1
				end

				setCharCoordinates(playerPed, var_0_12[1], var_0_12[2], var_0_12[3] - difference)

				if isKeyDown(VK_W) and not sampIsChatInputActive() then
					var_0_12[1] = var_0_12[1] + var_0_14 * math.sin(-math.rad(angle))
					var_0_12[2] = var_0_12[2] + var_0_14 * math.cos(-math.rad(angle))

					if not isCharInAnyCar(playerPed) then
						setCharHeading(playerPed, angle)
					else
						setCarHeading(storeCarCharIsInNoSave(playerPed), angle)
					end
				elseif isKeyDown(VK_S) and not sampIsChatInputActive() then
					var_0_12[1] = var_0_12[1] - var_0_14 * math.sin(-math.rad(heading))
					var_0_12[2] = var_0_12[2] - var_0_14 * math.cos(-math.rad(heading))
				end

				if isKeyDown(VK_A) and not sampIsChatInputActive() then
					var_0_12[1] = var_0_12[1] - var_0_14 * math.sin(-math.rad(heading - 90))
					var_0_12[2] = var_0_12[2] - var_0_14 * math.cos(-math.rad(heading - 90))
				elseif isKeyDown(VK_D) and not sampIsChatInputActive() then
					var_0_12[1] = var_0_12[1] - var_0_14 * math.sin(-math.rad(heading + 90))
					var_0_12[2] = var_0_12[2] - var_0_14 * math.cos(-math.rad(heading + 90))
				end

				if isKeyDown(VK_SPACE) and not sampIsChatInputActive() then
					var_0_12[3] = var_0_12[3] + var_0_14 / 2
				end

				if isKeyDown(VK_LSHIFT) and not sampIsChatInputActive() and var_0_12[3] > -95 then
					var_0_12[3] = var_0_12[3] - var_0_14 / 2
				end
			end
		end
	end
end

function jumpcar_function()
	lua_thread.create(function()
		while isKeyDown(VK_CAPITAL) do
			local var_60_0, var_60_1, var_60_2 = getCarSpeedVector(storeCarCharIsInNoSave(PLAYER_PED))

			if var_60_2 < 7 then
				applyForceToCar(storeCarCharIsInNoSave(PLAYER_PED), 0, 0, 0.2, 0, 0, 0)
			end

			wait(50)
		end
	end)
end

function AH_WARNINGS()
	while configIni.config.namewarning do
		for iter_61_0 = 0, sampGetMaxPlayerId() do
			if sampIsPlayerConnected(iter_61_0) then
				local var_61_0 = false
				local var_61_1 = sampGetPlayerNickname(iter_61_0)
				local var_61_2 = iter_61_0

				for iter_61_1 = 1, #warningsIni.whitelist do
					if var_61_1:find(warningsIni.whitelist[iter_61_1]) then
						var_61_0 = true
					end
				end

				if var_61_0 == false then
					for iter_61_2 = 1, #var_0_30 do
						if var_61_1:find(var_0_30[iter_61_2]) then
							sampAddChatMessage("{51fffa}[AH] {FF0000}[WARNING] {d5dedd}Вероятно, у " .. var_61_1 .. "[" .. var_61_2 .. "] некорректный никнейм (Если это не так, введите: /wl " .. var_61_2 .. ")", -1)
						end
					end
				end
			end
		end

		wait(tonumber(configIni.config.timewarning))
	end
end

function var_0_0.onPlayerDeathNotification(arg_62_0, arg_62_1, arg_62_2)
	if checks.killlistid.v then
		local var_62_0 = var_0_11.cast("struct stKillInfo*", sampGetKillInfoPtr())
		local var_62_1, var_62_2 = sampGetPlayerIdByCharHandle(playerPed)
		local var_62_3 = (sampIsPlayerConnected(arg_62_0) or arg_62_0 == var_62_2) and sampGetPlayerNickname(arg_62_0) or nil
		local var_62_4 = (sampIsPlayerConnected(arg_62_1) or arg_62_1 == var_62_2) and sampGetPlayerNickname(arg_62_1) or nil

		lua_thread.create(function()
			wait(0)

			if var_62_3 then
				var_62_0.killEntry[4].szKiller = var_0_11.new("char[25]", (var_62_3 .. "[" .. arg_62_0 .. "]"):sub(1, 24))
			end

			if var_62_4 then
				var_62_0.killEntry[4].szVictim = var_0_11.new("char[25]", (var_62_4 .. "[" .. arg_62_1 .. "]"):sub(1, 24))
			end
		end)
	end
end

function var_0_0.onDisplayGameText(arg_65_0, arg_65_1, arg_65_2)
	if configIni.config.godmode == true then
		if arg_65_2:find("~g~GODMODE ON") then
			return false
		end

		if arg_65_2:find("~r~GODMODE OFF") then
			lua_thread.create(function()
				wait(1000)
				sampSendChat("/agm")
			end)

			return false
		end
	end

	if arg_65_2:find("PLAYER DISCONNECTED") then
		var_0_3.ShowCursor = false
	end
end

function var_0_0.onRemovePlayerFromVehicle()
	return false
end

function var_0_0.onPlayerChatBubble(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4)
	if sampIsPlayerConnected(arg_69_0) and bubbleBox then
		bubbleBox:add_message(arg_69_0, arg_69_1, arg_69_2, arg_69_4)
	end
end

function onExitScript()
	if bubbleBox then
		bubbleBox:free()
	end
end

function number_week()
	local var_71_0 = 3
	local var_71_1 = os.time(os.date("!*t")) + var_71_0 * 60 * 60
	local var_71_2 = os.date("*t", var_71_1)
	local var_71_3 = os.time({
		month = 1,
		day = 1,
		year = var_71_2.year
	})
	local var_71_4 = (os.date("%w", var_71_3) - 1) % 7

	return math.ceil((var_71_2.yday + var_71_4) / 7)
end

function resetstats()
	local var_72_0 = tonumber(number_week())

	statsIni.stats.report0 = 0
	statsIni.stats.report1 = 0
	statsIni.stats.report2 = 0
	statsIni.stats.report3 = 0
	statsIni.stats.report4 = 0
	statsIni.stats.report5 = 0
	statsIni.stats.report6 = 0
	statsIni.stats.mute0 = 0
	statsIni.stats.mute1 = 0
	statsIni.stats.mute2 = 0
	statsIni.stats.mute3 = 0
	statsIni.stats.mute4 = 0
	statsIni.stats.mute5 = 0
	statsIni.stats.mute6 = 0
	statsIni.stats.jail0 = 0
	statsIni.stats.jail1 = 0
	statsIni.stats.jail2 = 0
	statsIni.stats.jail3 = 0
	statsIni.stats.jail4 = 0
	statsIni.stats.jail5 = 0
	statsIni.stats.jail6 = 0
	statsIni.stats.warn0 = 0
	statsIni.stats.warn1 = 0
	statsIni.stats.warn2 = 0
	statsIni.stats.warn3 = 0
	statsIni.stats.warn4 = 0
	statsIni.stats.warn5 = 0
	statsIni.stats.warn6 = 0
	statsIni.stats.ban0 = 0
	statsIni.stats.ban1 = 0
	statsIni.stats.ban2 = 0
	statsIni.stats.ban3 = 0
	statsIni.stats.ban4 = 0
	statsIni.stats.ban5 = 0
	statsIni.stats.ban6 = 0
	statsIni.stats.kick0 = 0
	statsIni.stats.kick1 = 0
	statsIni.stats.kick2 = 0
	statsIni.stats.kick3 = 0
	statsIni.stats.kick4 = 0
	statsIni.stats.kick5 = 0
	statsIni.stats.kick6 = 0
	statistic.report0 = 0
	statistic.report1 = 0
	statistic.report2 = 0
	statistic.report3 = 0
	statistic.report4 = 0
	statistic.report5 = 0
	statistic.report6 = 0
	statistic.mute0 = 0
	statistic.mute1 = 0
	statistic.mute2 = 0
	statistic.mute3 = 0
	statistic.mute4 = 0
	statistic.mute5 = 0
	statistic.mute6 = 0
	statistic.jail0 = 0
	statistic.jail1 = 0
	statistic.jail2 = 0
	statistic.jail3 = 0
	statistic.jail4 = 0
	statistic.jail5 = 0
	statistic.jail6 = 0
	statistic.warn0 = 0
	statistic.warn1 = 0
	statistic.warn2 = 0
	statistic.warn3 = 0
	statistic.warn4 = 0
	statistic.warn5 = 0
	statistic.warn6 = 0
	statistic.ban0 = 0
	statistic.ban1 = 0
	statistic.ban2 = 0
	statistic.ban3 = 0
	statistic.ban4 = 0
	statistic.ban5 = 0
	statistic.ban6 = 0
	statistic.kick0 = 0
	statistic.kick1 = 0
	statistic.kick2 = 0
	statistic.kick3 = 0
	statistic.kick4 = 0
	statistic.kick5 = 0
	statistic.kick6 = 0
	statsIni.stats.week = var_72_0

	var_0_2.save(statsIni, "AdminHelper/stats")
end

function ChatBox(arg_73_0, arg_73_1)
	obj = {
		currentMessage = 0,
		firstMessage = 0,
		active = false,
		pagesize = arg_73_0,
		messages = {},
		farchat_blacklist = arg_73_1
	}

	function obj.initialize(arg_74_0)
		if arg_74_0.font == nil then
			arg_74_0.font = renderCreateFont("Verdana", 8, FCR_BORDER + FCR_BOLD)
		end
	end

	function obj.free(arg_75_0)
		if arg_75_0.font ~= nil then
			renderReleaseFont(arg_75_0.font)

			arg_75_0.font = nil
		end
	end

	function obj.toggle(arg_76_0, arg_76_1)
		arg_76_0:initialize()

		arg_76_0.active = arg_76_1
	end

	function obj.draw(arg_77_0, arg_77_1, arg_77_2)
		local function var_77_0(arg_78_0, arg_78_1)
			renderFontDrawText(arg_77_0.font, arg_78_0, arg_77_1, arg_77_2, arg_78_1)

			arg_77_2 = arg_77_2 + renderGetFontDrawHeight(arg_77_0.font)
		end

		var_77_0("FarChat:", 4293187788)

		if #arg_77_0.messages == 0 then
			return
		end

		local var_77_1 = arg_77_0.currentMessage
		local var_77_2 = var_77_1 + math.min(arg_77_0.pagesize, #arg_77_0.messages) - 1

		var_77_0(string.format("%d/%d", var_77_2, #arg_77_0.messages), 4293187788)

		arg_77_1 = arg_77_1 + 4

		for iter_77_0 = var_77_1, var_77_2 do
			local var_77_3 = arg_77_0.messages[iter_77_0]

			if checks.farchat_date.v == true and checks.farchat_distance.v == true then
				var_77_0(string.format("{E4E4E4}[%s] (%.1fm) {%06X}%s{D4D4D4}({EEEEEE}%d{D4D4D4}): {%06X}%s", var_77_3.time, var_77_3.dist, argb_to_rgb(var_77_3.playerColor), var_77_3.nickname, var_77_3.playerId, argb_to_rgb(var_77_3.color), var_77_3.text), var_77_3.color)
			end

			if checks.farchat_date.v == false and checks.farchat_distance.v == true then
				var_77_0(string.format("{E4E4E4}(%.1fm) {%06X}%s{D4D4D4}({EEEEEE}%d{D4D4D4}): {%06X}%s", var_77_3.dist, argb_to_rgb(var_77_3.playerColor), var_77_3.nickname, var_77_3.playerId, argb_to_rgb(var_77_3.color), var_77_3.text), var_77_3.color)
			end

			if checks.farchat_date.v == true and checks.farchat_distance.v == false then
				var_77_0(string.format("{E4E4E4}[%s] {%06X}%s{D4D4D4}({EEEEEE}%d{D4D4D4}): {%06X}%s", var_77_3.time, argb_to_rgb(var_77_3.playerColor), var_77_3.nickname, var_77_3.playerId, argb_to_rgb(var_77_3.color), var_77_3.text), var_77_3.color)
			end

			if checks.farchat_date.v == false and checks.farchat_distance.v == false then
				var_77_0(string.format("{E4E4E4}{%06X}%s{D4D4D4}({EEEEEE}%d{D4D4D4}): {%06X}%s", argb_to_rgb(var_77_3.playerColor), var_77_3.nickname, var_77_3.playerId, argb_to_rgb(var_77_3.color), var_77_3.text), var_77_3.color)
			end
		end
	end

	function obj.add_message(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4)
		if arg_79_0:is_text_blacklisted(arg_79_4) then
			return
		end

		local var_79_0 = get_distance_to_player(arg_79_1)

		if var_79_0 ~= nil then
			arg_79_2 = bgra_to_argb(arg_79_2)

			if arg_79_3 < var_79_0 then
				arg_79_2 = set_argb_alpha(arg_79_2, 160)
			else
				arg_79_2 = set_argb_alpha(arg_79_2, 240)
			end

			table.insert(arg_79_0.messages, {
				playerId = arg_79_1,
				nickname = sampGetPlayerNickname(arg_79_1),
				color = arg_79_2,
				playerColor = sampGetPlayerColor(arg_79_1),
				dist = var_79_0,
				distLimit = arg_79_3,
				text = arg_79_4,
				time = os.date("%X")
			})

			if #arg_79_0.messages > tonumber(farchat_messagesize) then
				arg_79_0.messages[arg_79_0.firstMessage] = nil
				arg_79_0.firstMessage = #arg_79_0.messages - tonumber(farchat_messagesize)
			else
				arg_79_0.firstMessage = 1
			end

			arg_79_0:scroll(1)
		end
	end

	function obj.is_text_blacklisted(arg_80_0, arg_80_1)
		for iter_80_0, iter_80_1 in pairs(arg_80_0.farchat_blacklist) do
			if string.match(arg_80_1, iter_80_1) then
				return true
			end
		end

		return false
	end

	function obj.scroll(arg_81_0, arg_81_1)
		arg_81_0.currentMessage = arg_81_0.currentMessage + arg_81_1

		if arg_81_0.currentMessage < arg_81_0.firstMessage then
			arg_81_0.currentMessage = arg_81_0.firstMessage
		else
			local var_81_0 = math.max(#arg_81_0.messages, arg_81_0.pagesize) + 1 - arg_81_0.pagesize

			if var_81_0 < arg_81_0.currentMessage then
				arg_81_0.currentMessage = var_81_0
			end
		end
	end

	setmetatable(obj, {})

	return obj
end

function get_distance_to_player(arg_82_0)
	if sampIsPlayerConnected(arg_82_0) then
		local var_82_0, var_82_1 = sampGetCharHandleBySampPlayerId(arg_82_0)

		if var_82_0 and doesCharExist(var_82_1) then
			local var_82_2, var_82_3, var_82_4 = getCharCoordinates(playerPed)
			local var_82_5, var_82_6, var_82_7 = getCharCoordinates(var_82_1)

			return getDistanceBetweenCoords3d(var_82_2, var_82_3, var_82_4, var_82_5, var_82_6, var_82_7)
		end
	end

	return nil
end

function bgra_to_argb(arg_83_0)
	local var_83_0, var_83_1, var_83_2, var_83_3 = explode_argb(arg_83_0)

	return join_argb(var_83_3, var_83_2, var_83_1, var_83_0)
end

function set_argb_alpha(arg_84_0, arg_84_1)
	local var_84_0, var_84_1, var_84_2, var_84_3 = explode_argb(arg_84_0)

	return join_argb(arg_84_1, var_84_1, var_84_2, var_84_3)
end

function get_argb_alpha(arg_85_0)
	return (explode_argb(arg_85_0))
end

function argb_to_rgb(arg_86_0)
	return bit.band(arg_86_0, 16777215)
end

function argb_to_rgba(arg_87_0)
	local var_87_0, var_87_1, var_87_2, var_87_3 = explode_argb(arg_87_0)

	return join_argb(var_87_1, var_87_2, var_87_3, var_87_0)
end

function join_argb(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
	local var_88_0 = arg_88_3
	local var_88_1 = bit.bor(var_88_0, bit.lshift(arg_88_2, 8))
	local var_88_2 = bit.bor(var_88_1, bit.lshift(arg_88_1, 16))

	return (bit.bor(var_88_2, bit.lshift(arg_88_0, 24)))
end

function explode_argb(arg_89_0)
	local var_89_0 = bit.band(bit.rshift(arg_89_0, 24), 255)
	local var_89_1 = bit.band(bit.rshift(arg_89_0, 16), 255)
	local var_89_2 = bit.band(bit.rshift(arg_89_0, 8), 255)
	local var_89_3 = bit.band(arg_89_0, 255)

	return var_89_0, var_89_1, var_89_2, var_89_3
end

function pColor(arg_90_0)
	local var_90_0 = sampGetPlayerColor(arg_90_0)
	local var_90_1 = argb_to_rgb(var_90_0)

	if var_90_1 == nil then
		var_90_1 = "FFFFFF"
	end

	local var_90_2 = string.format("%06X", var_90_1)

	return (tostring(var_90_2):gsub("(.+)", "{%1}"))
end

function getBodyPartCoordinates(arg_91_0, arg_91_1)
	local var_91_0 = getCharPointer(arg_91_1)
	local var_91_1 = var_0_11.new("float[3]")

	var_0_45(var_0_11.cast("void*", var_91_0), var_91_1, arg_91_0, true)

	return var_91_1[0], var_91_1[1], var_91_1[2]
end

function nameTagOn()
	local var_92_0 = sampGetServerSettingsPtr()

	NTdist = var_0_6.getfloat(var_92_0 + 39)
	NTwalls = var_0_6.getint8(var_92_0 + 47)
	NTshow = var_0_6.getint8(var_92_0 + 56)

	var_0_6.setfloat(var_92_0 + 39, 1488)
	var_0_6.setint8(var_92_0 + 47, 0)
	var_0_6.setint8(var_92_0 + 56, 1)

	nameTag = true
end

function nameTagOff()
	local var_93_0 = sampGetServerSettingsPtr()

	var_0_6.setfloat(var_93_0 + 39, NTdist)
	var_0_6.setint8(var_93_0 + 47, NTwalls)
	var_0_6.setint8(var_93_0 + 56, NTshow)

	nameTag = false
end

function warptp()
	while isPauseMenuActive() do
		if cursorEnabled then
			showCursor(false)
		end

		var_0_92.v = false
		checks.autoplus_check.v = false

		wait(100)
	end

	if isKeyJustPressed(VK_MBUTTON) then
		var_0_121 = os.clock() + 5000
		cursorEnabled = not cursorEnabled

		showCursor(cursorEnabled)
	end

	if var_0_121 <= os.clock() then
		while isKeyDown(VK_MBUTTON) do
			wait(80)
		end
	end

	if cursorEnabled then
		if sampGetCursorMode() == 0 then
			showCursor(true)
		end

		local var_94_0, var_94_1 = getCursorPos()
		local var_94_2, var_94_3 = getScreenResolution()

		if var_94_0 >= 0 and var_94_1 >= 0 and var_94_0 < var_94_2 and var_94_1 < var_94_3 then
			local var_94_4, var_94_5, var_94_6 = convertScreenCoordsToWorld3D(var_94_0, var_94_1, 700)
			local var_94_7, var_94_8, var_94_9 = getActiveCameraCoordinates()
			local var_94_10, var_94_11 = processLineOfSight(var_94_7, var_94_8, var_94_9, var_94_4, var_94_5, var_94_6, true, true, false, true, false, false, false)

			if var_94_10 and var_94_11.entity ~= 0 then
				local var_94_12 = var_94_11.normal
				local var_94_13 = var_0_5(var_94_11.pos[1], var_94_11.pos[2], var_94_11.pos[3]) - var_0_5(var_94_12[1], var_94_12[2], var_94_12[3]) * 0.1
				local var_94_14 = 300

				if var_94_12[3] >= 0.5 then
					var_94_14 = 1
				end

				local var_94_15, var_94_16 = processLineOfSight(var_94_13.x, var_94_13.y, var_94_13.z + var_94_14, var_94_13.x, var_94_13.y, var_94_13.z - 0.3, true, true, false, true, false, false, false)

				if var_94_15 then
					local var_94_17 = var_0_5(var_94_16.pos[1], var_94_16.pos[2], var_94_16.pos[3] + 1)
					local var_94_18, var_94_19, var_94_20 = getCharCoordinates(playerPed)
					local var_94_21 = getDistanceBetweenCoords3d(var_94_18, var_94_19, var_94_20, var_94_17.x, var_94_17.y, var_94_17.z)
					local var_94_22 = renderGetFontDrawHeight(font)
					local var_94_23 = var_94_1 - 2
					local var_94_24 = var_94_0 - 2

					renderFontDrawText(font, string.format("%0.2fm", var_94_21), var_94_24, var_94_23 - var_94_22, 4008636142)

					local var_94_25

					if var_94_11.entityType == 2 then
						local var_94_26 = getVehiclePointerHandle(var_94_11.entity)

						if doesVehicleExist(var_94_26) and (not isCharInAnyCar(playerPed) or storeCarCharIsInNoSave(playerPed) ~= var_94_26) then
							displayVehicleName(var_94_24, var_94_23 - var_94_22 * 2, getNameOfVehicleModel(getCarModel(var_94_26)))

							local var_94_27 = 2868903935

							if isKeyDown(VK_RBUTTON) then
								var_94_25 = var_94_26
								var_94_27 = 4294967295
							end

							renderFontDrawText(font2, "Зажмите ПКМ и нажмите ЛКМ для телепорта в транспорт", var_94_24, var_94_23 - var_94_22 * 3, var_94_27)
						end
					end

					if isKeyDown(VK_LBUTTON) then
						if var_0_13 then
							var_0_13 = not var_0_13
						end

						if var_94_25 then
							if not jumpIntoCar(var_94_25) then
								teleportPlayer(var_94_17.x, var_94_17.y, var_94_17.z)
							end
						else
							if isCharInAnyCar(playerPed) then
								local var_94_28 = var_0_5(var_94_11.normal[1], var_94_11.normal[2], 0)
								local var_94_29 = var_0_5(var_94_16.normal[1], var_94_16.normal[2], var_94_16.normal[3])

								rotateCarAroundUpAxis(storeCarCharIsInNoSave(playerPed), var_94_29)

								var_94_17 = var_94_17 - var_94_28 * 1.8
								var_94_17.z = var_94_17.z - 0.8
							end

							teleportPlayer(var_94_17.x, var_94_17.y, var_94_17.z)
						end

						while isKeyDown(VK_LBUTTON) do
							wait(0)
						end

						showCursor(false)
					end
				end
			end
		end
	end
end

function checko()
	if var_0_119 then
		showCursor(true, true)

		renderPosX, renderPosY = getCursorPos()

		renderList(renderPosX, renderPosY)

		if isKeyJustPressed(2) then
			var_0_82.menu.v = true

			showCursor(false, false)

			var_0_119 = false

			alert("Отменено.")
		end

		if isKeyJustPressed(1) then
			var_0_54.settings.headerPosX, var_0_54.settings.headerPosY = getCursorPos()
			var_0_112.v = var_0_54.settings.headerPosX
			var_0_113.v = var_0_54.settings.headerPosY
			var_0_82.menu.v = true

			showCursor(false, false)

			var_0_119 = false

			alert("Новые координаты установлены.")
			saveData()
		end
	end

	if var_0_93.v == true and not var_0_119 and (not isKeyDown(119) or not var_0_54.settings.hideOnScreenshot) then
		if var_0_54.settings.renderHotKeyType == 0 then
			renderList(var_0_54.settings.headerPosX, var_0_54.settings.headerPosY)
		elseif var_0_54.settings.renderHotKeyType == 1 and isKeyJustPressed(var_0_54.settings.renderHotKey.v[1]) then
			local var_95_0 = os.clock()

			while os.clock() - var_95_0 < var_0_54.settings.renderTime / 1000 do
				renderList(var_0_54.settings.headerPosX, var_0_54.settings.headerPosY)
				wait(0)
			end
		elseif var_0_54.settings.renderHotKeyType == 2 and isKeyDown(var_0_54.settings.renderHotKey.v[1]) then
			renderList(var_0_54.settings.headerPosX, var_0_54.settings.headerPosY)
		elseif var_0_54.settings.renderHotKeyType == 3 and isKeyJustPressed(var_0_54.settings.renderHotKey.v[1]) or var_0_54.settings.isRenderEnabledByDefault and not var_0_120 then
			while isKeyDown(var_0_54.settings.renderHotKey.v[1]) do
				wait(100)
			end

			while not isKeyJustPressed(var_0_54.settings.renderHotKey.v[1]) and var_0_54.settings.renderHotKeyType == 3 do
				renderList(var_0_54.settings.headerPosX, var_0_54.settings.headerPosY)
				wait(0)
			end
		end
	end
end

function initializeRender()
	font = renderCreateFont("Tahoma", 10, FCR_BOLD + FCR_BORDER)
	font2 = renderCreateFont("Arial", 8, FCR_ITALICS + FCR_BORDER)
	font3 = renderCreateFont("Tahoma", 12, FCR_BORDER)
	font4 = renderCreateFont("Verdana", 8, FCR_BORDER + FCR_BOLD)
end

function rotateCarAroundUpAxis(arg_97_0, arg_97_1)
	local var_97_0 = var_0_4(getVehicleRotationMatrix(arg_97_0))
	local var_97_1 = var_0_5(var_97_0.up:get())

	arg_97_1:normalize()
	var_97_1:normalize()

	local var_97_2 = math.acos(var_97_1:dotProduct(arg_97_1))

	if var_97_2 ~= 0 then
		var_97_1:crossProduct(arg_97_1)
		var_97_1:normalize()
		var_97_1:zeroNearZero()

		var_97_0 = var_97_0:rotate(var_97_1, -var_97_2)
	end

	setVehicleRotationMatrix(arg_97_0, var_97_0:get())
end

function readFloatArray(arg_98_0, arg_98_1)
	return representIntAsFloat(readMemory(arg_98_0 + arg_98_1 * 4, 4, false))
end

function writeFloatArray(arg_99_0, arg_99_1, arg_99_2)
	writeMemory(arg_99_0 + arg_99_1 * 4, 4, representFloatAsInt(arg_99_2), false)
end

function getVehicleRotationMatrix(arg_100_0)
	local var_100_0 = getCarPointer(arg_100_0)

	if var_100_0 ~= 0 then
		local var_100_1 = readMemory(var_100_0 + 20, 4, false)

		if var_100_1 ~= 0 then
			local var_100_2
			local var_100_3
			local var_100_4
			local var_100_5
			local var_100_6
			local var_100_7
			local var_100_8
			local var_100_9
			local var_100_10
			local var_100_11 = readFloatArray(var_100_1, 0)
			local var_100_12 = readFloatArray(var_100_1, 1)
			local var_100_13 = readFloatArray(var_100_1, 2)
			local var_100_14 = readFloatArray(var_100_1, 4)
			local var_100_15 = readFloatArray(var_100_1, 5)
			local var_100_16 = readFloatArray(var_100_1, 6)
			local var_100_17 = readFloatArray(var_100_1, 8)
			local var_100_18 = readFloatArray(var_100_1, 9)
			local var_100_19 = readFloatArray(var_100_1, 10)

			return var_100_11, var_100_12, var_100_13, var_100_14, var_100_15, var_100_16, var_100_17, var_100_18, var_100_19
		end
	end
end

function setVehicleRotationMatrix(arg_101_0, arg_101_1, arg_101_2, arg_101_3, arg_101_4, arg_101_5, arg_101_6, arg_101_7, arg_101_8, arg_101_9)
	local var_101_0 = getCarPointer(arg_101_0)

	if var_101_0 ~= 0 then
		local var_101_1 = readMemory(var_101_0 + 20, 4, false)

		if var_101_1 ~= 0 then
			writeFloatArray(var_101_1, 0, arg_101_1)
			writeFloatArray(var_101_1, 1, arg_101_2)
			writeFloatArray(var_101_1, 2, arg_101_3)
			writeFloatArray(var_101_1, 4, arg_101_4)
			writeFloatArray(var_101_1, 5, arg_101_5)
			writeFloatArray(var_101_1, 6, arg_101_6)
			writeFloatArray(var_101_1, 8, arg_101_7)
			writeFloatArray(var_101_1, 9, arg_101_8)
			writeFloatArray(var_101_1, 10, arg_101_9)
		end
	end
end

function displayVehicleName(arg_102_0, arg_102_1, arg_102_2)
	arg_102_0, arg_102_1 = convertWindowScreenCoordsToGameScreenCoords(arg_102_0, arg_102_1)

	useRenderCommands(true)
	setTextWrapx(640)
	setTextProportional(true)
	setTextJustify(false)
	setTextScale(0.33, 0.8)
	setTextDropshadow(0, 0, 0, 0, 0)
	setTextColour(255, 255, 255, 230)
	setTextEdge(1, 0, 0, 0, 100)
	setTextFont(1)
	displayText(arg_102_0, arg_102_1, arg_102_2)
end

function getCarFreeSeat(arg_103_0)
	if doesCharExist(getDriverOfCar(arg_103_0)) then
		local var_103_0 = getMaximumNumberOfPassengers(arg_103_0)

		for iter_103_0 = 0, var_103_0 do
			if isCarPassengerSeatFree(arg_103_0, iter_103_0) then
				return iter_103_0 + 1
			end
		end

		return nil
	else
		return 0
	end
end

function jumpIntoCar(arg_104_0)
	local var_104_0 = getCarFreeSeat(arg_104_0)

	if not var_104_0 then
		return false
	end

	if var_104_0 == 0 then
		warpCharIntoCar(playerPed, arg_104_0)
	else
		warpCharIntoCarAsPassenger(playerPed, arg_104_0, var_104_0 - 1)
	end

	restoreCameraJumpcut()

	return true
end

function teleportPlayer(arg_105_0, arg_105_1, arg_105_2)
	if isCharInAnyCar(playerPed) then
		setCharCoordinates(playerPed, arg_105_0, arg_105_1, arg_105_2)
	end

	setCharCoordinatesDontResetAnim(playerPed, arg_105_0, arg_105_1, arg_105_2)
end

function setCharCoordinatesDontResetAnim(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
	if doesCharExist(arg_106_0) then
		local var_106_0 = getCharPointer(arg_106_0)

		setEntityCoordinates(var_106_0, arg_106_1, arg_106_2, arg_106_3)
	end
end

function setEntityCoordinates(arg_107_0, arg_107_1, arg_107_2, arg_107_3)
	if arg_107_0 ~= 0 then
		local var_107_0 = readMemory(arg_107_0 + 20, 4, false)

		if var_107_0 ~= 0 then
			local var_107_1 = var_107_0 + 48

			writeMemory(var_107_1 + 0, 4, representFloatAsInt(arg_107_1), false)
			writeMemory(var_107_1 + 4, 4, representFloatAsInt(arg_107_2), false)
			writeMemory(var_107_1 + 8, 4, representFloatAsInt(arg_107_3), false)
		end
	end
end

function showCursor(arg_108_0)
	if arg_108_0 then
		sampSetCursorMode(CMODE_LOCKCAM)
	else
		sampToggleCursor(false)
	end

	cursorEnabled = arg_108_0
end

function autoO_function()
	wait(math.random(1000, 3000))

	if waito ~= nil then
		nickido1 = nickido:gsub("(%u+)%l+_(%w+)", "%1.%2")

		sampSendChat("/ooc " .. texto .. " | " .. nickido1)

		nickido1, nickido, ido, texto = nil
		autogive = 0
		waito = nil
	else
		nickido1, nickido, ido, texto = nil
		autogive = 0
		waito = nil

		sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Другой администратор уже подтвердил запрос.", -1)
	end
end

function fastreport_function()
	for iter_110_0 = 1, #var_0_40.playerid do
		if var_0_76 ~= nil and var_0_77 ~= nil and var_0_40.playerid[iter_110_0] == var_0_76 and var_0_40.suspectid[iter_110_0] == var_0_77 and sampIsPlayerConnected(var_0_40.playerid[iter_110_0]) and sampGetPlayerNickname(var_0_40.playerid[iter_110_0]) == var_0_40.playername[iter_110_0] and var_0_40.suspectid[iter_110_0] ~= nil and var_0_40.suspectname[iter_110_0] ~= nil then
			if sampIsPlayerConnected(var_0_40.suspectid[iter_110_0]) and sampGetPlayerNickname(var_0_40.suspectid[iter_110_0]) == var_0_40.suspectname[iter_110_0] then
				var_0_40.complete[iter_110_0] = "true"

				math.randomseed(os.time())
				sampSendChat("/pm " .. var_0_40.playerid[iter_110_0] .. " " .. var_0_68.one[math.random(1, #var_0_68.one)] .. " " .. var_0_40.suspectname[iter_110_0] .. ", " .. var_0_68.two[math.random(1, #var_0_68.two)])
				wait(1000)

				if configIni.config.reconcar then
					if var_0_28 ~= true then
						if isCharInAnyCar(PLAYER_PED) then
							resultcar, recarid = sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(PLAYER_PED))

							local var_110_0, var_110_1 = sampGetCarHandleBySampVehicleId(recarid)
							local var_110_2, var_110_3, var_110_4 = getCarCoordinates(storeCarCharIsInNoSave(PLAYER_PED))

							if getDriverOfCar(var_110_1) == 1 then
								temppassenger = true
							else
								temppassenger = false
							end

							warpCharFromCarToCoord(PLAYER_PED, var_110_2, var_110_3, var_110_4)
							wait(150)
							sampSendChat("/re " .. var_0_40.suspectid[iter_110_0])
						else
							recarid = nil
							temppassenger = nil

							sampSendChat("/re " .. var_0_40.suspectid[iter_110_0])
						end
					else
						sampSendChat("/re " .. var_0_40.suspectid[iter_110_0])
					end
				else
					sampSendChat("/re " .. var_0_40.suspectid[iter_110_0])
				end

				var_0_77, var_0_76, idpm2 = nil
			else
				sampSendChat("/pm " .. var_0_40.playerid[iter_110_0] .. " Вы жаловались на " .. var_0_40.suspectname[iter_110_0] .. ", но он покинул игру. Оставьте жалобу на форуме.")
				wait(300)
				table.remove(var_0_40.playername, iter_110_0)
				table.remove(var_0_40.playerid, iter_110_0)
				table.remove(var_0_40.suspectname, iter_110_0)
				table.remove(var_0_40.suspectid, iter_110_0)
				table.remove(var_0_40.reason, iter_110_0)
				table.remove(var_0_40.complete, iter_110_0)
				table.remove(var_0_40.timer, iter_110_0)

				var_0_77, var_0_76, idpm2 = nil
			end
		end
	end
end

function sampSetChatInputCursor(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_1 or arg_111_0
	local var_111_1 = tonumber(arg_111_0)
	local var_111_2 = tonumber(var_111_0)
	local var_111_3 = require("memory")
	local var_111_4 = sampGetInputInfoPtr()
	local var_111_5 = getStructElement(var_111_4, 8, 4)

	var_111_3.setint8(var_111_5 + 286, var_111_1)
	var_111_3.setint8(var_111_5 + 281, var_111_2)

	return true
end

function alert(arg_112_0)
	sampAddChatMessage("{51fffa}[" .. var_0_50 .. "]{FFFFFF} " .. arg_112_0, -1)
end

function saveData()
	local var_113_0 = io.open(getWorkingDirectory() .. "\\config\\AdminHelper\\AHchecker.json", "w+")

	var_113_0:write(encodeJson(var_0_54))
	var_113_0:close()
end

function loadData()
	local function var_114_0(arg_115_0, arg_115_1)
		for iter_115_0, iter_115_1 in pairs(arg_115_0) do
			if type(iter_115_1) == "table" then
				var_114_0(iter_115_1, arg_115_1[iter_115_0])
			end

			arg_115_1[iter_115_0] = iter_115_1
		end
	end

	if not doesFileExist(getWorkingDirectory() .. "\\config\\AdminHelper\\AHchecker.json") then
		local var_114_1 = io.open(getWorkingDirectory() .. "\\config\\AdminHelper\\AHchecker.json", "w+")

		var_114_1:write(encodeJson(var_0_54))
		var_114_1:close()

		return
	end

	local var_114_2 = io.open(getWorkingDirectory() .. "\\config\\AdminHelper\\AHchecker.json", "r")
	local var_114_3 = decodeJson(var_114_2:read("*a"))

	var_114_0(var_114_3.settings, var_0_54.settings)

	var_0_54.lists = var_114_3.lists or var_0_54.list

	var_114_2:close()

	local var_114_4, var_114_5, var_114_6, var_114_7 = explode_argb(var_0_54.settings.headerFontColor)

	var_0_104.v = var_0_54.settings.listFontName or "Arial"
	var_0_105.v = var_0_54.settings.listFontSize or 9
	var_0_106 = var_0_54.settings.listFontFlags or 5
	var_0_107.v = var_0_54.settings.headerFontName or "Arial"
	var_0_108.v = var_0_54.settings.headerFontSize or 9
	var_0_109 = var_0_54.settings.headerFontFlags or 5
	var_0_112.v = var_0_54.settings.headerPosX or 450
	var_0_113.v = var_0_54.settings.headerPosY or 450
	var_0_111.v = var_0_54.settings.headerText or "Admins online"
	var_0_116.v = var_0_54.settings.renderTime or 3000
	var_0_110 = var_0_3.ImFloat3(var_114_5 / 255, var_114_6 / 255, var_114_7 / 255)
end

function loadUsers()
	var_0_52 = {}
	var_0_53 = {}

	local var_116_0, var_116_1 = sampGetCurrentServerAddress()

	for iter_116_0, iter_116_1 in ipairs(var_0_54.lists) do
		if iter_116_1.isbuiltin or iter_116_1.ip == var_116_0 and iter_116_1.port == var_116_1 and type(iter_116_1.users) == "table" then
			for iter_116_2, iter_116_3 in pairs(iter_116_1.users) do
				table.insert(var_0_52, {
					nickname = iter_116_3,
					listid = iter_116_0
				})
			end
		end
	end
end

function rebuildFonts()
	fontHeader = renderCreateFont(var_0_54.settings.headerFontName, var_0_54.settings.headerFontSize, var_0_54.settings.headerFontFlags)
	fontList = renderCreateFont(var_0_54.settings.listFontName, var_0_54.settings.listFontSize, var_0_54.settings.listFontFlags)
end

function rebuildUsers()
	loadUsers()

	for iter_118_0, iter_118_1 in ipairs(var_0_52) do
		for iter_118_2 = 0, sampGetMaxPlayerId(false) do
			if sampIsPlayerConnected(iter_118_2) and sampGetPlayerNickname(iter_118_2) == u8:decode(iter_118_1.nickname) then
				table.insert(var_0_53, {
					nickname = u8:decode(iter_118_1.nickname),
					id = iter_118_2,
					listid = iter_118_1.listid
				})
			end
		end
	end
end

function renderList(arg_119_0, arg_119_1)
	local var_119_0 = arg_119_1

	renderFontDrawText(fontHeader, u8:decode(var_0_54.settings.headerText) .. " [" .. #var_0_53 .. "]:", arg_119_0, arg_119_1, var_0_54.settings.headerFontColor)

	local var_119_1 = var_119_0 + var_0_54.settings.headerFontSize

	for iter_119_0, iter_119_1 in ipairs(var_0_53) do
		var_119_1 = var_119_1 + var_0_54.settings.listFontSize * 2

		local var_119_2 = iter_119_1.nickname
		local var_119_3 = var_0_54.settings.renderID and "[" .. iter_119_1.id .. "]" or ""
		local var_119_4 = var_0_54.settings.renderLevel and " LVL: " .. sampGetPlayerScore(iter_119_1.id) or ""

		renderFontDrawText(fontList, var_119_2 .. var_119_3 .. var_119_4, arg_119_0, var_119_1, var_0_54.lists[iter_119_1.listid].color)
	end
end

function parseText(arg_120_0)
	local var_120_0 = {}

	for iter_120_0 in arg_120_0:gmatch("([%w+%d+%[%]_@$]+)") do
		table.insert(var_120_0, iter_120_0)
	end

	return var_120_0
end

function var_0_3.OnDrawFrame()
	if var_0_82.menu.v then
		var_0_82.changename.v = false
		var_0_82.mpwin.v = false
		var_0_82.ppv.v = false
		var_0_82.acheck.v = false
		var_0_82.ipaccounts.v = false
		var_0_82.fastreport.v = false

		local var_121_0, var_121_1 = getScreenResolution()

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(300, 334), var_0_3.Cond.FirstUseEver)

		local var_121_2 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.Begin(var_0_46.ICON_FA_HOME .. u8(" AdminHelper | Меню"), var_0_82.menu, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		im_colored_text_with_shadow(var_0_3.ImVec4(0.32, 0.32, 0.87, 1), var_0_46.ICON_FA_HOME)
		var_0_3.SetCursorPos(var_0_3.ImVec2(30, 15))
		im_colored_text_with_shadow(var_0_3.ImVec4(0.95, 0.96, 0.98, 1), " AdminHelper v" .. thisScript().version)
		ShowHelp("Разработчик: Anthony_Ward\n\nСпециально для GRAND MOBILE 17")

		if nick:find(developer.v1) or nick:find(tester.v1) or nick:find(vipclient.v1) or nick:find(vipclient.v2) or nick:find(vipclient.v3) or nick:find(vipclient.v4) or nick:find(vipclient.v5) or nick:find(vipclient.v6) then
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(191, 10))
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImVec4(0.32, 0.32, 0.87, 1))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_CROWN .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.vip_fastad.v = not var_0_82.vip_fastad.v
				var_0_82.binds.v = false
				var_0_82.stats.v = false
				var_0_82.announce.v = false
				var_0_82.binder.v = false
				var_0_103.v = false
				var_0_82.cmd.v = false
				var_0_82.penalty.v = false
				var_0_82.settings.v = false
				var_0_82.cheats.v = false
				var_0_82.acar.v = false
				var_0_82.ahgun.v = false
				var_0_82.log.v = false
				var_0_82.farchat.v = false
			end

			var_0_3.PopStyleVar(1)
			var_0_3.PopStyleColor()
			ShowHelp("VIP Menu")
		end

		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(223, 10))
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TOOLBOX .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.binds.v = not var_0_82.binds.v
			var_0_82.vip_fastad.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		var_0_3.PopStyleVar(1)
		ShowHelp("Настройки клавиш")
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(255, 10))
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.menu.v = not var_0_82.menu.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		var_0_3.PopStyleVar(1)
		var_0_3.EndGroup()

		if var_0_3.Button(var_0_46.ICON_FA_CALCULATOR .. u8(" Статистика"), var_121_2) then
			var_0_82.stats.v = not var_0_82.stats.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		if var_0_3.Button(var_0_46.ICON_FA_BULLHORN .. u8(" Объявления"), var_121_2) then
			var_0_82.announce.v = not var_0_82.announce.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		if var_0_3.Button(var_0_46.ICON_FA_KEYBOARD .. u8(" Биндер"), var_121_2) then
			editbind_c1 = nil
			editbind_c2 = nil
			editbind_c3 = nil
			editbind_c4 = nil
			editbind_c5 = nil
			editbind_c6 = nil
			editbind_c7 = nil
			editbind_c8 = nil
			editbind_c9 = nil
			editbind_c0 = nil
			editbind_a1 = nil
			editbind_a2 = nil
			editbind_a3 = nil
			editbind_a4 = nil
			editbind_a5 = nil
			editbind_a6 = nil
			editbind_a7 = nil
			editbind_a8 = nil
			editbind_a9 = nil
			editbind_a0 = nil
			var_0_82.binder.v = not var_0_82.binder.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		if var_0_3.Button(var_0_46.ICON_FA_EYE .. u8(" Чекер"), var_121_2) then
			var_0_103.v = not var_0_103.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		if var_0_3.Button(var_0_46.ICON_FA_INFO_CIRCLE .. u8(" Доступные команды"), var_121_2) then
			var_0_82.cmd.v = not var_0_82.cmd.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		if var_0_3.Button(var_0_46.ICON_FA_TOOLS .. u8(" Быстрые наказания"), var_121_2) then
			var_0_82.penalty.v = not var_0_82.penalty.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		if var_0_3.Button(var_0_46.ICON_FA_COGS .. u8(" Настройки"), var_121_2) then
			var_0_82.settings.v = not var_0_82.settings.v
			var_0_117 = 1
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		if var_0_3.Button(var_0_46.ICON_FA_BIOHAZARD .. u8(""), var_0_3.ImVec2(30, 0)) then
			var_0_82.cheats.v = not var_0_82.cheats.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		ShowHelp("\xD7\xE8\xF2\xFB")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(47)

		if var_0_3.Button(var_0_46.ICON_FA_CAR .. u8(""), var_0_3.ImVec2(30, 0)) then
			var_0_82.acar.v = not var_0_82.acar.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		ShowHelp("Меню спавна транспорта")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(79)

		if var_0_3.Button(var_0_46.ICON_FA_SKULL_CROSSBONES .. u8(""), var_0_3.ImVec2(30, 0)) then
			var_0_82.ahgun.v = not var_0_82.ahgun.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.log.v = false
			var_0_82.farchat.v = false
		end

		ShowHelp("Меню выдачи оружия")
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(223, 298))

		if var_0_3.Button(var_0_46.ICON_FA_AT .. u8(""), var_0_3.ImVec2(30, 0)) then
			var_0_82.response.v = not var_0_82.response.v
			var_0_82.log.v = false
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.farchat.v = false
		end

		ShowHelp("Обратная связь")
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(255, 298))

		if var_0_3.Button(var_0_46.ICON_FA_HISTORY .. u8(""), var_0_3.ImVec2(30, 0)) then
			var_0_82.log.v = not var_0_82.log.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.farchat.v = false
		end

		ShowHelp("Лог обновлений")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(111)

		if var_0_3.Button(var_0_46.ICON_FA_SATELLITE_DISH .. u8(""), var_0_3.ImVec2(30, 0)) then
			var_0_82.farchat.v = not var_0_82.farchat.v
			var_0_82.vip_fastad.v = false
			var_0_82.binds.v = false
			var_0_82.stats.v = false
			var_0_82.announce.v = false
			var_0_82.binder.v = false
			var_0_103.v = false
			var_0_82.cmd.v = false
			var_0_82.penalty.v = false
			var_0_82.settings.v = false
			var_0_82.cheats.v = false
			var_0_82.acar.v = false
			var_0_82.ahgun.v = false
			var_0_82.log.v = false
		end

		ShowHelp("Прослушка чата")

		if var_0_82.stats.v then
			local var_121_3 = tonumber(number_week())

			if statsIni.stats.week ~= var_121_3 then
				resetstats()
			end

			local var_121_4 = 3
			local var_121_5 = os.time(os.date("!*t")) + var_121_4 * 60 * 60
			local var_121_6 = tonumber(os.date("%w", var_121_5))

			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2 + 373, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(435, 205), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_CALCULATOR .. u8(" AdminHelper | Статистика"), var_0_82.stats, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CALCULATOR .. u8(" {E0DEF8}Статистика 2.0"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(326, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_SYNC_ALT .. "##1", var_0_3.ImVec2(30, 0)) then
				statsswitch = not statsswitch
				statsIni.stats.statsswitch = statsswitch

				var_0_2.save(statsIni, "AdminHelper/stats")
			end

			var_0_3.PopStyleVar(1)

			if statsswitch then
				ShowHelp("Cтатистика за текущую неделю")
			else
				ShowHelp("Cтатистика за всё время")
			end

			if var_0_3.BeginPopupModal(u8("StatsSettings"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar) then
				var_0_3.BeginGroup()
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COG .. u8(" {E0DEF8}Настройки"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(170, 10))
				var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

				if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
					statsIni.stats.StatsDayNorm = buffers.StatsDayNorm.v
					statsIni.stats.StatsWeekNorm = buffers.StatsWeekNorm.v

					var_0_2.save(statsIni, "AdminHelper/stats")
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Настройки сохранены.", 16776960)
					var_0_3.CloseCurrentPopup()
				end

				var_0_3.PopStyleVar(1)
				var_0_3.EndGroup()
				var_0_3.SetCursorPosY(43)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Суточная норма:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(150, 40))
				var_0_3.PushItemWidth(50)
				var_0_3.InputText("##DayStandart", buffers.StatsDayNorm, var_0_3.InputTextFlags.CharsDecimal)
				var_0_3.SetCursorPosY(74)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Недельная норма:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(150, 70))
				var_0_3.PushItemWidth(50)
				var_0_3.InputText("##WeekStandart", buffers.StatsWeekNorm, var_0_3.InputTextFlags.CharsDecimal)
				var_0_3.EndPopup()
			end

			var_0_3.SetCursorPos(var_0_3.ImVec2(358, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_COG .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_3.OpenPopup("StatsSettings")
			end

			var_0_3.PopStyleVar(1)
			ShowHelp("Настройки")
			var_0_3.SetCursorPos(var_0_3.ImVec2(390, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.stats.v = not var_0_82.stats.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()
			var_0_3.TextColoredRGB(u8("{5252DF}Действие"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(95)

			if var_121_6 == 1 then
				var_0_3.TextColoredRGB(u8("{FCFF00}Пн"))
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB(u8("{5252DF}Пн"))
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(135)

			if var_121_6 == 2 then
				var_0_3.TextColoredRGB(u8("{FCFF00}Вт"))
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB(u8("{5252DF}Вт"))
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(175)

			if var_121_6 == 3 then
				var_0_3.TextColoredRGB(u8("{FCFF00}Ср"))
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB(u8("{5252DF}Ср"))
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(215)

			if var_121_6 == 4 then
				var_0_3.TextColoredRGB(u8("{FCFF00}Чт"))
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB(u8("{5252DF}Чт"))
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(255)

			if var_121_6 == 5 then
				var_0_3.TextColoredRGB(u8("{FCFF00}Пт"))
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB(u8("{5252DF}Пт"))
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(295)

			if var_121_6 == 6 then
				var_0_3.TextColoredRGB(u8("{FCFF00}Сб"))
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB(u8("{5252DF}Сб"))
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(335)

			if var_121_6 == 0 then
				var_0_3.TextColoredRGB(u8("{FCFF00}Вс"))
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB(u8("{5252DF}Вс"))
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(380)
			var_0_3.TextColoredRGB(u8("{5252DF}Итог"))
			var_0_3.TextColoredRGB(u8("{FFFFFF}Репорт"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(95)

			if var_121_6 == 1 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.report1)
				var_0_3.SameLine()
			elseif statistic.report1 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.report1)
				var_0_3.SameLine()
			elseif statistic.report1 >= tonumber(statsIni.stats.StatsDayNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report1)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{C71116}" .. statistic.report1)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(135)

			if var_121_6 == 2 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.report2)
				var_0_3.SameLine()
			elseif statistic.report2 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.report2)
				var_0_3.SameLine()
			elseif statistic.report2 >= tonumber(statsIni.stats.StatsDayNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report2)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{C71116}" .. statistic.report2)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(175)

			if var_121_6 == 3 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.report3)
				var_0_3.SameLine()
			elseif statistic.report3 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.report3)
				var_0_3.SameLine()
			elseif statistic.report3 >= tonumber(statsIni.stats.StatsDayNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report3)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{C71116}" .. statistic.report3)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(215)

			if var_121_6 == 4 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.report4)
				var_0_3.SameLine()
			elseif statistic.report4 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.report4)
				var_0_3.SameLine()
			elseif statistic.report4 >= tonumber(statsIni.stats.StatsDayNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report4)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{C71116}" .. statistic.report4)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(255)

			if var_121_6 == 5 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.report5)
				var_0_3.SameLine()
			elseif statistic.report5 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.report5)
				var_0_3.SameLine()
			elseif statistic.report5 >= tonumber(statsIni.stats.StatsDayNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report5)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{C71116}" .. statistic.report5)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(295)

			if var_121_6 == 6 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.report6)
				var_0_3.SameLine()
			elseif statistic.report6 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.report6)
				var_0_3.SameLine()
			elseif statistic.report6 >= tonumber(statsIni.stats.StatsDayNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report6)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{C71116}" .. statistic.report6)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(335)

			if var_121_6 == 0 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.report0)
				var_0_3.SameLine()
			elseif statistic.report0 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.report0)
				var_0_3.SameLine()
			elseif statistic.report0 >= tonumber(statsIni.stats.StatsDayNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report0)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{C71116}" .. statistic.report0)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(380)

			if statsswitch then
				var_0_3.TextColoredRGB("{FCFF00}" .. reportall)
			elseif statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6 >= tonumber(statsIni.stats.StatsWeekNorm) then
				var_0_3.TextColoredRGB("{46BD1D}" .. statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6)
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6)
			end

			var_0_3.TextColoredRGB(u8("{FFFFFF}Бан чата"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(95)

			if var_121_6 == 1 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.mute1)
				var_0_3.SameLine()
			elseif statistic.mute1 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.mute1)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute1)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(135)

			if var_121_6 == 2 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.mute2)
				var_0_3.SameLine()
			elseif statistic.mute2 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.mute2)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute2)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(175)

			if var_121_6 == 3 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.mute3)
				var_0_3.SameLine()
			elseif statistic.mute3 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.mute3)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute3)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(215)

			if var_121_6 == 4 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.mute4)
				var_0_3.SameLine()
			elseif statistic.mute4 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.mute4)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute4)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(255)

			if var_121_6 == 5 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.mute5)
				var_0_3.SameLine()
			elseif statistic.mute5 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.mute5)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute5)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(295)

			if var_121_6 == 6 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.mute6)
				var_0_3.SameLine()
			elseif statistic.mute6 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.mute6)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute6)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(335)

			if var_121_6 == 0 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.mute0)
				var_0_3.SameLine()
			elseif statistic.mute0 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.mute0)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute0)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(380)

			if statsswitch then
				var_0_3.TextColoredRGB("{FCFF00}" .. muteall)
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute0 + statistic.mute1 + statistic.mute2 + statistic.mute3 + statistic.mute4 + statistic.mute5 + statistic.mute6)
			end

			var_0_3.TextColoredRGB(u8("{FFFFFF}Призон"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(95)

			if var_121_6 == 1 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.jail1)
				var_0_3.SameLine()
			elseif statistic.jail1 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.jail1)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail1)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(135)

			if var_121_6 == 2 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.jail2)
				var_0_3.SameLine()
			elseif statistic.jail2 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.jail2)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail2)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(175)

			if var_121_6 == 3 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.jail3)
				var_0_3.SameLine()
			elseif statistic.jail3 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.jail3)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail3)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(215)

			if var_121_6 == 4 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.jail4)
				var_0_3.SameLine()
			elseif statistic.jail4 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.jail4)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail4)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(255)

			if var_121_6 == 5 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.jail5)
				var_0_3.SameLine()
			elseif statistic.jail5 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.jail5)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail5)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(295)

			if var_121_6 == 6 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.jail6)
				var_0_3.SameLine()
			elseif statistic.jail6 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.jail6)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail6)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(335)

			if var_121_6 == 0 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.jail0)
				var_0_3.SameLine()
			elseif statistic.jail0 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.jail0)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail0)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(380)

			if statsswitch then
				var_0_3.TextColoredRGB("{FCFF00}" .. jailall)
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail0 + statistic.jail1 + statistic.jail2 + statistic.jail3 + statistic.jail4 + statistic.jail5 + statistic.jail6)
			end

			var_0_3.TextColoredRGB(u8("{FFFFFF}Кик"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(95)

			if var_121_6 == 1 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.kick1)
				var_0_3.SameLine()
			elseif statistic.kick1 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.kick1)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick1)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(135)

			if var_121_6 == 2 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.kick2)
				var_0_3.SameLine()
			elseif statistic.kick2 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.kick2)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick2)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(175)

			if var_121_6 == 3 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.kick3)
				var_0_3.SameLine()
			elseif statistic.kick3 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.kick3)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick3)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(215)

			if var_121_6 == 4 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.kick4)
				var_0_3.SameLine()
			elseif statistic.kick4 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.kick4)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick4)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(255)

			if var_121_6 == 5 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.kick5)
				var_0_3.SameLine()
			elseif statistic.kick5 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.kick5)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick5)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(295)

			if var_121_6 == 6 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.kick6)
				var_0_3.SameLine()
			elseif statistic.kick6 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.kick6)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick6)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(335)

			if var_121_6 == 0 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.kick0)
				var_0_3.SameLine()
			elseif statistic.kick0 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.kick0)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick0)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(380)

			if statsswitch then
				var_0_3.TextColoredRGB("{FCFF00}" .. kickall)
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick0 + statistic.kick1 + statistic.kick2 + statistic.kick3 + statistic.kick4 + statistic.kick5 + statistic.kick6)
			end

			var_0_3.TextColoredRGB(u8("{FFFFFF}Варн"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(95)

			if var_121_6 == 1 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.warn1)
				var_0_3.SameLine()
			elseif statistic.warn1 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.warn1)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn1)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(135)

			if var_121_6 == 2 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.warn2)
				var_0_3.SameLine()
			elseif statistic.warn2 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.warn2)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn2)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(175)

			if var_121_6 == 3 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.warn3)
				var_0_3.SameLine()
			elseif statistic.warn3 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.warn3)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn3)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(215)

			if var_121_6 == 4 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.warn4)
				var_0_3.SameLine()
			elseif statistic.warn4 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.warn4)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn4)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(255)

			if var_121_6 == 5 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.warn5)
				var_0_3.SameLine()
			elseif statistic.warn5 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.warn5)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn5)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(295)

			if var_121_6 == 6 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.warn6)
				var_0_3.SameLine()
			elseif statistic.warn6 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.warn6)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn6)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(335)

			if var_121_6 == 0 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.warn0)
				var_0_3.SameLine()
			elseif statistic.warn0 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.warn0)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn0)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(380)

			if statsswitch then
				var_0_3.TextColoredRGB("{FCFF00}" .. warnall)
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn0 + statistic.warn1 + statistic.warn2 + statistic.warn3 + statistic.warn4 + statistic.warn5 + statistic.warn6)
			end

			var_0_3.TextColoredRGB(u8("{FFFFFF}Бан"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(95)

			if var_121_6 == 1 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.ban1)
				var_0_3.SameLine()
			elseif statistic.ban1 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.ban1)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban1)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(135)

			if var_121_6 == 2 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.ban2)
				var_0_3.SameLine()
			elseif statistic.ban2 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.ban2)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban2)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(175)

			if var_121_6 == 3 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.ban3)
				var_0_3.SameLine()
			elseif statistic.ban3 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.ban3)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban3)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(215)

			if var_121_6 == 4 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.ban4)
				var_0_3.SameLine()
			elseif statistic.ban4 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.ban4)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban4)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(255)

			if var_121_6 == 5 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.ban5)
				var_0_3.SameLine()
			elseif statistic.ban5 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.ban5)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban5)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(295)

			if var_121_6 == 6 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.ban6)
				var_0_3.SameLine()
			elseif statistic.ban6 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.ban6)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban6)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(335)

			if var_121_6 == 0 then
				var_0_3.TextColoredRGB("{FCFF00}" .. statistic.ban0)
				var_0_3.SameLine()
			elseif statistic.ban0 == 0 then
				var_0_3.TextColoredRGB("{8D8D8D}" .. statistic.ban0)
				var_0_3.SameLine()
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban0)
				var_0_3.SameLine()
			end

			var_0_3.SetCursorPosX(380)

			if statsswitch then
				var_0_3.TextColoredRGB("{FCFF00}" .. banall)
			else
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban0 + statistic.ban1 + statistic.ban2 + statistic.ban3 + statistic.ban4 + statistic.ban5 + statistic.ban6)
			end

			var_0_3.End()
		end

		if var_0_82.announce.v then
			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2 + 315, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(315, 200), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_BULLHORN .. u8(" AdminHelper | Объявления"), var_0_82.announce, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_BULLHORN .. u8(" {E0DEF8}Объявления"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(270, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.announce.v = not var_0_82.announce.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_FOLDER .. u8(" {FFFFFF}Выберите тип объявления:"))
			var_0_3.Combo("", var_0_101, var_0_56, #var_0_56)
			var_0_3.Text("")
			var_0_3.SetCursorPos(var_0_3.ImVec2(221, 64))

			if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##2", var_0_3.ImVec2(30, 0)) and (var_0_101.v == 0 or var_0_101.v == 1 or var_0_101.v == 2 or var_0_101.v == 3 or var_0_101.v == 4 or var_0_101.v == 5) then
				var_0_82.announce_edit.v = not var_0_82.announce_edit.v
			end

			ShowHelp("Редактировать объявление")

			if var_0_101.v == 2 or var_0_101.v == 3 or var_0_101.v == 4 or var_0_101.v == 5 then
				var_0_3.BeginGroup()
				var_0_3.Columns(2, _, false)
				var_0_3.SetColumnWidth(-1, 140)
				var_0_3.Checkbox(u8("##1"), var_0_91)
				var_0_3.SetCursorPos(var_0_3.ImVec2(42, 100))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COMMENT_DOLLAR .. u8(" {FFFFFF}Спонсор"))

				if var_0_91.v == true then
					var_0_3.PushItemWidth(90)
					var_0_3.InputText(u8("ID"), var_0_86, var_0_3.InputTextFlags.CharsDecimal)
					var_0_3.PopItemWidth()
				end

				var_0_3.NextColumn()
				var_0_3.Checkbox(u8("##2"), var_0_95)
				var_0_3.SetCursorPos(var_0_3.ImVec2(182, 100))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_DOLLAR_SIGN .. u8(" {FFFFFF}Приз"))
				ShowHelpMarker("Сумма с точкой\nПример: 100.000")

				if var_0_95.v == true then
					var_0_3.PushItemWidth(90)
					var_0_3.InputText(u8("Сумма"), var_0_88, var_0_3.InputTextFlags.CharsDecimal)
					var_0_3.PopItemWidth()
				end

				var_0_3.Columns(1)
				var_0_3.EndGroup()
			end

			var_0_3.SetCursorPos(var_0_3.ImVec2(15, 163))
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_PLAY .. u8(" Объявить"), var_121_2) then
				if var_0_101.v == 0 then
					announce:run()
				end

				if var_0_101.v == 1 then
					announce2:run()
				end

				if var_0_101.v == 2 then
					announce3:run()
				end

				if var_0_101.v == 3 then
					announce4:run()
				end

				if var_0_101.v == 4 then
					announce5:run()
				end

				if var_0_101.v == 5 then
					announce6:run()
				end

				if var_0_101.v == 6 then
					var_0_82.announce_dogoni.v = not var_0_82.announce_dogoni.v
				end

				if var_0_101.v == 7 then
					var_0_82.announce_needsponsor.v = not var_0_82.announce_needsponsor.v
				end
			end

			var_0_3.PopStyleColor()
			var_0_3.End()
		end

		if var_0_82.announce_dogoni.v then
			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2 + 330, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(355, 400), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(u8("AdminHelper | Догони и передай"), var_0_82.announce_dogoni, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_PENCIL_ALT .. u8(" {E0DEF8}Догони и передай"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(310, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.announce_dogoni.v = not var_0_82.announce_dogoni.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ID тех, кому нужно передать 1$, через запятую:"))
			var_0_3.PushItemWidth(325)
			var_0_3.InputText(u8("##1"), var_0_83)
			var_0_3.PopItemWidth()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Марка и цвет машины:"))
			var_0_3.PushItemWidth(325)
			var_0_3.InputText(u8("##2"), var_0_84)
			var_0_3.PopItemWidth()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Местоположение начала МП:"))
			var_0_3.PushItemWidth(325)
			var_0_3.InputText(u8("##3"), var_0_85)
			var_0_3.PopItemWidth()
			var_0_3.Columns(2, _, false)
			var_0_3.SetColumnWidth(-1, 160)
			var_0_3.Checkbox(u8("##02"), var_0_91)
			var_0_3.BeginGroup()
			var_0_3.SetCursorPos(var_0_3.ImVec2(42, 208))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COMMENT_DOLLAR .. u8(" {FFFFFF}Спонсор"))
			var_0_3.EndGroup()

			if var_0_91.v == true then
				var_0_3.PushItemWidth(110)
				var_0_3.InputText(u8("ID"), var_0_86, var_0_3.InputTextFlags.CharsDecimal)
				var_0_3.PopItemWidth()
			end

			var_0_3.NextColumn()
			var_0_3.Checkbox(u8("##01"), var_0_95)
			var_0_3.BeginGroup()
			var_0_3.SetCursorPos(var_0_3.ImVec2(205, 208))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_DOLLAR_SIGN .. u8(" {FFFFFF}Приз"))
			ShowHelpMarker("Сумма с точкой, без знака '$'\nПример: 100.000")
			var_0_3.EndGroup()

			if var_0_95.v == true then
				var_0_3.PushItemWidth(110)
				var_0_3.InputText(u8("Сумма"), var_0_88, var_0_3.InputTextFlags.CharsDecimal)
				var_0_3.PopItemWidth()
			end

			var_0_3.Columns(1)
			var_0_3.TextColoredRGB("{CECF34}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Сейчас пройдет мероприятие 'Догони и передай'."))
			var_0_3.TextColoredRGB("{CECF34}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Суть мероприятия - догнать id: {CECF34}") .. var_0_83.v .. u8("\n     {FFFFFF}и передать 1$."))
			var_0_3.TextColoredRGB("{CECF34}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Мы на {CECF34}") .. var_0_84.v .. u8("{FFFFFF}. Начинаем от {CECF34}") .. var_0_85.v .. "{FFFFFF}.")
			var_0_3.SetCursorPos(var_0_3.ImVec2(15, 365))
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_PLAY .. u8(" Объявить"), var_121_2) then
				announce7:run()
			end

			var_0_3.PopStyleColor()
			var_0_3.End()
		end

		if var_0_82.announce_needsponsor.v then
			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2 + 310, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(310, 265), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(u8("Поиск спонсора"), var_0_82.announce_needsponsor, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_PENCIL_ALT .. u8(" {E0DEF8}Поиск спонсора"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(268, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.announce_needsponsor.v = not var_0_82.announce_needsponsor.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Введите необходимую сумму(c точкой):"))
			var_0_3.PushItemWidth(280)
			var_0_3.InputText(u8("##1"), var_0_89, var_0_3.InputTextFlags.CharsDecimal)
			var_0_3.PopItemWidth()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Введите ваш номер телефона:"))
			var_0_3.PushItemWidth(280)
			var_0_3.InputText(u8("##2"), var_0_90, var_0_3.InputTextFlags.CharsDecimal)
			var_0_3.PopItemWidth()
			var_0_3.BeginChild("##sponsortext", var_0_3.ImVec2(470, 65), false)
			var_0_3.TextColoredRGB("{CECF34}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Требуется спонсор для мероприятия. \nНеобходимая сумма: {CECF34}") .. var_0_89.v .. u8("{FFFFFF}$"))
			var_0_3.TextColoredRGB("{CECF34}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Желающие напишите + в /sms {CECF34}") .. var_0_90.v)
			var_0_3.EndChild()
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_PLAY .. u8(" Объявить"), var_121_2) then
				announce8:run()
			end

			var_0_3.PopStyleColor()
			var_0_3.End()
		end

		if var_0_82.announce_edit.v then
			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2 + 300, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(505, 175), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(u8("Редактируем объявление"), var_0_82.announce_edit, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)

			if var_0_101.v == 6 or var_0_101.v == 7 then
				var_0_82.announce_edit.v = not var_0_82.announce_edit.v
			end

			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_PENCIL_ALT .. u8(" {E0DEF8}Редактируем объявление"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(433, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_SAVE .. "", var_0_3.ImVec2(30, 0)) then
				if var_0_101.v == 0 then
					announceIni.announcesettings.comboannouncera = var_0_72.comboaskrep.v
					announceIni.announcesettings.announcera = var_0_72.askrep.v
					announceIni.announcesettings.announcera2 = var_0_72.askrep2.v
					announceIni.announcesettings.announcera3 = var_0_72.askrep3.v
					var_0_56[1] = var_0_72.comboaskrep.v
				end

				if var_0_101.v == 1 then
					announceIni.announcesettings.comboannouncerc = var_0_72.comborespawncar.v
					announceIni.announcesettings.announcerc = var_0_72.respawncar.v
					announceIni.announcesettings.announcerc2 = var_0_72.respawncar2.v
					announceIni.announcesettings.announcerc3 = var_0_72.respawncar3.v
					var_0_56[2] = var_0_72.comborespawncar.v
				end

				if var_0_101.v == 2 then
					announceIni.announcesettings.comboannouncem = var_0_72.combomyasorubka.v
					announceIni.announcesettings.announcem = var_0_72.myasorubka.v
					announceIni.announcesettings.announcem2 = var_0_72.myasorubka2.v
					var_0_56[3] = var_0_72.combomyasorubka.v
				end

				if var_0_101.v == 3 then
					announceIni.announcesettings.comboannounceh = var_0_72.combopryatki.v
					announceIni.announcesettings.announceh = var_0_72.pryatki.v
					announceIni.announcesettings.announceh2 = var_0_72.pryatki2.v
					var_0_56[4] = var_0_72.combopryatki.v
				end

				if var_0_101.v == 4 then
					announceIni.announcesettings.comboannouncer = var_0_72.comboruletka.v
					announceIni.announcesettings.announcer = var_0_72.ruletka.v
					announceIni.announcesettings.announcer2 = var_0_72.ruletka2.v
					var_0_56[5] = var_0_72.comboruletka.v
				end

				if var_0_101.v == 5 then
					announceIni.announcesettings.comboannouncp = var_0_72.combopolivalka.v
					announceIni.announcesettings.announcep = var_0_72.polivalka.v
					announceIni.announcesettings.announcep2 = var_0_72.polivalka2.v
					var_0_56[6] = var_0_72.combopolivalka.v
				end

				var_0_2.save(announceIni, "AdminHelper/announce")
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Объявление отредактировано.", 16776960)
			end

			var_0_3.PopStyleVar(1)
			ShowHelp("Сохранить")
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(465, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.announce_edit.v = not var_0_82.announce_edit.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()

			if var_0_101.v == 0 then
				var_0_3.PushItemWidth(455)
				var_0_3.PushItemWidth(188)
				var_0_3.InputText(var_0_46.ICON_FA_HEADING .. u8("##0"), var_0_72.comboaskrep)
				var_0_3.PopItemWidth()
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##1"), var_0_72.askrep)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##2"), var_0_72.askrep2)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##3"), var_0_72.askrep3)
				var_0_3.PopItemWidth()
			end

			if var_0_101.v == 1 then
				var_0_3.PushItemWidth(455)
				var_0_3.PushItemWidth(188)
				var_0_3.InputText(var_0_46.ICON_FA_HEADING .. u8("##01"), var_0_72.comborespawncar)
				var_0_3.PopItemWidth()
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##4"), var_0_72.respawncar)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##5"), var_0_72.respawncar2)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##6"), var_0_72.respawncar3)
				var_0_3.PopItemWidth()
			end

			if var_0_101.v == 2 then
				var_0_3.PushItemWidth(455)
				var_0_3.PushItemWidth(188)
				var_0_3.InputText(var_0_46.ICON_FA_HEADING .. u8("##02"), var_0_72.combomyasorubka)
				var_0_3.PopItemWidth()
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##7"), var_0_72.myasorubka)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##8"), var_0_72.myasorubka2)
				var_0_3.PopItemWidth()
			end

			if var_0_101.v == 3 then
				var_0_3.PushItemWidth(455)
				var_0_3.PushItemWidth(188)
				var_0_3.InputText(var_0_46.ICON_FA_HEADING .. u8("##03"), var_0_72.combopryatki)
				var_0_3.PopItemWidth()
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##10"), var_0_72.pryatki)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##11"), var_0_72.pryatki2)
				var_0_3.PopItemWidth()
			end

			if var_0_101.v == 4 then
				var_0_3.PushItemWidth(455)
				var_0_3.PushItemWidth(188)
				var_0_3.InputText(var_0_46.ICON_FA_HEADING .. u8("##04"), var_0_72.comboruletka)
				var_0_3.PopItemWidth()
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##10"), var_0_72.ruletka)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##11"), var_0_72.ruletka2)
				var_0_3.PopItemWidth()
			end

			if var_0_101.v == 5 then
				var_0_3.PushItemWidth(455)
				var_0_3.PushItemWidth(188)
				var_0_3.InputText(var_0_46.ICON_FA_HEADING .. u8("##05"), var_0_72.combopolivalka)
				var_0_3.PopItemWidth()
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##13"), var_0_72.polivalka)
				var_0_3.InputText(var_0_46.ICON_FA_ITALIC .. u8("##14"), var_0_72.polivalka2)
				var_0_3.PopItemWidth()
			end

			var_0_3.End()
		end

		if var_0_82.binder.v then
			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(557, 395), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_BULLHORN .. u8(" AdminHelper | Биндер"), var_0_82.announce, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_KEYBOARD .. u8(" {E0DEF8}Биндер"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(482, 10))
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_SAVE .. u8(""), var_0_3.ImVec2(30, 0)) then
				binderIni.binder.CTRL1 = u8:decode(var_0_71.buffer.v)
				binderIni.binder.CTRL1_2 = u8:decode(var_0_71.buffer_2.v)
				binderIni.binder.CTRL1_3 = u8:decode(var_0_71.buffer_3.v)
				binderIni.binder.CTRL2 = u8:decode(var_0_71.buffer2.v)
				binderIni.binder.CTRL2_2 = u8:decode(var_0_71.buffer2_2.v)
				binderIni.binder.CTRL2_3 = u8:decode(var_0_71.buffer2_3.v)
				binderIni.binder.CTRL3 = u8:decode(var_0_71.buffer3.v)
				binderIni.binder.CTRL3_2 = u8:decode(var_0_71.buffer3_2.v)
				binderIni.binder.CTRL3_3 = u8:decode(var_0_71.buffer3_3.v)
				binderIni.binder.CTRL4 = u8:decode(var_0_71.buffer4.v)
				binderIni.binder.CTRL4_2 = u8:decode(var_0_71.buffer4_2.v)
				binderIni.binder.CTRL4_3 = u8:decode(var_0_71.buffer4_3.v)
				binderIni.binder.CTRL5 = u8:decode(var_0_71.buffer5.v)
				binderIni.binder.CTRL5_2 = u8:decode(var_0_71.buffer5_2.v)
				binderIni.binder.CTRL5_3 = u8:decode(var_0_71.buffer5_3.v)
				binderIni.binder.CTRL6 = u8:decode(var_0_71.buffer6.v)
				binderIni.binder.CTRL6_2 = u8:decode(var_0_71.buffer6_2.v)
				binderIni.binder.CTRL6_3 = u8:decode(var_0_71.buffer6_3.v)
				binderIni.binder.CTRL7 = u8:decode(var_0_71.buffer7.v)
				binderIni.binder.CTRL7_2 = u8:decode(var_0_71.buffer7_2.v)
				binderIni.binder.CTRL7_3 = u8:decode(var_0_71.buffer7_3.v)
				binderIni.binder.CTRL8 = u8:decode(var_0_71.buffer8.v)
				binderIni.binder.CTRL8_2 = u8:decode(var_0_71.buffer8_2.v)
				binderIni.binder.CTRL8_3 = u8:decode(var_0_71.buffer8_3.v)
				binderIni.binder.CTRL9 = u8:decode(var_0_71.buffer9.v)
				binderIni.binder.CTRL9_2 = u8:decode(var_0_71.buffer9_2.v)
				binderIni.binder.CTRL9_3 = u8:decode(var_0_71.buffer9_3.v)
				binderIni.binder.CTRL0 = u8:decode(var_0_71.buffer10.v)
				binderIni.binder.CTRL0_2 = u8:decode(var_0_71.buffer10_2.v)
				binderIni.binder.CTRL0_3 = u8:decode(var_0_71.buffer10_3.v)
				binderIni.binder.ALT1 = u8:decode(var_0_71.buffer11.v)
				binderIni.binder.ALT1_2 = u8:decode(var_0_71.buffer11_2.v)
				binderIni.binder.ALT1_3 = u8:decode(var_0_71.buffer11_3.v)
				binderIni.binder.ALT2 = u8:decode(var_0_71.buffer12.v)
				binderIni.binder.ALT2_2 = u8:decode(var_0_71.buffer12_2.v)
				binderIni.binder.ALT2_3 = u8:decode(var_0_71.buffer12_3.v)
				binderIni.binder.ALT3 = u8:decode(var_0_71.buffer13.v)
				binderIni.binder.ALT3_2 = u8:decode(var_0_71.buffer13_2.v)
				binderIni.binder.ALT3_3 = u8:decode(var_0_71.buffer13_3.v)
				binderIni.binder.ALT4 = u8:decode(var_0_71.buffer14.v)
				binderIni.binder.ALT4_2 = u8:decode(var_0_71.buffer14_2.v)
				binderIni.binder.ALT4_3 = u8:decode(var_0_71.buffer14_3.v)
				binderIni.binder.ALT5 = u8:decode(var_0_71.buffer15.v)
				binderIni.binder.ALT5_2 = u8:decode(var_0_71.buffer15_2.v)
				binderIni.binder.ALT5_3 = u8:decode(var_0_71.buffer15_3.v)
				binderIni.binder.ALT6 = u8:decode(var_0_71.buffer16.v)
				binderIni.binder.ALT6_2 = u8:decode(var_0_71.buffer16_2.v)
				binderIni.binder.ALT6_3 = u8:decode(var_0_71.buffer16_3.v)
				binderIni.binder.ALT7 = u8:decode(var_0_71.buffer17.v)
				binderIni.binder.ALT7_2 = u8:decode(var_0_71.buffer17_2.v)
				binderIni.binder.ALT7_3 = u8:decode(var_0_71.buffer17_3.v)
				binderIni.binder.ALT8 = u8:decode(var_0_71.buffer18.v)
				binderIni.binder.ALT8_2 = u8:decode(var_0_71.buffer18_2.v)
				binderIni.binder.ALT8_3 = u8:decode(var_0_71.buffer18_3.v)
				binderIni.binder.ALT9 = u8:decode(var_0_71.buffer19.v)
				binderIni.binder.ALT9_2 = u8:decode(var_0_71.buffer19_2.v)
				binderIni.binder.ALT9_3 = u8:decode(var_0_71.buffer19_3.v)
				binderIni.binder.ALT0 = u8:decode(var_0_71.buffer20.v)
				binderIni.binder.ALT0_2 = u8:decode(var_0_71.buffer20_2.v)
				binderIni.binder.ALT0_3 = u8:decode(var_0_71.buffer20_3.v)

				var_0_2.save(binderIni, "AdminHelper/binder")
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Настройки биндера сохранены.", 16776960)
			end

			var_0_3.PopStyleVar(1)
			var_0_3.PopStyleColor()
			ShowHelp("Сохранить настройки")
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(515, 10))
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.binder.v = not var_0_82.binder.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.PopStyleColor()
			var_0_3.EndGroup()

			if var_0_78 == true then
				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 45))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 1:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##2"), var_0_71.buffer)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 42))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____1", var_0_3.ImVec2(30, 0)) then
					editbind_c1 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 77))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 2:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##3"), var_0_71.buffer2)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 74))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____2", var_0_3.ImVec2(30, 0)) then
					editbind_c2 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 109))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 3:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##4"), var_0_71.buffer3)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 106))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____3", var_0_3.ImVec2(30, 0)) then
					editbind_c3 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 141))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 4:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##5"), var_0_71.buffer4)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 138))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____4", var_0_3.ImVec2(30, 0)) then
					editbind_c4 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 173))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 5:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##6"), var_0_71.buffer5)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 170))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____5", var_0_3.ImVec2(30, 0)) then
					editbind_c5 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 205))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 6:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##7"), var_0_71.buffer6)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 202))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____6", var_0_3.ImVec2(30, 0)) then
					editbind_c6 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 237))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 7:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##8"), var_0_71.buffer7)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 234))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____7", var_0_3.ImVec2(30, 0)) then
					editbind_c7 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 269))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 8:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##9"), var_0_71.buffer8)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 266))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____8", var_0_3.ImVec2(30, 0)) then
					editbind_c8 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 301))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 9:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##10"), var_0_71.buffer9)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 298))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____9", var_0_3.ImVec2(30, 0)) then
					editbind_c9 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 333))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}CTRL + 0:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##11"), var_0_71.buffer10)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(514, 330))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##____10", var_0_3.ImVec2(30, 0)) then
					editbind_c0 = true

					var_0_3.OpenPopup("EditBinder")
				end
			end

			if var_0_78 == false then
				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 45))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 1:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##12"), var_0_71.buffer11)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 42))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___1", var_0_3.ImVec2(30, 0)) then
					editbind_a1 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 77))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 2:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##13"), var_0_71.buffer12)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 74))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___2", var_0_3.ImVec2(30, 0)) then
					editbind_a2 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 109))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 3:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##14"), var_0_71.buffer13)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 106))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___3", var_0_3.ImVec2(30, 0)) then
					editbind_a3 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 141))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 4:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##15"), var_0_71.buffer14)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 138))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___4", var_0_3.ImVec2(30, 0)) then
					editbind_a4 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 173))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 5:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##16"), var_0_71.buffer15)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 170))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___5", var_0_3.ImVec2(30, 0)) then
					editbind_a5 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 205))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 6:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##17"), var_0_71.buffer16)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 203))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___6", var_0_3.ImVec2(30, 0)) then
					editbind_a6 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 237))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 7:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##18"), var_0_71.buffer17)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 235))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___7", var_0_3.ImVec2(30, 0)) then
					editbind_a7 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 269))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 8:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##19"), var_0_71.buffer18)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 268))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___8", var_0_3.ImVec2(30, 0)) then
					editbind_a8 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 301))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 9:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##20"), var_0_71.buffer19)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 300))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___9", var_0_3.ImVec2(30, 0)) then
					editbind_a9 = true

					var_0_3.OpenPopup("EditBinder")
				end

				var_0_3.BeginGroup()
				var_0_3.SetCursorPos(var_0_3.ImVec2(15, 333))
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}ALT + 0:"))
				var_0_3.EndGroup()
				var_0_3.SameLine()
				var_0_3.PushItemWidth(410)
				var_0_3.InputText(u8("##11"), var_0_71.buffer20)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(507, 332))

				if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##___10", var_0_3.ImVec2(30, 0)) then
					editbind_a0 = true

					var_0_3.OpenPopup("EditBinder")
				end
			end

			if var_0_3.BeginPopupModal(u8("EditBinder"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
				var_0_3.BeginGroup()
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_PENCIL_ALT .. u8(" {E0DEF8}Редактирование ответов"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(395, 10))
				var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

				if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
					editbind_c1 = nil
					editbind_c2 = nil
					editbind_c3 = nil
					editbind_c4 = nil
					editbind_c5 = nil
					editbind_c6 = nil
					editbind_c7 = nil
					editbind_c8 = nil
					editbind_c9 = nil
					editbind_c0 = nil
					editbind_a1 = nil
					editbind_a2 = nil
					editbind_a3 = nil
					editbind_a4 = nil
					editbind_a5 = nil
					editbind_a6 = nil
					editbind_a7 = nil
					editbind_a8 = nil
					editbind_a9 = nil
					editbind_a0 = nil

					var_0_3.CloseCurrentPopup()
				end

				var_0_3.PopStyleVar(1)
				var_0_3.EndGroup()
				var_0_3.PushItemWidth(220)

				if editbind_c1 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##1_1"), var_0_71.buffer)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##1_2"), var_0_71.buffer_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##1_3"), var_0_71.buffer_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c2 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##2_1"), var_0_71.buffer2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##2_2"), var_0_71.buffer2_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##2_3"), var_0_71.buffer2_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c3 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##3_1"), var_0_71.buffer3)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##3_2"), var_0_71.buffer3_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##3_3"), var_0_71.buffer3_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c4 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##4_1"), var_0_71.buffer4)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##4_2"), var_0_71.buffer4_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##4_3"), var_0_71.buffer4_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c5 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##5_1"), var_0_71.buffer5)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##5_2"), var_0_71.buffer5_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##5_3"), var_0_71.buffer5_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c6 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##6_1"), var_0_71.buffer6)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##6_2"), var_0_71.buffer6_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##6_3"), var_0_71.buffer6_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c7 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##7_1"), var_0_71.buffer7)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##7_2"), var_0_71.buffer7_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##7_3"), var_0_71.buffer7_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c8 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##8_1"), var_0_71.buffer8)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##8_2"), var_0_71.buffer8_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##8_3"), var_0_71.buffer8_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c9 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##9_1"), var_0_71.buffer9)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##9_2"), var_0_71.buffer9_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##9_3"), var_0_71.buffer9_3)
					var_0_3.PopItemWidth()
				end

				if editbind_c0 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##10_1"), var_0_71.buffer10)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##10_2"), var_0_71.buffer10_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##10_3"), var_0_71.buffer10_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a1 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##11_1"), var_0_71.buffer11)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##11_2"), var_0_71.buffer11_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##11_3"), var_0_71.buffer11_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a2 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##12_1"), var_0_71.buffer12)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##12_2"), var_0_71.buffer12_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##12_3"), var_0_71.buffer12_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a3 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##13_1"), var_0_71.buffer13)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##13_2"), var_0_71.buffer13_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##13_3"), var_0_71.buffer13_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a4 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##14_1"), var_0_71.buffer14)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##14_2"), var_0_71.buffer14_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##14_3"), var_0_71.buffer14_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a5 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##15_1"), var_0_71.buffer15)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##15_2"), var_0_71.buffer15_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##15_3"), var_0_71.buffer15_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a6 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##16_1"), var_0_71.buffer16)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##16_2"), var_0_71.buffer16_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##16_3"), var_0_71.buffer16_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a7 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##17_1"), var_0_71.buffer17)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##17_2"), var_0_71.buffer17_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##17_3"), var_0_71.buffer17_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a8 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##18_1"), var_0_71.buffer18)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##18_2"), var_0_71.buffer18_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##18_3"), var_0_71.buffer18_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a9 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##19_1"), var_0_71.buffer19)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##19_2"), var_0_71.buffer19_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##19_3"), var_0_71.buffer19_3)
					var_0_3.PopItemWidth()
				end

				if editbind_a0 ~= nil then
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##20_1"), var_0_71.buffer20)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##20_2"), var_0_71.buffer20_2)
					var_0_3.PopItemWidth()
					var_0_3.PushItemWidth(410)
					var_0_3.InputText(u8("##20_3"), var_0_71.buffer20_3)
					var_0_3.PopItemWidth()
				end

				var_0_3.PopItemWidth()
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

				if var_0_3.Button(var_0_46.ICON_FA_SAVE .. u8(" Сохранить"), var_0_3.ImVec2(410, 0)) then
					if editbind_c1 ~= nil then
						binderIni.binder.CTRL1 = u8:decode(var_0_71.buffer.v)
						binderIni.binder.CTRL1_2 = u8:decode(var_0_71.buffer_2.v)
						binderIni.binder.CTRL1_3 = u8:decode(var_0_71.buffer_3.v)
						editbind_c1 = nil
					end

					if editbind_c2 ~= nil then
						binderIni.binder.CTRL2 = u8:decode(var_0_71.buffer2.v)
						binderIni.binder.CTRL2_2 = u8:decode(var_0_71.buffer2_2.v)
						binderIni.binder.CTRL2_3 = u8:decode(var_0_71.buffer2_3.v)
						editbind_c2 = nil
					end

					if editbind_c3 ~= nil then
						binderIni.binder.CTRL3 = u8:decode(var_0_71.buffer3.v)
						binderIni.binder.CTRL3_2 = u8:decode(var_0_71.buffer3_2.v)
						binderIni.binder.CTRL3_3 = u8:decode(var_0_71.buffer3_3.v)
						editbind_c3 = nil
					end

					if editbind_c4 ~= nil then
						binderIni.binder.CTRL4 = u8:decode(var_0_71.buffer4.v)
						binderIni.binder.CTRL4_2 = u8:decode(var_0_71.buffer4_2.v)
						binderIni.binder.CTRL4_3 = u8:decode(var_0_71.buffer4_3.v)
						editbind_c4 = nil
					end

					if editbind_c5 ~= nil then
						binderIni.binder.CTRL5 = u8:decode(var_0_71.buffer5.v)
						binderIni.binder.CTRL5_2 = u8:decode(var_0_71.buffer5_2.v)
						binderIni.binder.CTRL5_3 = u8:decode(var_0_71.buffer5_3.v)
						editbind_c5 = nil
					end

					if editbind_c6 ~= nil then
						binderIni.binder.CTRL6 = u8:decode(var_0_71.buffer6.v)
						binderIni.binder.CTRL6_2 = u8:decode(var_0_71.buffer6_2.v)
						binderIni.binder.CTRL6_3 = u8:decode(var_0_71.buffer6_3.v)
						editbind_c6 = nil
					end

					if editbind_c7 ~= nil then
						binderIni.binder.CTRL7 = u8:decode(var_0_71.buffer7.v)
						binderIni.binder.CTRL7_2 = u8:decode(var_0_71.buffer7_2.v)
						binderIni.binder.CTRL7_3 = u8:decode(var_0_71.buffer7_3.v)
						editbind_c7 = nil
					end

					if editbind_c8 ~= nil then
						binderIni.binder.CTRL8 = u8:decode(var_0_71.buffer8.v)
						binderIni.binder.CTRL8_2 = u8:decode(var_0_71.buffer8_2.v)
						binderIni.binder.CTRL8_3 = u8:decode(var_0_71.buffer8_3.v)
						editbind_c8 = nil
					end

					if editbind_c9 ~= nil then
						binderIni.binder.CTRL9 = u8:decode(var_0_71.buffer9.v)
						binderIni.binder.CTRL9_2 = u8:decode(var_0_71.buffer9_2.v)
						binderIni.binder.CTRL9_3 = u8:decode(var_0_71.buffer9_3.v)
						editbind_c9 = nil
					end

					if editbind_c0 ~= nil then
						binderIni.binder.CTRL0 = u8:decode(var_0_71.buffer10.v)
						binderIni.binder.CTRL0_2 = u8:decode(var_0_71.buffer10_2.v)
						binderIni.binder.CTRL0_3 = u8:decode(var_0_71.buffer10_3.v)
						editbind_c0 = nil
					end

					if editbind_a1 ~= nil then
						binderIni.binder.ALT1 = u8:decode(var_0_71.buffer11.v)
						binderIni.binder.ALT1_2 = u8:decode(var_0_71.buffer11_2.v)
						binderIni.binder.ALT1_3 = u8:decode(var_0_71.buffer11_3.v)
						editbind_a1 = nil
					end

					if editbind_a2 ~= nil then
						binderIni.binder.ALT2 = u8:decode(var_0_71.buffer12.v)
						binderIni.binder.ALT2_2 = u8:decode(var_0_71.buffer12_2.v)
						binderIni.binder.ALT2_3 = u8:decode(var_0_71.buffer12_3.v)
						editbind_a2 = nil
					end

					if editbind_a3 ~= nil then
						binderIni.binder.ALT3 = u8:decode(var_0_71.buffer13.v)
						binderIni.binder.ALT3_2 = u8:decode(var_0_71.buffer13_2.v)
						binderIni.binder.ALT3_3 = u8:decode(var_0_71.buffer13_3.v)
						editbind_a3 = nil
					end

					if editbind_a4 ~= nil then
						binderIni.binder.ALT4 = u8:decode(var_0_71.buffer14.v)
						binderIni.binder.ALT4_2 = u8:decode(var_0_71.buffer14_2.v)
						binderIni.binder.ALT4_3 = u8:decode(var_0_71.buffer14_3.v)
						editbind_a4 = nil
					end

					if editbind_a5 ~= nil then
						binderIni.binder.ALT5 = u8:decode(var_0_71.buffer15.v)
						binderIni.binder.ALT5_2 = u8:decode(var_0_71.buffer15_2.v)
						binderIni.binder.ALT5_3 = u8:decode(var_0_71.buffer15_3.v)
						editbind_a5 = nil
					end

					if editbind_a6 ~= nil then
						binderIni.binder.ALT6 = u8:decode(var_0_71.buffer16.v)
						binderIni.binder.ALT6_2 = u8:decode(var_0_71.buffer16_2.v)
						binderIni.binder.ALT6_3 = u8:decode(var_0_71.buffer16_3.v)
						editbind_a6 = nil
					end

					if editbind_a7 ~= nil then
						binderIni.binder.ALT7 = u8:decode(var_0_71.buffer17.v)
						binderIni.binder.ALT7_2 = u8:decode(var_0_71.buffer17_2.v)
						binderIni.binder.ALT7_3 = u8:decode(var_0_71.buffer17_3.v)
						editbind_a7 = nil
					end

					if editbind_a8 ~= nil then
						binderIni.binder.ALT8 = u8:decode(var_0_71.buffer18.v)
						binderIni.binder.ALT8_2 = u8:decode(var_0_71.buffer18_2.v)
						binderIni.binder.ALT8_3 = u8:decode(var_0_71.buffer18_3.v)
						editbind_a8 = nil
					end

					if editbind_a9 ~= nil then
						binderIni.binder.ALT9 = u8:decode(var_0_71.buffer19.v)
						binderIni.binder.ALT9_2 = u8:decode(var_0_71.buffer19_2.v)
						binderIni.binder.ALT9_3 = u8:decode(var_0_71.buffer19_3.v)
						editbind_a9 = nil
					end

					if editbind_a0 ~= nil then
						binderIni.binder.ALT0 = u8:decode(var_0_71.buffer20.v)
						binderIni.binder.ALT0_2 = u8:decode(var_0_71.buffer20_2.v)
						binderIni.binder.ALT0_3 = u8:decode(var_0_71.buffer20_3.v)
						editbind_a0 = nil
					end

					var_0_2.save(binderIni, "AdminHelper/binder")
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ответы бинда успешно отредактированы.")
					var_0_3.CloseCurrentPopup()
				end

				var_0_3.PopStyleColor()
				var_0_3.EndPopup()
			end

			local var_121_7
			local var_121_8 = var_0_78 == true and " ALT" or " CTRL"

			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_SORT .. var_121_8, var_121_2) then
				if var_0_78 == true then
					var_0_78 = false
				else
					var_0_78 = true
				end
			end

			var_0_3.PopStyleColor()
			var_0_3.End()
		end

		if var_0_82.penalty.v then
			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(470, 420), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_COG .. u8(" AdminHelper | Быстрые наказания"), var_0_82.penalty, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoTitleBar + var_0_3.WindowFlags.NoScrollbar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_TOOLS .. u8(" {E0DEF8}Быстрые наказания"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(397, 10))
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_PLUS .. "", var_0_3.ImVec2(30, 0)) then
				var_0_3.OpenPopup("NewPenalty")
			end

			var_0_3.PopStyleVar(1)
			var_0_3.PopStyleColor()
			ShowHelp("Создать команду")

			if var_0_3.BeginPopupModal(u8("NewPenalty"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
				var_0_3.BeginGroup()
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_PENCIL_ALT .. u8(" {E0DEF8}Создание команды"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(290, 10))
				var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

				if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
					buffers.PenaltyCommand.v = ""
					buffers.PenaltyTime.v = ""
					buffers.PenaltyReason.v = ""

					var_0_3.CloseCurrentPopup()
				end

				var_0_3.PopStyleVar(1)
				var_0_3.EndGroup()
				var_0_3.SetCursorPosX(27)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_TERMINAL .. u8(" {FFFFFF}Команда"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(120)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CLOCK .. u8(" {FFFFFF}Время"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(213)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COMMENT .. u8(" {FFFFFF}Причина"))
				var_0_3.PushItemWidth(100)
				var_0_3.InputText(u8("##1"), buffers.PenaltyCommand)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(118)
				var_0_3.PushItemWidth(65)

				if not var_0_26:find("Kick") and not var_0_26:find("Warn") and not var_0_26:find("Iban") then
					if buffers.PenaltyTime.v:find("-") then
						buffers.PenaltyTime.v = ""
					end

					var_0_3.InputText(u8("##2"), buffers.PenaltyTime, var_0_3.InputTextFlags.CharsDecimal)
				else
					buffers.PenaltyTime.v = "-"

					var_0_3.InputText(u8("##2"), buffers.PenaltyTime, var_0_3.InputTextFlags.ReadOnly)
				end

				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(186)
				var_0_3.PushItemWidth(131)
				var_0_3.InputText(u8("##3"), buffers.PenaltyReason)
				var_0_3.PopItemWidth()

				if var_0_26:find("Kick") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Kick", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Kick", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Kick"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(76)

				if var_0_26:find("Mute") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Mute", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Mute", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Mute"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(137)

				if var_0_26:find("Jail") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Jail", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Jail", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Jail"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(198)

				if var_0_26:find("Warn") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Warn", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Warn", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Warn"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(259)

				if var_0_26:find("Ban") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Ban", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Ban", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Ban"
				end

				var_0_3.SetCursorPosX(76)

				if var_0_26:find("Rmute") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Rmute", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Rmute", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Rmute"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(137)

				if var_0_26:find("Iban") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Iban", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Iban", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Iban"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(198)

				if var_0_26:find("Sban") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Sban", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Sban", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Sban"
				end

				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

				if var_0_3.Button(var_0_46.ICON_FA_SAVE .. u8(" Готово"), var_0_3.ImVec2(301, 0)) then
					if buffers.PenaltyCommand.v == "" or buffers.PenaltyTime.v == "" or buffers.PenaltyReason.v == "" then
						sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Заполните все поля.", 16776960)
					else
						for iter_121_0 = 1, #penaltyIni.cmd do
							if penaltyIni.cmd[iter_121_0]:find(u8:decode(buffers.PenaltyCommand.v)) or penaltyIni.cmd[iter_121_0]:find("dmjail") then
								cmdreserved = true
							end
						end

						if cmdreserved == nil then
							for iter_121_1 = 1, #penaltyIni.cmd do
								sampUnregisterChatCommand(penaltyIni.cmd[iter_121_1])
							end

							table.insert(penaltyIni.cmd, u8:decode(buffers.PenaltyCommand.v))
							table.insert(penaltyIni.time, buffers.PenaltyTime.v)
							table.insert(penaltyIni.reason, u8:decode(buffers.PenaltyReason.v))
							table.insert(penaltyIni.penalty, var_0_26)

							for iter_121_2 = 1, #penaltyIni.cmd do
								sampRegisterChatCommand(penaltyIni.cmd[iter_121_2], function(arg_122_0)
									variable = string.match(arg_122_0, "(.+)")

									if variable == nil then
										sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /" .. penaltyIni.cmd[iter_121_2] .. " [id]", 16776960)
									elseif not tostring(penaltyIni.time[iter_121_2]):find("-") then
										sampSendChat("/" .. penaltyIni.penalty[iter_121_2] .. " " .. variable .. " " .. penaltyIni.time[iter_121_2] .. " " .. penaltyIni.reason[iter_121_2])
									else
										sampSendChat("/" .. penaltyIni.penalty[iter_121_2] .. " " .. variable .. " " .. penaltyIni.reason[iter_121_2])
									end
								end)
							end

							var_0_2.save(penaltyIni, "AdminHelper/penalty")
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Команда успешно создана.")

							buffers.PenaltyCommand.v = ""
							buffers.PenaltyTime.v = ""
							buffers.PenaltyReason.v = ""

							var_0_3.CloseCurrentPopup()
						else
							sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Данная команда уже существует.", 16776960)
						end

						cmdreserved = nil
					end
				end

				var_0_3.PopStyleColor()
				var_0_3.EndPopup()
			end

			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(430, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.penalty.v = not var_0_82.penalty.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()
			var_0_3.SetCursorPosX(34)
			var_0_3.TextColoredRGB("{7572A8}" .. var_0_46.ICON_FA_HAMMER)
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(91)
			var_0_3.TextColoredRGB(u8("{7572A8}Команда"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(186)
			var_0_3.TextColoredRGB(u8("{7572A8}Время"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(286)
			var_0_3.TextColoredRGB(u8("{7572A8}Причина"))
			var_0_3.BeginChild("##penalty", var_0_3.ImVec2(447, 345), false)

			if var_0_3.BeginPopupModal(u8("EditPenalty"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
				var_0_3.BeginGroup()
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_PENCIL_ALT .. u8(" {E0DEF8}Редактирование команды"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(290, 10))
				var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

				if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
					buffers.PenaltyCommand.v = ""
					buffers.PenaltyTime.v = ""
					buffers.PenaltyReason.v = ""

					var_0_3.CloseCurrentPopup()
				end

				var_0_3.PopStyleVar(1)
				var_0_3.EndGroup()
				var_0_3.SetCursorPosX(27)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_TERMINAL .. u8(" {FFFFFF}Команда"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(120)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CLOCK .. u8(" {FFFFFF}Время"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(213)
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COMMENT .. u8(" {FFFFFF}Причина"))
				var_0_3.PushItemWidth(100)
				var_0_3.InputText(u8("##1"), buffers.PenaltyCommand)
				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(118)
				var_0_3.PushItemWidth(65)

				if not var_0_26:find("Kick") and not var_0_26:find("Warn") and not var_0_26:find("Iban") then
					if buffers.PenaltyTime.v:find("-") then
						buffers.PenaltyTime.v = ""
					end

					var_0_3.InputText(u8("##2"), buffers.PenaltyTime, var_0_3.InputTextFlags.CharsDecimal)
				else
					buffers.PenaltyTime.v = "-"

					var_0_3.InputText(u8("##2"), buffers.PenaltyTime, var_0_3.InputTextFlags.ReadOnly)
				end

				var_0_3.PopItemWidth()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(186)
				var_0_3.PushItemWidth(131)
				var_0_3.InputText(u8("##3"), buffers.PenaltyReason)
				var_0_3.PopItemWidth()

				if var_0_26:find("Kick") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Kick", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Kick", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Kick"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(76)

				if var_0_26:find("Mute") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Mute", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Mute", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Mute"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(137)

				if var_0_26:find("Jail") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Jail", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Jail", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Jail"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(198)

				if var_0_26:find("Warn") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Warn", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Warn", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Warn"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(259)

				if var_0_26:find("Ban") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Ban", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Ban", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Ban"
				end

				var_0_3.SetCursorPosX(76)

				if var_0_26:find("Rmute") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Rmute", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Rmute", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Rmute"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(137)

				if var_0_26:find("Iban") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Iban", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Iban", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Iban"
				end

				var_0_3.SameLine()
				var_0_3.SetCursorPosX(198)

				if var_0_26:find("Sban") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.Button("Sban", var_0_3.ImVec2(58, 0))
					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Sban", var_0_3.ImVec2(58, 0)) then
					var_0_26 = "Sban"
				end

				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

				if var_0_3.Button(var_0_46.ICON_FA_SAVE .. u8(" Готово"), var_0_3.ImVec2(301, 0)) then
					if buffers.PenaltyCommand.v == "" or buffers.PenaltyTime.v == "" or buffers.PenaltyReason.v == "" then
						sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Заполните все поля.", 16776960)
					else
						for iter_121_3 = 1, #penaltyIni.cmd do
							if penaltyIni.cmd[iter_121_3]:find(u8:decode(buffers.PenaltyCommand.v)) and not penaltyIni.cmd[iter_121_3]:find(TempPenaltyCmd) then
								cmdreserved = true
							end
						end

						if cmdreserved == nil then
							for iter_121_4 = 1, #penaltyIni.cmd do
								sampUnregisterChatCommand(penaltyIni.cmd[iter_121_4])
							end

							penaltyIni.cmd[TempPenaltyCount] = u8:decode(buffers.PenaltyCommand.v)
							penaltyIni.time[TempPenaltyCount] = buffers.PenaltyTime.v
							penaltyIni.reason[TempPenaltyCount] = u8:decode(buffers.PenaltyReason.v)
							penaltyIni.penalty[TempPenaltyCount] = var_0_26

							for iter_121_5 = 1, #penaltyIni.cmd do
								sampRegisterChatCommand(penaltyIni.cmd[iter_121_5], function(arg_123_0)
									variable = string.match(arg_123_0, "(.+)")

									if variable == nil then
										sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Введите: /" .. penaltyIni.cmd[iter_121_5] .. " [id]", 16776960)
									elseif not tostring(penaltyIni.time[iter_121_5]):find("-") then
										sampSendChat("/" .. penaltyIni.penalty[iter_121_5] .. " " .. variable .. " " .. penaltyIni.time[iter_121_5] .. " " .. penaltyIni.reason[iter_121_5])
									else
										sampSendChat("/" .. penaltyIni.penalty[iter_121_5] .. " " .. variable .. " " .. penaltyIni.reason[iter_121_5])
									end
								end)
							end

							var_0_2.save(penaltyIni, "AdminHelper/penalty")
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Команда отредактирована.")

							buffers.PenaltyCommand.v = ""
							buffers.PenaltyTime.v = ""
							buffers.PenaltyReason.v = ""
							TempPenaltyCmd = nil
							TempPenaltyCount = nil

							var_0_3.CloseCurrentPopup()
						else
							sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Данная команда уже существует.", 16776960)
						end

						cmdreserved = nil
					end
				end

				var_0_3.PopStyleColor()
				var_0_3.EndPopup()
			end

			if penaltyIni ~= nil then
				for iter_121_6 = 1, #penaltyIni.cmd do
					if penaltyIni.cmd[iter_121_6] ~= nil then
						var_0_3.Button(u8(penaltyIni.penalty[iter_121_6]) .. "##penalty" .. iter_121_6, var_0_3.ImVec2(50, 0))
						var_0_3.SameLine()
						var_0_3.SetCursorPosX(53)
						var_0_3.Button(u8(penaltyIni.cmd[iter_121_6]) .. "##cmd" .. iter_121_6, var_0_3.ImVec2(100, 0))
						var_0_3.SameLine()
						var_0_3.SetCursorPosX(156)
						var_0_3.Button(u8(penaltyIni.time[iter_121_6]) .. "##time" .. iter_121_6, var_0_3.ImVec2(70, 0))
						var_0_3.SameLine()
						var_0_3.SetCursorPosX(229)
						var_0_3.Button(u8(penaltyIni.reason[iter_121_6]) .. "##reason" .. iter_121_6, var_0_3.ImVec2(135, 0))
						var_0_3.SameLine()
						var_0_3.SetCursorPosX(367)

						if var_0_3.Button(var_0_46.ICON_FA_PENCIL_ALT .. "##editpenaltyy" .. iter_121_6, var_0_3.ImVec2(30, 0)) then
							buffers.PenaltyCommand.v = tostring(penaltyIni.cmd[iter_121_6])
							buffers.PenaltyTime.v = tostring(penaltyIni.time[iter_121_6])
							buffers.PenaltyReason.v = tostring(u8(penaltyIni.reason[iter_121_6]))
							var_0_26 = tostring(penaltyIni.penalty[iter_121_6])
							TempPenaltyCmd = penaltyIni.cmd[iter_121_6]
							TempPenaltyCount = iter_121_6

							var_0_3.OpenPopup("EditPenalty")
						end

						ShowHelp("Редактировать команду")
						var_0_3.SameLine()
						var_0_3.SetCursorPosX(400)

						if var_0_3.Button(var_0_46.ICON_FA_TRASH_ALT .. "##deletepenalty" .. iter_121_6, var_0_3.ImVec2(30, 0)) then
							sampUnregisterChatCommand(penaltyIni.cmd[iter_121_6])
							table.remove(penaltyIni.penalty, iter_121_6)
							table.remove(penaltyIni.cmd, iter_121_6)
							table.remove(penaltyIni.time, iter_121_6)
							table.remove(penaltyIni.reason, iter_121_6)
							var_0_2.save(penaltyIni, "AdminHelper/penalty")
						end

						ShowHelp("Удалить команду")
					end
				end
			end

			var_0_3.EndChild()
			var_0_3.End()
		end

		if var_0_82.cmd.v then
			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_0 / 2 + 355, var_121_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(400, 575), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_INFO_CIRCLE .. u8(" Список доступных команд"), var_0_82.cmd, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_INFO_CIRCLE .. u8(" {E0DEF8}Список доступных команд"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(360, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.cmd.v = not var_0_82.cmd.v
			end

			var_0_3.EndGroup()
			var_0_3.PopStyleVar(1)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/res [сообщение] - Отправить сообщение разработчику"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/aears – Меню SMS прослушки"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/accs [id] – Проверить существующие аккаунты игрока"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/cmute [id/nick] – Проверить наличие мута у игрока"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/auncuf [id] – Снять наручники с игрока"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/mpgun [id] – Выдать пакет оружия для МП"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/mpwin [id] – Выдать награду победителю МП и объявить"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/ppv [id/nick] - Сравнение REG-IP и LAST-IP"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/appv [id/nick] - Сравнение REG-IP и LAST-IP с отправкой в /a"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/ab [id/nick] - Меню информации об игроке"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/invis – Вкл/выкл невидимость"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/pcheck – Проверить всех игроков на некорректные ники"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/acar - Меню спавна транспорта"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/ahgun - Меню выдачи оружия"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/fisheye - Вкл/выкл эффект рыбьего глаза"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/sgo [id] - обычный телепорт + инвиз"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/stp - тихий телепорт без оповещения + инвиз"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/sh [1-1000] - Скорость SpeedHack (рекомендуется 15)"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/admlvl [1-9] - Установить уровень админки"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/online – Отобразить в чате список онлайна из чекера"))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}/delstats – Очистить статистику"))
			var_0_3.End()
		end

		if var_0_103.v then
			checker:run()
		end

		if var_0_82.settings.v then
			local var_121_9, var_121_10 = getScreenResolution()

			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_9 / 2, var_121_10 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(530, 395), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_COGS .. u8(" AdminHelper | Настройки"), var_0_82.settings, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()

			if var_0_117 == 1 then
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COGS .. u8(" {E0DEF8}Настройки | Основные"))
			elseif var_0_117 == 2 then
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COGS .. u8(" {E0DEF8}Настройки | Разное"))
			elseif var_0_117 == 3 then
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COGS .. u8(" {E0DEF8}Настройки | Автовыдача"))
			end

			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(452, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_SAVE .. "", var_0_3.ImVec2(30, 0)) then
				configIni.config.sendsupport = checks.sendsupport_check.v
				configIni.config.nickformat = var_0_69.v

				var_0_2.save(configIni, "AdminHelper/config")
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Настройки сохранены.", 16776960)
			end

			var_0_3.PopStyleVar(1)
			ShowHelp("Сохранить настройки")
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(484, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.settings.v = not var_0_82.settings.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()
			var_0_3.BeginGroup()
			var_0_3.BeginChild("Left panel", var_0_3.ImVec2(115, 0), true)

			if var_0_3.Selectable(var_0_46.ICON_FA_COG .. u8(" Основные"), var_0_117 == 1) then
				var_0_117 = 1
			end

			if var_0_3.Selectable(var_0_46.ICON_FA_USER_COG .. u8(" Разное"), var_0_117 == 2) then
				var_0_117 = 2
			end

			if var_0_3.Selectable(var_0_46.ICON_FA_HAMMER .. u8(" Автовыдача"), var_0_117 == 3) then
				var_0_117 = 3
			end

			var_0_3.EndChild()
			var_0_3.EndGroup()
			var_0_3.SameLine()
			var_0_3.BeginGroup()
			var_0_3.BeginChild("Center panel", var_0_3.ImVec2(375, 338), true)

			if var_0_117 == 1 then
				if var_0_3.Checkbox(u8("[Beta] Scoreboard (Tab) с логом подключений"), checks.scoreboard) then
					configIni.config.scoreboard = checks.scoreboard.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				ShowWarningMarker("Beta функция\nЖрет FPS, когда открыто,\nне рекомендуется к использованию на слабых ПК")

				if var_0_3.Checkbox(u8("Работа чекера"), var_0_93) then
					configIni.config.checker = var_0_93.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if var_0_3.Checkbox(u8("Работа биндера"), checks.binder_check) then
					configIni.config.binder = checks.binder_check.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if var_0_3.Checkbox(u8("Автовыдача по просьбе администрации"), checks.autoplus_check) then
					configIni.config.autoplus = checks.autoplus_check.v

					var_0_2.save(configIni, "AdminHelper/config")
				end
			end

			if var_0_117 == 2 then
				if var_0_3.Checkbox(u8("Эффект рыбьего глаза"), checks.fisheye) then
					configIni.config.fisheye = checks.fisheye.v
					var_0_22 = configIni.config.fisheye

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if var_0_3.Checkbox(u8("Оповещения о возможности нажать ALT + R"), var_0_92) then
					configIni.config.fr = var_0_92.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if var_0_3.Checkbox(u8("Рекон из т/c и возвращение в т/с после окончания"), checks.reconcar) then
					configIni.config.reconcar = checks.reconcar.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if var_0_3.Checkbox(u8("Проверка аккаунтов после бана"), var_0_94) then
					configIni.config.ipcheck = var_0_94.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				ShowHelpMarker("После блокировки аккаунта игрока откроется чат\nс введенной командой /ipaccounts и ip заблокированного\nдля быстрой проверки всех существующих аккаунтов наказуемого")

				if var_0_3.Checkbox(u8("Статистика на экране"), checks.statshud) then
					configIni.config.statshud = checks.statshud.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if var_0_3.Checkbox(u8("Отображение ID в Kill List"), checks.killlistid) then
					configIni.config.killlistid = checks.killlistid.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if var_0_3.Checkbox(u8("Варнинги на некорректные ники у игроков"), checks.namewarning) then
					configIni.config.namewarning = checks.namewarning.v

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.SameLine()

				if var_0_3.BeginPopupModal(u8("Warnings Time"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
					var_0_3.BeginGroup()
					var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COGS .. u8(" {E0DEF8}Время между проверками"))
					var_0_3.SameLine()
					var_0_3.SetCursorPos(var_0_3.ImVec2(207, 10))
					var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

					if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
						var_0_3.CloseCurrentPopup()
					end

					var_0_3.PopStyleVar(1)
					var_0_3.EndGroup()
					var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Кол-во минут:"))
					var_0_3.PushItemWidth(220)
					var_0_3.InputText(u8(""), buffers.timewarning, var_0_3.InputTextFlags.CharsDecimal)
					var_0_3.PopItemWidth()
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

					if var_0_3.Button(var_0_46.ICON_FA_SAVE .. u8(" Сохранить"), var_0_3.ImVec2(220, 0)) then
						configIni.config.timewarning = tonumber(buffers.timewarning.v) * 60 * 1000

						var_0_2.save(configIni, "AdminHelper/config")
						sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Время между проверками некорректных никнеймов изменено.")
						var_0_3.CloseCurrentPopup()
					end

					var_0_3.PopStyleColor()
					var_0_3.EndPopup()
				end

				var_0_3.SetCursorPosX(307)

				if var_0_3.Button("" .. var_0_46.ICON_FA_COG, var_0_3.ImVec2(30, 0)) then
					var_0_3.OpenPopup("Warnings Time")
				end
			end

			if var_0_117 == 3 then
				var_0_3.Text(u8("Формат ника"))
				var_0_3.Combo("##nickformat", var_0_69, var_0_70, #var_0_70)
			end

			var_0_3.EndChild()
			var_0_3.EndGroup()
			var_0_3.End()
		end

		if var_0_82.cheats.v then
			local var_121_11, var_121_12 = getScreenResolution()

			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_11 / 2 - 255, var_121_12 / 2 + 49), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(200, 236), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_BIOHAZARD .. u8(" AdminHelper | Читы"), var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_BIOHAZARD .. u8(" {E0DEF8}Читы"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(159, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.cheats.v = not var_0_82.cheats.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()

			if configIni.config.wallhack == true then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("WallHack", var_0_3.ImVec2(83, 0)) then
					var_0_3.OpenPopup("WH params")
				end

				var_0_3.PopStyleColor()
				ShowHelp("Увеличивает дистанцию прорисовки ников,\nдобавляет отображение ников через объекты и стены")
			else
				if var_0_3.Button("WallHack", var_0_3.ImVec2(83, 0)) then
					var_0_3.OpenPopup("WH params")
				end

				ShowHelp("Увеличивает дистанцию прорисовки ников,\nдобавляет отображение ников через объекты и стены")
			end

			if var_0_3.BeginPopupModal(u8("WH params"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
				var_0_3.BeginGroup()
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_BIOHAZARD .. u8(" {E0DEF8}Настройки Wallhack"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(207, 10))
				var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

				if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
					if whVisible:find("off") then
						sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Wallhack отключен, может понадобиться перезапуск игры.", -1)
					end

					var_0_3.CloseCurrentPopup()
				end

				var_0_3.PopStyleVar(1)
				var_0_3.EndGroup()

				if whVisible:find("off") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button(u8("Выключить"), var_0_3.ImVec2(220, 0)) then
						-- block empty
					end

					var_0_3.PopStyleColor()
				elseif var_0_3.Button(u8("Выключить"), var_0_3.ImVec2(220, 0)) then
					whVisible = "off"
					defaultState = false

					nameTagOff()

					configIni.config.wallhack = defaultState
					configIni.config.WHtype = whVisible

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if whVisible:find("names") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button(u8("Только ник"), var_0_3.ImVec2(220, 0)) then
						-- block empty
					end

					var_0_3.PopStyleColor()
				elseif var_0_3.Button(u8("Только ник"), var_0_3.ImVec2(220, 0)) then
					defaultState = true
					whVisible = "names"

					nameTagOn()

					configIni.config.wallhack = defaultState
					configIni.config.WHtype = whVisible

					var_0_2.save(configIni, "AdminHelper/config")
				end

				if whVisible:find("all") then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button(u8("Ник и скелет"), var_0_3.ImVec2(220, 0)) then
						-- block empty
					end

					var_0_3.PopStyleColor()
				elseif var_0_3.Button(u8("Ник и скелет"), var_0_3.ImVec2(220, 0)) then
					defaultState = true
					whVisible = "all"

					nameTagOn()

					configIni.config.wallhack = defaultState
					configIni.config.WHtype = whVisible

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.EndPopup()
			end

			if configIni.config.clickwarp == true then
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("ClickWarp", var_0_3.ImVec2(83, 0)) then
					configIni.config.clickwarp = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			else
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)

				if var_0_3.Button("ClickWarp", var_0_3.ImVec2(83, 0)) then
					configIni.config.clickwarp = true

					var_0_2.save(configIni, "AdminHelper/config")
				end
			end

			ShowHelp("Варп телепорт на колесо мыши")

			if configIni.config.godmode == true then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("GodMode", var_0_3.ImVec2(83, 0)) then
					configIni.config.godmode = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			elseif var_0_3.Button("GodMode", var_0_3.ImVec2(83, 0)) then
				configIni.config.godmode = true

				var_0_2.save(configIni, "AdminHelper/config")
			end

			ShowHelp("Бессмертие на себя и на транспорт")

			if configIni.config.airbrake == true then
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("AirBrake", var_0_3.ImVec2(83, 0)) then
					configIni.config.airbrake = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			else
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)

				if var_0_3.Button("AirBrake", var_0_3.ImVec2(83, 0)) then
					configIni.config.airbrake = true

					var_0_2.save(configIni, "AdminHelper/config")
				end
			end

			ShowHelp("Парение, проход сквозь стены.\n\nУправление:\nRSHIFT - Активация\nQ/E - Скорость\nSPACE/LSHIFT - Вверх/вниз\n* - Вернуть стандартную скорость")

			if configIni.config.nofall == true then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("NoFall", var_0_3.ImVec2(83, 0)) then
					configIni.config.nofall = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			elseif var_0_3.Button("NoFall", var_0_3.ImVec2(83, 0)) then
				configIni.config.nofall = true

				var_0_2.save(configIni, "AdminHelper/config")
			end

			ShowHelp("Отключает анимацию падения")

			if configIni.config.infiniteammo == true then
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("InfiniteAmmo", var_0_3.ImVec2(83, 0)) then
					configIni.config.infiniteammo = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			else
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)

				if var_0_3.Button("InfiniteAmmo", var_0_3.ImVec2(83, 0)) then
					configIni.config.infiniteammo = true

					var_0_2.save(configIni, "AdminHelper/config")
				end
			end

			ShowHelp("Бесконечные патроны без перезарядки")

			if configIni.config.fastwalk == true then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("FastWalk", var_0_3.ImVec2(83, 0)) then
					var_0_15 = 1
					configIni.config.fastwalk = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			elseif var_0_3.Button("FastWalk", var_0_3.ImVec2(83, 0)) then
				configIni.config.fastwalk = true

				var_0_2.save(configIni, "AdminHelper/config")
			end

			ShowHelp("Ускорение анимаций движения.\n\nУправление:\n-/= - Скорость\n* - Вернуть стандартную скорость")

			if configIni.config.antistun == true then
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("AntiStun", var_0_3.ImVec2(83, 0)) then
					configIni.config.antistun = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			else
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)

				if var_0_3.Button("AntiStun", var_0_3.ImVec2(83, 0)) then
					configIni.config.antistun = true

					var_0_2.save(configIni, "AdminHelper/config")
				end
			end

			ShowHelp("Отключает анимацию от попадания из оружия")

			if configIni.config.highjump == true then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("HighJump", var_0_3.ImVec2(83, 0)) then
					configIni.config.highjump = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			elseif var_0_3.Button("HighJump", var_0_3.ImVec2(83, 0)) then
				configIni.config.highjump = true

				var_0_2.save(configIni, "AdminHelper/config")
			end

			ShowHelp("Высокий прыжок")

			if configIni.config.nochatanim == true then
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

				if var_0_3.Button("NoChatAnim", var_0_3.ImVec2(83, 0)) then
					configIni.config.nochatanim = false

					var_0_2.save(configIni, "AdminHelper/config")
				end

				var_0_3.PopStyleColor()
			else
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(103)

				if var_0_3.Button("NoChatAnim", var_0_3.ImVec2(83, 0)) then
					configIni.config.nochatanim = true

					var_0_2.save(configIni, "AdminHelper/config")
				end
			end

			ShowHelp("Отключает анимацию разговора при отправке сообщений в чат")

			if var_0_3.BeginPopupModal(u8("CarCheats"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
				var_0_3.BeginGroup()
				var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_BIOHAZARD .. u8(" {E0DEF8}CarCheats"))
				var_0_3.SameLine()
				var_0_3.SetCursorPos(var_0_3.ImVec2(157, 10))
				var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

				if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
					var_0_3.CloseCurrentPopup()
				end

				var_0_3.PopStyleVar(1)
				var_0_3.EndGroup()

				if configIni.config.speedhack then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button("SpeedHack", var_0_3.ImVec2(83, 0)) then
						configIni.config.speedhack = false

						var_0_2.save(configIni, "AdminHelper/config")
					end

					var_0_3.PopStyleColor()
				elseif var_0_3.Button("SpeedHack", var_0_3.ImVec2(83, 0)) then
					configIni.config.speedhack = true

					var_0_2.save(configIni, "AdminHelper/config")
				end

				ShowHelp("Увеличение скорости транспорта\nИспользование: ALT\nИзменение скорости - /sh [1-1000]\nСкорость по умолчанию - 15")

				if configIni.config.rideonwater then
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(103)
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button("RideOnWater", var_0_3.ImVec2(83, 0)) then
						configIni.config.rideonwater = false
						var_0_24 = configIni.config.rideonwater

						var_0_2.save(configIni, "AdminHelper/config")
					end

					var_0_3.PopStyleColor()
				else
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(103)

					if var_0_3.Button("RideOnWater", var_0_3.ImVec2(83, 0)) then
						configIni.config.rideonwater = true

						var_0_2.save(configIni, "AdminHelper/config")
					end
				end

				ShowHelp("Езда по воде\nАктивация/деактивация: X")

				if configIni.config.autoflip then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button("AutoFlip", var_0_3.ImVec2(83, 0)) then
						configIni.config.autoflip = false

						var_0_2.save(configIni, "AdminHelper/config")
					end

					var_0_3.PopStyleColor()
				elseif var_0_3.Button("AutoFlip", var_0_3.ImVec2(83, 0)) then
					configIni.config.autoflip = true

					var_0_2.save(configIni, "AdminHelper/config")
				end

				ShowHelp("Не позволяет транспорту перевернуться на крышу")

				if configIni.config.coup then
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(103)
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button("Coup", var_0_3.ImVec2(83, 0)) then
						configIni.config.coup = false

						var_0_2.save(configIni, "AdminHelper/config")
					end

					var_0_3.PopStyleColor()
				else
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(103)

					if var_0_3.Button("Coup", var_0_3.ImVec2(83, 0)) then
						configIni.config.coup = true

						var_0_2.save(configIni, "AdminHelper/config")
					end
				end

				ShowHelp("Резкая остановка транспорта/переворот на крышу\nИспользование: Delete")

				if configIni.config.turn then
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button("Turn", var_0_3.ImVec2(83, 0)) then
						configIni.config.turn = false

						var_0_2.save(configIni, "AdminHelper/config")
					end

					var_0_3.PopStyleColor()
				elseif var_0_3.Button("Turn", var_0_3.ImVec2(83, 0)) then
					configIni.config.turn = true

					var_0_2.save(configIni, "AdminHelper/config")
				end

				ShowHelp("Резкая остановка и разворот транспорта на 180 градусов\nИспользование: Backspace")

				if configIni.config.jumpcar then
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(103)
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button("JumpCar", var_0_3.ImVec2(83, 0)) then
						configIni.config.jumpcar = false

						var_0_2.save(configIni, "AdminHelper/config")
					end

					var_0_3.PopStyleColor()
				else
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(103)

					if var_0_3.Button("JumpCar", var_0_3.ImVec2(83, 0)) then
						configIni.config.jumpcar = true

						var_0_2.save(configIni, "AdminHelper/config")
					end
				end

				ShowHelp("Подбрасывает транспорт вверх\nИспользование: CapsLock")

				if configIni.config.NoBikeFall then
					var_0_3.SetCursorPosX(58)
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(58, 163, 56):GetVec4())

					if var_0_3.Button("NoBikeFall", var_0_3.ImVec2(83, 0)) then
						configIni.config.NoBikeFall = false

						var_0_2.save(configIni, "AdminHelper/config")
					end

					var_0_3.PopStyleColor()
				else
					var_0_3.SetCursorPosX(58)

					if var_0_3.Button("NoBikeFall", var_0_3.ImVec2(83, 0)) then
						configIni.config.NoBikeFall = true

						var_0_2.save(configIni, "AdminHelper/config")
					end
				end

				ShowHelp("Убирает возможность падения с велосипеда/мотоцикла")
				var_0_3.EndPopup()
			end

			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button("CarCheats", var_0_3.ImVec2(-0.1, 0)) then
				var_0_3.OpenPopup("CarCheats")
			end

			var_0_3.PopStyleColor()
			ShowHelp("Читы, связанные с транспортом")
			var_0_3.End()
		end

		if var_0_82.response.v then
			local var_121_13, var_121_14 = getScreenResolution()
			local var_121_15 = var_0_3.ImVec2(-0.1, 0)
			local var_121_16 = {
				u8("Предложение по улучшению"),
				u8("Баг"),
				u8("Вопрос"),
				u8("Другое")
			}

			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_13 / 2 + 315, var_121_14 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(320, 293), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(u8("AdminHelper | Response"), var_0_82.response, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_AT .. u8(" {E0DEF8}Обратная связь"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(276, 10))
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.response.v = not var_0_82.response.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.PopStyleColor()
			var_0_3.EndGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Сообщение:"))
			var_0_3.InputTextMultiline("##response", buffers.response, var_0_3.ImVec2(290, 130))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Тип обращения:"))
			var_0_3.PushItemWidth(290)
			var_0_3.Combo("", var_0_102, var_121_16, #var_121_16)
			var_0_3.PopItemWidth()

			if var_0_3.Button(var_0_46.ICON_FA_PAPER_PLANE .. u8(" Отправить"), var_121_15) then
				if buffers.response.v ~= nil and buffers.response.v ~= "" and buffers.response.v ~= " " then
					if timeresponse == nil or os.clock() - timeresponse >= 10 then
						timeresponse = os.clock()

						if var_0_102.v == 0 then
							sendTelegramNotification("[RESPONSE: Idea]\n\n" .. u8:decode(buffers.response.v) .. "\n\nОт: /" .. nick .. "\nЛвл админки: " .. admlvl .. "\nСервер: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1))
						elseif var_0_102.v == 1 then
							sendTelegramNotification("[RESPONSE: Bag]\n\n" .. u8:decode(buffers.response.v) .. "\n\nОт: /" .. nick .. "\nЛвл админки: " .. admlvl .. "\nСервер: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1))
						elseif var_0_102.v == 2 then
							sendTelegramNotification("[RESPONSE: Question]\n\n" .. u8:decode(buffers.response.v) .. "\n\nОт: /" .. nick .. "\nЛвл админки: " .. admlvl .. "\nСервер: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1))
						elseif var_0_102.v == 3 then
							sendTelegramNotification("[RESPONSE: Other]\n\n" .. u8:decode(buffers.response.v) .. "\n\nОт: /" .. nick .. "\nЛвл админки: " .. admlvl .. "\nСервер: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1))
						end

						sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ваше обращение отправлено разработчику.", -1)
					else
						sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Подождите " .. math.ceil(10 - (os.clock() - timeresponse)) .. " сек.", -1)
					end
				else
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Введите сообщение.", -1)
				end
			end

			var_0_3.End()
		end

		if var_0_82.log.v then
			local var_121_17, var_121_18 = getScreenResolution()

			var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_17 / 2, var_121_18 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
			var_0_3.SetNextWindowSize(var_0_3.ImVec2(590, 395), var_0_3.Cond.FirstUseEver)
			var_0_3.Begin(var_0_46.ICON_FA_HISTORY .. u8(" AdminHelper | Лог обновлений"), var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_HISTORY .. u8(" {E0DEF8}Лог обновлений"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(544, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_82.log.v = not var_0_82.log.v
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()
			var_0_3.BeginGroup()
			var_0_3.BeginChild("##pe", var_0_3.ImVec2(560, 345), false)

			if var_0_3.CollapsingHeader("0.8.1") then
				var_0_3.Text(u8("- Улучшен интерфейс"))
				var_0_3.Text(u8("- Были произведены заменены команд 'Авто-форм'."))
			end

			var_0_3.EndChild()
			var_0_3.EndGroup()
			var_0_3.End()
		end

		var_0_3.End()
	end

	if var_0_82.mpwin.v then
		local var_121_19, var_121_20 = getScreenResolution()
		local var_121_21 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_19 / 2, var_121_20 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(360, 160), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(var_0_46.ICON_FA_GIFT .. u8(" AdminHelper | Выдача приза"), var_0_82.mpwin, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_GIFT .. u8(" {E0DEF8}Выдача приза"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(315, 10))
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.mpwin.v = not var_0_82.mpwin.v
			var_0_3.Process = var_0_82.mpwin.v
		end

		var_0_3.PopStyleVar(1)
		var_0_3.EndGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Ник: ") .. var_0_79.winnick .. "[" .. var_0_79.var1 .. "]")
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Уровень: ") .. var_0_79.lvl)

		if var_0_80 == 1 then
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(u8(" 50.000$"), var_0_3.ImVec2(80, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
			var_0_3.SameLine()
		else
			if var_0_3.Button(u8(" 50.000$"), var_0_3.ImVec2(80, 0)) then
				var_0_80 = 1
			end

			var_0_3.SameLine()
		end

		if var_0_80 == 2 then
			var_0_3.SetCursorPosX(98)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(u8(" 100.000$"), var_0_3.ImVec2(80, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
			var_0_3.SameLine()
		else
			var_0_3.SetCursorPosX(98)

			if var_0_3.Button(u8(" 100.000$"), var_0_3.ImVec2(80, 0)) then
				var_0_80 = 2
			end

			var_0_3.SameLine()
		end

		if var_0_80 == 3 then
			var_0_3.SetCursorPosX(181)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(u8(" 150.000$"), var_0_3.ImVec2(80, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
			var_0_3.SameLine()
		else
			var_0_3.SetCursorPosX(181)

			if var_0_3.Button(u8(" 150.000$"), var_0_3.ImVec2(80, 0)) then
				var_0_80 = 3
			end

			var_0_3.SameLine()
		end

		if var_0_80 == 4 then
			var_0_3.SetCursorPosX(264)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(u8(" 200.000$"), var_0_3.ImVec2(80, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
		else
			var_0_3.SetCursorPosX(264)

			if var_0_3.Button(u8(" 200.000$"), var_0_3.ImVec2(80, 0)) then
				var_0_80 = 4
			end
		end

		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.Button(var_0_46.ICON_FA_HANDS .. u8(" Выдать награду"), var_121_21) then
			givegiftfunc:run()
		end

		var_0_3.PopStyleColor()
		var_0_3.End()
	end

	if var_0_82.acar.v then
		spawncar:run()
	end

	if var_0_82.ahgun.v then
		ahgun:run()
	end

	if var_0_82.ppv.v then
		if var_0_82.menu.v then
			var_0_82.menu.v = false
		end

		searchaccounts = true

		local var_121_22, var_121_23 = getScreenResolution()
		local var_121_24 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_22 / 2, var_121_23 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(335, 393), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(u8("AdminHelper | Проверка на П/П/В"), var_0_82.ppv, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_WIFI .. u8(" {E0DEF8}IP Info 2.0"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(256, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_COMMENT .. "##1", var_0_3.ImVec2(30, 0)) then
			if not tostring(var1):find("%a+") then
				sampProcessChatInput("/appv " .. var1)
			else
				sampProcessChatInput("/appv " .. ppvnick)
			end
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		ShowHelp("Отправить информацию об игроке в /a чат")
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(289, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			if var_0_82.acheck.v ~= true then
				searchaccounts = false
			end

			if var_0_82.bans.v == false then
				var_0_82.ppv.v = not var_0_82.ppv.v
				var_0_3.Process = var_0_82.ppv.v
			else
				var_0_82.ppv.v = not var_0_82.ppv.v
			end
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if not tostring(var1):find("%a+") then
			var_0_3.Button("" .. ppvnick .. "[" .. var1 .. "]", var_0_3.ImVec2(303, 0))
		else
			var_0_3.Button("" .. ppvnick, var_0_3.ImVec2(303, 0))
		end

		var_0_3.PopStyleColor()
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.Button(var_0_46.ICON_FA_SEARCH .. u8(" ") .. quer.v1, var_0_3.ImVec2(150, 0)) then
			ipaccountscheck = nil

			lua_thread.create(function()
				wait(0)

				ipsaccounts = {
					nick = {},
					lvl = {},
					status = {},
					date = {},
					time = {}
				}

				sampSendChat("/ips " .. quer.v1 .. " 0")

				ipsaccip = quer.v1

				wait(500)

				var_0_82.ipaccounts.v = true
			end)
		end

		var_0_3.PopStyleColor()
		ShowHelp("Выполнить поиск по аккаунтам\nпринадлежащим данному IP адресу")

		if quer.v1:find(quer.v2) then
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_SEARCH .. u8(" ") .. quer.v2, var_0_3.ImVec2(150, 0)) then
				ipaccountscheck = nil

				lua_thread.create(function()
					wait(0)

					ipsaccounts = {
						nick = {},
						lvl = {},
						status = {},
						date = {},
						time = {}
					}

					sampSendChat("/ips " .. quer.v2 .. " 0")

					ipsaccip = quer.v2

					wait(500)

					var_0_82.ipaccounts.v = true
				end)
			end

			var_0_3.PopStyleColor()
			ShowHelp("Выполнить поиск по аккаунтам\nпринадлежащим данному IP адресу")
		else
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_SEARCH .. u8(" ") .. quer.v2, var_0_3.ImVec2(150, 0)) then
				ipaccountscheck = nil

				lua_thread.create(function()
					wait(0)

					ipsaccounts = {
						nick = {},
						lvl = {},
						status = {},
						date = {},
						time = {}
					}

					sampSendChat("/ips " .. quer.v2 .. " 0")

					ipsaccip = quer.v2

					wait(500)

					var_0_82.ipaccounts.v = true
				end)
			end

			var_0_3.PopStyleColor()
			ShowHelp("Выполнить поиск по аккаунтам\nпринадлежащим данному IP адресу")
		end

		var_0_3.SetCursorPosX(36)
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.Button(var_0_46.ICON_FA_EYE .. "##11", var_0_3.ImVec2(30, 0)) then
			if not tostring(var1):find("%a+") then
				sampSendChat("/re " .. var1)
			else
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Игрок не в сети.", 16776960)
			end
		end

		var_0_3.PopStyleColor()
		ShowHelp("/re")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(69)
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.Button(var_0_46.ICON_FA_FILE_SIGNATURE .. "##11", var_0_3.ImVec2(30, 0)) then
			lua_thread.create(function()
				fuckingnick = ppvnick

				wait(0)

				offstatsmassiv = {
					account,
					lvl,
					exp,
					number,
					wantedlvl,
					donate,
					home,
					renthome,
					business,
					gender,
					job,
					fraction,
					rank,
					referal,
					promocode,
					regip,
					lastip,
					regdate,
					lastonline,
					jail,
					mute,
					rmute
				}

				wait(800)
				sampSendChat("/offstats " .. ppvnick)

				var_0_82.offstats.v = true
			end)
		end

		var_0_3.PopStyleColor()
		ShowHelp("/offstats")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(102)
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.Button(var_0_46.ICON_FA_ADDRESS_CARD .. "##44", var_0_3.ImVec2(30, 0)) then
			lua_thread.create(function()
				fuckingnick = ppvnick

				wait(0)

				ppvanamestore = {
					name1 = {},
					name2 = {},
					date = {},
					time = {},
					changer = {}
				}

				wait(800)
				sampSendChat("/anamestore " .. ppvnick)

				var_0_82.anamestore.v = true
			end)
		end

		var_0_3.PopStyleColor()
		ShowHelp("/anamestore")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(201)
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.Button(var_0_46.ICON_FA_PLUG .. "##55", var_0_3.ImVec2(30, 0)) then
			lua_thread.create(function()
				fuckingnick = ppvnick

				wait(0)

				ppvconnections = {
					date = {},
					time = {},
					ip = {},
					platform = {}
				}

				wait(800)
				sampSendChat("/connections " .. ppvnick)

				var_0_82.connections.v = true
			end)
		end

		var_0_3.PopStyleColor()
		ShowHelp("/connections")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(234)
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Страны:"))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.Button("" .. u8(quer.v3), var_0_3.ImVec2(150, 0))
		var_0_3.PopStyleColor()

		if quer.v3:find(quer.v4) then
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button("" .. u8(quer.v4), var_0_3.ImVec2(150, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
		else
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

			if var_0_3.Button("" .. u8(quer.v4), var_0_3.ImVec2(150, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
		end

		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Города:"))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.Button("" .. u8(quer.v5), var_0_3.ImVec2(150, 0))
		var_0_3.PopStyleColor()

		if quer.v5:find(quer.v6) then
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.Button("" .. u8(quer.v6), var_0_3.ImVec2(150, 0))
			var_0_3.PopStyleColor()
		else
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())
			var_0_3.Button("" .. u8(quer.v6), var_0_3.ImVec2(150, 0))
			var_0_3.PopStyleColor()
		end

		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Провайдеры:"))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.Button("" .. u8(quer.v7), var_0_3.ImVec2(150, 0))
		var_0_3.PopStyleColor()
		ShowHelp(quer.v7)

		if quer.v7:find(quer.v8) then
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.Button("" .. u8(quer.v8), var_0_3.ImVec2(150, 0))
			var_0_3.PopStyleColor()
			ShowHelp(quer.v8)
		else
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(168)
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())
			var_0_3.Button("" .. u8(quer.v8), var_0_3.ImVec2(150, 0))
			var_0_3.PopStyleColor()
			ShowHelp(quer.v8)
		end

		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Расстояние:"))

		if distances <= 449 then
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.Button("" .. math.ceil(distances) .. u8(" км"), var_0_3.ImVec2(303, 0))
			var_0_3.PopStyleColor()
		else
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())
			var_0_3.Button("" .. math.ceil(distances) .. u8(" км"), var_0_3.ImVec2(303, 0))
			var_0_3.PopStyleColor()
		end

		if not tostring(var1):find("%a+") then
			if os.clock() - var_0_123 <= 4 then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

				if var_0_3.Button(var_0_46.ICON_FA_ARROW_LEFT .. "", var_0_3.ImVec2(70, 0)) then
					sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Не так быстро.", 16776960)
				end

				var_0_3.PopStyleColor()
			else
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

				if var_0_3.Button(var_0_46.ICON_FA_ARROW_LEFT .. "", var_0_3.ImVec2(70, 0)) then
					var_0_123 = os.clock()
					var1 = tonumber(var1) - 1

					if sampIsPlayerConnected(var1) then
						sampProcessChatInput("/ppv " .. var1)
					else
						while not sampIsPlayerConnected(var1) do
							if tonumber(var1) > 0 then
								var1 = tonumber(var1) - 1
							else
								var1 = 1000
							end

							if sampIsPlayerConnected(var1) then
								sampProcessChatInput("/ppv " .. var1)
							end
						end
					end

					if quer.v1:find(quer.v1) then
						quer = {
							v6 = "",
							v3 = "",
							v5 = "",
							v7 = "",
							v8 = "",
							v4 = "",
							v1 = u8(""),
							v2 = u8("")
						}
						distances = 0
					end
				end

				var_0_3.PopStyleColor()
			end

			var_0_3.SameLine()
			var_0_3.SetCursorPosX(247)

			if os.clock() - var_0_123 <= 4 then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

				if var_0_3.Button(var_0_46.ICON_FA_ARROW_RIGHT .. "", var_0_3.ImVec2(70, 0)) then
					sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Не так быстро.", 16776960)
				end

				var_0_3.PopStyleColor()
			else
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

				if var_0_3.Button(var_0_46.ICON_FA_ARROW_RIGHT .. "", var_0_3.ImVec2(70, 0)) then
					var_0_123 = os.clock()
					var1 = tonumber(var1) + 1

					if sampIsPlayerConnected(var1) then
						sampProcessChatInput("/ppv " .. var1)
					else
						while not sampIsPlayerConnected(var1) do
							if tonumber(var1) < 1000 then
								var1 = tonumber(var1) + 1
							else
								var1 = 0
							end

							if sampIsPlayerConnected(var1) then
								sampProcessChatInput("/ppv " .. var1)
							end
						end
					end

					if quer.v1:find(quer.v1) then
						quer = {
							v6 = "",
							v3 = "",
							v5 = "",
							v7 = "",
							v8 = "",
							v4 = "",
							v1 = u8(""),
							v2 = u8("")
						}
						distances = 0
					end
				end

				var_0_3.PopStyleColor()
			end
		end

		var_0_3.End()
	end

	if var_0_82.acheck.v then
		searchaccounts = true

		local var_121_25, var_121_26 = getScreenResolution()
		local var_121_27 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_25 / 2, var_121_26 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(335, 213), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(u8("AdminHelper | acheck"), var_0_82.acheck, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_DATABASE .. u8(" {E0DEF8}[Admin Base]"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(289, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			if var_0_82.ppv.v ~= true then
				searchaccounts = false
			end

			var_0_82.acheck.v = not var_0_82.acheck.v
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()

		if not tostring(var1):find("%a+") then
			achecktumbler = true

			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.Button("" .. achecknick .. "[" .. var1 .. "]", var_0_3.ImVec2(303, 0))
			var_0_3.PopStyleColor()
			ShowHelp("Игрок онлайн")
		else
			achecktumbler = false

			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())
			var_0_3.Button("" .. achecknick, var_0_3.ImVec2(303, 0))
			var_0_3.PopStyleColor()
			ShowHelp("Игрок оффлайн")
		end

		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.Button(var_0_46.ICON_FA_EYE .. u8(" Слежка"), var_0_3.ImVec2(145, 0)) then
			if not tostring(var1):find("%a+") then
				sampSendChat("/re " .. var1)
			else
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Игрок не в сети.", 16776960)
			end
		end

		var_0_3.PopStyleColor()
		ShowHelp("/re")
		var_0_3.SameLine()

		if tonumber(configIni.config.admlvl) > 1 then
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_FILE_SIGNATURE .. u8(" Статистика"), var_0_3.ImVec2(145, 0)) then
				lua_thread.create(function()
					fuckingnick = achecknick

					wait(0)

					offstatsmassiv = {
						account,
						lvl,
						exp,
						number,
						wantedlvl,
						donate,
						home,
						renthome,
						business,
						gender,
						job,
						fraction,
						rank,
						referal,
						promocode,
						regip,
						lastip,
						regdate,
						lastonline,
						jail,
						mute,
						rmute
					}

					wait(800)
					sampSendChat("/offstats " .. achecknick)

					var_0_82.offstats.v = true
				end)
			end

			var_0_3.PopStyleColor()
			ShowHelp("/offstats")
		else
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_FILE_SIGNATURE .. u8(" Статистика"), var_0_3.ImVec2(145, 0)) then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Доступно со 2-го уровня администратора.", 16776960)
			end

			var_0_3.PopStyleColor()
			ShowHelp("/offstats")
		end

		var_0_3.SameLine()

		if tonumber(configIni.config.admlvl) > 1 then
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_ADDRESS_CARD .. u8(" Никнеймы"), var_0_3.ImVec2(145, 0)) then
				lua_thread.create(function()
					fuckingnick = achecknick

					wait(0)

					ppvanamestore = {
						name1 = {},
						name2 = {},
						date = {},
						time = {},
						changer = {}
					}

					wait(800)
					sampSendChat("/anamestore " .. achecknick)

					var_0_82.anamestore.v = true
				end)
			end

			var_0_3.PopStyleColor()
			ShowHelp("/anamestore")
		else
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_ADDRESS_CARD .. u8(" Никнеймы"), var_0_3.ImVec2(145, 0)) then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Доступно с 2-го уровня администратора.", 16776960)
			end

			var_0_3.PopStyleColor()
			ShowHelp("/anamestore")
		end

		if tonumber(configIni.config.admlvl) > 3 then
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_PLUG .. u8(" Подключения"), var_0_3.ImVec2(145, 0)) then
				lua_thread.create(function()
					fuckingnick = achecknick

					wait(0)

					ppvconnections = {
						date = {},
						time = {},
						ip = {},
						platform = {}
					}

					wait(800)
					sampSendChat("/connections " .. achecknick)

					var_0_82.connections.v = true
				end)
			end

			var_0_3.PopStyleColor()
			ShowHelp("/connections")
		else
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_PLUG .. u8(" Подключения"), var_0_3.ImVec2(145, 0)) then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Доступно с 4-го уровня администратора.", 16776960)
			end

			var_0_3.PopStyleColor()
			ShowHelp("/connections")
		end

		var_0_3.SameLine()

		if tonumber(configIni.config.admlvl) > 3 then
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_SEARCH .. u8(" Аккаунты"), var_0_3.ImVec2(145, 0)) then
				if achecktumbler == true then
					lua_thread.create(function()
						wait(0)

						ipsaccounts = {
							nick = {},
							lvl = {},
							status = {},
							date = {},
							time = {}
						}
						acheckips = true

						wait(50)
						sampSendChat("/getip " .. var1)
						wait(1000)
						sampSendChat("/ips " .. acheckip .. " 0")
						wait(500)

						var_0_82.ipaccounts.v = true
					end)
				else
					lua_thread.create(function()
						wait(0)

						ipsaccounts = {
							nick = {},
							lvl = {},
							status = {},
							date = {},
							time = {}
						}
						acheckips = true

						wait(50)
						sampSendChat("/offstats " .. var1)
						wait(2000)
						sampSendChat("/ips " .. acheckip .. " 0")
						wait(500)

						var_0_82.ipaccounts.v = true
					end)
				end
			end

			var_0_3.PopStyleColor()
			ShowHelp("Выполнить поиск по аккаунтам")
		else
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(204, 37, 37):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_SEARCH .. u8(" Аккаунты"), var_0_3.ImVec2(145, 0)) then
				sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Доступно с 4-го уровня администратора.", 16776960)
			end

			var_0_3.PopStyleColor()
			ShowHelp("Выполнить поиск по аккаунтам")
		end

		var_0_3.End()
	end

	if var_0_82.ipaccounts.v then
		local var_121_28, var_121_29 = getScreenResolution()
		local var_121_30 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_28 / 2, var_121_29 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(580, 330), var_0_3.Cond.FirstUseEver)
		var_0_3.PushStyleColor(var_0_3.Col.WindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0.97))
		var_0_3.PushStyleColor(var_0_3.Col.ChildWindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0))
		var_0_3.Begin(u8("AdminHelper | ipaccounts"), var_0_82.ipaccounts, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()

		if ipsaccip ~= nil then
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_SEARCH .. u8(" {E0DEF8}Аккаунты по IP адресу: ") .. ipsaccip)
		elseif acheckip ~= nil then
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_SEARCH .. u8(" {E0DEF8}Аккаунты по IP адресу: ") .. acheckip)
		elseif ipaccountscheck ~= nil then
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_SEARCH .. u8(" {E0DEF8}Аккаунты по IP адресу: ") .. ipaccounts_ip)
		end

		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(473, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_USER_CHECK .. "##1", var_0_3.ImVec2(30, 0)) then
			if acheckips ~= nil then
				kostil = acheckips
				acheckips = nil
			end

			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Ничего не делайте, требуется время, ожидайте... ", -1)

			if ipsaccounts.nick ~= nil then
				var_0_82.machinations.v = true

				lua_thread.create(function()
					wait(0)

					for iter_143_0 = 1, #ipsaccounts.nick do

						sampSendChat("/offstats " .. ipsaccounts.nick[iter_143_0])
						sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Процесс: [" .. iter_143_0 .. "]", -1)
						wait(1500)
					end

					sampAddChatMessage("{51fffa}[AdminHelper] {28BE11}Готово.", -1)

					if kostil ~= nil then
						acheckips = true
					end

					kostil = nil
				end)
			end
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		ShowHelp("Проверить аккаунты на махинации")
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(506, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##2", var_0_3.ImVec2(30, 0)) then
			var_0_82.ipaccounts.v = not var_0_82.ipaccounts.v
			acheckips = nil
			ipaccountscheck = nil
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()

		if ipsaccounts.nick ~= nil then
			var_0_3.SetCursorPosX(12)
			var_0_3.TextColoredRGB(u8(" {5252DF}№"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(35)
			var_0_3.TextColoredRGB(u8(" {5252DF}Ник"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(185)
			var_0_3.TextColoredRGB(u8(" {5252DF}Уровень"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(250)
			var_0_3.TextColoredRGB(u8(" {5252DF}Статус"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(310)
			var_0_3.TextColoredRGB(u8(" {5252DF}Дата входа"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(395)
			var_0_3.TextColoredRGB(u8(" {5252DF}Время входа"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(490)
			var_0_3.TextColoredRGB(u8(" {5252DF}Действия"))
			var_0_3.BeginChild("##ipsaccs", var_0_3.ImVec2(552, 257), false)

			for iter_121_9 = 1, #ipsaccounts.nick do
				var_0_3.TextColoredRGB(iter_121_9 .. "")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(23)
				var_0_3.TextColoredRGB(ipsaccounts.nick[iter_121_9])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(173)
				var_0_3.TextColoredRGB(ipsaccounts.lvl[iter_121_9])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(238)
				var_0_3.TextColoredRGB(ipsaccounts.status[iter_121_9])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(298)
				var_0_3.TextColoredRGB(ipsaccounts.date[iter_121_9])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(383)
				var_0_3.TextColoredRGB(ipsaccounts.time[iter_121_9])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(478)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

				if var_0_3.Button(u8("##Yo") .. iter_121_9, var_0_3.ImVec2(55, 15)) then
					if acheckips == nil then
						var_0_3.OpenPopup("##Ipaccounts interactive" .. iter_121_9)
					elseif ipsaccounts.status[iter_121_9]:find("ONLINE") then
						lua_thread.create(function()
							wait(0)

							acheckaccnick = nil
							acheckaccid = nil
							acheckid = true
							ipsaccounts.nick[iter_121_9] = ipsaccounts.nick[iter_121_9]:match("%{.+%}(.+)")
							acheckaccnick = ipsaccounts.nick[iter_121_9]
							var_0_82.ipaccounts.v = false

							sampSendChat("/id " .. acheckaccnick)
							wait(1000)

							if acheckaccid ~= nil then
								sampProcessChatInput("/abase " .. acheckaccid)
							else
								sampSendChat("/id " .. acheckaccnick)
								wait(1000)

								if acheckaccid ~= nil then
									sampProcessChatInput("/abase " .. acheckaccid)
								end
							end

							acheckips = nil
							ipaccountscheck = nil
						end)
					else
						ipsaccounts.nick[iter_121_9] = ipsaccounts.nick[iter_121_9]:match("%{.+%}(.+)")
						acheckaccnick = ipsaccounts.nick[iter_121_9]
						var_0_82.ipaccounts.v = false

						if acheckaccnick ~= nil then
							sampProcessChatInput("/abase " .. acheckaccnick)
						else
							lua_thread.create(function()
								wait(1000)

								ipsaccounts.nick[iter_121_9] = ipsaccounts.nick[iter_121_9]:match("%{.+%}(.+)")
								acheckaccnick = ipsaccounts.nick[iter_121_9]

								if acheckaccnick ~= nil then
									sampProcessChatInput("/abase " .. acheckaccnick)
								else
									sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Произошла ошибка.", -1)
								end
							end)
						end

						acheckips = nil
						ipaccountscheck = nil
					end
				end

				var_0_3.PopStyleColor()

				if var_0_3.BeginPopupModal("##Ipaccounts interactive" .. iter_121_9, _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
					var_0_3.BeginGroup()
					var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COG .. u8(" {E0DEF8}Действия с ") .. ipsaccounts.nick[iter_121_9])
					var_0_3.SameLine()
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.SetCursorPos(var_0_3.ImVec2(253, 10))
					var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

					if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
						var_0_3.CloseCurrentPopup()
					end

					var_0_3.PopStyleVar(1)
					var_0_3.PopStyleColor()
					var_0_3.EndGroup()

					if not ipsaccounts.nick[iter_121_9]:find(ppvnick) then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_WIFI .. " PPV", var_0_3.ImVec2(265, 0)) then
							if ipsaccounts.status[iter_121_9]:find("ONLINE") then
								var_0_3.CloseCurrentPopup()
								lua_thread.create(function()
									wait(0)

									ipsaccounts.nick[iter_121_9] = ipsaccounts.nick[iter_121_9]:match("%{.+%}(.+)")
									ppvid = true
									ppvaccnick = ipsaccounts.nick[iter_121_9]

									sampSendChat("/id " .. ipsaccounts.nick[iter_121_9])
									wait(1000)
									sampProcessChatInput("/ppv " .. ppvaccid)
									wait(200)

									ppvaccid = nil
								end)
							else
								var_0_3.CloseCurrentPopup()

								ipsaccounts.nick[iter_121_9] = ipsaccounts.nick[iter_121_9]:match("%{.+%}(.+)")

								sampProcessChatInput("/ppv " .. ipsaccounts.nick[iter_121_9])
							end
						end

						var_0_3.PopStyleColor()
						ShowHelp("/ppv")
					end

					if ipsaccounts.status[iter_121_9]:find("ONLINE") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_EYE .. " Recon", var_0_3.ImVec2(265, 0)) then
							var_0_3.CloseCurrentPopup()
							lua_thread.create(function()
								wait(0)

								reconppv = true

								sampSendChat("/id " .. ipsaccounts.nick[iter_121_9])
								wait(1000)
								sampSendChat("/re " .. reconid)
								wait(100)

								reconid = nil
							end)
						end

						var_0_3.PopStyleColor()
						ShowHelp("/re")
					end

					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

					if var_0_3.Button(var_0_46.ICON_FA_FILE_SIGNATURE .. " Offstats", var_0_3.ImVec2(265, 0)) then
						lua_thread.create(function()
							wait(0)

							fuckingnick = ipsaccounts.nick[iter_121_9]
							offstatsmassiv = {
								account,
								lvl,
								exp,
								number,
								wantedlvl,
								donate,
								home,
								renthome,
								business,
								gender,
								job,
								fraction,
								rank,
								referal,
								promocode,
								regip,
								lastip,
								regdate,
								lastonline,
								jail,
								mute,
								rmute
							}

							wait(800)
							var_0_3.CloseCurrentPopup()
							sampSendChat("/offstats " .. ipsaccounts.nick[iter_121_9])

							var_0_82.offstats.v = true
						end)
					end

					var_0_3.PopStyleColor()
					ShowHelp("/offstats")

					if var_0_3.Button(var_0_46.ICON_FA_ADDRESS_CARD .. " Anamestore", var_0_3.ImVec2(265, 0)) then
						lua_thread.create(function()
							wait(0)

							fuckingnick = ipsaccounts.nick[iter_121_9]
							ppvanamestore = {
								name1 = {},
								name2 = {},
								date = {},
								time = {},
								changer = {}
							}

							wait(800)
							var_0_3.CloseCurrentPopup()
							sampSendChat("/anamestore " .. ipsaccounts.nick[iter_121_9])

							var_0_82.anamestore.v = true
						end)
					end

					var_0_3.PopStyleColor()
					ShowHelp("/anamestore")
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

					if var_0_3.Button(var_0_46.ICON_FA_PLUG .. " Connections", var_0_3.ImVec2(265, 0)) then
						lua_thread.create(function()
							wait(0)

							fuckingnick = ipsaccounts.nick[iter_121_9]
							ppvconnections = {
								date = {},
								time = {},
								ip = {},
								platform = {}
							}

							wait(800)
							var_0_3.CloseCurrentPopup()
							sampSendChat("/connections " .. ipsaccounts.nick[iter_121_9])

							var_0_82.connections.v = true
						end)
					end

					var_0_3.PopStyleColor()
					ShowHelp("/connections")
					var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
					var_0_3.EndPopup()
				end
			end

			var_0_3.EndChild()
		end

		var_0_3.End()
		var_0_3.PopStyleColor()
		var_0_3.PopStyleColor()
	end

	if var_0_82.offstats.v then
		local var_121_35, var_121_36 = getScreenResolution()
		local var_121_37 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_35 / 2 + 413, var_121_36 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(480, 363), var_0_3.Cond.FirstUseEver)
		var_0_3.PushStyleColor(var_0_3.Col.WindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0.97))
		var_0_3.PushStyleColor(var_0_3.Col.ChildWindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0))
		var_0_3.Begin(u8("AdminHelper | offstats"), var_0_82.offstats, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_FILE_SIGNATURE .. u8(" {E0DEF8}Статистика ") .. fuckingnick)
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(438, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.offstats.v = not var_0_82.offstats.v
			offstatsmassiv = {
				account,
				lvl,
				exp,
				number,
				wantedlvl,
				donate,
				home,
				renthome,
				business,
				gender,
				job,
				fraction,
				rank,
				referal,
				promocode,
				regip,
				lastip,
				regdate,
				lastonline,
				jail,
				mute,
				rmute
			}
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()

		if offstatsmassiv.account ~= nil then
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Номер аккаунта: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. offstatsmassiv.account)
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Пол: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.gender))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Уровень: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{5BC3F7}" .. offstatsmassiv.lvl)
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Работа: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.job))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Очки опыта: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.exp))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Организация: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.fraction))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Номер телефона: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. offstatsmassiv.number)
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Ранг: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.rank))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Уровень розыска: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. offstatsmassiv.wantedlvl)
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Реферал: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.referal))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Донат: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. offstatsmassiv.donate)
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Промокод: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)

			if offstatsmassiv.promocode ~= nil then
				var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.promocode))
			else
				var_0_3.TextColoredRGB(u8("{4CBCF5}Нет"))
			end

			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Дом: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. offstatsmassiv.home)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Аренда дома: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. offstatsmassiv.renthome)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Бизнес: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. offstatsmassiv.business)
			var_0_3.Text("")
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Jail: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.jail))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Рег IP: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.regip))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Mute: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.mute))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Последний IP: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.lastip))
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}RMute: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(144)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.rmute))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Рег дата: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.regdate))
			var_0_3.SetCursorPosX(210)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Последний вход: "))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(334)
			var_0_3.TextColoredRGB("{4CBCF5}" .. u8(offstatsmassiv.lastonline))
		end

		var_0_3.End()
		var_0_3.PopStyleColor()
		var_0_3.PopStyleColor()
	end

	if var_0_82.anamestore.v then
		local var_121_44, var_121_45 = getScreenResolution()
		local var_121_46 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_44 / 2, var_121_45 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(650, 360), var_0_3.Cond.FirstUseEver)
		var_0_3.PushStyleColor(var_0_3.Col.WindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0.97))
		var_0_3.PushStyleColor(var_0_3.Col.ChildWindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0))
		var_0_3.Begin(u8("AdminHelper | anamestore"), var_0_82.anamestore, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_ADDRESS_CARD .. u8(" {E0DEF8}История никнеймов игрока ") .. fuckingnick)
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(608, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.anamestore.v = not var_0_82.anamestore.v
			ppvanamestore = {
				name1 = {},
				name2 = {},
				date = {},
				time = {},
				changer = {}
			}
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()

		if ppvanamestore.name1 ~= nil then
			var_0_3.SetCursorPosX(12)
			var_0_3.TextColoredRGB(u8(" {5252DF}Было"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(35)
			var_0_3.SetCursorPosX(169)
			var_0_3.TextColoredRGB(u8(" {5252DF}Стало"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(330)
			var_0_3.TextColoredRGB(u8(" {5252DF}Изменил"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(470)
			var_0_3.TextColoredRGB(u8(" {5252DF}Дата"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(555)
			var_0_3.TextColoredRGB(u8(" {5252DF}Время"))
			var_0_3.BeginChild("##ppvanamestore", var_0_3.ImVec2(623, 287), false)

			for iter_121_13 = 1, #ppvanamestore.name1 do
				var_0_3.TextColoredRGB(ppvanamestore.name1[iter_121_13])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(158)
				var_0_3.TextColoredRGB(ppvanamestore.name2[iter_121_13])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(318)
				var_0_3.TextColoredRGB(ppvanamestore.changer[iter_121_13])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(458)
				var_0_3.TextColoredRGB(u8(ppvanamestore.date[iter_121_13]))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(543)
				var_0_3.TextColoredRGB(ppvanamestore.time[iter_121_13])
			end

			var_0_3.EndChild()
		end

		var_0_3.End()
		var_0_3.PopStyleColor()
		var_0_3.PopStyleColor()
	end

	if var_0_82.connections.v then
		local var_121_47, var_121_48 = getScreenResolution()
		local var_121_49 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_47 / 2, var_121_48 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(440, 415), var_0_3.Cond.FirstUseEver)
		var_0_3.PushStyleColor(var_0_3.Col.WindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0.97))
		var_0_3.PushStyleColor(var_0_3.Col.ChildWindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0))
		var_0_3.Begin(u8("AdminHelper | connections"), var_0_82.connections, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_PLUG .. u8(" {E0DEF8}История подключений ") .. fuckingnick)
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(398, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.connections.v = not var_0_82.connections.v
			ppvconnections = {
				date = {},
				time = {},
				ip = {},
				platform = {}
			}
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()

		if ppvconnections.date ~= nil then
			var_0_3.SetCursorPosX(12)
			var_0_3.TextColoredRGB(u8(" {5252DF}IP"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(35)
			var_0_3.SetCursorPosX(140)
			var_0_3.TextColoredRGB(u8(" {5252DF}Платформа"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(250)
			var_0_3.TextColoredRGB(u8(" {5252DF}Дата"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(340)
			var_0_3.TextColoredRGB(u8(" {5252DF}Время"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(404)
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_WIFI)
			var_0_3.BeginChild("##ppvconnections", var_0_3.ImVec2(450, 345), false)

			for iter_121_14 = 1, #ppvconnections.date do
				var_0_3.TextColoredRGB(ppvconnections.ip[iter_121_14])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(128)
				var_0_3.TextColoredRGB(ppvconnections.platform[iter_121_14])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(238)
				var_0_3.TextColoredRGB(ppvconnections.date[iter_121_14])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(328)
				var_0_3.TextColoredRGB(ppvconnections.time[iter_121_14])
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(390)

				if var_0_3.Button("##1" .. iter_121_14, var_0_3.ImVec2(16, 15)) then
					var_0_82.connections.v = not var_0_82.connections.v
					ipaccountscheck = true
					ipaccounts_ip = ppvconnections.ip[iter_121_14]

					lua_thread.create(function()
						wait(0)

						ipsaccounts = {
							nick = {},
							lvl = {},
							status = {},
							date = {},
							time = {}
						}

						sampSendChat("/ips " .. ipaccounts_ip .. " 0")
						wait(500)

						var_0_82.ipaccounts.v = true
					end)
				end

				ShowHelp("Список аккаунтов по данному IP")
			end

			var_0_3.EndChild()
		end

		var_0_3.End()
		var_0_3.PopStyleColor()
		var_0_3.PopStyleColor()
	end

	if var_0_82.farchat.v then
		local var_121_59, var_121_60 = getScreenResolution()
		local var_121_61 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_59 / 2 + 268, var_121_60 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(230, 335), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(u8("AdminHelper | Прослушка чата"), var_0_82.farchat, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_SATELLITE_DISH .. u8(" {E0DEF8}FarChat"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosY(14)
		var_0_3.TextDisabled("(?)")
		ShowHelp("ALT + Колесо мыши вверх/вниз - вращение чата")
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(153, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_SAVE .. "", var_0_3.ImVec2(30, 0)) then
			if buffers.farchat_pagesize.v < buffers.farchat_messagesize.v then
				farchatIni.farchat.positionX = buffers.farchat_posx.v
				farchatIni.farchat.positionY = buffers.farchat_posy.v
				farchatIni.farchat.pagesize = buffers.farchat_pagesize.v
				farchatIni.farchat.messagesize = buffers.farchat_messagesize.v
				farchatIni.farchat.date = checks.farchat_date.v
				farchatIni.farchat.distance = checks.farchat_distance.v

				var_0_2.save(farchatIni, "AdminHelper/farchat")

				obj.messages = {}
				farchat_messagesize = buffers.farchat_messagesize.v
				obj.pagesize = buffers.farchat_pagesize.v
				pagesize = buffers.farchat_pagesize.v

				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Настройки FarChat сохранены.", 16776960)
			else
				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Размер страницы не может быть больше хранилища.", 16776960)
			end
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		ShowHelp("Сохранить")
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(185, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.farchat.v = not var_0_82.farchat.v
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()

		if bubbleBox.active == true then
			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

			if var_0_3.Button(var_0_46.ICON_FA_SATELLITE_DISH .. u8(" Вкл"), var_0_3.ImVec2(98, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(116)

			if var_0_3.Button(var_0_46.ICON_FA_SATELLITE_DISH .. u8(" Выкл"), var_0_3.ImVec2(98, 0)) then
				bubbleBox:toggle(not bubbleBox.active)

				farchatIni.farchat.enable = bubbleBox.active

				var_0_2.save(farchatIni, "AdminHelper/farchat")
			end
		else
			if var_0_3.Button(var_0_46.ICON_FA_SATELLITE_DISH .. u8(" Вкл"), var_0_3.ImVec2(98, 0)) then
				bubbleBox:toggle(bubbleBox.active)

				bubbleBox.active = true
				farchatIni.farchat.enable = bubbleBox.active

				var_0_2.save(farchatIni, "AdminHelper/farchat")
			end

			var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(116)

			if var_0_3.Button(var_0_46.ICON_FA_SATELLITE_DISH .. u8(" Выкл"), var_0_3.ImVec2(98, 0)) then
				-- block empty
			end

			var_0_3.PopStyleColor()
		end

		var_0_3.BeginChild("##farchat_settings", var_0_3.ImVec2(200, 65), true)
		var_0_3.PushStyleVar(var_0_3.StyleVar.FramePadding, var_0_3.ImVec2(0, 0))
		var_0_3.Checkbox(u8("Отображать дату"), checks.farchat_date)
		var_0_3.Checkbox(u8("Отображать дистанцию"), checks.farchat_distance)
		var_0_3.PopStyleVar(1)
		var_0_3.EndChild()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Хранимое кол-во строк: "))
		var_0_3.PushItemWidth(200)
		var_0_3.InputText("##11", buffers.farchat_messagesize, var_0_3.InputTextFlags.CharsDecimal)
		var_0_3.PopItemWidth()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Кол-во строк на странице:"))
		var_0_3.PushItemWidth(200)
		var_0_3.InputText("##22", buffers.farchat_pagesize, var_0_3.InputTextFlags.CharsDecimal)
		var_0_3.PopItemWidth()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Позиция на экране:"))
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_VECTOR_SQUARE .. u8(" {E0DEF8}X"))
		var_0_3.SameLine()
		var_0_3.PushItemWidth(164)
		var_0_3.SetCursorPosY(272)
		var_0_3.InputText("##33", buffers.farchat_posx, var_0_3.InputTextFlags.CharsDecimal)
		var_0_3.PopItemWidth()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_VECTOR_SQUARE .. u8(" {E0DEF8}Y"))
		var_0_3.SameLine()
		var_0_3.PushItemWidth(164)
		var_0_3.SetCursorPosY(299)
		var_0_3.InputText("##44", buffers.farchat_posy, var_0_3.InputTextFlags.CharsDecimal)
		var_0_3.PopItemWidth()
		var_0_3.End()
	end

	if var_0_82.changename.v then
		if var_0_82.fastreport.v then
			var_0_82.fastreport.v = false
		end

		if var_0_82.menu.v or var_0_82.ipaccounts.v then
			var_0_82.menu.v = false
			var_0_82.ipaccounts.v = false
		end

		local var_121_62, var_121_63 = getScreenResolution()
		local var_121_64 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_62 / 2, var_121_63 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(675, 410), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(u8("AdminHelper | Смена имени"), var_0_82.changename, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_USER_EDIT .. u8(" {E0DEF8}Смена имени"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(598, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TRASH_ALT .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_39 = {
				name = {},
				id = {},
				newname = {},
				timer = {}
			}
		end

		ShowHelp("Очистить список")
		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(630, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.changename.v = not var_0_82.changename.v
			var_0_3.Process = var_0_82.changename.v
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()
		var_0_3.SetCursorPosX(82)
		var_0_3.TextColoredRGB(u8("{7572A8}Текущий ник"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(257)
		var_0_3.TextColoredRGB(u8("{7572A8}Желаемый ник"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(447)
		var_0_3.TextColoredRGB(u8("{7572A8}Действия"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(572)
		var_0_3.TextColoredRGB(u8("{7572A8}Прошло"))

		if var_0_39.name ~= nil and var_0_39.id ~= nil and var_0_39.newname ~= nil then
			var_0_3.BeginChild("panel", var_0_3.ImVec2(640, 0), false)

			for iter_121_18 = 1, #var_0_39.name do
				if sampIsPlayerConnected(var_0_39.id[iter_121_18]) and sampGetPlayerNickname(var_0_39.id[iter_121_18]) == var_0_39.name[iter_121_18] then
					var_0_3.SetCursorPosX(15)

					if var_0_39.name[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(199, 17, 22):GetVec4())
						var_0_3.Button(var_0_39.name[iter_121_18] .. "[" .. var_0_39.id[iter_121_18] .. "]" .. u8("##ФорматOdin") .. iter_121_18, var_0_3.ImVec2(180, 0))
						var_0_3.PopStyleColor()
						ShowHelp("RP ник")
					else
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(70, 189, 29):GetVec4())
						var_0_3.Button(var_0_39.name[iter_121_18] .. "[" .. var_0_39.id[iter_121_18] .. "]" .. u8("##ФорматOdin") .. iter_121_18, var_0_3.ImVec2(180, 0))
						var_0_3.PopStyleColor()
						ShowHelp("NonRP ник")
					end

					var_0_3.SameLine()
					var_0_3.SetCursorPosX(198)

					if var_0_39.newname[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(70, 189, 29):GetVec4())
						var_0_3.Button(var_0_39.newname[iter_121_18] .. u8("##ФорматDva") .. iter_121_18, var_0_3.ImVec2(180, 0))
						var_0_3.PopStyleColor()
						ShowHelp("RP ник")
					else
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(199, 17, 22):GetVec4())
						var_0_3.Button(var_0_39.newname[iter_121_18] .. u8("##ФорматDva") .. iter_121_18, var_0_3.ImVec2(180, 0))
						var_0_3.PopStyleColor()
						ShowHelp("NonRP ник")
					end

					var_0_3.SameLine()
					var_0_3.SetCursorPosX(395)

					if not var_0_39.name[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") and var_0_39.newname[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_CHECK .. u8("##Ок") .. iter_121_18, var_0_3.ImVec2(30, 0)) then
							lua_thread.create(function()
								sampSendChat("/pm " .. var_0_39.id[iter_121_18] .. " Укажите новый ник в лаунчере: " .. var_0_39.newname[iter_121_18])
								wait(1000)
								sampSendChat("/okay " .. var_0_39.id[iter_121_18])
								table.remove(var_0_39.name, iter_121_18)
								table.remove(var_0_39.id, iter_121_18)
								table.remove(var_0_39.newname, iter_121_18)
								table.remove(var_0_39.timer, iter_121_18)
							end)
						end

						var_0_3.PopStyleColor()
					elseif var_0_3.Button(var_0_46.ICON_FA_CHECK .. u8("##Ок") .. iter_121_18, var_0_3.ImVec2(30, 0)) then
						lua_thread.create(function()
							sampSendChat("/pm " .. var_0_39.id[iter_121_18] .. " Укажите новый ник в лаунчере: " .. var_0_39.newname[iter_121_18])
							wait(1000)
							sampSendChat("/okay " .. var_0_39.id[iter_121_18])
							table.remove(var_0_39.name, iter_121_18)
							table.remove(var_0_39.id, iter_121_18)
							table.remove(var_0_39.newname, iter_121_18)
							table.remove(var_0_39.timer, iter_121_18)
						end)
					end

					ShowHelp("Принять")
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(428)

					if var_0_39.name[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") and var_0_39.newname[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") or var_0_39.name[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") and not var_0_39.newname[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_EXCLAMATION .. u8("##РПник") .. iter_121_18, var_0_3.ImVec2(30, 0)) then
							sampSendChat("/pm " .. var_0_39.id[iter_121_18] .. " Ники RP формата меняются через: /donate")
							table.remove(var_0_39.name, iter_121_18)
							table.remove(var_0_39.id, iter_121_18)
							table.remove(var_0_39.newname, iter_121_18)
							table.remove(var_0_39.timer, iter_121_18)
						end

						var_0_3.PopStyleColor()
					elseif var_0_3.Button(var_0_46.ICON_FA_EXCLAMATION .. u8("##РПник") .. iter_121_18, var_0_3.ImVec2(30, 0)) then
						sampSendChat("/pm " .. var_0_39.id[iter_121_18] .. " Ники RP формата меняются через: /donate")
						table.remove(var_0_39.name, iter_121_18)
						table.remove(var_0_39.id, iter_121_18)
						table.remove(var_0_39.newname, iter_121_18)
						table.remove(var_0_39.timer, iter_121_18)
					end

					ShowHelp("У игрока RP ник")
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(461)

					if var_0_3.Button(var_0_46.ICON_FA_EXCHANGE_ALT .. u8("##Местами") .. iter_121_18, var_0_3.ImVec2(30, 0)) then
						local var_121_65 = var_0_39.newname[iter_121_18]:gsub("(%u+)(%l+)_(%u+)(%l+)", "%3%4_%1%2")

						sampSendChat("/pm " .. var_0_39.id[iter_121_18] .. " Поменяйте имя и фамилию местами: " .. var_121_65)
						table.remove(var_0_39.name, iter_121_18)
						table.remove(var_0_39.id, iter_121_18)
						table.remove(var_0_39.newname, iter_121_18)
						table.remove(var_0_39.timer, iter_121_18)
					end

					ShowHelp("Фамилия_Имя -> Имя_Фамилия")
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(494)

					if var_0_39.name[iter_121_18] ~= nil and var_0_39.id[iter_121_18] ~= nil and var_0_39.newname[iter_121_18] ~= nil and not var_0_39.name[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") and not var_0_39.newname[iter_121_18]:find("(%u+)(%l+)_(%u+)(%l+)") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_TIMES .. u8("##Отказ") .. iter_121_18, var_0_3.ImVec2(30, 0)) then
							sampSendChat("/pm " .. var_0_39.id[iter_121_18] .. " Выберите имя RP формата: Имя_Фамилия.")
							table.remove(var_0_39.name, iter_121_18)
							table.remove(var_0_39.id, iter_121_18)
							table.remove(var_0_39.newname, iter_121_18)
							table.remove(var_0_39.timer, iter_121_18)
						end

						var_0_3.PopStyleColor()
					elseif var_0_3.Button(var_0_46.ICON_FA_TIMES .. u8("##Отказ") .. iter_121_18, var_0_3.ImVec2(30, 0)) then
						sampSendChat("/pm " .. var_0_39.id[iter_121_18] .. " Выберите имя RP формата: Имя_Фамилия.")
						table.remove(var_0_39.name, iter_121_18)
						table.remove(var_0_39.id, iter_121_18)
						table.remove(var_0_39.newname, iter_121_18)
						table.remove(var_0_39.timer, iter_121_18)
					end

					ShowHelp("Неверный формат")
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(540)

					if var_0_39.timer[iter_121_18] ~= nil then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
						var_0_3.Button(math.ceil(os.clock()) - math.ceil(var_0_39.timer[iter_121_18]) .. u8(" сек") .. "##numberok" .. iter_121_18, var_0_3.ImVec2(80, 0))
						var_0_3.PopStyleColor()
					end
				end
			end

			var_0_3.EndChild()
		end

		var_0_3.End()
	end

	if var_0_82.fastreport.v then
		if var_0_82.menu.v or var_0_82.ipaccounts.v then
			var_0_82.menu.v = false
			var_0_82.ipaccounts.v = false
		end

		local var_121_66, var_121_67 = getScreenResolution()
		local var_121_68 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_66 / 2, var_121_67 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(710, 421), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(u8("AdminHelper | FastReport"), var_0_82.fastreport, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)

		if var_0_82.changename.v then
			var_0_82.changename.v = false
		end

		if var_0_82.menu.v then
			var_0_82.menu.v = false
		end

		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_METEOR .. u8(" {E0DEF8}FastReport"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(567, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TRASH .. "##1", var_0_3.ImVec2(30, 0)) then
			for iter_121_19, iter_121_20 in ipairs(var_0_40.complete) do
				if not iter_121_20:find("false") then
					table.remove(var_0_40.playername, iter_121_19)
					table.remove(var_0_40.playerid, iter_121_19)
					table.remove(var_0_40.suspectname, iter_121_19)
					table.remove(var_0_40.suspectid, iter_121_19)
					table.remove(var_0_40.reason, iter_121_19)
					table.remove(var_0_40.complete, iter_121_19)
					table.remove(var_0_40.timer, iter_121_19)
				end
			end

			for iter_121_21, iter_121_22 in ipairs(var_0_40.complete) do
				if not iter_121_22:find("false") then
					table.remove(var_0_40.playername, iter_121_21)
					table.remove(var_0_40.playerid, iter_121_21)
					table.remove(var_0_40.suspectname, iter_121_21)
					table.remove(var_0_40.suspectid, iter_121_21)
					table.remove(var_0_40.reason, iter_121_21)
					table.remove(var_0_40.complete, iter_121_21)
					table.remove(var_0_40.timer, iter_121_21)
				end
			end
		end

		ShowHelp("Очистить отвеченные")
		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(599, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TRASH_ALT .. "##2", var_0_3.ImVec2(30, 0)) then
			var_0_40 = {
				playername = {},
				playerid = {},
				suspectname = {},
				suspectid = {},
				reason = {},
				complete = {},
				timer = {}
			}
		end

		ShowHelp("Очистить список")
		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(631, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_COG .. "##3", var_0_3.ImVec2(30, 0)) then
			var_0_3.OpenPopup("FastReport Settings")
		end

		ShowHelp("Настройки FastReport")
		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()

		if var_0_3.BeginPopupModal(u8("FastReport Settings"), _, var_0_3.WindowFlags.NoCollapse + var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoMove + var_0_3.WindowFlags.NoTitleBar) then
			var_0_3.BeginGroup()
			var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_COG .. u8(" {E0DEF8}Настройки FastReport"))
			var_0_3.SameLine()
			var_0_3.SetCursorPos(var_0_3.ImVec2(328, 10))
			var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

			if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
				var_0_3.CloseCurrentPopup()
			end

			var_0_3.PopStyleVar(1)
			var_0_3.EndGroup()

			if var_0_3.Checkbox(u8("Отметить отвеченные другими администраторами"), checks.frcomplete) then
				configIni.config.frcomplete = checks.frcomplete.v

				var_0_2.save(configIni, "AdminHelper/config")
			end

			if var_0_3.Checkbox(u8("Цвета ников как в scoreboard (beta)"), checks.frclistcolor) then
				configIni.config.frclistcolor = checks.frclistcolor.v

				var_0_2.save(configIni, "AdminHelper/config")
			end

			var_0_3.EndPopup()
		end

		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(663, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##4", var_0_3.ImVec2(30, 0)) then
			var_0_82.fastreport.v = not var_0_82.fastreport.v
			var_0_3.Process = var_0_82.fastreport.v
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()
		var_0_3.SetCursorPosX(37)
		var_0_3.TextColoredRGB(u8("{7572A8}Re"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(107)
		var_0_3.TextColoredRGB(u8("{7572A8}Обвинитель"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(259)
		var_0_3.TextColoredRGB(u8("{7572A8}Подозреваемый"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(457)
		var_0_3.TextColoredRGB(u8("{7572A8}Жалоба"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(590)
		var_0_3.TextColoredRGB(u8("{7572A8}Прошло"))

		if var_0_40.playername ~= nil and var_0_40.playerid ~= nil and var_0_40.suspectname ~= nil and var_0_40.suspectname ~= nil and var_0_40.suspectid ~= nil and var_0_40.reason ~= nil and var_0_40.complete ~= nil and var_0_40.timer ~= nil then
			var_0_3.BeginChild("panel", var_0_3.ImVec2(688, 0), false)

			for iter_121_23 = 1, #var_0_40.playername do
				local var_121_69, var_121_70, var_121_71, var_121_72 = explode_argb(sampGetPlayerColor(var_0_40.playerid[iter_121_23]))
				local var_121_73, var_121_74, var_121_75, var_121_76 = explode_argb(sampGetPlayerColor(var_0_40.suspectid[iter_121_23]))
				local var_121_77 = var_0_3.ImColor(var_121_70, var_121_71, var_121_72):GetVec4()
				local var_121_78 = var_0_3.ImColor(var_121_74, var_121_75, var_121_76):GetVec4()

				if sampIsPlayerConnected(var_0_40.playerid[iter_121_23]) and sampGetPlayerNickname(var_0_40.playerid[iter_121_23]) == var_0_40.playername[iter_121_23] then
					var_0_3.SetCursorPosX(15)

					if var_0_40.complete[iter_121_23]:find("false") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_EYE .. u8("##Recon") .. iter_121_23, var_0_3.ImVec2(30, 0)) then
							lua_thread.create(function()
								if var_0_40.suspectid[iter_121_23] ~= nil and var_0_40.suspectname[iter_121_23] ~= nil then
									if sampIsPlayerConnected(var_0_40.suspectid[iter_121_23]) and sampGetPlayerNickname(var_0_40.suspectid[iter_121_23]) == var_0_40.suspectname[iter_121_23] then
										var_0_40.complete[iter_121_23] = "true"

										math.randomseed(os.time())
										sampSendChat("/pm " .. var_0_40.playerid[iter_121_23] .. " " .. var_0_68.one[math.random(1, #var_0_68.one)] .. " " .. var_0_40.suspectname[iter_121_23] .. ", " .. var_0_68.two[math.random(1, #var_0_68.two)])
										wait(1000)

										if configIni.config.reconcar then
											if var_0_28 ~= true then
												if isCharInAnyCar(PLAYER_PED) then
													resultcar, recarid = sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(PLAYER_PED))

													local var_160_0, var_160_1 = sampGetCarHandleBySampVehicleId(recarid)
													local var_160_2, var_160_3, var_160_4 = getCarCoordinates(storeCarCharIsInNoSave(PLAYER_PED))

													if getDriverOfCar(var_160_1) == 1 then
														temppassenger = true
													else
														temppassenger = false
													end

													warpCharFromCarToCoord(PLAYER_PED, var_160_2, var_160_3, var_160_4)
													wait(150)
													sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
												else
													recarid = nil
													temppassenger = nil

													sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
												end
											else
												sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
											end
										else
											sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
										end
									else
										sampSendChat("/pm " .. var_0_40.playerid[iter_121_23] .. " Вы жаловались на " .. var_0_40.suspectname[iter_121_23] .. ", игрок не в сети. Оставьте жалобу на форуме.")
										wait(300)
										table.remove(var_0_40.playername, iter_121_23)
										table.remove(var_0_40.playerid, iter_121_23)
										table.remove(var_0_40.suspectname, iter_121_23)
										table.remove(var_0_40.suspectid, iter_121_23)
										table.remove(var_0_40.reason, iter_121_23)
										table.remove(var_0_40.complete, iter_121_23)
										table.remove(var_0_40.timer, iter_121_23)
									end
								end
							end)
						end

						var_0_3.PopStyleColor()
					else
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(117, 114, 168):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_EYE .. u8("##Recon") .. iter_121_23, var_0_3.ImVec2(30, 0)) then
							lua_thread.create(function()
								if sampIsPlayerConnected(var_0_40.suspectid[iter_121_23]) and sampGetPlayerNickname(var_0_40.suspectid[iter_121_23]) == var_0_40.suspectname[iter_121_23] then
									if configIni.config.reconcar then
										if var_0_28 ~= true then
											if isCharInAnyCar(PLAYER_PED) then
												resultcar, recarid = sampGetVehicleIdByCarHandle(storeCarCharIsInNoSave(PLAYER_PED))

												local var_161_0, var_161_1 = sampGetCarHandleBySampVehicleId(recarid)
												local var_161_2, var_161_3, var_161_4 = getCarCoordinates(storeCarCharIsInNoSave(PLAYER_PED))

												if getDriverOfCar(var_161_1) == 1 then
													temppassenger = true
												else
													temppassenger = false
												end

												warpCharFromCarToCoord(PLAYER_PED, var_161_2, var_161_3, var_161_4)
												wait(150)
												sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
											else
												recarid = nil
												temppassenger = nil

												sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
											end
										else
											sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
										end
									else
										sampSendChat("/re " .. var_0_40.suspectid[iter_121_23])
									end
								else
									table.remove(var_0_40.playername, iter_121_23)
									table.remove(var_0_40.playerid, iter_121_23)
									table.remove(var_0_40.suspectname, iter_121_23)
									table.remove(var_0_40.suspectid, iter_121_23)
									table.remove(var_0_40.reason, iter_121_23)
									table.remove(var_0_40.complete, iter_121_23)
									table.remove(var_0_40.timer, iter_121_23)
								end
							end)
						end

						var_0_3.PopStyleColor()
					end

					var_0_3.SameLine()
					var_0_3.SetCursorPosX(48)

					if checks.frclistcolor.v then
						var_0_3.PushStyleColor(var_0_3.Col.Text, var_121_77)
					end

					if var_0_40.complete[iter_121_23]:find("false") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
						var_0_3.Button(var_0_40.playername[iter_121_23] .. "[" .. var_0_40.playerid[iter_121_23] .. "]" .. "##number" .. iter_121_23, var_0_3.ImVec2(160, 0))
						var_0_3.PopStyleColor()
					else
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(117, 114, 168):GetVec4())
						var_0_3.Button(var_0_40.playername[iter_121_23] .. "[" .. var_0_40.playerid[iter_121_23] .. "]" .. "##number" .. iter_121_23, var_0_3.ImVec2(160, 0))
						var_0_3.PopStyleColor()
					end

					if checks.frclistcolor.v then
						var_0_3.PopStyleColor()
					end

					var_0_3.SameLine()
					var_0_3.SetCursorPosX(211)

					if checks.frclistcolor.v then
						var_0_3.PushStyleColor(var_0_3.Col.Text, var_121_78)
					end

					if var_0_40.complete[iter_121_23]:find("false") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
						var_0_3.Button(var_0_40.suspectname[iter_121_23] .. "[" .. var_0_40.suspectid[iter_121_23] .. "]" .. "##numberg" .. iter_121_23, var_0_3.ImVec2(160, 0))
						var_0_3.PopStyleColor()
					else
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(117, 114, 168):GetVec4())
						var_0_3.Button(var_0_40.suspectname[iter_121_23] .. "[" .. var_0_40.suspectid[iter_121_23] .. "]" .. "##numberg" .. iter_121_23, var_0_3.ImVec2(160, 0))
						var_0_3.PopStyleColor()
					end

					if checks.frclistcolor.v then
						var_0_3.PopStyleColor()
					end

					var_0_3.SameLine()
					var_0_3.SetCursorPosX(374)

					if var_0_40.complete[iter_121_23]:find("false") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
						var_0_3.Button(u8(var_0_40.reason[iter_121_23]) .. "##numberq" .. iter_121_23, var_0_3.ImVec2(180, 0))
						var_0_3.PopStyleColor()
					else
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(117, 114, 168):GetVec4())
						var_0_3.Button(u8(var_0_40.reason[iter_121_23]) .. "##numberq" .. iter_121_23, var_0_3.ImVec2(180, 0))
						var_0_3.PopStyleColor()
					end

					ShowHelp(var_0_40.suspectid[iter_121_23] .. " " .. var_0_40.reason[iter_121_23])
					var_0_3.Columns(1)
					var_0_3.SameLine()
					var_0_3.SetCursorPosX(557)

					if var_0_40.timer[iter_121_23] ~= nil then
						if var_0_40.complete[iter_121_23]:find("false") then
							var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
							var_0_3.Button(math.ceil(os.clock()) - math.ceil(var_0_40.timer[iter_121_23]) .. u8(" сек") .. "##numberw" .. iter_121_23, var_0_3.ImVec2(80, 0))
							var_0_3.PopStyleColor()
						else
							var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(117, 114, 168):GetVec4())
							var_0_3.Button(math.ceil(os.clock()) - math.ceil(var_0_40.timer[iter_121_23]) .. u8(" сек") .. "##numberw" .. iter_121_23, var_0_3.ImVec2(80, 0))
							var_0_3.PopStyleColor()
						end
					end

					var_0_3.SameLine()
					var_0_3.SetCursorPosX(640)

					if var_0_40.complete[iter_121_23]:find("false") then
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_TRASH .. u8("##Delete") .. iter_121_23, var_0_3.ImVec2(30, 0)) then
							table.remove(var_0_40.playername, iter_121_23)
							table.remove(var_0_40.playerid, iter_121_23)
							table.remove(var_0_40.suspectname, iter_121_23)
							table.remove(var_0_40.suspectid, iter_121_23)
							table.remove(var_0_40.reason, iter_121_23)
							table.remove(var_0_40.complete, iter_121_23)
							table.remove(var_0_40.timer, iter_121_23)
						end

						var_0_3.PopStyleColor()
					else
						var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(117, 114, 168):GetVec4())

						if var_0_3.Button(var_0_46.ICON_FA_TRASH .. u8("##Delete") .. iter_121_23, var_0_3.ImVec2(30, 0)) then
							table.remove(var_0_40.playername, iter_121_23)
							table.remove(var_0_40.playerid, iter_121_23)
							table.remove(var_0_40.suspectname, iter_121_23)
							table.remove(var_0_40.suspectid, iter_121_23)
							table.remove(var_0_40.reason, iter_121_23)
							table.remove(var_0_40.complete, iter_121_23)
							table.remove(var_0_40.timer, iter_121_23)
						end

						var_0_3.PopStyleColor()
					end
				else
					table.remove(var_0_40.playername, iter_121_23)
					table.remove(var_0_40.playerid, iter_121_23)
					table.remove(var_0_40.suspectname, iter_121_23)
					table.remove(var_0_40.suspectid, iter_121_23)
					table.remove(var_0_40.reason, iter_121_23)
					table.remove(var_0_40.complete, iter_121_23)
					table.remove(var_0_40.timer, iter_121_23)
				end
			end

			var_0_3.EndChild()
		end

		var_0_3.End()
	end

	if var_0_82.binds.v then
		local var_121_83, var_121_84 = getScreenResolution()
		local var_121_85 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_83 / 2, var_121_84 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(320, 427), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(u8("AdminHelper | Настройки клавиш"), var_0_82.binds, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_TOOLBOX .. u8(" {E0DEF8}Настройки клавиш"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(275, 10))
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.binds.v = not var_0_82.binds.v
		end

		var_0_3.PopStyleVar(1)
		var_0_3.EndGroup()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Меню:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 38))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindMenu", HotKeys.menu, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.menu = encodeJson(HotKeys.menu.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Окно FastReport:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 65))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindFastReport", HotKeys.fastreport, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.fastreport = encodeJson(HotKeys.fastreport.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Окно RTools:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 92))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindRTools", HotKeys.rtools, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.rtools = encodeJson(HotKeys.rtools.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Окно изменения ников:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 119))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindChangename", HotKeys.changename, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.changename = encodeJson(HotKeys.changename.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}/pm на последний репорт:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 146))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindFastpm", HotKeys.fastpm, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.fastpm = encodeJson(HotKeys.fastpm.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}/re на последний репорт:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 173))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindFastre", HotKeys.fastre, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.fastre = encodeJson(HotKeys.fastre.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}/update:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 200))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindUpdate", HotKeys.update, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.update = encodeJson(HotKeys.update.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}/reoff:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 227))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindReoff", HotKeys.reoff, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.reoff = encodeJson(HotKeys.reoff.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}/pm:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 254))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindPM", HotKeys.pm, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.pm = encodeJson(HotKeys.pm.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}/re:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 281))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindRE", HotKeys.re, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.re = encodeJson(HotKeys.re.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Карта:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 308))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindMap", HotKeys.map, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.map = encodeJson(HotKeys.map.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Активация WallHack:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 335))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindWH", HotKeys.wallhack, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.wallhack = encodeJson(HotKeys.wallhack.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Активация Invisible:"))
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(205, 362))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

		if var_0_3.HotKey("##BindInvis", HotKeys.invisible, {}, 100) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Клавиша установлена.", -1)

			bindsIni.binds.invisible = encodeJson(HotKeys.invisible.v)

			var_0_2.save(bindsIni, "AdminHelper/binds")
		end

		var_0_3.PopStyleColor()

		if var_0_3.Button(var_0_46.ICON_FA_HASHTAG .. u8(" Сброс"), var_0_3.ImVec2(-1, 0)) then
			bindsIni.binds.menu = encodeJson({
				VK_MENU,
				VK_T
			})
			bindsIni.binds.fastreport = encodeJson({
				VK_Q
			})
			bindsIni.binds.rtools = encodeJson({
				VK_R
			})
			bindsIni.binds.changename = encodeJson({
				VK_F3
			})
			bindsIni.binds.fastpm = encodeJson({
				VK_MENU,
				VK_G
			})
			bindsIni.binds.fastre = encodeJson({
				VK_MENU,
				VK_H
			})
			bindsIni.binds.update = encodeJson({
				VK_MENU,
				VK_Q
			})
			bindsIni.binds.reoff = encodeJson({
				VK_MENU,
				VK_E
			})
			bindsIni.binds.pm = encodeJson({
				VK_NUMPAD7
			})
			bindsIni.binds.re = encodeJson({
				VK_NUMPAD8
			})
			bindsIni.binds.map = encodeJson({
				VK_MENU,
				VK_M
			})
			bindsIni.binds.wallhack = encodeJson({
				VK_F5
			})
			bindsIni.binds.invisible = encodeJson({
				VK_I
			})

			var_0_2.save(bindsIni, "AdminHelper/binds")

			HotKeys = {
				menu = {
					v = decodeJson(bindsIni.binds.menu)
				},
				fastreport = {
					v = decodeJson(bindsIni.binds.fastreport)
				},
				rtools = {
					v = decodeJson(bindsIni.binds.rtools)
				},
				changename = {
					v = decodeJson(bindsIni.binds.changename)
				},
				fastpm = {
					v = decodeJson(bindsIni.binds.fastpm)
				},
				fastre = {
					v = decodeJson(bindsIni.binds.fastre)
				},
				update = {
					v = decodeJson(bindsIni.binds.update)
				},
				reoff = {
					v = decodeJson(bindsIni.binds.reoff)
				},
				pm = {
					v = decodeJson(bindsIni.binds.pm)
				},
				re = {
					v = decodeJson(bindsIni.binds.re)
				},
				map = {
					v = decodeJson(bindsIni.binds.map)
				},
				wallhack = {
					v = decodeJson(bindsIni.binds.wallhack)
				},
				invisible = {
					v = decodeJson(bindsIni.binds.invisible)
				}
			}
		end

		var_0_3.End()
	end

	if configIni.config.statshud and var_0_82.statshud.v then
		local var_121_92, var_121_93 = getScreenResolution()
		local var_121_94 = var_0_3.ImVec2(-0.1, 0)
		local var_121_95 = 3
		local var_121_96 = os.time(os.date("!*t")) + var_121_95 * 60 * 60
		local var_121_97 = tonumber(os.date("%w", var_121_96))

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(saved_posX, saved_posY), var_0_3.Cond.FirstUseEver)
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(80, 155), var_0_3.Cond.FirstUseEver)
		var_0_3.PushStyleColor(var_0_3.Col.WindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0.9))
		var_0_3.Begin(u8("AdminHelper | Stats Hud"), var_0_82.statshud, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)

		currentPos = var_0_3.GetWindowPos()
		saved_posX, saved_posY = currentPos.x, currentPos.y

		if statsswitch then
			var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(32)
			var_0_3.TextColoredRGB("{FFFFFF}" .. reportall)
			var_0_3.TextColoredRGB(u8("{5252DF}М:"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(32)
			var_0_3.TextColoredRGB("{FFFFFF}" .. muteall)
			var_0_3.TextColoredRGB(u8("{5252DF}П:"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(32)
			var_0_3.TextColoredRGB("{FFFFFF}" .. jailall)
			var_0_3.TextColoredRGB(u8("{5252DF}К:"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(32)
			var_0_3.TextColoredRGB("{FFFFFF}" .. kickall)
			var_0_3.TextColoredRGB(u8("{5252DF}В:"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(32)
			var_0_3.TextColoredRGB("{FFFFFF}" .. warnall)
			var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
			var_0_3.SameLine()
			var_0_3.SetCursorPosX(32)
			var_0_3.TextColoredRGB("{FFFFFF}" .. banall)
		else
			if var_121_97 == 0 then
				var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report0)
				var_0_3.TextColoredRGB(u8("{5252DF}М:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute0)
				var_0_3.TextColoredRGB(u8("{5252DF}П:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail0)
				var_0_3.TextColoredRGB(u8("{5252DF}К:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick0)
				var_0_3.TextColoredRGB(u8("{5252DF}В:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn0)
				var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban0)
			end

			if var_121_97 == 1 then
				var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report1)
				var_0_3.TextColoredRGB(u8("{5252DF}М:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute1)
				var_0_3.TextColoredRGB(u8("{5252DF}П:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail1)
				var_0_3.TextColoredRGB(u8("{5252DF}К:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick1)
				var_0_3.TextColoredRGB(u8("{5252DF}В:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn1)
				var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban1)
			end

			if var_121_97 == 2 then
				var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report2)
				var_0_3.TextColoredRGB(u8("{5252DF}М:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute2)
				var_0_3.TextColoredRGB(u8("{5252DF}П:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail2)
				var_0_3.TextColoredRGB(u8("{5252DF}К:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick2)
				var_0_3.TextColoredRGB(u8("{5252DF}В:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn2)
				var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban2)
			end

			if var_121_97 == 3 then
				var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report3)
				var_0_3.TextColoredRGB(u8("{5252DF}М:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute3)
				var_0_3.TextColoredRGB(u8("{5252DF}П:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail3)
				var_0_3.TextColoredRGB(u8("{5252DF}К:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick3)
				var_0_3.TextColoredRGB(u8("{5252DF}В:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn3)
				var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban3)
			end

			if var_121_97 == 4 then
				var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report4)
				var_0_3.TextColoredRGB(u8("{5252DF}М:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute4)
				var_0_3.TextColoredRGB(u8("{5252DF}П:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail4)
				var_0_3.TextColoredRGB(u8("{5252DF}К:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick4)
				var_0_3.TextColoredRGB(u8("{5252DF}В:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn4)
				var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban4)
			end

			if var_121_97 == 5 then
				var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report5)
				var_0_3.TextColoredRGB(u8("{5252DF}М:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute5)
				var_0_3.TextColoredRGB(u8("{5252DF}П:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail5)
				var_0_3.TextColoredRGB(u8("{5252DF}К:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick5)
				var_0_3.TextColoredRGB(u8("{5252DF}В:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn5)
				var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban5)
			end

			if var_121_97 == 6 then
				var_0_3.TextColoredRGB(u8("{5252DF}Р:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.report6)
				var_0_3.TextColoredRGB(u8("{5252DF}М:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.mute6)
				var_0_3.TextColoredRGB(u8("{5252DF}П:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.jail6)
				var_0_3.TextColoredRGB(u8("{5252DF}К:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.kick6)
				var_0_3.TextColoredRGB(u8("{5252DF}В:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.warn6)
				var_0_3.TextColoredRGB(u8("{5252DF}Б:"))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("{FFFFFF}" .. statistic.ban6)
			end
		end

		var_0_3.End()
		var_0_3.PopStyleColor()
	end

	if var_0_82.invishud.v and var_0_28 == false then
		local var_121_98, var_121_99 = getScreenResolution()

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_98 / 2, var_121_99 / 2 + 330), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(80, 45), var_0_3.Cond.FirstUseEver)
		var_0_3.PushStyleColor(var_0_3.Col.WindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0.9))
		var_0_3.Begin(u8("AdminHelper | Invis Hud"), var_0_82.invishud, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)

		if not isCharInAnyCar(PLAYER_PED) then
			var_0_3.TextColoredRGB(u8("{5252DF}INVISIBLE"))
		else
			var_0_3.TextColoredRGB(u8("{ab1616}INVISIBLE"))
		end

		var_0_3.End()
		var_0_3.PopStyleColor()
	end

	if var_0_82.scoreboard.v then
		local var_121_112, var_121_113 = getScreenResolution()
		local var_121_114 = var_0_3.ImVec2(275, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_112 / 2, var_121_113 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(710, 630), var_0_3.Cond.FirstUseEver)
		var_0_3.Begin(u8("AdminHelper | Scoreboard"), var_0_82.scoreboard, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
		var_0_3.BeginGroup()

		local var_121_115 = {}

		for iter_121_27 = 0, 1000 do
			if sampIsPlayerConnected(iter_121_27) then
				table.insert(var_121_115, iter_121_27)
			end
		end

		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Лог подключений"))
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(378)
		var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {E0DEF8}Online: ") .. #var_121_115 + 1)
		var_0_3.SameLine()
		var_0_3.SetCursorPos(var_0_3.ImVec2(668, 10))
		var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())
		var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

		if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
			var_0_82.scoreboard.v = not var_0_82.scoreboard.v
		end

		var_0_3.PopStyleVar(1)
		var_0_3.PopStyleColor()
		var_0_3.EndGroup()
		var_0_3.Columns(2, _, false)
		var_0_3.SetColumnWidth(-1, 365)
		var_0_3.BeginChild("##connections", var_0_3.ImVec2(350, 577), false)

		if #var_0_35.time > 0 and #var_0_35.nick > 0 and #var_0_35.reason > 0 then
			for iter_121_28 = 1, #var_0_35.time do
				local var_121_116 = #var_0_35.time

				if iter_121_28 > 150 then
					table.remove(var_0_35.time, var_121_116)
					table.remove(var_0_35.nick, var_121_116)
					table.remove(var_0_35.reason, var_121_116)

					iter_121_28 = 1
				end

				var_0_3.TextColoredRGB(var_0_35.time[iter_121_28] .. " " .. var_0_35.nick[iter_121_28] .. " " .. var_0_35.reason[iter_121_28])
			end
		end

		var_0_3.EndChild()
		var_0_3.NextColumn()
		var_0_3.SetCursorPosX(380)
		var_0_3.TextColoredRGB("ID")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(412)
		var_0_3.TextColoredRGB("NICK")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(614)
		var_0_3.TextColoredRGB("LVL")
		var_0_3.SameLine()
		var_0_3.SetCursorPosX(657)
		var_0_3.TextColoredRGB("PING")
		var_0_3.BeginChild("##players", var_0_3.ImVec2(320, 555), false)

		local var_121_117, var_121_118 = sampGetPlayerIdByCharHandle(PLAYER_PED)

		for iter_121_29 = 0, 1000 do
			if iter_121_29 == var_121_118 then
				var_0_3.Text("" .. iter_121_29)
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("" .. pColor(iter_121_29) .. sampGetPlayerNickname(iter_121_29))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(234)
				var_0_3.Text("" .. sampGetPlayerScore(iter_121_29))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(277)
				var_0_3.Text("" .. sampGetPlayerPing(iter_121_29))
			end
		end

		for iter_121_30 = 0, 1000 do
			if sampIsPlayerConnected(iter_121_30) then
				var_0_3.Text("" .. iter_121_30)
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(32)
				var_0_3.TextColoredRGB("" .. pColor(iter_121_30) .. sampGetPlayerNickname(iter_121_30))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(234)
				var_0_3.Text("" .. sampGetPlayerScore(iter_121_30))
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(277)
				var_0_3.Text("" .. sampGetPlayerPing(iter_121_30))
			end
		end

		var_0_3.EndChild()
		var_0_3.Columns(1)
		var_0_3.End()
	end

	if var_0_82.spectatemenu.v then
		local var_121_119, var_121_120 = getScreenResolution()
		local var_121_121 = var_0_3.ImVec2(-0.1, 0)

		var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_121_119 / 2, var_121_120 / 2 + 270), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
		var_0_3.SetNextWindowSize(var_0_3.ImVec2(342, 213), var_0_3.Cond.FirstUseEver)
		var_0_3.PushStyleColor(var_0_3.Col.WindowBg, var_0_3.ImVec4(0.11, 0.15, 0.17, 0.95))
		var_0_3.Begin(u8("AdminHelper | Spectate Menu"), var_0_82.spectatemenu, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)

		if spectate_id ~= nil then
			if var_0_25 == 1 then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(118, 54, 38):GetVec4())

				if var_0_3.Button(u8("") .. sampGetPlayerNickname(spectate_id) .. "[" .. spectate_id .. "]", var_0_3.ImVec2(var_121_121)) then
					-- block empty
				end

				var_0_3.PopStyleColor()
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Обновить"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/update")
				end

				var_0_3.PopStyleColor()
				ShowHelp("/update")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(94)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Статистика"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/stats " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/stats")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(173)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Офф.Статc"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/offstats " .. sampGetPlayerNickname(spectate_id))
				end

				var_0_3.PopStyleColor()
				ShowHelp("/offstats")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(252)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Оружие"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/iwep " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/iwep")
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Баланс"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/money " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/money")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(94)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Аккаунты"), var_0_3.ImVec2(75, 0)) then
					sampProcessChatInput("/accs " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/accs")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(173)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(120, 149, 167):GetVec4())

				if var_0_3.Button(u8("Наказания"), var_0_3.ImVec2(75, 0)) then
					var_0_25 = 2
				end

				var_0_3.PopStyleColor()
				ShowHelp("Список наказаний")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(252)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Попадания"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/sd " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/sd")
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Выдать HP"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/hp " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/hp")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(94)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("ТП к игроку"), var_0_3.ImVec2(75, 0)) then
					lua_thread.create(function()
						wait(0)
						sampSendChat("/reoff")
						wait(1000)
						sampSendChat("/go " .. spectate_id)
					end)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/goto")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(173)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("ТП к себе"), var_0_3.ImVec2(75, 0)) then
					lua_thread.create(function()
						wait(0)
						sampSendChat("/reoff")
						wait(1000)
						sampSendChat("/gh " .. spectate_id)
					end)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/gethere")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(252)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Заспавнить"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/spawn " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/spawn")
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Заморозить"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/freeze " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/freeze")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(94)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Размороз"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/unfreeze " .. spectate_id)
				end

				var_0_3.PopStyleColor()
				ShowHelp("/unfreeze")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(173)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Подкинуть"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/slap " .. sampGetPlayerNickname(spectate_id))
				end

				var_0_3.PopStyleColor()
				ShowHelp("/slap")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(252)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Убить"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/sethp " .. spectate_id .. " 0")
				end

				var_0_3.PopStyleColor()
				ShowHelp("/sethp")
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(118, 54, 38):GetVec4())

				if var_0_3.Button(u8("< Назад"), var_0_3.ImVec2(75, 0)) then
					spectatemenu_left = spectate_id - 1

					if sampIsPlayerConnected(spectatemenu_left) then
						sampSendChat("/re " .. spectatemenu_left)
					else
						while not sampIsPlayerConnected(spectatemenu_left) do
							if spectatemenu_left > 0 then
								spectatemenu_left = spectatemenu_left - 1
							else
								spectatemenu_left = 1000
							end

							if sampIsPlayerConnected(spectatemenu_left) then
								sampSendChat("/re " .. spectatemenu_left)
							end
						end
					end
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(94)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(118, 54, 38):GetVec4())

				if var_0_3.Button(u8("Выход"), var_0_3.ImVec2(154, 0)) then
					sampSendChat("/reoff")
				end

				var_0_3.PopStyleColor()
				ShowHelp("/reoff")
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(252)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(118, 54, 38):GetVec4())

				if var_0_3.Button(u8("Вперед >"), var_0_3.ImVec2(75, 0)) then
					spectatemenu_right = spectate_id + 1

					if sampIsPlayerConnected(spectatemenu_right) then
						sampSendChat("/re " .. spectatemenu_right)
					else
						while not sampIsPlayerConnected(spectatemenu_right) do
							if spectatemenu_right < 1000 then
								spectatemenu_right = spectatemenu_right + 1
							else
								spectatemenu_right = 0
							end

							if sampIsPlayerConnected(spectatemenu_right) then
								sampSendChat("/re " .. spectatemenu_right)
							end
						end
					end
				end

				var_0_3.PopStyleColor()
			end

			if var_0_25 == 2 then
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(118, 54, 38):GetVec4())

				if var_0_3.Button(u8("") .. sampGetPlayerNickname(spectate_id) .. "[" .. spectate_id .. "]", var_0_3.ImVec2(var_121_121)) then
					-- block empty
				end

				var_0_3.PopStyleColor()
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("DM"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 30 DM")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(58)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("SK"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 40 SK")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(101)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("NRPCop"), var_0_3.ImVec2(58, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 120 NonRP Cop")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(162)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(36, 75, 95):GetVec4())

				if var_0_3.Button(u8("Помеха"), var_0_3.ImVec2(60, 0)) then
					sampSendChat("/kick " .. spectate_id .. " Помеха")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(225)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(30, 64, 87):GetVec4())

				if var_0_3.Button(u8("MG"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/mute " .. spectate_id .. " 20 MG")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(268)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(24, 50, 65):GetVec4())

				if var_0_3.Button(u8("NRPCop"), var_0_3.ImVec2(58, 0)) then
					sampSendChat("/warn " .. spectate_id .. " NonRP Cop")
				end

				var_0_3.PopStyleColor()
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("DMZZ"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 60 DM in ZZ")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(58)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("TK"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 45 TK")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(101)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("MassDM"), var_0_3.ImVec2(58, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 60 Mass DM")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(162)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(36, 75, 95):GetVec4())

				if var_0_3.Button(u8("Релог"), var_0_3.ImVec2(60, 0)) then
					sampSendChat("/kick " .. spectate_id .. " Relog")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(225)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(30, 64, 87):GetVec4())

				if var_0_3.Button(u8("Оск"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/mute " .. spectate_id .. " 30 Оск. игроков")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(268)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(24, 50, 65):GetVec4())

				if var_0_3.Button(u8("Cheats"), var_0_3.ImVec2(58, 0)) then
					sampSendChat("/warn " .. spectate_id .. " Cheats")
				end

				var_0_3.PopStyleColor()
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("DB"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 30 DB")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(58)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("GunZZ"), var_0_3.ImVec2(45, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 30 Gun in ZZ")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(106)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("Багоюз"), var_0_3.ImVec2(57, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 60 Багоюз")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(166)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(36, 75, 95):GetVec4())

				if var_0_3.Button(u8("AfkRoad"), var_0_3.ImVec2(60, 0)) then
					sampSendChat("/kick " .. spectate_id .. " Afk On Road")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(229)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(30, 64, 87):GetVec4())

				if var_0_3.Button(u8("Caps"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/mute " .. spectate_id .. " 10 Caps")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(272)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(24, 50, 65):GetVec4())

				if var_0_3.Button(u8("Багоюз"), var_0_3.ImVec2(54, 0)) then
					sampSendChat("/warn " .. spectate_id .. " Багоюз")
				end

				var_0_3.PopStyleColor()
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("PG"), var_0_3.ImVec2(40, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 30 PG")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(58)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(51, 107, 135):GetVec4())

				if var_0_3.Button(u8("NRPDrive"), var_0_3.ImVec2(75, 0)) then
					sampSendChat("/jail " .. spectate_id .. " 20 NonRP Drive")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(136)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(36, 75, 95):GetVec4())

				if var_0_3.Button(u8("Afk w/o Esc"), var_0_3.ImVec2(79, 0)) then
					sampSendChat("/kick " .. spectate_id .. " Afk w/o esc")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(218)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(30, 64, 87):GetVec4())

				if var_0_3.Button(u8("Flood"), var_0_3.ImVec2(45, 0)) then
					sampSendChat("/mute " .. spectate_id .. " 15 Flood")
				end

				var_0_3.PopStyleColor()
				var_0_3.SameLine()
				var_0_3.SetCursorPosX(266)
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(24, 50, 65):GetVec4())

				if var_0_3.Button(u8("MassDM"), var_0_3.ImVec2(60, 0)) then
					sampSendChat("/warn " .. spectate_id .. " Mass DM")
				end

				var_0_3.PopStyleColor()
				var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(118, 54, 38):GetVec4())

				if var_0_3.Button(u8("Назад"), var_0_3.ImVec2(var_121_121)) then
					var_0_25 = 1
				end

				var_0_3.PopStyleColor()
			end
		end

		var_0_3.End()
		var_0_3.PopStyleColor()
	end
end

function givegift_function()
	var_0_82.mpwin.v = not var_0_82.mpwin.v

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Выдаем награду игроку: {b31515}" .. var_0_79.winnick .. "%[" .. var_0_79.var1 .. "%]{d5dedd}, не двигайтесь.", 16776960)
	wait(300)
	sampSendChat("/freeze " .. var_0_79.var1)

	if var_0_80 == 1 then
		for iter_165_0 = 0, 5 do
			sampSendChat("/pay " .. var_0_79.var1 .. " 10000")
			wait(1000)
		end
	end

	if var_0_80 == 2 then
		for iter_165_1 = 0, 10 do
			sampSendChat("/pay " .. var_0_79.var1 .. " 10000")
			wait(1000)
		end
	end

	if var_0_80 == 3 then
		for iter_165_2 = 0, 15 do
			sampSendChat("/pay " .. var_0_79.var1 .. " 10000")
			wait(1000)
		end
	end

	if var_0_80 == 4 then
		for iter_165_3 = 0, 20 do
			sampSendChat("/pay " .. var_0_79.var1 .. " 10000")
			wait(1000)
		end
	end

	sampSendChat("/unfreeze " .. var_0_79.var1)
	wait(100)
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Награда выдана.", 16776960)
	wait(900)
	sampSendChat("/ooc [МП] Победителем мероприятия стал игрок: " .. var_0_79.winnick .. "%[" .. var_0_79.var1 .. "%], поздравим! ;)")

	var_0_79.winnick = " "
end

function ShowHelp(arg_166_0)
	if var_0_3.IsItemHovered() then
		var_0_3.SetTooltip(u8(arg_166_0))
	end
end

function ShowHelpMarker(arg_167_0)
	var_0_3.SameLine()
	var_0_3.TextDisabled("(?)")

	if var_0_3.IsItemHovered() then
		var_0_3.SetTooltip(u8(arg_167_0))
	end
end

function ShowWarningMarker(arg_168_0)
	var_0_3.SameLine()
	var_0_3.TextDisabled("(!!!)")

	if var_0_3.IsItemHovered() then
		var_0_3.SetTooltip(u8(arg_168_0))
	end
end

function ShowFilterMarker(arg_169_0)
	var_0_3.TextDisabled(var_0_46.ICON_FA_BAN)

	if var_0_3.IsItemHovered() then
		var_0_3.SetTooltip(u8(arg_169_0))
	end
end

function var_0_3.CenterColumnText(arg_170_0)
	var_0_3.SetCursorPosX(var_0_3.GetColumnOffset() + var_0_3.GetColumnWidth() / 2 - var_0_3.CalcTextSize(arg_170_0).x / 2)
	var_0_3.Text(arg_170_0)
end

function var_0_3.CenterColumnTextRGB(arg_171_0)
	var_0_3.SetCursorPosX(var_0_3.GetColumnOffset() + var_0_3.GetColumnWidth() / 2 - var_0_3.CalcTextSize(arg_171_0).x / 2)
	var_0_3.TextColoredRGB(arg_171_0)
end

function var_0_3.CenterText(arg_172_0)
	local var_172_0 = var_0_3.GetWindowWidth()
	local var_172_1 = var_0_3.CalcTextSize(arg_172_0)

	var_0_3.SetCursorPosX(var_172_0 / 2 - var_172_1.x / 2)
	var_0_3.Text(arg_172_0)
end

function var_0_3.CenterTextColoredRGB(arg_173_0)
	local var_173_0 = var_0_3.GetWindowWidth()
	local var_173_1 = var_0_3.CalcTextSize(arg_173_0)

	var_0_3.SetCursorPosX(var_173_0 / 2 - var_173_1.x / 2)
	var_0_3.TextColoredRGB(arg_173_0)
end

function ahgun_function()
	local var_174_0, var_174_1 = getScreenResolution()
	local var_174_2 = var_0_3.ImVec2(-0.1, 0)
	local var_174_3, var_174_4 = sampGetPlayerIdByCharHandle(PLAYER_PED)

	var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_174_0 / 2 + 275, var_174_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
	var_0_3.SetNextWindowSize(var_0_3.ImVec2(245, 240), var_0_3.Cond.FirstUseEver)
	var_0_3.Begin(u8("AdminHelper | Выдача оружия"), var_0_82.ahgun, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
	var_0_3.BeginGroup()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_SKULL_CROSSBONES .. u8(" {E0DEF8}Выдача оружия"))
	var_0_3.SameLine()
	var_0_3.SetCursorPos(var_0_3.ImVec2(201, 10))
	var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

	if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
		var_0_82.ahgun.v = not var_0_82.ahgun.v
	end

	var_0_3.PopStyleVar(1)
	var_0_3.EndGroup()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Выберите оружие:"))
	var_0_3.PushItemWidth(215)
	var_0_3.Combo("##gun", var_0_65, var_0_66, #var_0_66)
	var_0_3.PopItemWidth()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Кол-во патронов [1-500]:"))
	var_0_3.PushItemWidth(215)
	var_0_3.InputText("##99", buffers.ahgun_ammo, var_0_3.InputTextFlags.CharsDecimal)
	var_0_3.PopItemWidth()
	var_0_3.BeginGroup()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Укажите ID:"))
	var_0_3.SameLine()
	var_0_3.PushItemWidth(90)
	var_0_3.PushStyleVar(var_0_3.StyleVar.FramePadding, var_0_3.ImVec2(0, 0))
	var_0_3.SetCursorPosX(162)
	var_0_3.Checkbox("##98", checks.ahgunmyID_check)
	var_0_3.SameLine()
	var_0_3.SetCursorPosX(180)
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_USER .. u8(" {FFFFFF}Себе"))
	var_0_3.PopStyleVar()
	var_0_3.PopItemWidth()
	var_0_3.EndGroup()

	if checks.ahgunmyID_check.v == false then
		var_0_3.PushItemWidth(215)
		var_0_3.InputText(u8("##1"), var_0_87, var_0_3.InputTextFlags.CharsDecimal)
		var_0_3.PopItemWidth()
	end

	var_0_3.SetCursorPosY(205)
	var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

	if var_0_3.Button(var_0_46.ICON_FA_PLAY .. u8(" Выдать"), var_174_2) then
		if var_0_65.v == 0 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 1 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 1 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 1 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 2 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 2 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 2 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 3 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 3 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 3 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 5 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 5 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 4 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 6 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 6 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 5 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 7 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 7 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 6 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 8 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 8 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 7 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 10 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 10 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 8 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 11 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 11 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 9 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 12 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 12 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 10 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 13 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 13 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 11 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 14 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 14 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 12 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 15 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 15 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 13 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 22 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 22 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 14 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 23 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 23 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 15 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 24 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 24 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 16 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 25 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 25 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 17 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 26 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 26 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 18 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 27 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 27 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 19 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 28 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 28 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 20 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 29 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 29 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 21 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 30 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 30 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 22 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 31 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 31 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 23 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. id .. " 32 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 32 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 24 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 33 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 33 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 25 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 34 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 34 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 26 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 41 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 41 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 27 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 42 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 42 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 28 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 43 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 43 " .. buffers.ahgun_ammo.v)
			end
		end

		if var_0_65.v == 29 then
			if checks.ahgunmyID_check.v == true then
				sampSendChat("/agun " .. var_174_4 .. " 46 " .. buffers.ahgun_ammo.v)
			else
				sampSendChat("/agun " .. var_0_87.v .. " 46 " .. buffers.ahgun_ammo.v)
			end
		end
	end

	var_0_3.PopStyleColor()
	var_0_3.End()
end

function spawncar_function()
	local var_175_0, var_175_1 = getScreenResolution()
	local var_175_2 = var_0_3.ImVec2(-0.1, 0)

	var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_175_0 / 2 + 340, var_175_1 / 2), var_0_3.Cond.FirstUseEver, var_0_3.ImVec2(0.5, 0.5))
	var_0_3.SetNextWindowSize(var_0_3.ImVec2(360, 187), var_0_3.Cond.FirstUseEver)
	var_0_3.Begin(u8("AdminHelper | Создание транспорта"), var_0_82.acar, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
	var_0_3.BeginGroup()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CAR .. u8(" {E0DEF8}Создание транспорта"))
	var_0_3.SameLine()
	var_0_3.PushItemWidth(90)
	var_0_3.SetCursorPos(var_0_3.ImVec2(195, 15))
	var_0_3.PushStyleVar(var_0_3.StyleVar.FramePadding, var_0_3.ImVec2(0, 0))
	var_0_3.Checkbox("##99", checks.acarsit_check)
	var_0_3.SetCursorPos(var_0_3.ImVec2(214, 15))
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CAR_CRASH .. u8(" {FFFFFF}Сесть"))
	var_0_3.PopStyleVar()
	var_0_3.PopItemWidth()
	var_0_3.SameLine()
	var_0_3.SetCursorPos(var_0_3.ImVec2(315, 10))
	var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

	if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
		var_0_82.acar.v = not var_0_82.acar.v
	end

	var_0_3.PopStyleVar(1)
	var_0_3.EndGroup()
	var_0_3.Columns(2, _, false)
	var_0_3.SetColumnWidth(-1, 180)
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Тип транспорта:"))
	var_0_3.NextColumn()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Модель:"))
	var_0_3.NextColumn()
	var_0_3.PushItemWidth(150)
	var_0_3.Combo("##class", var_0_61, var_0_57, #var_0_57)
	var_0_3.PopItemWidth()

	if var_0_61.v == 0 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##offroad", var_0_62.offroad, var_0_58.offroad, #var_0_58.offroad)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 1 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##sedan", var_0_62.sedan, var_0_58.sedan, #var_0_58.sedan)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 2 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##universal", var_0_62.universal, var_0_58.universal, #var_0_58.universal)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 3 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##sportcar", var_0_62.sportcar, var_0_58.sportcar, #var_0_58.sportcar)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 4 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##cabriolet", var_0_62.cabriolet, var_0_58.cabriolet, #var_0_58.cabriolet)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 5 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##lowrider", var_0_62.lowrider, var_0_58.lowrider, #var_0_58.lowrider)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 6 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##motobike", var_0_62.motobike, var_0_58.motobike, #var_0_58.motobike)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 7 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##bike", var_0_62.bike, var_0_58.bike, #var_0_58.bike)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 8 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##industrial", var_0_62.industrial, var_0_58.industrial, #var_0_58.industrial)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 9 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##government", var_0_62.government, var_0_58.government, #var_0_58.government)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 10 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##unic", var_0_62.unic, var_0_58.unic, #var_0_58.unic)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 11 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##air", var_0_62.air, var_0_58.air, #var_0_58.air)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 12 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##helicopter", var_0_62.helicopter, var_0_58.helicopter, #var_0_58.helicopter)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 13 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##boat", var_0_62.boat, var_0_58.boat, #var_0_58.boat)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 14 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##rc", var_0_62.rc, var_0_58.rc, #var_0_58.rc)
		var_0_3.PopItemWidth()
	end

	if var_0_61.v == 15 then
		var_0_3.NextColumn()
		var_0_3.PushItemWidth(150)
		var_0_3.Combo("##truck", var_0_62.truck, var_0_58.truck, #var_0_58.truck)
		var_0_3.PopItemWidth()
	end

	var_0_3.NextColumn()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Цвет 1:"))
	var_0_3.PushItemWidth(150)
	var_0_3.Combo("##carcolor", var_0_63, var_0_59, #var_0_59)
	var_0_3.PopItemWidth()
	var_0_3.NextColumn()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_CIRCLE .. u8(" {FFFFFF}Цвет 2:"))
	var_0_3.PushItemWidth(150)
	var_0_3.Combo("##carcolor2", var_0_64, var_0_60, #var_0_60)
	var_0_3.PopItemWidth()

	if var_0_63.v == 0 then
		carcolor = 0
	end

	if var_0_63.v == 1 then
		carcolor = 1
	end

	if var_0_63.v == 2 then
		carcolor = 134
	end

	if var_0_63.v == 3 then
		carcolor = 53
	end

	if var_0_63.v == 4 then
		carcolor = 135
	end

	if var_0_63.v == 5 then
		carcolor = 155
	end

	if var_0_63.v == 6 then
		carcolor = 23
	end

	if var_0_63.v == 7 then
		carcolor = 175
	end

	if var_0_63.v == 8 then
		carcolor = 3
	end

	if var_0_63.v == 9 then
		carcolor = 243
	end

	if var_0_63.v == 10 then
		carcolor = 235
	end

	if var_0_63.v == 11 then
		carcolor = 226
	end

	if var_0_63.v == 12 then
		carcolor = 234
	end

	if var_0_63.v == 13 then
		carcolor = 194
	end

	if var_0_63.v == 14 then
		carcolor = 6
	end

	if var_0_63.v == 15 then
		carcolor = 126
	end

	if var_0_63.v == 16 then
		carcolor = 131
	end

	if var_0_63.v == 17 then
		carcolor = 233
	end

	if var_0_64.v == 0 then
		carcolor2 = 0
	end

	if var_0_64.v == 1 then
		carcolor2 = 1
	end

	if var_0_64.v == 2 then
		carcolor2 = 134
	end

	if var_0_64.v == 3 then
		carcolor2 = 53
	end

	if var_0_64.v == 4 then
		carcolor2 = 135
	end

	if var_0_64.v == 5 then
		carcolor2 = 155
	end

	if var_0_64.v == 6 then
		carcolor2 = 23
	end

	if var_0_64.v == 7 then
		carcolor2 = 175
	end

	if var_0_64.v == 8 then
		carcolor2 = 3
	end

	if var_0_64.v == 9 then
		carcolor2 = 243
	end

	if var_0_64.v == 10 then
		carcolor2 = 235
	end

	if var_0_64.v == 11 then
		carcolor2 = 226
	end

	if var_0_64.v == 12 then
		carcolor2 = 234
	end

	if var_0_64.v == 13 then
		carcolor2 = 194
	end

	if var_0_64.v == 14 then
		carcolor2 = 6
	end

	if var_0_64.v == 15 then
		carcolor2 = 126
	end

	if var_0_64.v == 16 then
		carcolor2 = 131
	end

	if var_0_64.v == 17 then
		carcolor2 = 233
	end

	var_0_3.Columns(1)
	var_0_3.PushStyleColor(var_0_3.Col.Button, var_0_3.ImColor(82, 82, 223):GetVec4())

	if var_0_3.Button(var_0_46.ICON_FA_KEY .. u8(" Заспавнить"), var_175_2) then
		if checks.acarsit_check.v == true then
			sitornot = 1
		else
			sitornot = 0
		end

		if var_0_61.v == 0 then
			if var_0_62.offroad.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 400 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 424 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 444 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 470 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 489 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 495 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 500 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 505 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 556 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 557 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 568 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 11 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 573 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.offroad.v == 12 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 579 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 1 then
			if var_0_62.sedan.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 401 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 405 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 410 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 419 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 421 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 426 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 436 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 445 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 466 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 467 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 474 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 11 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 491 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 12 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 492 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 13 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 507 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 14 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 516 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 15 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 517 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 16 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 518 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 17 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 526 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 18 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 527 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 19 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 529 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 20 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 540 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 21 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 542 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 22 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 546 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 23 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 547 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 24 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 549 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 25 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 550 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 26 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 551 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 27 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 560 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 28 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 562 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 29 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 580 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 30 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 585 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sedan.v == 31 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 604 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 2 then
			if var_0_62.universal.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 404 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.universal.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 418 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.universal.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 458 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.universal.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 479 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.universal.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 561 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 3 then
			if var_0_62.sportcar.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 402 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 411 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 415 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 429 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 451 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 475 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 477 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 494 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 502 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 503 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 496 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 11 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 506 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 12 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 541 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 13 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 558 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 14 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 559 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 15 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 565 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 16 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 587 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 17 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 589 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 18 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 602 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.sportcar.v == 19 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 603 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 4 then
			if var_0_62.cabriolet.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 439 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.cabriolet.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 480 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.cabriolet.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 533 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.cabriolet.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 555 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 5 then
			if var_0_62.lowrider.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 412 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.lowrider.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 534 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.lowrider.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 535 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.lowrider.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 536 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.lowrider.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 566 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.lowrider.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 567 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.lowrider.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 575 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 6 then
			if var_0_62.motobike.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 448 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 461 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 462 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 463 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 468 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 471 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 521 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 522 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 581 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.motobike.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 586 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 7 then
			if var_0_62.bike.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 481 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.bike.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 509 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.bike.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 510 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 8 then
			if var_0_62.industrial.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 403 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 408 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 413 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 414 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 422 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 440 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 443 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 455 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 456 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 459 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 478 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 11 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 482 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 12 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 498 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 13 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 499 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 14 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 514 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 15 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 515 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 16 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 524 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 17 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 531 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 18 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 543 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 19 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 552 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 20 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 554 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 21 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 578 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 22 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 582 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 23 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 600 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 24 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 605 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.industrial.v == 25 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 609 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 9 then
			if var_0_62.government.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 407 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 416 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 420 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 427 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 431 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 432 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 433 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 437 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 438 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 490 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 523 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 11 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 528 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 12 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 544 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 13 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 596 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 14 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 597 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 15 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 598 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 16 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 599 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.government.v == 17 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 601 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 10 then
			if var_0_62.unic.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 504 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 406 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 409 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 423 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 428 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 434 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 442 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 449 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 457 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 483 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 485 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 11 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 486 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 12 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 508 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 13 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 525 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 14 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 530 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 15 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 532 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 16 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 537 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 17 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 538 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 18 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 539 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 19 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 545 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 20 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 571 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 21 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 572 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 22 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 574 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 23 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 583 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.unic.v == 24 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 588 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 11 then
			if var_0_62.air.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 460 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 476 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 511 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 512 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 513 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 519 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 520 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 553 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 577 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 592 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.air.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 593 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 12 then
			if var_0_62.helicopter.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 417 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 425 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 447 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 469 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 487 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 488 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 497 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 548 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.helicopter.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 563 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 13 then
			if var_0_62.boat.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 430 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 446 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 452 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 453 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 454 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 472 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 473 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 484 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 493 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.boat.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 595 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 14 then
			if var_0_62.rc.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 441 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.rc.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 464 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.rc.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 465 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.rc.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 501 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.rc.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 564 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.rc.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 594 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end

		if var_0_61.v == 15 then
			if var_0_62.truck.v == 0 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 435 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 1 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 450 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 2 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 569 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 3 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 570 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 4 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 584 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 5 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 590 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 6 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 591 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 7 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 606 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 8 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 607 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 9 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 608 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 10 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 610 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end

			if var_0_62.truck.v == 11 then
				if sitornot == 1 then
					var_0_82.acar.v = not var_0_82.acar.v

					if var_0_82.menu.v == true then
						var_0_82.menu.v = not var_0_82.menu.v
					end
				end

				sampSendChat("/veh 611 " .. sitornot .. " " .. carcolor .. " " .. carcolor2)
			end
		end
	end

	var_0_3.PopStyleColor()
	var_0_3.End()
end

function checker_function()
	local var_176_0 = {}
	local var_176_1, var_176_2 = getScreenResolution()

	var_0_3.SetNextWindowSize(var_0_3.ImVec2(670, 360), 2)
	var_0_3.SetNextWindowPos(var_0_3.ImVec2(var_176_1 / 2, var_176_2 / 2), 2, var_0_3.ImVec2(0.5, 0.5))
	var_0_3.Begin(var_0_46.ICON_FA_EYE .. u8(" AdminHelper | Чекер"), var_0_103, var_0_3.WindowFlags.NoResize + var_0_3.WindowFlags.NoTitleBar)
	var_0_3.BeginGroup()
	var_0_3.TextColoredRGB("{5252DF}" .. var_0_46.ICON_FA_EYE .. u8(" {E0DEF8}Чекер"))
	var_0_3.SameLine()
	var_0_3.SetCursorPos(var_0_3.ImVec2(625, 10))
	var_0_3.PushStyleVar(var_0_3.StyleVar.FrameRounding, 10)

	if var_0_3.Button(var_0_46.ICON_FA_TIMES .. "##1", var_0_3.ImVec2(30, 0)) then
		var_0_103.v = not var_0_103.v
	end

	var_0_3.PopStyleVar(1)
	var_0_3.EndGroup()
	var_0_3.BeginGroup()
	var_0_3.BeginChild("Left panel", var_0_3.ImVec2(110, 0), true)

	if var_0_3.Selectable(var_0_46.ICON_FA_STICKY_NOTE .. u8(" Списки"), var_0_117 == 1) then
		var_0_117 = 1
	end

	if var_0_3.Selectable(var_0_46.ICON_FA_COG .. u8(" Настройки"), var_0_117 == 2) then
		var_0_117 = 2
	end

	var_0_3.EndChild()
	var_0_3.EndGroup()
	var_0_3.SameLine()

	if var_0_117 == 1 then
		var_0_3.BeginGroup()
		var_0_3.BeginChild("Center panel", var_0_3.ImVec2(145, -var_0_3.GetItemsLineHeightWithSpacing()), true)

		for iter_176_0, iter_176_1 in ipairs(var_0_54.lists) do
			if var_0_3.Selectable(iter_176_1.title .. "##" .. iter_176_0, var_0_118 == iter_176_0, var_0_3.SelectableFlags.AllowDoubleClick) then
				var_0_118 = iter_176_0

				if var_0_3.IsMouseDoubleClicked(0) then
					local var_176_3, var_176_4, var_176_5, var_176_6 = explode_argb(var_0_54.lists[var_0_118].color)

					var_0_55.listTitle = var_0_3.ImBuffer(var_0_54.lists[var_0_118].title, 128)
					var_0_55.listIp = var_0_3.ImBuffer(var_0_54.lists[var_0_118].ip, 16)
					var_0_55.listPort = var_0_3.ImInt(var_0_54.lists[var_0_118].port)
					var_0_55.listColor = var_0_3.ImFloat3(var_176_4 / 255, var_176_5 / 255, var_176_6 / 255)

					var_0_3.OpenPopup(u8("Изменить настройки списка##") .. iter_176_0)
				end
			end

			if var_0_3.BeginPopupModal(u8("Изменить настройки списка##") .. iter_176_0, nil, 64) then
				var_0_3.InputText(u8("Название"), var_0_55.listTitle)
				var_0_3.ColorEdit3(u8("Цвет"), var_0_55.listColor)
				var_0_3.Separator()
				var_0_3.SetCursorPosX((var_0_3.GetWindowWidth() - 240 + var_0_3.GetStyle().ItemSpacing.x) / 2)

				if var_0_3.Button(u8("Готово"), var_0_3.ImVec2(120, 0)) then
					var_0_54.lists[var_0_118] = {
						isbuiltin = var_0_54.lists[var_0_118].isbuiltin,
						title = var_0_55.listTitle.v,
						ip = var_0_55.listIp.v,
						port = var_0_55.listPort.v,
						color = join_argb(255, var_0_55.listColor.v[1] * 255, var_0_55.listColor.v[2] * 255, var_0_55.listColor.v[3] * 255),
						users = var_0_54.lists[var_0_118].users
					}

					saveData()
					var_0_3.CloseCurrentPopup()
				end

				var_0_3.SameLine()

				if var_0_3.Button(u8("Отмена"), var_0_3.ImVec2(120, 0)) then
					var_0_3.CloseCurrentPopup()
				end

				var_0_3.EndPopup()
			end
		end

		var_0_3.EndChild()

		if var_0_3.Button(u8("Добавить"), var_0_3.ImVec2((var_0_118 == 0 or var_0_54.lists[var_0_118].isbuiltin) and 145 or 66, 0)) then
			local var_176_7 = sampGetCurrentServerName()
			local var_176_8, var_176_9 = sampGetCurrentServerAddress()

			var_0_55.listTitle = var_0_3.ImBuffer(u8:encode(var_176_7), 128)
			var_0_55.listIp = var_0_3.ImBuffer(var_176_8, 16)
			var_0_55.listPort = var_0_3.ImInt(var_176_9)
			var_0_55.listColor = var_0_3.ImFloat3(0, 0, 0)
			var_0_55.listTitle = var_0_3.ImBuffer("", 128)
			var_0_55.listColor = var_0_3.ImFloat3(0, 0, 0)

			var_0_3.OpenPopup(u8("Добавление списка"))
		end

		var_0_3.SameLine()

		if var_0_118 ~= 0 and not var_0_54.lists[var_0_118].isbuiltin and var_0_3.Button(u8("Удалить"), var_0_3.ImVec2(66, 0)) then
			var_0_3.OpenPopup(u8("Удаление списка"))
		end

		if var_0_3.BeginPopupModal(u8("Добавление списка"), nil, 64) then
			var_0_3.InputText(u8("Название"), var_0_55.listTitle)
			var_0_3.ColorEdit3(u8("Цвет"), var_0_55.listColor)
			var_0_3.Separator()
			var_0_3.SetCursorPosX((var_0_3.GetWindowWidth() - 240 + var_0_3.GetStyle().ItemSpacing.x) / 2)

			if var_0_3.Button(u8("Готово"), var_0_3.ImVec2(120, 0)) then
				table.insert(var_0_54.lists, {
					isbuiltin = false,
					title = var_0_55.listTitle.v,
					ip = var_0_55.listIp.v,
					port = var_0_55.listPort.v,
					color = join_argb(255, var_0_55.listColor.v[1] * 255, var_0_55.listColor.v[2] * 255, var_0_55.listColor.v[3] * 255),
					users = {
						""
					}
				})
				saveData()
				var_0_3.CloseCurrentPopup()
			end

			var_0_3.SameLine()

			if var_0_3.Button(u8("Отмена"), var_0_3.ImVec2(120, 0)) then
				var_0_3.CloseCurrentPopup()
			end

			var_0_3.EndPopup()
		end

		if var_0_3.BeginPopupModal(u8("Удаление списка"), nil, 2) then
			var_0_3.Text(u8("Удаление списка приведет к полной потере всех данных.\nЖелаете продолжить?"))
			var_0_3.Separator()
			var_0_3.SetCursorPosX((var_0_3.GetWindowWidth() - 240 + var_0_3.GetStyle().ItemSpacing.x) / 2)

			if var_0_3.Button(u8("Да"), var_0_3.ImVec2(120, 0)) then
				table.remove(var_0_54.lists, var_0_118)

				var_0_118 = 0

				saveData()
				var_0_3.CloseCurrentPopup()
			end

			var_0_3.SameLine()

			if var_0_3.Button(u8("Нет"), var_0_3.ImVec2(120, 0)) then
				var_0_3.CloseCurrentPopup()
			end

			var_0_3.EndPopup()
		end

		var_0_3.EndGroup()
		var_0_3.SameLine()
		var_0_3.BeginGroup()
		var_0_3.BeginChild("Right", var_0_3.ImVec2(175, 0), true)

		if var_0_118 ~= 0 then
			var_0_55.usersListTextBuffer = var_0_3.ImBuffer(table.concat(var_0_54.lists[var_0_118].users, "\n"), 65535)

			if var_0_3.InputTextMultiline("##userslist", var_0_55.usersListTextBuffer, var_0_3.ImVec2(150, -1)) then
				local var_176_10 = parseText(var_0_55.usersListTextBuffer.v)

				var_0_54.lists[var_0_118].users = #var_176_10 > 0 and var_176_10 or {
					""
				}

				saveData()
				rebuildUsers()
			end
		end

		var_0_3.EndChild()
		var_0_3.SameLine()
		var_0_3.BeginChild("Users list", var_0_3.ImVec2(173, 0), true)

		if var_0_118 ~= 0 then
			var_0_3.Text(table.concat(var_0_54.lists[var_0_118].users, "\n"))
		end

		var_0_3.EndChild()
		var_0_3.EndGroup()
	end

	if var_0_117 == 2 then
		var_0_3.BeginGroup()
		var_0_3.BeginChild("Center panel")
		var_0_3.PushItemWidth(100)

		if var_0_3.Checkbox(u8("Сообщения о входе/выходе отслеживаемых пользователей"), var_0_3.ImBool(var_0_54.settings.notificationsAboutJoinsAndQuits)) then
			var_0_54.settings.notificationsAboutJoinsAndQuits = not var_0_54.settings.notificationsAboutJoinsAndQuits

			saveData()
		end

		if var_0_3.Button(var_0_54.settings.renderHotKeyType == 0 and u8("Постоянно") or var_0_54.settings.renderHotKeyType == 1 and u8("Нажатие") or var_0_54.settings.renderHotKeyType == 2 and u8("Зажатие") or u8("Переключение"), var_0_3.ImVec2(100, 0)) then
			var_0_54.settings.renderHotKeyType = (var_0_54.settings.renderHotKeyType + 1) % 4

			saveData()
		end

		if var_0_54.settings.renderHotKeyType ~= 0 and var_0_3.HotKey("##renderhotkey", var_0_54.settings.renderHotKey, var_176_0, 100) then
			saveData()
		end

		var_0_3.SameLine()
		var_0_3.Text(u8("Хоткей рендера на экране"))

		if var_0_54.settings.renderHotKeyType == 1 and var_0_3.InputInt(u8("Время рендера (в мс, 1000 мс = 1 сек)"), var_0_116, 1, 100) then
			var_0_54.settings.renderTime = var_0_116.v

			saveData()
		end

		if var_0_54.settings.renderHotKeyType == 3 and var_0_3.Checkbox(u8("Рендерить после запуска"), var_0_3.ImBool(var_0_54.settings.isRenderEnabledByDefault)) then
			var_0_54.settings.isRenderEnabledByDefault = not var_0_54.settings.isRenderEnabledByDefault

			saveData()
		end

		if var_0_3.Checkbox(u8("Прятать на скриншотах"), var_0_3.ImBool(var_0_54.settings.hideOnScreenshot)) then
			var_0_54.settings.hideOnScreenshot = not var_0_54.settings.hideOnScreenshot

			saveData()
		end

		if var_0_3.Checkbox(u8("Показывать ID"), var_0_3.ImBool(var_0_54.settings.renderID)) then
			var_0_54.settings.renderID = not var_0_54.settings.renderID

			saveData()
		end

		if var_0_3.Checkbox(u8("Показывать LVL"), var_0_3.ImBool(var_0_54.settings.renderLevel)) then
			var_0_54.settings.renderLevel = not var_0_54.settings.renderLevel

			saveData()
		end

		if var_0_3.InputText(u8("Название шрифта списка"), var_0_104) then
			var_0_54.settings.listFontName = var_0_104.v

			saveData()
			rebuildFonts()
		end

		if var_0_3.InputInt(u8("Размер шрифта спика"), var_0_105, 1, 3) then
			var_0_54.settings.listFontSize = var_0_105.v

			saveData()
			rebuildFonts()
		end

		var_0_3.Text(u8("Флаги шрифта списка:"))

		if var_0_3.RadioButton(u8("Полужирный##list"), bit.band(1, var_0_106) == 1) then
			var_0_106 = bit.bxor(1, var_0_106)
			var_0_54.settings.listFontFlags = var_0_106

			saveData()
			rebuildFonts()
		end

		var_0_3.SameLine()

		if var_0_3.RadioButton(u8("Курсив##list"), bit.band(2, var_0_106) == 2) then
			var_0_106 = bit.bxor(2, var_0_106)
			var_0_54.settings.listFontFlags = var_0_106

			saveData()
			rebuildFonts()
		end

		var_0_3.SameLine()

		if var_0_3.RadioButton(u8("Контур##list"), bit.band(4, var_0_106) == 4) then
			var_0_106 = bit.bxor(4, var_0_106)
			var_0_54.settings.listFontFlags = var_0_106

			saveData()
			rebuildFonts()
		end

		var_0_3.SameLine()

		if var_0_3.RadioButton(u8("Тень##list"), bit.band(8, var_0_106) == 8) then
			var_0_106 = bit.bxor(8, var_0_106)
			var_0_54.settings.listFontFlags = var_0_106

			saveData()
			rebuildFonts()
		end

		if var_0_3.InputText(u8("Текст шапки"), var_0_111) then
			var_0_54.settings.headerText = var_0_111.v

			saveData()
			rebuildFonts()
		end

		if var_0_3.InputText(u8("Название шрифта шапки"), var_0_107) then
			var_0_54.settings.headerFontName = var_0_107.v

			saveData()
			rebuildFonts()
		end

		if var_0_3.InputInt(u8("Размер шрифта шапки"), var_0_108, 1, 3) then
			var_0_54.settings.headerFontSize = var_0_108.v

			saveData()
			rebuildFonts()
		end

		var_0_3.Text(u8("Флаги шрифта шапки:"))

		if var_0_3.RadioButton(u8("Полужирный##header"), bit.band(1, var_0_109) == 1) then
			var_0_109 = bit.bxor(1, var_0_109)
			var_0_54.settings.headerFontFlags = var_0_109

			saveData()
			rebuildFonts()
		end

		var_0_3.SameLine()

		if var_0_3.RadioButton(u8("Курсив##header"), bit.band(2, var_0_109) == 2) then
			var_0_109 = bit.bxor(2, var_0_109)
			var_0_54.settings.headerFontFlags = var_0_109

			saveData()
			rebuildFonts()
		end

		var_0_3.SameLine()

		if var_0_3.RadioButton(u8("Контур##header"), bit.band(4, var_0_109) == 4) then
			var_0_109 = bit.bxor(4, var_0_109)
			var_0_54.settings.headerFontFlags = var_0_109

			saveData()
			rebuildFonts()
		end

		var_0_3.SameLine()

		if var_0_3.RadioButton(u8("Тень##header"), bit.band(8, var_0_109) == 8) then
			var_0_109 = bit.bxor(8, var_0_109)
			var_0_54.settings.headerFontFlags = var_0_109

			saveData()
			rebuildFonts()
		end

		if var_0_3.ColorEdit3(u8("Цвет шрифта шапки"), var_0_110) then
			var_0_54.settings.headerFontColor = join_argb(255, var_0_110.v[1] * 255, var_0_110.v[2] * 255, var_0_110.v[3] * 255)

			saveData()
			rebuildFonts()
		end

		if var_0_3.DragInt(u8("Позиция списка по оси X"), var_0_112, 1, 0, var_176_1) then
			var_0_54.settings.headerPosX = var_0_112.v

			saveData()
		end

		if var_0_3.DragInt(u8("Позиция списка по оси Y"), var_0_113, 1, 0, var_176_2) then
			var_0_54.settings.headerPosY = var_0_113.v

			saveData()
		end

		if var_0_3.Button(u8("Указать позицию списка с помощью курсора")) then
			var_0_119 = true
			var_0_82.menu.v = false

			alert("Нажмите {9932cc}ЛКМ{FFFFFF}, чтобы завершить. Нажмите {9932cc}ПКМ{FFFFFF}, чтобы отменить.")
		end

		var_0_3.PopItemWidth()
		var_0_3.EndChild()
		var_0_3.EndGroup()
	end

	var_0_3.End()
end

function announce_function()
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [INFO] " .. u8:decode(var_0_72.askrep.v))
	wait(1000)
	sampSendChat("/ooc [INFO] " .. u8:decode(var_0_72.askrep2.v))
	wait(1000)
	sampSendChat("/ooc [INFO] " .. u8:decode(var_0_72.askrep3.v))
	wait(400)
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function announce2_function()
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [INFO] " .. u8:decode(var_0_72.respawncar.v))
	wait(1000)
	sampSendChat("/ooc [INFO] " .. u8:decode(var_0_72.respawncar2.v))
	wait(1000)
	sampSendChat("/ooc [INFO] " .. u8:decode(var_0_72.respawncar3.v))
	wait(400)
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function announce3_function()
	local var_179_0 = sampGetPlayerNickname(var_0_86.v)

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.myasorubka.v))
	wait(1000)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.myasorubka2.v))
	wait(400)

	if var_0_91.v == true and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$. Спонсор мероприятия: " .. var_179_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == true and var_0_95.v == false then
		wait(600)
		sampSendChat("/ooc [МП] Спонсор мероприятия: " .. var_179_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == false and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$")
		wait(400)
	end

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function announce4_function()
	local var_180_0 = sampGetPlayerNickname(var_0_86.v)

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.pryatki.v))
	wait(1000)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.pryatki2.v))
	wait(400)

	if var_0_91.v == true and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$. Спонсор мероприятия: " .. var_180_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == true and var_0_95.v == false then
		wait(600)
		sampSendChat("/ooc [МП] Спонсор мероприятия: " .. var_180_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == false and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$")
		wait(400)
	end

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function announce5_function()
	local var_181_0 = sampGetPlayerNickname(var_0_86.v)

	sampAddChatMessage("{51fffa}[AdminHelper]{d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.ruletka.v))
	wait(1000)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.ruletka2.v))
	wait(400)

	if var_0_91.v == true and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$. Спонсор мероприятия: " .. var_181_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == true and var_0_95.v == false then
		wait(600)
		sampSendChat("/ooc [МП] Спонсор мероприятия: " .. var_181_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == false and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$")
		wait(400)
	end

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function announce6_function()
	local var_182_0 = sampGetPlayerNickname(var_0_86.v)

	sampAddChatMessage("{51fffa}[AdminHelper]{d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.polivalka.v))
	wait(1000)
	sampSendChat("/ooc [МП] " .. u8:decode(var_0_72.polivalka2.v))
	wait(400)

	if var_0_91.v == true and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$. Спонсор мероприятия: " .. var_182_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == true and var_0_95.v == false then
		wait(600)
		sampSendChat("/ooc [МП] Спонсор мероприятия: " .. var_182_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == false and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$")
		wait(400)
	end

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function announce7_function()
	local var_183_0 = sampGetPlayerNickname(var_0_86.v)

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [МП] Сейчас пройдет мероприятие 'Догони и передай'.")
	wait(1000)
	sampSendChat("/ooc [МП] Суть мероприятия - догнать id: " .. var_0_83.v .. " и передать 1$.")
	wait(1000)
	sampSendChat("/ooc [МП] Мы на " .. u8:decode(var_0_84.v) .. ". Начинаем от " .. u8:decode(var_0_85.v) .. ".")
	wait(400)

	if var_0_91.v == true and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$. Спонсор мероприятия: " .. var_183_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == true and var_0_95.v == false then
		wait(600)
		sampSendChat("/ooc [МП] Спонсор мероприятия: " .. var_183_0 .. "%[" .. var_0_86.v .. "%]")
		wait(400)
	end

	if var_0_91.v == false and var_0_95.v == true then
		wait(600)
		sampSendChat("/ooc [МП] Приз: " .. var_0_88.v .. "$")
		wait(400)
	end

	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function announce8_function()
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Объявляем...", 16776960)
	wait(400)
	sampSendChat("/ooc [МП] Требуется спонсор для мероприятия. Необходимая сумма: " .. var_0_89.v .. "$")
	wait(1000)
	sampSendChat("/ooc [МП] Желающие напишите + в /sms " .. var_0_90.v)
	wait(400)
	sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Закончили.", 16776960)
end

function var_0_0.onShowDialog(arg_185_0, arg_185_1, arg_185_2, arg_185_3, arg_185_4, arg_185_5)
	if arg_185_0 == 32700 then
		if openip == 1 then
			local var_185_0 = arg_185_5

			for iter_185_0 in string.gmatch(var_185_0, "[^\r\n]+") do
				if iter_185_0.find(iter_185_0, "Рег IP:\t\t\t\t%{.+%}%d+%p%d+%p%d+%p%d+") then
					ipreg = iter_185_0.match(iter_185_0, "Рег IP:\t\t\t\t%{.+%}(%d+%p%d+%p%d+%p%d+)")
				elseif iter_185_0.find(iter_185_0, "Последний IP:\t\t\t%{.+%}%d+%p%d+%p%d+%p%d+") then
					iplast = iter_185_0.match(iter_185_0, "Последний IP:\t\t\t%{.+%}(%d+%p%d+%p%d+%p%d+)")
				end
			end

			ips = {
				ipreg,
				iplast
			}

			sampSendDialogResponse(32700, 1, 0, "")

			openip = 0

			return false
		end

		if acheckips == true then
			local var_185_1 = arg_185_5

			for iter_185_1 in string.gmatch(var_185_1, "[^\r\n]+") do
				if iter_185_1.find(iter_185_1, "Последний IP:\t\t\t%{.+%}%d+%p%d+%p%d+%p%d+") then
					acheckip = iter_185_1.match(iter_185_1, "Последний IP:\t\t\t%{.+%}(%d+%p%d+%p%d+%p%d+)")
				end
			end

			sampSendDialogResponse(32700, 1, 0, "")

			return false
		end

		if var_0_82.offstats.v then
			local var_185_4 = arg_185_5

			for iter_185_3 in string.gmatch(var_185_4, "[^\r\n]+") do
				if iter_185_3.find(iter_185_3, "Номер аккаунта:\t\t%{.+%}.+") then
					offstatsmassiv.account = iter_185_3.match(iter_185_3, "Номер аккаунта:\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Уровень:\t\t\t%{.+%}.+") then
					offstatsmassiv.lvl = iter_185_3.match(iter_185_3, "Уровень:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Очки опыта:\t\t\t%{.+%}(.+)") then
					offstatsmassiv.exp = iter_185_3.match(iter_185_3, "Очки опыта:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Номер телефона:\t\t%{.+%}.+") then
					offstatsmassiv.number = iter_185_3.match(iter_185_3, "Номер телефона:\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Уровень розыска:\t\t%{.+%}.+") then
					offstatsmassiv.wantedlvl = iter_185_3.match(iter_185_3, "Уровень розыска:\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Донат:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.donate = iter_185_3.match(iter_185_3, "Донат:\t\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Дом:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.home = iter_185_3.match(iter_185_3, "Дом:\t\t\t\t%{.+%}(.+)")

					if offstatsmassiv.home:find("-1") then
						offstatsmassiv.home = u8("Нет")
					end
				end

				if iter_185_3.find(iter_185_3, "Аренда дома:\t\t\t%{.+%}.+") then
					offstatsmassiv.renthome = iter_185_3.match(iter_185_3, "Аренда дома:\t\t\t%{.+%}(.+)")

					if offstatsmassiv.renthome:find("-1") then
						offstatsmassiv.renthome = u8("Нет")
					end
				end

				if iter_185_3.find(iter_185_3, "Бизнес:\t\t\t%{.+%}.+") then
					offstatsmassiv.business = iter_185_3.match(iter_185_3, "Бизнес:\t\t\t%{.+%}(.+)")

					if offstatsmassiv.business:find("-1") then
						offstatsmassiv.business = u8("Нет")
					end
				end

				if iter_185_3.find(iter_185_3, "Пол:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.gender = iter_185_3.match(iter_185_3, "Пол:\t\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Работа:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.job = iter_185_3.match(iter_185_3, "Работа:\t\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Организация:\t\t\t%{.+%}.+") then
					offstatsmassiv.fraction = iter_185_3.match(iter_185_3, "Организация:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Ранг:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.rank = iter_185_3.match(iter_185_3, "Ранг:\t\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Реферал:\t\t\t%{.+%}.+") then
					offstatsmassiv.referal = iter_185_3.match(iter_185_3, "Реферал:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Промокод:\t\t\t%{.+%}.+") then
					offstatsmassiv.promocode = iter_185_3.match(iter_185_3, "Промокод:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Рег IP:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.regip = iter_185_3.match(iter_185_3, "Рег IP:\t\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Последний IP:\t\t\t%{.+%}.+") then
					offstatsmassiv.lastip = iter_185_3.match(iter_185_3, "Последний IP:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Рег дата:\t\t\t%{.+%}.+") then
					offstatsmassiv.regdate = iter_185_3.match(iter_185_3, "Рег дата:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Последний вход:\t\t\t%{.+%}.+") then
					offstatsmassiv.lastonline = iter_185_3.match(iter_185_3, "Последний вход:\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Jail:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.jail = iter_185_3.match(iter_185_3, "Jail:\t\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "Mute:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.mute = iter_185_3.match(iter_185_3, "Mute:\t\t\t\t%{.+%}(.+)")
				end

				if iter_185_3.find(iter_185_3, "RMute:\t\t\t\t%{.+%}.+") then
					offstatsmassiv.rmute = iter_185_3.match(iter_185_3, "RMute:\t\t\t\t%{.+%}(.+)")
				end
			end

			sampSendDialogResponse(arg_185_0, 1, 0, "")

			return false
		end
	end

	if var_0_82.anamestore.v == true and arg_185_2:match("История никнеймов") then
		local var_185_18 = arg_185_5

		for iter_185_6 in string.gmatch(var_185_18, "[^\r\n]+") do
			if iter_185_6.find(iter_185_6, ".+ %p .+ %p %d+-%d+-%d+ %d+:%d+:%d+ %p Изменён .+") then
				local var_185_19, var_185_20, var_185_21, var_185_22, var_185_23 = iter_185_6.match(iter_185_6, "(.+) %p (.+) %p (%d+-%d+-%d+) (%d+:%d+:%d+) %p Изменён (.+)")

				table.insert(ppvanamestore.name1, var_185_19)
				table.insert(ppvanamestore.name2, var_185_20)
				table.insert(ppvanamestore.date, var_185_21)
				table.insert(ppvanamestore.time, var_185_22)
				table.insert(ppvanamestore.changer, var_185_23)
			end
		end

		sampSendDialogResponse(arg_185_0, 1, 0, "")

		return false
	end

	if var_0_82.connections.v == true and arg_185_2:match("История подключений") then
		local var_185_24 = arg_185_5

		for iter_185_7 in string.gmatch(var_185_24, "[^\r\n]+") do
			if iter_185_7.find(iter_185_7, "%d+%p %d+-%d+-%d+ %d+:%d+:%d+ %p %d+%p%d+%p%d+%p%d+ %(%a+%)") then
				local var_185_25, var_185_26, var_185_27, var_185_28 = iter_185_7.match(iter_185_7, "%d+%p (%d+-%d+-%d+) (%d+:%d+:%d+) %p (%d+%p%d+%p%d+%p%d+) %((%a+)%)")

				table.insert(ppvconnections.date, var_185_25)
				table.insert(ppvconnections.time, var_185_26)
				table.insert(ppvconnections.ip, var_185_27)
				table.insert(ppvconnections.platform, var_185_28)
			end
		end

		sampSendDialogResponse(arg_185_0, 1, 0, "")

		return false
	end
end

function var_0_0.onServerMessage(arg_186_0, arg_186_1)
	if not isPauseMenuActive() then
		if var_0_100.allchat then
			sendTelegramNotification("" .. arg_186_1)
		end

		if var_0_100.achat and arg_186_1:find("%[A%]") then
			sendTelegramNotification("" .. arg_186_1)
		end

		if var_0_100.report then
			if string.find(arg_186_1, "Администратор .+%[%d+%] для ", 1, true) then
				sendTelegramNotification("" .. arg_186_1)
			end

			if arg_186_1:find("%[Жалоба%] .+%[%d+%]:") then
				sendTelegramNotification("" .. arg_186_1)
			end
		end

		if var_0_100.localchat and arg_186_1:find("%p .+ %(.+%)") then
			sendTelegramNotification("" .. arg_186_1)
		end
	end

	if arg_186_1:find("Вард") or arg_186_1:find("вард") or arg_186_1:find("AdminHelper") or arg_186_1:find("adminhelper") or arg_186_1:find("админхелпер") or arg_186_1:find("админ хелпер") or arg_186_1:find("АдминХелпер") or arg_186_1:find("EYE") or arg_186_1:find("ЕУЕ") or arg_186_1:find("еуе") then
		sendTelegramNotification("[WARNING /" .. nick .. "]\n\n" .. arg_186_1)
	end

	if string.find(arg_186_1, "Администратор " .. nick .. "[" .. select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)) .. "] для ", 1, true) then
		local var_186_0 = 3
		local var_186_1 = os.time(os.date("!*t")) + var_186_0 * 60 * 60
		local var_186_2 = tonumber(os.date("%w", var_186_1))

		if var_186_2 == 0 then
			statistic.report0 = statistic.report0 + 1

			if statistic.report0 == tonumber(statsIni.stats.StatsDayNorm) then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! :)", 16776960)
			end

			if statistic.report0 == tonumber(statsIni.stats.StatsDayNorm) * 2 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x2", 16776960)
			end

			if statistic.report0 == tonumber(statsIni.stats.StatsDayNorm) * 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x3", 16776960)
			end

			if statistic.report0 == tonumber(statsIni.stats.StatsDayNorm) * 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x4", 16776960)
			end

			if statistic.report0 == tonumber(statsIni.stats.StatsDayNorm) * 5 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x5", 16776960)
			end
		end

		if var_186_2 == 1 then
			statistic.report1 = statistic.report1 + 1

			if statistic.report1 == tonumber(statsIni.stats.StatsDayNorm) then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! :)", 16776960)
			end

			if statistic.report1 == tonumber(statsIni.stats.StatsDayNorm) * 2 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x2", 16776960)
			end

			if statistic.report1 == tonumber(statsIni.stats.StatsDayNorm) * 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x3", 16776960)
			end

			if statistic.report1 == tonumber(statsIni.stats.StatsDayNorm) * 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x4", 16776960)
			end

			if statistic.report1 == tonumber(statsIni.stats.StatsDayNorm) * 5 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x5", 16776960)
			end
		end

		if var_186_2 == 2 then
			statistic.report2 = statistic.report2 + 1

			if statistic.report2 == tonumber(statsIni.stats.StatsDayNorm) then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! :)", 16776960)
			end

			if statistic.report2 == tonumber(statsIni.stats.StatsDayNorm) * 2 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x2", 16776960)
			end

			if statistic.report2 == tonumber(statsIni.stats.StatsDayNorm) * 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x3", 16776960)
			end

			if statistic.report2 == tonumber(statsIni.stats.StatsDayNorm) * 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x4", 16776960)
			end

			if statistic.report2 == tonumber(statsIni.stats.StatsDayNorm) * 5 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x5", 16776960)
			end
		end

		if var_186_2 == 3 then
			statistic.report3 = statistic.report3 + 1

			if statistic.report3 == tonumber(statsIni.stats.StatsDayNorm) then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! :)", 16776960)
			end

			if statistic.report3 == tonumber(statsIni.stats.StatsDayNorm) * 2 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x2", 16776960)
			end

			if statistic.report3 == tonumber(statsIni.stats.StatsDayNorm) * 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x3", 16776960)
			end

			if statistic.report3 == tonumber(statsIni.stats.StatsDayNorm) * 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x4", 16776960)
			end

			if statistic.report3 == tonumber(statsIni.stats.StatsDayNorm) * 5 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x5", 16776960)
			end
		end

		if var_186_2 == 4 then
			statistic.report4 = statistic.report4 + 1

			if statistic.report4 == tonumber(statsIni.stats.StatsDayNorm) then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! :)", 16776960)
			end

			if statistic.report4 == tonumber(statsIni.stats.StatsDayNorm) * 2 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x2", 16776960)
			end

			if statistic.report4 == tonumber(statsIni.stats.StatsDayNorm) * 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x3", 16776960)
			end

			if statistic.report4 == tonumber(statsIni.stats.StatsDayNorm) * 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x4", 16776960)
			end

			if statistic.report4 == tonumber(statsIni.stats.StatsDayNorm) * 5 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x5", 16776960)
			end
		end

		if var_186_2 == 5 then
			statistic.report5 = statistic.report5 + 1

			if statistic.report5 == tonumber(statsIni.stats.StatsDayNorm) then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! :)", 16776960)
			end

			if statistic.report5 == tonumber(statsIni.stats.StatsDayNorm) * 2 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x2", 16776960)
			end

			if statistic.report5 == tonumber(statsIni.stats.StatsDayNorm) * 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x3", 16776960)
			end

			if statistic.report5 == tonumber(statsIni.stats.StatsDayNorm) * 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x4", 16776960)
			end

			if statistic.report5 == tonumber(statsIni.stats.StatsDayNorm) * 5 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x5", 16776960)
			end
		end

		if var_186_2 == 6 then
			statistic.report6 = statistic.report6 + 1

			if statistic.report6 == tonumber(statsIni.stats.StatsDayNorm) then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! :)", 16776960)
			end

			if statistic.report6 == tonumber(statsIni.stats.StatsDayNorm) * 2 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x2", 16776960)
			end

			if statistic.report6 == tonumber(statsIni.stats.StatsDayNorm) * 3 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x3", 16776960)
			end

			if statistic.report6 == tonumber(statsIni.stats.StatsDayNorm) * 4 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x4", 16776960)
			end

			if statistic.report6 == tonumber(statsIni.stats.StatsDayNorm) * 5 then
				sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Ежедневная норма выполнена! x5", 16776960)
			end
		end

		if statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6 == tonumber(statsIni.stats.StatsWeekNorm) then
			sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Недельная норма выполнена! :)", 16776960)
		end

		if statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6 == tonumber(statsIni.stats.StatsWeekNorm) * 2 then
			sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Недельная норма выполнена! x2", 16776960)
		end

		if statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6 == tonumber(statsIni.stats.StatsWeekNorm) * 3 then
			sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Недельная норма выполнена! x3", 16776960)
		end

		if statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6 == tonumber(statsIni.stats.StatsWeekNorm) * 4 then
			sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Недельная норма выполнена! x4", 16776960)
		end

		if statistic.report0 + statistic.report1 + statistic.report2 + statistic.report3 + statistic.report4 + statistic.report5 + statistic.report6 == tonumber(statsIni.stats.StatsWeekNorm) * 5 then
			sampAddChatMessage("{51fffa}[AdminHelper] {f9ff19}Недельная норма выполнена! x5", 16776960)
		end

		reportall = reportall + 1
		statsIni.stats.reportall = reportall
		statsIni.stats.report0 = statistic.report0
		statsIni.stats.report1 = statistic.report1
		statsIni.stats.report2 = statistic.report2
		statsIni.stats.report3 = statistic.report3
		statsIni.stats.report4 = statistic.report4
		statsIni.stats.report5 = statistic.report5
		statsIni.stats.report6 = statistic.report6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if string.find(arg_186_1, "Администратор " .. nick .. " выдал бан", 1, true) then
		local var_186_3 = 3
		local var_186_4 = os.time(os.date("!*t")) + var_186_3 * 60 * 60
		local var_186_5 = tonumber(os.date("%w", var_186_4))

		if var_186_5 == 0 then
			statistic.mute0 = statistic.mute0 + 1
		end

		if var_186_5 == 1 then
			statistic.mute1 = statistic.mute1 + 1
		end

		if var_186_5 == 2 then
			statistic.mute2 = statistic.mute2 + 1
		end

		if var_186_5 == 3 then
			statistic.mute3 = statistic.mute3 + 1
		end

		if var_186_5 == 4 then
			statistic.mute4 = statistic.mute4 + 1
		end

		if var_186_5 == 5 then
			statistic.mute5 = statistic.mute5 + 1
		end

		if var_186_5 == 6 then
			statistic.mute6 = statistic.mute6 + 1
		end

		muteall = muteall + 1
		statsIni.stats.muteall = muteall
		statsIni.stats.mute0 = statistic.mute0
		statsIni.stats.mute1 = statistic.mute1
		statsIni.stats.mute2 = statistic.mute2
		statsIni.stats.mute3 = statistic.mute3
		statsIni.stats.mute4 = statistic.mute4
		statsIni.stats.mute5 = statistic.mute5
		statsIni.stats.mute6 = statistic.mute6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if string.find(arg_186_1, "Администратор " .. nick .. " посадил", 1, true) then
		local var_186_6 = 3
		local var_186_7 = os.time(os.date("!*t")) + var_186_6 * 60 * 60
		local var_186_8 = tonumber(os.date("%w", var_186_7))

		if var_186_8 == 0 then
			statistic.jail0 = statistic.jail0 + 1
		end

		if var_186_8 == 1 then
			statistic.jail1 = statistic.jail1 + 1
		end

		if var_186_8 == 2 then
			statistic.jail2 = statistic.jail2 + 1
		end

		if var_186_8 == 3 then
			statistic.jail3 = statistic.jail3 + 1
		end

		if var_186_8 == 4 then
			statistic.jail4 = statistic.jail4 + 1
		end

		if var_186_8 == 5 then
			statistic.jail5 = statistic.jail5 + 1
		end

		if var_186_8 == 6 then
			statistic.jail6 = statistic.jail6 + 1
		end

		jailall = jailall + 1
		statsIni.stats.jailall = jailall
		statsIni.stats.jail0 = statistic.jail0
		statsIni.stats.jail1 = statistic.jail1
		statsIni.stats.jail2 = statistic.jail2
		statsIni.stats.jail3 = statistic.jail3
		statsIni.stats.jail4 = statistic.jail4
		statsIni.stats.jail5 = statistic.jail5
		statsIni.stats.jail6 = statistic.jail6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if string.find(arg_186_1, "Администратор " .. nick .. " выдал предупреждение", 1, true) then
		local var_186_9 = 3
		local var_186_10 = os.time(os.date("!*t")) + var_186_9 * 60 * 60
		local var_186_11 = tonumber(os.date("%w", var_186_10))

		if var_186_11 == 0 then
			statistic.warn0 = statistic.warn0 + 1
		end

		if var_186_11 == 1 then
			statistic.warn1 = statistic.warn1 + 1
		end

		if var_186_11 == 2 then
			statistic.warn2 = statistic.warn2 + 1
		end

		if var_186_11 == 3 then
			statistic.warn3 = statistic.warn3 + 1
		end

		if var_186_11 == 4 then
			statistic.warn4 = statistic.warn4 + 1
		end

		if var_186_11 == 5 then
			statistic.warn5 = statistic.warn5 + 1
		end

		if var_186_11 == 6 then
			statistic.warn6 = statistic.warn6 + 1
		end

		warnall = warnall + 1
		statsIni.stats.warnall = warnall
		statsIni.stats.warn0 = statistic.warn0
		statsIni.stats.warn1 = statistic.warn1
		statsIni.stats.warn2 = statistic.warn2
		statsIni.stats.warn3 = statistic.warn3
		statsIni.stats.warn4 = statistic.warn4
		statsIni.stats.warn5 = statistic.warn5
		statsIni.stats.warn6 = statistic.warn6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if string.find(arg_186_1, "Администратор " .. nick .. " выдал оффлайн", 1, true) then
		local var_186_12 = 3
		local var_186_13 = os.time(os.date("!*t")) + var_186_12 * 60 * 60
		local var_186_14 = tonumber(os.date("%w", var_186_13))

		if var_186_14 == 0 then
			statistic.ban0 = statistic.ban0 + 1
		end

		if var_186_14 == 1 then
			statistic.ban1 = statistic.ban1 + 1
		end

		if var_186_14 == 2 then
			statistic.ban2 = statistic.ban2 + 1
		end

		if var_186_14 == 3 then
			statistic.ban3 = statistic.ban3 + 1
		end

		if var_186_14 == 4 then
			statistic.ban4 = statistic.ban4 + 1
		end

		if var_186_14 == 5 then
			statistic.ban5 = statistic.ban5 + 1
		end

		if var_186_14 == 6 then
			statistic.ban6 = statistic.ban6 + 1
		end

		banall = banall + 1
		statsIni.stats.banall = banall
		statsIni.stats.ban0 = statistic.ban0
		statsIni.stats.ban1 = statistic.ban1
		statsIni.stats.ban2 = statistic.ban2
		statsIni.stats.ban3 = statistic.ban3
		statsIni.stats.ban4 = statistic.ban4
		statsIni.stats.ban5 = statistic.ban5
		statsIni.stats.ban6 = statistic.ban6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if string.find(arg_186_1, "Администратор " .. nick .. " забанил игрока", 1, true) then
		local var_186_15 = 3
		local var_186_16 = os.time(os.date("!*t")) + var_186_15 * 60 * 60
		local var_186_17 = tonumber(os.date("%w", var_186_16))

		if var_186_17 == 0 then
			statistic.ban0 = statistic.ban0 + 1
		end

		if var_186_17 == 1 then
			statistic.ban1 = statistic.ban1 + 1
		end

		if var_186_17 == 2 then
			statistic.ban2 = statistic.ban2 + 1
		end

		if var_186_17 == 3 then
			statistic.ban3 = statistic.ban3 + 1
		end

		if var_186_17 == 4 then
			statistic.ban4 = statistic.ban4 + 1
		end

		if var_186_17 == 5 then
			statistic.ban5 = statistic.ban5 + 1
		end

		if var_186_17 == 6 then
			statistic.ban6 = statistic.ban6 + 1
		end

		banall = banall + 1
		statsIni.stats.banall = banall
		statsIni.stats.ban0 = statistic.ban0
		statsIni.stats.ban1 = statistic.ban1
		statsIni.stats.ban2 = statistic.ban2
		statsIni.stats.ban3 = statistic.ban3
		statsIni.stats.ban4 = statistic.ban4
		statsIni.stats.ban5 = statistic.ban5
		statsIni.stats.ban6 = statistic.ban6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if arg_186_1:find("%[A%] " .. nick .. "%[%d+%] тихо забанил игрока") then
		local var_186_18 = 3
		local var_186_19 = os.time(os.date("!*t")) + var_186_18 * 60 * 60
		local var_186_20 = tonumber(os.date("%w", var_186_19))

		if var_186_20 == 0 then
			statistic.ban0 = statistic.ban0 + 1
		end

		if var_186_20 == 1 then
			statistic.ban1 = statistic.ban1 + 1
		end

		if var_186_20 == 2 then
			statistic.ban2 = statistic.ban2 + 1
		end

		if var_186_20 == 3 then
			statistic.ban3 = statistic.ban3 + 1
		end

		if var_186_20 == 4 then
			statistic.ban4 = statistic.ban4 + 1
		end

		if var_186_20 == 5 then
			statistic.ban5 = statistic.ban5 + 1
		end

		if var_186_20 == 6 then
			statistic.ban6 = statistic.ban6 + 1
		end

		banall = banall + 1
		statsIni.stats.banall = banall
		statsIni.stats.ban0 = statistic.ban0
		statsIni.stats.ban1 = statistic.ban1
		statsIni.stats.ban2 = statistic.ban2
		statsIni.stats.ban3 = statistic.ban3
		statsIni.stats.ban4 = statistic.ban4
		statsIni.stats.ban5 = statistic.ban5
		statsIni.stats.ban6 = statistic.ban6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if string.find(arg_186_1, "Администратор " .. nick .. " кикнул", 1, true) then
		local var_186_21 = 3
		local var_186_22 = os.time(os.date("!*t")) + var_186_21 * 60 * 60
		local var_186_23 = tonumber(os.date("%w", var_186_22))

		if var_186_23 == 0 then
			statistic.kick0 = statistic.kick0 + 1
		end

		if var_186_23 == 1 then
			statistic.kick1 = statistic.kick1 + 1
		end

		if var_186_23 == 2 then
			statistic.kick2 = statistic.kick2 + 1
		end

		if var_186_23 == 3 then
			statistic.kick3 = statistic.kick3 + 1
		end

		if var_186_23 == 4 then
			statistic.kick4 = statistic.kick4 + 1
		end

		if var_186_23 == 5 then
			statistic.kick5 = statistic.kick5 + 1
		end

		if var_186_23 == 6 then
			statistic.kick6 = statistic.kick6 + 1
		end

		kickall = kickall + 1
		statsIni.stats.kickall = kickall
		statsIni.stats.kick0 = statistic.kick0
		statsIni.stats.kick1 = statistic.kick1
		statsIni.stats.kick2 = statistic.kick2
		statsIni.stats.kick3 = statistic.kick3
		statsIni.stats.kick4 = statistic.kick4
		statsIni.stats.kick5 = statistic.kick5
		statsIni.stats.kick6 = statistic.kick6

		var_0_2.save(statsIni, "AdminHelper/stats")
	end

	if var_0_96.anticheatF.v == true and string.find(arg_186_1, "[AC]", 1, true) then
		return false
	end

	if var_0_96.adminchatF.v == true and string.find(arg_186_1, "[A]", 1, true) then
		return false
	end

	if var_0_96.hungryF.v == true and string.find(arg_186_1, "\xC2\xFB \xEF\xF0\xEE\xE3\xEE\xEB\xEE\xE4\xE0\xEB\xE8\xF1\xFC! \xCF\xEE\xF1\xE5\xF2\xE8\xF2\xE5 \xE1\xE0\xF0 \xE8\xEB\xE8 \xE7\xE0\xEA\xF3\xF1\xEE\xF7\xED\xF3\xFE. \xCF\xF0\xEE\xE2\xE5\xF0\xE8\xF2\xFC \xF1\xFB\xF2\xEE\xF1\xF2\xFC - /sety.", 1, true) then
		return false
	end

	if var_0_96.reconF.v == true and (string.find(arg_186_1, "* \xCD\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xEB\xE0\xE2\xE8\xF8\xF3 'F', \xF7\xF2\xEE\xE1\xFB \xEE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xEA\xF3\xF0\xF1\xEE\xF0.", 1, true) or string.find(arg_186_1, "* \xCD\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xEB\xE0\xE2\xE8\xF8\xF3 '\xCF\xF0\xEE\xE1\xE5\xEB', \xF7\xF2\xEE\xE1\xFB \xF1\xEA\xF0\xFB\xF2\xFC / \xEE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xEF\xE0\xED\xE5\xEB\xFC.", 1, true)) then
		return false
	end

	if var_0_96.newsF.v == true and (string.find(arg_186_1, "VIP \xCE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE5:", 1, true) or string.find(arg_186_1, "    \xCF\xF0\xEE\xE2\xE5\xF0\xE8\xEB \xF1\xEE\xF2\xF0\xF3\xE4\xED\xE8\xEA NPR:", 1, true) or string.find(arg_186_1, "\xCE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE5:", 1, true)) then
		return false
	end

	if var_0_96.reklamaF.v == true and (string.find(arg_186_1, "\xCD\xE5 \xE7\xE0\xE1\xF3\xE4\xFC\xF2\xE5 \xEF\xEE\xE4\xEF\xE8\xF1\xE0\xF2\xFC\xF1\xFF \xED\xE0 \xED\xE0\xF8\xE5 \xF1\xEE\xEE\xE1\xF9\xE5\xF1\xF2\xE2\xEE \xC2\xCA\xEE\xED\xF2\xE0\xEA\xF2\xE5: {FFFFFF}vk.com/online_samp", 1, true) or string.find(arg_186_1, "\xCF\xEE\xE4\xEF\xE8\xF8\xE8\xF2\xE5\xF1\xFC \xED\xE0 \xF0\xE0\xF1\xF1\xFB\xEB\xEA\xF3 \xE3\xF0\xF3\xEF\xEF\xFB, \xF7\xF2\xEE\xE1\xFB \xED\xE5 \xEF\xF0\xEE\xEF\xF3\xF1\xEA\xE0\xF2\xFC \xF0\xE0\xE7\xEB\xE8\xF7\xED\xFB\xE5 \xEA\xEE\xED\xEA\xF3\xF0\xF1\xFB \xE8 \xE0\xEA\xF6\xE8\xE8!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X2'{6699CC} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 2 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X2'{6699CC} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 {FFFFFF}2 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X2'{FFCD00} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 2 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X2'{FFCD00} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 {FFFFFF}2 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X3'{6699CC} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 3 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X3'{6699CC} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 {FFFFFF}3 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X3'{FFCD00} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 3 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xCF\xF0\xFF\xEC\xEE \xF1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xF5\xEE\xE4\xE8\xF2 {FFFFFF}'\xC0\xCA\xD6\xC8\xDF X3'{FFCD00} \xED\xE0 \xE4\xEE\xED\xE0\xF2. \xC2\xF1\xE5 \xE7\xE0\xF7\xE8\xF1\xEB\xE5\xED\xE8\xFF \xF3\xEC\xED\xEE\xE6\xE0\xFE\xF2\xF1\xFF \xE2 {FFFFFF}3 \xF0\xE0\xE7\xE0!", 1, true) or string.find(arg_186_1, "\xD5\xEE\xF2\xE8\xF2\xE5 \xE2\xFB\xE4\xE5\xEB\xFF\xF2\xFC\xF1\xFF \xE8\xE7 \xF2\xEE\xEB\xEF\xFB? \xC2 \xED\xE0\xF8\xE5\xEC \xE4\xEE\xED\xE0\xF2-\xEC\xE0\xE3\xE0\xE7\xE8\xED\xE5 (/donate) \xC2\xFB \xEC\xEE\xE6\xE5\xF2\xE5 \xEF\xF0\xE8\xEE\xE1\xF0\xE5\xF1\xF2\xE8 \xE4\xEE\xEF. \xE2\xEE\xE7\xEC\xEE\xE6\xED\xEE\xF1\xF2\xE8!", 1, true) or string.find(arg_186_1, "\xC8\xE3\xF0\xEE\xE2\xE0\xFF \xE2\xE0\xEB\xFE\xF2\xE0, VIP \xC0\xEA\xEA\xE0\xF3\xED\xF2, \xE0\xEA\xF1\xE5\xF1\xF1\xF3\xE0\xF0\xFB, \xED\xE0\xE2\xFB\xEA\xE8 \xF0\xE0\xE1\xEE\xF2\xFB, \xE4\xEE\xEF.\xF1\xEB\xEE\xF2 \xEB\xE8\xF7\xED\xEE\xE3\xEE \xF2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2\xE0 \xE8 \xEC\xED\xEE\xE3\xEE\xE5 \xE4\xF0\xF3\xE3\xEE\xE5...", 1, true)) then
		return false
	end

	if var_0_96.publicF.v == true then
		if arg_186_1:find("%[A%] Администратор .+%[%d+%] | ур: %d+ успешно авторизовался {FFFFFF}%[%d+%p%d+%p%d+%p%d+%]") then
			local var_186_24, var_186_25, var_186_26 = arg_186_1:match("%[A%] \xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 (.+)%[(%d+)%] | \xF3\xF0: (%d+) \xF3\xF1\xEF\xE5\xF8\xED\xEE \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xEB\xF1\xFF {FFFFFF}%[%d+%p%d+%p%d+%p%d+%]")

			sampAddChatMessage("[A] \xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_186_24 .. " [" .. var_186_25 .. "] | \xF3\xF0: " .. var_186_26 .. " \xF3\xF1\xEF\xE5\xF8\xED\xEE \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xEB\xF1\xFF.", 8421504)

			return false
		end

		if arg_186_1:find("%[A%] \xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 .+%[%d+%] | \xF3\xF0: %d+ \xED\xE5\xF3\xE4\xE0\xF7\xED\xEE \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xEB\xF1\xFF %[%d+%p%d+%p%d+%p%d+%]") then
			local var_186_27, var_186_28, var_186_29 = arg_186_1:match("%[A%] \xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 (.+)%[(%d+)%] | \xF3\xF0: (%d+) \xED\xE5\xF3\xE4\xE0\xF7\xED\xEE \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xEB\xF1\xFF %[%d+%p%d+%p%d+%p%d+%]")

			sampAddChatMessage("[A] \xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_186_27 .. " [" .. var_186_28 .. "] | \xF3\xF0: " .. var_186_29 .. " \xED\xE5\xF3\xE4\xE0\xF7\xED\xEE \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xEB\xF1\xFF.", 16717334)

			return false
		end
	end

	lua_thread.create(function()
		wait(0)

		if arg_186_1:find("%[Жалоба%] .+%[%d+%]: {FFFFFF}id %d+ .+") then
			local var_187_0, var_187_1, var_187_2, var_187_3 = arg_186_1:match("%[Жалоба%] (.+)%[(%d+)%]: {FFFFFF}id (%d+) (.+)")

			if var_187_1:match("(%d+)") then
				var_0_76 = var_187_1
			end

			if var_187_2:match("(%d+)") then
				var_0_77 = var_187_2:match("(%d+)")

				if var_0_92.v == true then
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Чтобы отправиться в слежку за {b31515}" .. var_0_77 .. " {d5dedd}id нажмите ALT + R", 106729)
				end
			end

			if sampIsPlayerConnected(var_187_2) then
				table.insert(var_0_40.playername, 1, var_187_0)
				table.insert(var_0_40.playerid, 1, var_187_1)
				table.insert(var_0_40.suspectname, 1, sampGetPlayerNickname(var_187_2))
				table.insert(var_0_40.suspectid, 1, var_187_2)
				table.insert(var_0_40.reason, 1, var_187_3)
				table.insert(var_0_40.timer, 1, os.clock())
				table.insert(var_0_40.complete, 1, "false")
			end
		end
	end)

	if checks.frcomplete.v then
		if var_0_76 ~= nil then
			for iter_186_0 = 1, #var_0_40.playerid do
				if arg_186_1:find("Администратор .+%[%d+%] для " .. var_0_40.playername[iter_186_0] .. "%[" .. var_0_40.playerid[iter_186_0] .. "%]") then
					var_0_40.complete[iter_186_0] = "true"
				end
			end
		end
	elseif var_0_76 ~= nil then
		for iter_186_1 = 1, #var_0_40.playerid do
			if arg_186_1:find("Администратор " .. nick .. "%[%d+%] для " .. var_0_40.playername[iter_186_1] .. "%[" .. var_0_40.playerid[iter_186_1] .. "%]") then
				var_0_40.complete[iter_186_1] = "true"
			end
		end
	end

	lua_thread.create(function()
		wait(0)

		if arg_186_1:find("%[Жалоба%] .+%[%d+%]: {FFFFFF}%d+ .+") then
			nicktut, var_0_76, arg_186_1, forsupport = arg_186_1:match("%[Жалоба%] (.+)%[(%d+)%]: {FFFFFF}(%d+) (.+)")

			if arg_186_1:match("(%d+)") then
				var_0_77 = arg_186_1:match("(%d+)")

				if var_0_92.v == true then
					sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Чтобы отправиться в слежку за {b31515}" .. var_0_77 .. " {d5dedd}id нажмите ALT + R", 106729)
				end
			end

			if sampIsPlayerConnected(arg_186_1) then
				table.insert(var_0_40.playername, 1, nicktut)
				table.insert(var_0_40.playerid, 1, var_0_76)
				table.insert(var_0_40.suspectname, 1, sampGetPlayerNickname(arg_186_1))
				table.insert(var_0_40.suspectid, 1, arg_186_1)
				table.insert(var_0_40.reason, 1, forsupport)
				table.insert(var_0_40.timer, 1, os.clock())
				table.insert(var_0_40.complete, 1, "false")
			end
		end
	end)

	if arg_186_1:find("%[Жалоба%] .+%[%d+%]") then
		fasttt = 1

		if fasttt == 1 then
			fastpm = arg_186_1:match("(%d+)")
			fasttt = 0
		end
	end

	if arg_186_1:find("{999999}%[A%] Никнейм: .- | IP: %d+%p%d+%p%d+%p%d+") then
		if acc == 2 then
			ipacc = arg_186_1:match("{999999}%[A%] Никнейм: .- | IP: (%d+%p%d+%p%d+%p%d+)")

			return false
		end

		if acheckips == true then
			acheckip = arg_186_1:match("{999999}%[A%] Никнейм: .- | IP: (%d+%p%d+%p%d+%p%d+)")

			return false
		end
	end

	if arg_186_1:find("* {999999}Данный аккаунт не найден в базе данных.") and openip == 1 then
		var_0_75 = true

		sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Аккаунт с таким ником не найден в базе данных.", -1)

		return false
	end

	if searchaccounts == true and arg_186_1:find(".+ %(LVL:%d+%) %p .+ {FFFFFF}| %d+-%d+-%d+ %d+:%d+:%d+") then
		local var_186_30, var_186_31, var_186_32, var_186_33, var_186_34 = arg_186_1:match("(.+) %(LVL:(%d+)%) %p (.+) {FFFFFF}| (%d+-%d+-%d+) (%d+:%d+:%d+)")

		table.insert(ipsaccounts.nick, var_186_30)
		table.insert(ipsaccounts.lvl, var_186_31)
		table.insert(ipsaccounts.status, var_186_32)
		table.insert(ipsaccounts.date, var_186_33)
		table.insert(ipsaccounts.time, var_186_34)

		return false
	end

	if var_0_94.v == true then
		if arg_186_1:find("Администратор " .. nick .. " забанил игрок") then
			ipcheckban = 1

			lua_thread.create(function()
				wait(3000)

				ipcheckban = nil
			end)
		end

		if ipcheckban == 1 and arg_186_1:find("%[A%] .+ IP: %d+%p%d+%p%d+%p%d+") then
			ipaccs = arg_186_1:match("%[A%] .+ IP: (%d+%p%d+%p%d+%p%d+)")

			sampSetChatInputEnabled(true)
			sampSetChatInputText("/ipaccounts " .. ipaccs .. " 1 ")

			ipcheckban = nil
		end

		if arg_186_1:find("Администратор " .. nick .. " забанил игрока") then
			ipcheckban2 = 1

			lua_thread.create(function()
				wait(3000)

				ipcheckban2 = nil
			end)
		end

		if ipcheckban2 == 1 and arg_186_1:find("%[A%] .+ IP: %d+%p%d+%p%d+%p%d+") then
			ipaccs = arg_186_1:match("%[A%] .+ IP: (%d+%p%d+%p%d+%p%d+)")

			sampSetChatInputEnabled(true)
			sampSetChatInputText("/ipaccounts " .. ipaccs .. " 1 ")

			ipcheckban2 = nil
		end
	end

	if reconppv ~= nil then
		if arg_186_1:find(".+%[%d+%]") then
			reconid = arg_186_1:match(".+%[(%d+)%]")
			reconppv = nil
		end

		return false
	end

	if arg_186_1:find("%[A%] .+%[%d+%]: /appv %d+") then
		idappv = arg_186_1:match("%[A%] .+%[%d+%]: /appv (%d+)")
		timerok = os.clock()
		autogive = 1
		waitappv = 1

		if tostring(idappv):find("%a+") then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Чтобы отправить информацию об IP адресах пользователя {06b600}" .. idappv .. " {d5dedd}нажмите F2", -1)
		elseif sampIsPlayerConnected(idappv) then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Чтобы отправить информацию об IP адресах пользователя {06b600}" .. sampGetPlayerNickname(idappv) .. " {d5dedd}нажмите F2", -1)
		end

		lua_thread.create(function()
			wait(9000)

			idappv = nil
		end)
	end

	if idappv == nil and arg_186_1:find("%[A%] .+%[%d+%]: /appv") then
		lua_thread.create(function()
			wait(0)

			local var_200_0 = arg_186_1:match("%[A%] (.+)%[%d+%]: /appv")

			sampSendChat("/a " .. var_200_0 .. ", напиши /appv [id/nick]")
		end)
	end

	if arg_186_1:find("%[A%] .+%[%d+%]: Информация об IP адресах:") then
		waitappv = nil
	end

	if arg_186_1:find("%[A%] .+%[%d+%]: IP1:") then
		waitappv = nil
	end

	if arg_186_1:find("%[A%] .+%[%d+%]: IP2:") then
		waitappv = nil
	end

	if arg_186_1:find("%[A%] .+%[%d+%]: Расстояние между городами:") then
		waitappv = nil
	end

	if checks.autoplus_check.v == true then
		for iter_186_2 = 1, #var_0_29.cmd do
			if not isPauseMenuActive() and arg_186_1:find("%[A%] .+%[%d+%]: /" .. var_0_29.cmd[iter_186_2]) then
				ActCommand = var_0_29.cmd[iter_186_2]

				if var_0_29.cmd[iter_186_2]:find("offmute") or var_0_29.cmd[iter_186_2]:find("offjail") or var_0_29.cmd[iter_186_2]:find("offwarn") or var_0_29.cmd[iter_186_2]:find("offban") or var_0_29.cmd[iter_186_2]:find("offunmute") or var_0_29.cmd[iter_186_2]:find("offunjail") or var_0_29.cmd[iter_186_2]:find("offunwarn") or var_0_29.cmd[iter_186_2]:find("unban") then
					StringValue = true
				else
					StringValue = false
				end

				if var_0_29.cmd[iter_186_2]:find("unjail") or var_0_29.cmd[iter_186_2]:find("unmute") or var_0_29.cmd[iter_186_2]:find("runmute") or var_0_29.cmd[iter_186_2]:find("spcar") or var_0_29.cmd[iter_186_2]:find("help") or var_0_29.cmd[iter_186_2]:find("offunmute") or var_0_29.cmd[iter_186_2]:find("offunjail") or var_0_29.cmd[iter_186_2]:find("offunwarn") or var_0_29.cmd[iter_186_2]:find("unban") or var_0_29.cmd[iter_186_2]:find("skick") or var_0_29.cmd[iter_186_2]:find("spawn") or var_0_29.cmd[iter_186_2]:find("slap") or var_0_29.cmd[iter_186_2]:find("uncuff") then
					ParamCount = 1
				end

				if var_0_29.cmd[iter_186_2]:find("kick") or var_0_29.cmd[iter_186_2]:find("warn") or var_0_29.cmd[iter_186_2]:find("unwarn") or var_0_29.cmd[iter_186_2]:find("arm") or var_0_29.cmd[iter_186_2]:find("setfuel") or var_0_29.cmd[iter_186_2]:find("offwarn") or var_0_29.cmd[iter_186_2]:find("setskin") then
					ParamCount = 2
				end

				if not var_0_29.cmd[iter_186_2]:find("ban") and not var_0_29.cmd[iter_186_2]:find("offban") and (var_0_29.cmd[iter_186_2]:find("sban") or var_0_29.cmd[iter_186_2]:find("mute") or var_0_29.cmd[iter_186_2]:find("offmute") or var_0_29.cmd[iter_186_2]:find("jail") or var_0_29.cmd[iter_186_2]:find("offjail") or var_0_29.cmd[iter_186_2]:find("rmute")) then
					ParamCount = 3
				end

				if ParamCount == 1 then
					if StringValue == false then
						ActAdmNick, ActAdmID, ActParam1 = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /" .. var_0_29.cmd[iter_186_2] .. " (%d+)")

						if ActAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil then
							if not var_0_29.cmd[iter_186_2]:find("spcar") then
								if sampIsPlayerConnected(ActParam1) then
									ActsAdmNick = ActAdmNick:gsub("(%u+)%l+_(%w+)", "%1.%2")
									ActParam2, ActParam3 = nil
									timerok = os.clock()
									autogive = 1

									sampAddChatMessage("{51fffa}[AdminHelper] {55B7CE}" .. ActAdmNick .. "[" .. ActAdmID .. "] просит {E7472E}< /" .. var_0_29.cmd[iter_186_2] .. " " .. ActParam1 .. " > {55B7CE}для " .. sampGetPlayerNickname(ActParam1) .. "[" .. ActParam1 .. "] | F2", -1)
								end
							else
								ActsAdmNick = ActAdmNick:gsub("(%u+)%l+_(%w+)", "%1.%2")
								ActParam2, ActParam3 = nil
								timerok = os.clock()
								autogive = 1

								sampAddChatMessage("{51fffa}[AdminHelper] {55B7CE}" .. ActAdmNick .. "[" .. ActAdmID .. "] просит {E7472E}< /" .. var_0_29.cmd[iter_186_2] .. " " .. ActParam1 .. " > {55B7CE} | F2", -1)
							end
						end
					else
						ActAdmNick, ActAdmID, ActParam1 = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /" .. var_0_29.cmd[iter_186_2] .. " (.+)")

						if ActAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil then
							ActsAdmNick = ActAdmNick:gsub("(%u+)%l+_(%w+)", "%1.%2")
							ActParam2, ActParam3 = nil
							timerok = os.clock()
							autogive = 1

							sampAddChatMessage("{51fffa}[AdminHelper] {55B7CE}" .. ActAdmNick .. "[" .. ActAdmID .. "] просит {E7472E}< /" .. var_0_29.cmd[iter_186_2] .. " " .. ActParam1 .. " > {55B7CE}для " .. ActParam1 .. " | F2", -1)
						end
					end
				end

				if ParamCount == 2 then
					if StringValue == false then
						if ActCommand:find("setskin") then
							ActAdmNick, ActAdmID, ActParam1, ActParam2 = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /" .. var_0_29.cmd[iter_186_2] .. " (%d+) (%d+)")
						else
							ActAdmNick, ActAdmID, ActParam1, ActParam2 = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /" .. var_0_29.cmd[iter_186_2] .. " (%d+) (.+)")
						end

						if ActAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil and ActParam2 ~= nil and sampIsPlayerConnected(ActParam1) then
							ActsAdmNick = ActAdmNick:gsub("(%u+)%l+_(%w+)", "%1.%2")
							ActParam3 = nil
							timerok = os.clock()
							autogive = 1

							sampAddChatMessage("{51fffa}[AdminHelper] {55B7CE}" .. ActAdmNick .. "[" .. ActAdmID .. "] просит {E7472E}< /" .. var_0_29.cmd[iter_186_2] .. " " .. ActParam1 .. " " .. ActParam2 .. " > {55B7CE}для " .. sampGetPlayerNickname(ActParam1) .. "[" .. ActParam1 .. "] | F2", -1)
						end
					else
						ActAdmNick, ActAdmID, ActParam1, ActParam2 = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /" .. var_0_29.cmd[iter_186_2] .. " (.+) (.+)")

						if ActAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil and ActParam2 ~= nil then
							ActsAdmNick = ActAdmNick:gsub("(%u+)%l+_(%w+)", "%1.%2")
							ActParam3 = nil
							timerok = os.clock()
							autogive = 1

							sampAddChatMessage("{51fffa}[AdminHelper] {55B7CE}" .. ActAdmNick .. "[" .. ActAdmID .. "] просит {E7472E}< /" .. var_0_29.cmd[iter_186_2] .. " " .. ActParam1 .. " " .. ActParam2 .. " > {55B7CE}для " .. ActParam1 .. " | F2", -1)
						end
					end
				end

				if ParamCount == 3 then
					if StringValue == false then
						ActAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /" .. var_0_29.cmd[iter_186_2] .. " (%d+) (%d+) (.+)")

						if ActAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil and ActParam2 ~= nil and ActParam3 ~= nil and sampIsPlayerConnected(ActParam1) then
							ActsAdmNick = ActAdmNick:gsub("(%u+)%l+_(%w+)", "%1.%2")
							timerok = os.clock()
							autogive = 1

							sampAddChatMessage("{51fffa}[AdminHelper] {55B7CE}" .. ActAdmNick .. "[" .. ActAdmID .. "] просит {E7472E}< /" .. var_0_29.cmd[iter_186_2] .. " " .. ActParam1 .. " " .. ActParam2 .. " " .. ActParam3 .. " > {55B7CE}для " .. sampGetPlayerNickname(ActParam1) .. "[" .. ActParam1 .. "] | F2", -1)
						end
					else
						ActAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /" .. var_0_29.cmd[iter_186_2] .. " (.+) (%d+) (.+)")

						if ActAdmNick ~= nil and ActAdmID ~= nil and ActParam1 ~= nil and ActParam2 ~= nil and ActParam3 ~= nil then
							ActsAdmNick = ActAdmNick:gsub("(%u+)%l+_(%w+)", "%1.%2")
							timerok = os.clock()
							autogive = 1

							sampAddChatMessage("{51fffa}[AdminHelper] {55B7CE}" .. ActAdmNick .. "[" .. ActAdmID .. "] просит {E7472E}< /" .. var_0_29.cmd[iter_186_2] .. " " .. ActParam1 .. " " .. ActParam2 .. " " .. ActParam3 .. " > {55B7CE}для " .. ActParam1 .. " | F2", -1)
						end
					end
				end

				lua_thread.create(function()
					wait(9000)

					ActAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
				end)

				if ParamCount == 1 and ActParam1 == nil and arg_186_1:find("%[A%] .+%[%d+%]: /" .. var_0_29.cmd[iter_186_2]) then
					lua_thread.create(function()
						wait(0)

						local var_202_0 = arg_186_1:match("%[A%] (.+)%[%d+%]: /" .. var_0_29.cmd[iter_186_2])

						if not arg_186_1:find("%[A%] .+%[%d+%]: " .. var_202_0 .. ", напиши /" .. var_0_29.cmd[iter_186_2]) then
							sampSendChat("/a " .. var_202_0 .. ", напиши " .. var_0_29.help[iter_186_2])

							ActAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
							autogive = 0
						end
					end)
				end

				if ParamCount == 2 and (ActParam1 == nil or ActParam2 == nil) and arg_186_1:find("%[A%] .+%[%d+%]: /" .. var_0_29.cmd[iter_186_2]) then
					lua_thread.create(function()
						wait(0)

						local var_203_0 = arg_186_1:match("%[A%] (.+)%[%d+%]: /" .. var_0_29.cmd[iter_186_2])

						if not arg_186_1:find("%[A%] .+%[%d+%]: " .. var_203_0 .. ", напиши /" .. var_0_29.cmd[iter_186_2]) then
							sampSendChat("/a " .. var_203_0 .. ", напиши " .. var_0_29.help[iter_186_2])

							ActAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
							autogive = 0
						end
					end)
				end

				if ParamCount == 3 and (ActParam1 == nil or ActParam2 == nil or ActParam3 == nil) and arg_186_1:find("%[A%] .+%[%d+%]: /" .. var_0_29.cmd[iter_186_2]) then
					lua_thread.create(function()
						wait(0)

						local var_204_0 = arg_186_1:match("%[A%] (.+)%[%d+%]: /" .. var_0_29.cmd[iter_186_2])

						if not arg_186_1:find("%[A%] .+%[%d+%]: " .. var_204_0 .. ", напиши /" .. var_0_29.cmd[iter_186_2]) then
							sampSendChat("/a " .. var_204_0 .. ", напиши " .. var_0_29.help[iter_186_2])

							ActAdmNick, ActAdmID, ActParam1, ActParam2, ActParam3 = nil
							autogive = 0
						end
					end)
				end
			end
		end

		if arg_186_1:find("%[A%] .+%[%d+%]: /msg .+") then
			timerok = os.clock()
			autogive = 1
			nickido, ido, texto = arg_186_1:match("%[A%] (.+)%[(%d+)%]: /msg (.+)")
			waito = true

			if sampIsPlayerConnected(ido) then
				local var_186_40 = sampGetPlayerNickname(ido)

				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Чтобы отправить сообщение в /msg от {06b600}" .. var_186_40 .. " {d5dedd}нажмите F2", -1)
			end

			lua_thread.create(function()
				wait(9000)

				nickido, ido, texto = nil
				waito = nil
			end)
		end

		if texto ~= nil and arg_186_1:find("\xAB .+%[%d+%]: " .. texto) then
			waito = nil
		end

		if arg_186_1:find("%[A%] .+%[%d+%]: /mpgun %d+") then
			timerok = os.clock()
			autogive = 1
			idmpgun = arg_186_1:match("%[A%] .+%[%d+%]: /mpgun (%d+)")

			if sampIsPlayerConnected(idmpgun) then
				local var_186_42 = sampGetPlayerNickname(idmpgun)

				sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Чтобы выдать пакет оружия игроку {06b600}" .. var_186_42 .. " {d5dedd}нажмите F2", -1)
			end
		end

		if idmpgun == nil and arg_186_1:find("%[A%] .+%[%d+%]: /mpgun") then
			lua_thread.create(function()
				wait(0)

				local var_208_0 = arg_186_1:match("%[A%] (.+)%[%d+%]: /mpgun")

				sampSendChat("/a " .. var_208_0 .. ", напиши /mpgun [id]")
			end)
		end
	end

	if arg_186_1:find("Заявление на смену nonRP никнейма от .+%[%d+%]. Желаемый никнейм: .+") then
		local var_186_43, var_186_44, var_186_45 = arg_186_1:match("Заявление на смену nonRP никнейма от (.+)%[(%d+)%]. Желаемый никнейм: (.+)")

		table.insert(var_0_39.name, var_186_43)
		table.insert(var_0_39.id, var_186_44)
		table.insert(var_0_39.newname, var_186_45)
		table.insert(var_0_39.timer, os.clock())

		if not var_186_43:find("(%u+)(%l+)_(%u+)(%l+)") and var_186_45:find("(%u+)(%l+)_(%u+)(%l+)") then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Заявление на смену ника: с {46BD1D}" .. var_186_43 .. "[" .. var_186_44 .. "]{d5dedd} на {46BD1D}" .. var_186_45, -1)
		end

		if var_186_43:find("(%u+)(%l+)_(%u+)(%l+)") and var_186_45:find("(%u+)(%l+)_(%u+)(%l+)") then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Заявление на смену ника: с {C71116}" .. var_186_43 .. "[" .. var_186_44 .. "]{d5dedd} на {46BD1D}" .. var_186_45, -1)
		end

		if var_186_43:find("(%u+)(%l+)_(%u+)(%l+)") and not var_186_45:find("(%u+)(%l+)_(%u+)(%l+)") then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Заявление на смену ника: с {C71116}" .. var_186_43 .. "[" .. var_186_44 .. "]{d5dedd} на {C71116}" .. var_186_45, -1)
		end

		if not var_186_43:find("(%u+)(%l+)_(%u+)(%l+)") and not var_186_45:find("(%u+)(%l+)_(%u+)(%l+)") then
			sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Заявление на смену ника: с {46BD1D}" .. var_186_43 .. "[" .. var_186_44 .. "]{d5dedd} на {C71116}" .. var_186_45, -1)
		end

		return false
	end

	if autotpcar and arg_186_1:find("%[A%] .+ телепортировался к автомобилю") then
		return false
	end

	if ppvid == true or acheckid == true then
		if arg_186_1:find("Игроки онлайн:") then
			return false
		end

		if ppvaccnick ~= nil and arg_186_1:find(ppvaccnick .. "%[%d+%]") then
			ppvaccid = arg_186_1:match("(%d+)")
			ppvid = false
			ppvaccnick = nil

			return false
		end

		if acheckaccnick ~= nil and arg_186_1:find(acheckaccnick .. "%[%d+%]") then
			acheckaccid = arg_186_1:match("(%d+)")
			acheckid = false

			return false
		end
	end

	if arg_186_1:find("ahlove %(Anthony_Ward%)") then
		lua_thread.create(function()
			wait(1000)
			sampSendChat("I love Ward <3")
		end)
	end

	if arg_186_1:find("ahver %(Anthony_Ward%)") then
		lua_thread.create(function()
			wait(1000)

			if not arg_186_1:find(nick) then
				sampSendChat("[AdminHelper] Версия скрипта: " .. thisScript().version)
			end
		end)
	end

	if arg_186_1:find("ahlove %(Anthony_Ward%)") then
		return false
	end

	if arg_186_1:find("I love Ward <3") then
		return false
	end
end

function var_0_0.onSendClientJoin()
	lua_thread.create(loadUsers)
end

function var_0_0.onPlayerJoin(arg_217_0, arg_217_1, arg_217_2, arg_217_3)
	lua_thread.create(addUser, arg_217_0, arg_217_3)

	if checks.scoreboard.v then
		table.insert(var_0_35.time, 1, "{55C24A}" .. os.date("%H:%M:%S"))
		table.insert(var_0_35.nick, 1, "{55C24A}" .. arg_217_3 .. "[" .. arg_217_0 .. "]")
		table.insert(var_0_35.reason, 1, u8("{55C24A}подключился"))
	end
end

function var_0_0.onPlayerQuit(arg_218_0, arg_218_1)
	lua_thread.create(removeUser, arg_218_0)

	if checks.scoreboard.v then
		if tonumber(arg_218_1) == 0 then
			table.insert(var_0_35.time, 1, "{C24A4A}" .. os.date("%H:%M:%S"))
			table.insert(var_0_35.nick, 1, "{C24A4A}" .. sampGetPlayerNickname(arg_218_0) .. "[" .. arg_218_0 .. "]")
			table.insert(var_0_35.reason, 1, u8("{C24A4A}(Выход/Тайм-аут)"))
		elseif tonumber(arg_218_1) == 1 then
			table.insert(var_0_35.time, 1, "{C24A4A}" .. os.date("%H:%M:%S"))
			table.insert(var_0_35.nick, 1, "{C24A4A}" .. sampGetPlayerNickname(arg_218_0) .. "[" .. arg_218_0 .. "]")
			table.insert(var_0_35.reason, 1, u8("{C24A4A}(Выход [PC])"))
		elseif tonumber(arg_218_1) == 2 then
			table.insert(var_0_35.time, 1, "{C24A4A}" .. os.date("%H:%M:%S"))
			table.insert(var_0_35.nick, 1, "{C24A4A}" .. sampGetPlayerNickname(arg_218_0) .. "[" .. arg_218_0 .. "]")
			table.insert(var_0_35.reason, 1, u8("{C24A4A}(Кик/Бан)"))
		elseif tonumber(arg_218_1) == 3 then
			table.insert(var_0_35.time, 1, "{C24A4A}" .. os.date("%H:%M:%S"))
			table.insert(var_0_35.nick, 1, "{C24A4A}" .. sampGetPlayerNickname(arg_218_0) .. "[" .. arg_218_0 .. "]")
			table.insert(var_0_35.reason, 1, u8("{C24A4A}(Краш)"))
		end
	end
end

function var_0_0.onSendCommand(arg_219_0)
	if arg_219_0:find("/re %d+") then
		spectate_id = arg_219_0:match("/re (%d+)")
	end

	if arg_219_0:find("/sp %d+") then
		spectate_id = arg_219_0:match("/sp (%d+)")
	end

end

function async_http_request(arg_220_0, arg_220_1, arg_220_2, arg_220_3, arg_220_4)
	local var_220_0 = lanes.gen("*", {
		package = {
			path = package.path,
			cpath = package.cpath
		}
	}, function()
		local var_221_0 = require("requests")
		local var_221_1, var_221_2 = pcall(var_221_0.request, arg_220_0, arg_220_1, arg_220_2)

		if var_221_1 then
			var_221_2.json, var_221_2.xml = nil

			return true, var_221_2
		else
			return false, var_221_2
		end
	end)

	arg_220_4 = arg_220_4 or function()
		return
	end

	local var_220_1 = var_220_0()

	while true do
		local var_220_2 = var_220_1.status

		if var_220_2 == "done" then
			local var_220_3 = var_220_1[1]
			local var_220_4 = var_220_1[2]

			if var_220_3 then
				arg_220_3(var_220_4)
			else
				arg_220_4(var_220_4)
			end

			return
		elseif var_220_2 == "error" then
			return arg_220_4(var_220_1[1])
		elseif var_220_2 == "killed" or var_220_2 == "cancelled" then
			return arg_220_4(var_220_2)
		end

		wait(0)
	end
end

function var_0_0.onSendPlayerSync(arg_223_0)
	if var_0_27 then
		local var_223_0 = samp_create_sync_data("spectator")

		var_223_0.position = arg_223_0.position
		var_223_0.keysData = arg_223_0.keysData

		var_223_0.send()

		return false
	end

	if configIni.config.antistun and arg_223_0.animationId == 1084 then
		arg_223_0.animationFlags = 32772
		arg_223_0.animationId = 1189
	end

	if bit.band(arg_223_0.keysData, 40) == 40 then
		arg_223_0.keysData = bit.bxor(arg_223_0.keysData, 32)
	end
end

function samp_create_sync_data(arg_224_0, arg_224_1)
	local var_224_0 = require("ffi")
	local var_224_1 = require("sampfuncs")
	local var_224_2 = require("samp.raknet")

	arg_224_1 = arg_224_1 or true

	local var_224_3 = ({
		player = {
			"PlayerSyncData",
			var_224_2.PACKET.PLAYER_SYNC,
			sampStorePlayerOnfootData
		},
		vehicle = {
			"VehicleSyncData",
			var_224_2.PACKET.VEHICLE_SYNC,
			sampStorePlayerIncarData
		},
		passenger = {
			"PassengerSyncData",
			var_224_2.PACKET.PASSENGER_SYNC,
			sampStorePlayerPassengerData
		},
		aim = {
			"AimSyncData",
			var_224_2.PACKET.AIM_SYNC,
			sampStorePlayerAimData
		},
		trailer = {
			"TrailerSyncData",
			var_224_2.PACKET.TRAILER_SYNC,
			sampStorePlayerTrailerData
		},
		unoccupied = {
			"UnoccupiedSyncData",
			var_224_2.PACKET.UNOCCUPIED_SYNC
		},
		bullet = {
			"BulletSyncData",
			var_224_2.PACKET.BULLET_SYNC
		},
		spectator = {
			"SpectatorSyncData",
			var_224_2.PACKET.SPECTATOR_SYNC
		}
	})[arg_224_0]
	local var_224_4 = "struct " .. var_224_3[1]
	local var_224_5 = var_224_0.new(var_224_4, {})
	local var_224_6 = tonumber(var_224_0.cast("uintptr_t", var_224_0.new(var_224_4 .. "*", var_224_5)))

	if arg_224_1 then
		local var_224_7 = var_224_3[3]

		if var_224_7 then
			local var_224_8
			local var_224_9

			if arg_224_1 == true then
				local var_224_10

				var_224_10, var_224_9 = sampGetPlayerIdByCharHandle(PLAYER_PED)
			else
				var_224_9 = tonumber(arg_224_1)
			end

			var_224_7(var_224_9, var_224_6)
		end
	end

	local function var_224_11()
		local var_225_0 = raknetNewBitStream()

		raknetBitStreamWriteInt8(var_225_0, var_224_3[2])
		raknetBitStreamWriteBuffer(var_225_0, var_224_6, var_224_0.sizeof(var_224_5))
		raknetSendBitStreamEx(var_225_0, var_224_1.HIGH_PRIORITY, var_224_1.UNRELIABLE_SEQUENCED, 1)
		raknetDeleteBitStream(var_225_0)
	end

	local var_224_12 = {
		__index = function(arg_226_0, arg_226_1)
			return var_224_5[arg_226_1]
		end,
		__newindex = function(arg_227_0, arg_227_1, arg_227_2)
			var_224_5[arg_227_1] = arg_227_2
		end
	}

	return setmetatable({
		send = var_224_11
	}, var_224_12)
end

function asyncHttpRequest(arg_228_0, arg_228_1, arg_228_2, arg_228_3, arg_228_4)
	local var_228_0 = var_0_10.thread(function(arg_229_0, arg_229_1, arg_229_2)
		local var_229_0 = require("requests")
		local var_229_1, var_229_2 = pcall(var_229_0.request, arg_229_0, arg_229_1, arg_229_2)

		if var_229_1 then
			var_229_2.json, var_229_2.xml = nil

			return true, var_229_2
		else
			return false, var_229_2
		end
	end)(arg_228_0, arg_228_1, arg_228_2)

	arg_228_3 = arg_228_3 or function()
		return
	end
	arg_228_4 = arg_228_4 or function()
		return
	end

	local var_228_1 = var_228_0

	while true do
		local var_228_2, var_228_3 = var_228_1:status()

		if not var_228_3 then
			if var_228_2 == "completed" then
				local var_228_4, var_228_5 = var_228_1:get()

				if var_228_4 then
					arg_228_3(var_228_5)
				else
					arg_228_4(var_228_5)
				end

				return
			elseif var_228_2 == "canceled" then
				return arg_228_4(var_228_2)
			end
		else
			return arg_228_4(var_228_3)
		end

		wait(0)
	end
end

function distance_cord(arg_232_0, arg_232_1, arg_232_2, arg_232_3)
	if arg_232_0 == nil or arg_232_1 == nil or arg_232_2 == nil or arg_232_3 == nil or arg_232_0 == "" or arg_232_1 == "" or arg_232_2 == "" or arg_232_3 == "" then
		return 0
	end

	local var_232_0 = math.rad(arg_232_2 - arg_232_0)
	local var_232_1 = math.rad(arg_232_3 - arg_232_1)
	local var_232_2 = math.sin(var_232_0 / 2)
	local var_232_3 = math.sin(var_232_1 / 2)
	local var_232_4 = var_232_2 * var_232_2 + math.cos(math.rad(arg_232_0)) * math.cos(math.rad(arg_232_2)) * var_232_3 * var_232_3

	return 6378 * (2 * math.atan2(math.sqrt(var_232_4), math.sqrt(1 - var_232_4)))
end

function getAsync()
	ips = {
		ipreg,
		iplast
	}
	ipreg, iplast = nil
	data_json = var_0_9.encode(ips)

	asyncHttpRequest("POST", "http://ip-api.com/batch?fields=25305&lang=ru", {
		data = data_json
	}, function(arg_234_0)
		rdata = var_0_9.decode(u8:decode(arg_234_0.text))

		for iter_234_0 = 1, #rdata do
			if rdata[iter_234_0].status == "success" then
				distances = distance_cord(rdata[1].lat, rdata[1].lon, rdata[iter_234_0].lat, rdata[iter_234_0].lon)
				quer = {
					v1 = rdata[1].query,
					v2 = rdata[iter_234_0].query,
					v3 = rdata[1].country,
					v4 = rdata[iter_234_0].country,
					v5 = rdata[1].city,
					v6 = rdata[iter_234_0].city,
					v7 = rdata[1].isp,
					v8 = rdata[iter_234_0].isp
				}
			end
		end

		print(quer.v7 .. "\n" .. quer.v8)

		for iter_234_1 = 1, #var_0_31.before do
			if quer.v7:find(var_0_31.before[iter_234_1]) then
				quer.v7 = var_0_31.after[iter_234_1]
			end

			if quer.v8:find(var_0_31.before[iter_234_1]) then
				quer.v8 = var_0_31.after[iter_234_1]
			end
		end

		if var_0_75 == true then
			var_0_75 = false
		else
			if tostring(var1):find("%d+") then
				ppvnick = sampGetPlayerNickname(var1)
			else
				ppvnick = var1
			end

			var_0_82.ipaccounts.v = false
			var_0_82.offstats.v = false
			var_0_82.connections.v = false
			var_0_82.ppv.v = true
			var_0_3.Process = true
			ips = {}
		end
	end, function(arg_235_0)
		sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Произошла ошибка.")
	end)
end

function getAsync2()
	ips = {
		ipreg,
		iplast
	}
	ipreg, iplast = nil
	data_json = var_0_9.encode(ips)

	asyncHttpRequest("POST", "http://ip-api.com/batch?fields=25305&lang=ru", {
		data = data_json
	}, function(arg_237_0)
		rdata = var_0_9.decode(u8:decode(arg_237_0.text))

		for iter_237_0 = 1, #rdata do
			if rdata[iter_237_0].status == "success" then
				distances = distance_cord(rdata[1].lat, rdata[1].lon, rdata[iter_237_0].lat, rdata[iter_237_0].lon)
				quer = {
					v1 = rdata[1].query,
					v2 = rdata[iter_237_0].query,
					v3 = rdata[1].country,
					v4 = rdata[iter_237_0].country,
					v5 = rdata[1].city,
					v6 = rdata[iter_237_0].city,
					v7 = rdata[1].isp,
					v8 = rdata[iter_237_0].isp
				}
			end
		end

		for iter_237_1 = 1, #var_0_31.before do
			if quer.v7:find(var_0_31.before[iter_237_1]) then
				quer.v7 = var_0_31.after[iter_237_1]
			end

			if quer.v8:find(var_0_31.before[iter_237_1]) then
				quer.v8 = var_0_31.after[iter_237_1]
			end
		end

		if var_0_75 == true then
			var_0_75 = false
		else
			if var1:find("%d+") then
				ppvnick = sampGetPlayerNickname(var1)
			else
				ppvnick = var1
			end

			ips = {}
		end
	end, function(arg_238_0)
		sampAddChatMessage("{51fffa}[AdminHelper] {FFFFFF}Произошла ошибка.")
	end)
end

function var_0_0.onTogglePlayerSpectating(arg_239_0)
	if arg_239_0 then
		var_0_28 = true
	else
		var_0_28 = false
		var_0_82.spectatemenu.v = false
	end
end

function threadHandle(arg_240_0, arg_240_1, arg_240_2, arg_240_3, arg_240_4)
	local var_240_0 = arg_240_0(arg_240_1, arg_240_2)
	local var_240_1 = var_240_0:get(0)

	while not var_240_1 do
		var_240_1 = var_240_0:get(0)

		wait(0)
	end

	local var_240_2 = var_240_0:status()

	if var_240_2 == "completed" then
		local var_240_3 = var_240_1[1]
		local var_240_4 = var_240_1[2]

		if var_240_3 then
			arg_240_3(var_240_4)
		else
			arg_240_4(var_240_4)
		end
	elseif err then
		arg_240_4(err)
	elseif var_240_2 == "canceled" then
		arg_240_4(var_240_2)
	end

	var_240_0:cancel(0)
end

function requestRunner()
	return var_0_10.thread(function(arg_242_0, arg_242_1)
		local var_242_0 = require("ssl.https")
		local var_242_1, var_242_2 = pcall(var_242_0.request, arg_242_0, arg_242_1)

		if var_242_1 then
			return {
				true,
				var_242_2
			}
		else
			return {
				false,
				var_242_2
			}
		end
	end)
end

function tg_async_http_request(arg_243_0, arg_243_1, arg_243_2, arg_243_3)
	local var_243_0 = requestRunner()

	arg_243_3 = arg_243_3 or function()
		return
	end

	lua_thread.create(function()
		threadHandle(var_243_0, arg_243_0, arg_243_1, arg_243_2, arg_243_3)
	end)
end

function encodeUrl(arg_246_0)
	arg_246_0 = arg_246_0:gsub(" ", "%+")
	arg_246_0 = arg_246_0:gsub("\n", "%%0A")

	return u8:encode(arg_246_0, "CP1251")
end

function sendTelegramNotification(arg_247_0)
	arg_247_0 = arg_247_0:gsub("{......}", "")
	arg_247_0 = encodeUrl(arg_247_0)

	tg_async_http_request("https://api.telegram.org/bot" .. var_0_98 .. "/sendMessage?chat_id=" .. var_0_97 .. "&text=" .. arg_247_0, "", function(arg_248_0)
		return
	end)
end

function get_telegram_updates()
	while not var_0_99 do
		wait(1)
	end

	local var_249_0 = requestRunner()

	local function var_249_1()
		return
	end

	local var_249_2 = ""

	while true do
		url = "https://api.telegram.org/bot" .. var_0_98 .. "/getUpdates?chat_id=" .. var_0_97 .. "&offset=-1"

		threadHandle(var_249_0, url, var_249_2, processing_telegram_messages, var_249_1)
		wait(0)
	end
end

function processing_telegram_messages(arg_251_0)
	if arg_251_0 then
		local var_251_0 = decodeJson(arg_251_0)

		if var_251_0.ok and #var_251_0.result > 0 then
			local var_251_1 = var_251_0.result[1]

			if var_251_1 and var_251_1.update_id ~= var_0_99 then
				var_0_99 = var_251_1.update_id

				local var_251_2 = var_251_1.message.text

				if var_251_2 then
					local var_251_3 = u8:decode(var_251_2) .. " "

					if var_251_3:match("^/Help_" .. nick) or var_251_3:match("^/help_" .. nick) then
						sendTelegramNotification("Список доступных команд:\n\n/online - Список пользователей онлайн\n/" .. nick .. " [сообщение] - Написать личное сообщение\n/o_" .. nick .. " [сообщение] - Написать личное сообщение с подсказкой\n/msg [сообщение] - Отправить сообщение всем\n/omsg [сообщение] - Отправить сообщение всем с подсказкой\n/announce [сообщение] - Отправить всем объявление\n/pmannounce_" .. nick .. " [сообщение] - Отправить объявление пользователю\n/check - Проверить все активные подключения\n/reset - Отключить все активные подключения\n/active_" .. nick .. " - Проверить активные подключения пользователя\n/disable_" .. nick .. " - Отключить активные подключения пользователя\n/get_" .. nick .. " - Информация о пользователе\n/achat_" .. nick .. " - Получение сообщений из админ чата\n/report_" .. nick .. " - Получение сообщений из репорта\n/localchat_" .. nick .. " - Получение сообщений из локального чата\n/allchat_" .. nick .. " - Получение сообщений из всего чата")
					end

					if var_251_3:match("^/Online") or var_251_3:match("^/online") then
						sendTelegramNotification("/" .. nick .. " | (Сервер: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1) .. ")")
					end

					if var_251_3:match("^/say_" .. nick) then
						local var_251_4 = var_251_3:match("/say_" .. nick .. " (.+)")

						if var_251_4 ~= nil then
							sampSendChat(var_251_4)
							sendTelegramNotification("Сообщение от /" .. nick .. " отправлено.")
						else
							sendTelegramNotification("Введите: /say_" .. nick .. " [сообщение]")
						end
					end

					if var_251_3:match("^/ah_say_" .. nick) then
						local var_251_5 = var_251_3:match("/ah_say_" .. nick .. " (.+)")

						if var_251_5 ~= nil then
							sampProcessChatInput(var_251_5)
							sendTelegramNotification("Сообщение от /" .. nick .. " отправлено.")
						else
							sendTelegramNotification("Введите: /ah_say_" .. nick .. " [сообщение]")
						end
					end

					if var_251_3:match("^/msg") then
						local var_251_6 = var_251_3:gsub("/msg ", "", 1)

						if #var_251_6 > 0 then
							sampAddChatMessage("{51fffa}[AH] {d5dedd}Разработчик Anthony Ward: {FFFFFF}" .. var_251_6, 16776960)
						end
					end

					if var_251_3:match("^/omsg") then
						local var_251_7 = var_251_3:gsub("/omsg ", "", 1)

						if #var_251_7 > 0 then
							sampAddChatMessage("{51fffa}[AH] {d5dedd}Разработчик Anthony Ward: {FFFFFF}" .. var_251_7, 16776960)
							sampAddChatMessage("{51fffa}[AH] {d5dedd}Чтобы ответить, напишите: /res [сообщение]", 16776960)
						end
					end

					if var_251_3:match("^/" .. nick) then
						local var_251_8 = var_251_3:match("/" .. nick .. " (.+)")

						if var_251_8 ~= nil then
							sampAddChatMessage("{51fffa}[AH] {d5dedd}Разработчик Anthony Ward: {51fffa}" .. var_251_8, 16776960)
							sendTelegramNotification("Сообщение для /" .. nick .. " доставлено.")
						else
							sendTelegramNotification("Введите: /" .. nick .. " [сообщение]")
						end
					end

					if var_251_3:match("^/o_" .. nick) then
						local var_251_9 = var_251_3:match("/o_" .. nick .. " (.+)")

						if var_251_9 ~= nil then
							sampAddChatMessage("{51fffa}[AH] {d5dedd}Разработчик Anthony Ward: {FFFFFF}" .. var_251_9, 16776960)
							sampAddChatMessage("{51fffa}[AH] {d5dedd}Чтобы ответить, напишите: /res [сообщение]", 16776960)
							sendTelegramNotification("Сообщение для /" .. nick .. " доставлено.")
						else
							sendTelegramNotification("Введите: /o_" .. nick .. " [сообщение]")
						end
					end

					if var_251_3:match("^/announce") then
						local var_251_10 = var_251_3:gsub("/announce ", "", 1)

						if #var_251_10 > 0 then
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}" .. var_251_10, 16776960)
						end
					end

					if var_251_3:match("^/pmannounce_" .. nick) then
						local var_251_11 = var_251_3:match("/pmannounce_" .. nick .. " (.+)")

						if var_251_11 ~= nil then
							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}" .. var_251_11, 16776960)
							sendTelegramNotification("Объявление для /" .. nick .. " доставлено.")
						else
							sendTelegramNotification("Введите: /pmannounce_" .. nick .. " [сообщение]")
						end
					end

					if var_251_3:match("^/stats_" .. nick) then
						sendTelegramNotification("Статистика за неделю:\n\nПонедельник: " .. statsIni.stats.report1 .. "\nВторник: " .. statsIni.stats.report2 .. "\nСреда: " .. statsIni.stats.report3 .. "\nЧетверг: " .. statsIni.stats.report4 .. "\nПятница: " .. statsIni.stats.report5 .. "\nСуббота: " .. statsIni.stats.report6 .. "\nВоскресенье: " .. statsIni.stats.report0 .. "\n\nИтог: " .. tonumber(statsIni.stats.report0) + tonumber(statsIni.stats.report1) + tonumber(statsIni.stats.report2) + tonumber(statsIni.stats.report3) + tonumber(statsIni.stats.report4) + tonumber(statsIni.stats.report5) + tonumber(statsIni.stats.report6))
					end

					if var_251_3:match("^/get_" .. nick) then
						sendTelegramNotification("Ник: " .. nick .. "\nУровень: " .. sampGetPlayerScore(id) .. "\nУровень адм: " .. configIni.config.admlvl .. "\nВерсия AH: " .. thisScript().version .. "\nСервер: " .. sampGetCurrentServerName():gsub("ONLINE RP | (.+)", "%1", 1))
					end

					if var_251_3:match("^/allchat_" .. nick) then
						var_0_100.allchat = not var_0_100.allchat

						if var_0_100.allchat then
							sendTelegramNotification("Получение сообщений из всех чатов /" .. nick .. " активировано.")
						else
							sendTelegramNotification("Получение сообщений из всех чатов /" .. nick .. " деактивировано.")
						end
					end

					if var_251_3:match("^/achat_" .. nick) then
						var_0_100.achat = not var_0_100.achat

						if var_0_100.achat then
							sendTelegramNotification("Получение сообщений из админ чата /" .. nick .. " активировано.")
						else
							sendTelegramNotification("Получение сообщений из админ чата /" .. nick .. " деактивировано.")
						end
					end

					if var_251_3:match("^/report_" .. nick) then
						var_0_100.report = not var_0_100.report

						if var_0_100.report then
							sendTelegramNotification("Получение репортов /" .. nick .. " активировано.")
						else
							sendTelegramNotification("Получение репортов /" .. nick .. " деактивировано.")
						end
					end

					if var_251_3:match("^/localchat_" .. nick) then
						var_0_100.localchat = not var_0_100.localchat

						if var_0_100.localchat then
							sendTelegramNotification("Получение сообщений из локальных чатов /" .. nick .. " активировано.")
						else
							sendTelegramNotification("Получение сообщений из локальных чатов /" .. nick .. " деактивировано.")
						end
					end

					if var_251_3:match("^/active_" .. nick) then
						sendTelegramNotification("[Подключения /" .. nick .. "]\n\nВсе чаты: " .. tostring(var_0_100.allchat) .. "\nАдмин чат: " .. tostring(var_0_100.achat) .. "\nРепорт: " .. tostring(var_0_100.report) .. "\nЛокальные чаты: " .. tostring(var_0_100.localchat))
					end

					if var_251_3:match("^/check") and (var_0_100.allchat or var_0_100.achat or var_0_100.report or var_0_100.localchat) then
						sendTelegramNotification("Имеются активные подключения к /active_" .. nick)
					end

					if var_251_3:match("^/disable_" .. nick) then
						if var_0_100.allchat or var_0_100.achat or var_0_100.report or var_0_100.localchat then
							var_0_100 = {
								achat = false,
								localchat = false,
								report = false,
								allchat = false
							}

							sendTelegramNotification("Все активные подключения пользователя /" .. nick .. " деактивированы.")
						else
							sendTelegramNotification("Нет активных подключений к /" .. nick)
						end
					end

					if var_251_3:match("^/reset") and (var_0_100.allchat or var_0_100.achat or var_0_100.report or var_0_100.localchat) then
						var_0_100 = {
							achat = false,
							localchat = false,
							report = false,
							allchat = false
						}

						sendTelegramNotification("Все активные подключения пользователя " .. nick .. " деактивированы.")
					end
				end
			end
		end
	end
end

function getLastUpdate()
	tg_async_http_request("https://api.telegram.org/bot" .. var_0_98 .. "/getUpdates?chat_id=" .. var_0_97 .. "&offset=-1", "", function(arg_253_0)
		if arg_253_0 then
			local var_253_0 = decodeJson(arg_253_0)

			if var_253_0.ok then
				if #var_253_0.result > 0 then
					local var_253_1 = var_253_0.result[1]

					if var_253_1 then
						var_0_99 = var_253_1.update_id
					end
				else
					var_0_99 = 1
				end
			end
		end
	end)
end

function onScriptTerminate(arg_254_0, arg_254_1)
	if arg_254_0 == thisScript() then
		if saved_posX ~= nil and saved_posY ~= nil then
			configIni.config.statsposX, configIni.config.statsposY = saved_posX, saved_posY

			var_0_2.save(configIni, "AdminHelper/config")
		end

		if var_0_100.allchat or var_0_100.achat or var_0_100.report or var_0_100.localchat then
			sendTelegramNotification("Соединение с /" .. nick .. " разорвано.")
		end
	end
end

function autoupdate(arg_255_0, arg_255_1, arg_255_2)
	local var_255_0 = require("moonloader").download_status
	local var_255_1 = getWorkingDirectory() .. "\\" .. thisScript().name .. "-version.json"

	if doesFileExist(var_255_1) then
		os.remove(var_255_1)
	end

	downloadUrlToFile(arg_255_0, var_255_1, function(arg_256_0, arg_256_1, arg_256_2, arg_256_3)
		if arg_256_1 == var_255_0.STATUSEX_ENDDOWNLOAD then
			if doesFileExist(var_255_1) then
				local var_256_0 = io.open(var_255_1, "r")

				if var_256_0 then
					local var_256_1 = decodeJson(var_256_0:read("*a"))

					updatelink = var_256_1.updateurl
					updateversion = var_256_1.latest

					var_256_0:close()
					os.remove(var_255_1)

					if updateversion ~= thisScript().version then
						lua_thread.create(function(arg_257_0)
							local var_257_0 = require("moonloader").download_status
							local var_257_1 = 4216448

							sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Обнаружено обновление. Пытаюсь обновиться c " .. thisScript().version .. " на " .. updateversion, var_257_1)
							wait(250)
							downloadUrlToFile(updatelink, thisScript().path, function(arg_258_0, arg_258_1, arg_258_2, arg_258_3)
								if arg_258_1 == var_257_0.STATUS_DOWNLOADINGDATA then
									print(string.format("Загружено %d из %d.", arg_258_2, arg_258_3))
								elseif arg_258_1 == var_257_0.STATUS_ENDDOWNLOADDATA then
									print("Загрузка обновления завершена.")
									sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Обновление завершено!", var_257_1)

									goupdatestatus = true

									lua_thread.create(function()
										wait(500)
										thisScript():reload()
									end)
								end

								if arg_258_1 == var_257_0.STATUSEX_ENDDOWNLOAD and goupdatestatus == nil then
									sampAddChatMessage("{51fffa}[AdminHelper] {d5dedd}Обновление прошло неудачно. Запускаю устаревшую версию...", var_257_1)

									update = false
								end
							end)
						end, arg_255_1)
					else
						update = false

						print("v" .. thisScript().version .. ": Обновление не требуется.")
					end
				end
			else
				print("v" .. thisScript().version .. ": Не удалось проверить обновление. Смиритесь или напишите в telegram: @nine_taileds")

				update = false
			end
		end
	end)

	while update ~= false do
		wait(100)
	end
end

function apply_custom_style()
	var_0_3.SwitchContext()

	local var_260_0 = var_0_3.GetStyle()
	local var_260_1 = var_260_0.Colors
	local var_260_2 = var_0_3.Col
	local var_260_3 = var_0_3.ImVec4
	local var_260_4 = var_0_3.ImVec2

	var_260_0.WindowPadding = var_260_4(15, 15)
	var_260_0.WindowRounding = 15
	var_260_0.FramePadding = var_260_4(5, 5)
	var_260_0.ItemSpacing = var_260_4(12, 8)
	var_260_0.ItemInnerSpacing = var_260_4(8, 6)
	var_260_0.IndentSpacing = 25
	var_260_0.ScrollbarSize = 15
	var_260_0.ScrollbarRounding = 15
	var_260_0.GrabMinSize = 15
	var_260_0.GrabRounding = 7
	var_260_0.ChildWindowRounding = 8
	var_260_0.FrameRounding = 6
	var_260_1[var_260_2.Text] = var_260_3(0.95, 0.96, 0.98, 1)
	var_260_1[var_260_2.TextDisabled] = var_260_3(0.36, 0.42, 0.47, 1)
	var_260_1[var_260_2.WindowBg] = var_260_3(0.11, 0.15, 0.17, 1)
	var_260_1[var_260_2.ChildWindowBg] = var_260_3(0.11, 0.15, 0.17, 1)
	var_260_1[var_260_2.PopupBg] = var_260_3(0.08, 0.08, 0.08, 0.94)
	var_260_1[var_260_2.Border] = var_260_3(0.43, 0.43, 0.5, 0.5)
	var_260_1[var_260_2.BorderShadow] = var_260_3(0, 0, 0, 0)
	var_260_1[var_260_2.FrameBg] = var_260_3(0.2, 0.25, 0.29, 1)
	var_260_1[var_260_2.FrameBgHovered] = var_260_3(0.12, 0.2, 0.28, 1)
	var_260_1[var_260_2.FrameBgActive] = var_260_3(0.09, 0.12, 0.14, 1)
	var_260_1[var_260_2.TitleBg] = var_260_3(0.09, 0.12, 0.14, 0.65)
	var_260_1[var_260_2.TitleBgCollapsed] = var_260_3(0, 0, 0, 0.51)
	var_260_1[var_260_2.TitleBgActive] = var_260_3(0.08, 0.1, 0.12, 1)
	var_260_1[var_260_2.MenuBarBg] = var_260_3(0.15, 0.18, 0.22, 1)
	var_260_1[var_260_2.ScrollbarBg] = var_260_3(0.11, 0.15, 0.17, 1)
	var_260_1[var_260_2.ScrollbarGrab] = var_260_3(0.2, 0.25, 0.29, 1)
	var_260_1[var_260_2.ScrollbarGrabHovered] = var_260_3(0.18, 0.22, 0.25, 1)
	var_260_1[var_260_2.ScrollbarGrabActive] = var_260_3(0.09, 0.21, 0.31, 1)
	var_260_1[var_260_2.ComboBg] = var_260_3(0.2, 0.25, 0.29, 1)
	var_260_1[var_260_2.CheckMark] = var_260_3(0.28, 0.56, 1, 1)
	var_260_1[var_260_2.SliderGrab] = var_260_3(0.28, 0.56, 1, 1)
	var_260_1[var_260_2.SliderGrabActive] = var_260_3(0.37, 0.61, 1, 1)
	var_260_1[var_260_2.Button] = var_260_3(0.2, 0.25, 0.29, 1)
	var_260_1[var_260_2.ButtonHovered] = var_260_3(0.28, 0.56, 1, 1)
	var_260_1[var_260_2.ButtonActive] = var_260_3(0.06, 0.53, 0.98, 1)
	var_260_1[var_260_2.Header] = var_260_3(0.2, 0.25, 0.29, 0.55)
	var_260_1[var_260_2.HeaderHovered] = var_260_3(0.26, 0.59, 0.98, 0.8)
	var_260_1[var_260_2.HeaderActive] = var_260_3(0.26, 0.59, 0.98, 1)
	var_260_1[var_260_2.ResizeGrip] = var_260_3(0.26, 0.59, 0.98, 0.25)
	var_260_1[var_260_2.ResizeGripHovered] = var_260_3(0.26, 0.59, 0.98, 0.67)
	var_260_1[var_260_2.ResizeGripActive] = var_260_3(0.06, 0.05, 0.07, 1)
	var_260_1[var_260_2.CloseButton] = var_260_3(0.4, 0.39, 0.38, 0.16)
	var_260_1[var_260_2.CloseButtonHovered] = var_260_3(0.4, 0.39, 0.38, 0.39)
	var_260_1[var_260_2.CloseButtonActive] = var_260_3(0.4, 0.39, 0.38, 1)
	var_260_1[var_260_2.PlotLines] = var_260_3(0.61, 0.61, 0.61, 1)
	var_260_1[var_260_2.PlotLinesHovered] = var_260_3(1, 0.43, 0.35, 1)
	var_260_1[var_260_2.PlotHistogram] = var_260_3(0.9, 0.7, 0, 1)
	var_260_1[var_260_2.PlotHistogramHovered] = var_260_3(1, 0.6, 0, 1)
	var_260_1[var_260_2.TextSelectedBg] = var_260_3(0.32, 0.32, 0.87, 1)
	var_260_1[var_260_2.ModalWindowDarkening] = var_260_3(1, 0.98, 0.95, 0.73)
end