# SMSM
## A MIDI interface for the Sega Master System

Originally developed by [little-scale](http://little-scale.blogspot.com/2012/12/how-to-build-sega-master-system-midi.html).

Updated and maintained by [catskull](http://catskull.net).

## Building the ROM
Install wla-dx. On OSX this is easily achieved using by using Homebrew. Simply call `brew install wla-dx` from a command line. If you get a linking error, run ```sudo chown -R `whoami`:admin /usr/local/bin` and then run `brew link wla-dx```. If that completed successfully, run `wla-z80` from the command line and you should see something like this:

```
WLA Z80 Macro Assembler v9.9
Written by Ville Helin in 1998-2008 - In GitHub since 2014: https://github.com/vhelin/wla-dx
$VER: WLA-Z80 9.9 (15.8.2019)

USAGE: wla-z80 [OPTIONS] <ASM FILE>

Options:
-i  Add list file information
-M  Output makefile rules
-q  Quiet
-t  Test compile
-v  Verbose messages
-x  Extra compile time labels & definitions
-I [DIR]  Include directory
-D [DEF]  Declare definition

Output types:
-o [FILE]  Output object file
-l [FILE]  Output library file

EXAMPLE: wla-z80 -v -o main.obj main.asm
```

Congratulations! You're now ready to build the ROM!

cd into the ROM directory. Inside there is SMSM.asm, and build.sh. Enter `./build.sh` from the command line and it will build the ROM for you! You should now see a file called output.sms in this directory. This is the rom! Fire up your favorite emulator and give it a shot!

## ROM improvements

The ROM as developed by little-scale works quite well but is very bare bones. For example, it does not display anything on the screen when booted so there's no way of knowing whether or not your cartridge even works or not!

Here is a list of improvements I've made to the ROM so far:
 - clear the bios screen on boot
 - display a message on boot "System ready!"

Wish list:
 - mGB style console based interface for editing instrument presets (currently that is only supported by MIDI CC commands)
 - Implement the reset button on the console to reset the rom (a sort of MIDI panic)
 - Display a message if the YM2413 FM sound chip is detected

# Hardware

The hardware as developed by little-scale is quite complete. It does most of the heavy lifting, which is why the console ROM is so bare bones.

Here is a list of improvements I have made:
 - Added a status LED on pin 13. It blinks in a pattern and then goes steady on on first boot. Once notes are being sent, it blinks each time a note is received.
 - Added a MIDI panic button. Pressing it will kill all notes on the console.
 - I have designed a small PCB based around the Arduino Pro Mini for easiest use.

Wish list:
 - Currently, the PCB does not work with a Game Gear. It simply does not power on. Powering the unit externally does not work either. It powers on, but will not receive any MIDI data.
 - The PCB interface does not work with my cheapie USB MIDI cable. It will occasionally get midi data, but not reliably and will frequently miss MIDI note off.


# Credits
Sebastian Tomczak (aka little-scale) for the ROM, arduino code, and everything else.

Maxim for a great hello world tutorial.

Everyone at smspower.org

# License

little-scale released this with this note:

"The code etc for this is open and free to use. Please do not commercialise this. It is not for making money. It is for making cool chiptune musics. I encourage you to build one of these. It is easy and shouldn't take long. I encourage you to hack the code and play and have fun with it."

This is not really a valid software license. The ROM is based on Maxim's hello world program which also was not really released with a license.

For the time being, the code is somewhere in between public domain and all rights reserved. All contributions I make will be licensed under GPL v2.
