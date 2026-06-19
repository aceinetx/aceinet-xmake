package("gltty")
	set_description("Render OpenGL in the terminal with rlsw.")
	add_urls("https://github.com/aceinetx/GLtty/archive/refs/tags/$(version).zip", "https://github.com/aceinet/GLtty.git")

	add_versions("0.1.0", "1ab52a89461b5f266c9885fd76ed3ae05d50f8e5223d850366490347be1758a2")

	on_install("linux", function (package)
		import("package.tools.xmake").install(package)
	end)


