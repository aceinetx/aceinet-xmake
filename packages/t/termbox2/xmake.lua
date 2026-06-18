package("tinygl")
	set_description("terminal I/O library")
	add_urls("https://github.com/termbox/termbox2/archive/refs/tags/v$(version).zip", "https://github.com/termbox/termbox2.git")

	add_versions("2.5.0", "d51f304dac421b62115e6ea5faa7a4c019e6c3cfca4c4866f00792130819a1a7")
	add_versions("2.0.0", "da2e8c2f30d784e9b3cdfea4332257beef471976556b9ddb6e994ca5adf389af")

	on_install("linux", function (package)
		local source_file = io.open("termbox2.c", "w")
		source_file:write([[
#define TB_IMPL
#include "termbox2.h"
]])
		source_file:close()

		local xmake = io.open("xmake.lua", "w")
		xmake:write([[
add_rules("mode.debug", "mode.release")

set_warnings("all")
set_languages("c99")

target("termbox2")
	set_kind("static")

	add_files("termbox2.c")
	add_headerfiles("termbox2.h", {public=true})
]])
		xmake:close()
		import("package.tools.xmake").install(package)
	end)

