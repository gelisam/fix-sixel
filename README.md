# fix-sixel

[According to Chris F. Chiesa](https://www.digiater.nl/openvms/decus/vax90b1/krypton-nasa/all-about-sixels.text), there are two formats for getting in and out of Sixel mode. Unfortunately, it looks like [ppmtosixel](https://netpbm.sourceforge.net/doc/ppmtosixel.html) uses one format while `xterm -ti vt340` expects the other. This program converts stdin to the format expected by xterm.
