package("tinygl")
	set_description("A portable, software-only OpenGL 1.1 rasterizer in C99")
	add_urls("https://github.com/jserv/tinygl/archive/refs/heads/main.zip", "https://github.com/jserv/tinygl.git")

	add_versions("1.0.0", "ae493b48d064e107c38e927c5e8f8c55a5084993e6501bbf5914cce3b2058349")

	on_install("linux", function (package)
		local xmake = io.open("xmake.lua", "w")
		xmake:write([[
add_rules("mode.debug", "mode.release")

set_warnings("all")
set_languages("c99")

target("TinyGL")
	set_kind("static")

	add_files("src/*.c")
	add_includedirs("include", {public=true})
	add_headerfiles("include/*.h", "include/(**/*.h)", {public=true})
]])
		xmake:close()
		import("package.tools.xmake").install(package)
	end)
