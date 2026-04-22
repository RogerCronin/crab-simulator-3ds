all: run

download_nest: FORCE
	curl -LJO https://github.com/lovebrew/nest/archive/refs/heads/master.zip
	unzip nest-master.zip -d ./tmp
	mkdir ./game/nest
	cp -r ./tmp/nest-master/nest/* ./game/nest/
	rm nest-master.zip
	rm -rf ./tmp

copy_nest_assets: assets/assets_nest
	rm -rf game/assets
	mkdir game/assets
	cp -r assets/assets_nest/. game/assets/

run: FORCE copy_nest_assets
	love game

build: FORCE
	rm "Crab Simulator (2020).zip"
	rm -rf build
	mkdir build

	cp lovebrew.toml build/
	cp -r game build/

	rm -rf build/game/assets
	mkdir build/game/assets
	cp -r assets/assets_3ds/. build/game/assets/

	cp build/game/main.lua main.lua.bk
	echo "--nest = require("nest").init({ console = "3ds", emulateJoystick = true })" > build/game/main.lua
	cat main.lua.bk | tail -n+2 >> build/game/main.lua
	rm main.lua.bk

	rm -rf build/game/nest

	cd build && zip -r "Crab Simulator (2020).zip" ./
	mv "build/Crab Simulator (2020).zip" "Crab Simulator (2020).zip"

clean: FORCE
	rm -rf "Crab Simulator (2020).zip" ./build ./games/assets

FORCE: ;