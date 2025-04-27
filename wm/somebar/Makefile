install:
	rm -rf build
	cp src/config.def.hpp src/config.hpp
	meson setup build
	ninja -C build
	sudo ninja -C build install
