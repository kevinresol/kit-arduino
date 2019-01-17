#!/bin/bash

kitc \
  --cc /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/gcc-avr \
  --lib \
  -s src \
  -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino \
  -I /Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/standard \
  -I /Applications/Arduino.app/Contents/Java/hardware/tools/avr/avr/include \
  --no-link \
  --no-compile \
  hello.kit && \
  
pushd build/lib && \
  make -f ../../Makefile && \
  make do_upload -f ../../Makefile && \
popd
