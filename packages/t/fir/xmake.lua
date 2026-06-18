package("fir")
	set_description("Feather IR: Simple SSA Intermediate Representation that compiles to C ")
	add_urls("https://github.com/aceinetx/fir/archive/$(version).zip", "https://github.com/aceinetx/fir.git")

	add_versions("a93e75fdfe0d7d77acd0fe20744e17e190d6d94a", "bb0f215f5d58d730e3ffdeaa4b3f1235fa0bd80bbc7f573a5e47aa9a7802dde3")

	on_install("linux", function (package)
		import("package.tools.xmake").install(package)
	end)

