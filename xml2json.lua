-- scaffold geniefile for xml2json

xml2json_script = path.getabsolute(path.getdirectory(_SCRIPT))
xml2json_root = path.join(xml2json_script, "xml2json")

xml2json_includedirs = {
	path.join(xml2json_script, "config"),
	xml2json_root,
}

xml2json_libdirs = {}
xml2json_links = {}
xml2json_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { xml2json_includedirs }
	end,

	_add_defines = function()
		defines { xml2json_defines }
	end,

	_add_libdirs = function()
		libdirs { xml2json_libdirs }
	end,

	_add_external_links = function()
		links { xml2json_links }
	end,

	_add_self_links = function()
		links { "xml2json" }
	end,

	_create_projects = function()

project "xml2json"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		xml2json_includedirs,
	}

	defines {}

	files {
		path.join(xml2json_script, "config", "**.h"),
		path.join(xml2json_root, "**.h"),
		path.join(xml2json_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
