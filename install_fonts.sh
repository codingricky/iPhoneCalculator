#!/bin/bash
set -x
curl http://www.imagemagick.org/Usage/scripts/imagick_type_gen > imagick_type_gen.sh
chmod a+x imagick_type_gen.sh
mkdir ~/.magick 
find /Library/Fonts/ -name '*.ttf' | ./imagick_type_gen.sh -f - > ~/.magick/type.xml
