# Crab Simulator 3DS

Wow it's on the 3DS now wow. Based on the existing 1.4 version you can find on SquareBrackets.

## Get it running

Run `make download_nest` to download the LÖVE 3DS compatability library [nëst](https://github.com/lovebrew/nest).

Run `make` to start Crab Simulator 3DS using LÖVE in 3DS compatability mode.

Run `make build` to generate a zip file that can be uploaded to the [bundler website](https://bundle.lovebrew.org/) to generate a `.3dsx` file.

And run `make clean` to revert the repository to its base condition.

`assets/ttf_convert.sh` uses `mkbcfnt` (installed by default at `/opt/devkitpro/tools/bin/mkbcfnt`) to convert all the `*.ttf` files in `assets/assets_nest` into `*.bcfnt` files usable by the 3DS in `assets/assets_3ds`. Do you like my use of `inline code sections`?
