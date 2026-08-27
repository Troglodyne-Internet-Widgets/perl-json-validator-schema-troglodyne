#!/bin/bash

#XXX SIGH
ln -sr .build/$(ls -1 .build | head -n1) .build/latest; /bin/true
cp .perltidyrc .build/latest/.perltidyrc
cp .perlcriticrc .build/latest/.perlcriticrc
cp .preferred_modules.ini .build/latest/.preferred_modules.ini
cp LICENSE .build/latest/LICENSE
