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
  
pushd build/lib && make -f ../../Makefile && popd && \

avrdude -C /Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf -p atmega328p -c arduino -b 115200 -P /dev/cu.usbmodem14131 -U flash:w:build/lib/build-uno/lib.hex

