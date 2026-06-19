package("tinygl-aceinet")
	set_description("A portable, software-only OpenGL 1.1 rasterizer in C99 (aceinet's fork)")
	add_urls("https://github.com/aceinetx/tinygl/archive/$(version).zip", "https://github.com/aceinetx/tinygl.git")

	add_versions("afdbeb74e5dfe8e3e9031835fbdac059c2aa9a03", "8cba36feafb06e68bb334ce4f633d802e17d30f2f829aeab1f14b96c1d41d718")

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
