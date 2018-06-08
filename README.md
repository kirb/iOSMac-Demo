# Experimenting with iOSMac (Marzipan)
This repo accompanies my blog post [**A quick look at UIKit on macOS**](https://kirb.me/2018/06/07/iosmac-research.html), where I investigate the iOSMac (aka UIKit on Mac, aka Marzipan) system included with macOS Mojave. This is a proof-of-concept of my iOS app [NewTerm](https://github.com/hbang/NewTerm) (somewhat) running on macOS using iOSMac. This repo is very messy and iOSMac is very crashy, but it serves as a proof-of-concept that an app really can be ported from iOS to macOS.

## Building
Most importantly, you need to be on macOS Mojave (the current developer beta release) with Xcode 10 (also beta), disable System Integrity Protection (Google for a guide), as well as AppleMobileFileIntegrity (AMFI) using `sudo nvram boot-args='amfi_get_out_of_my_way=0x1'`. This is of course disabling a lot of macOS’s security functionality and you should only do this on a test installation of macOS (you’re not running a beta OS as your daily driver, right‽), and re-enable it all once you’re done. Keep in mind NVRAM is global and affects all installations of macOS on the computer, and SIP configuration is kept in NVRAM.

I haven’t included UIKit headers, so you’ll need to take them from the iOS SDK and patch them to shut up availability warnings:

```shell
cp -r /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Headers/*.h ~/Downloads/iOSMac-Demo/UIKit/
cd ~/Downloads/iOSMac-Demo/UIKit/

for i in *.h; do
	sed -Ei s/'NS_(|CLASS_|ENUM_)AVAILABLE_IOS\([0-9]+_[0-9]\)'//g "$i"
done
```

Open NewTerm.xcodeproj, select the NewTerm project file at the top of the file list, and ensure the signing team is set to yourself (a free developer account works). Then click Run and have fun!

**Keep in mind** iOSMac is very likely to crash or hang the window server. This project currently causes a hang immediately after. You should enable SSH in the macOS Sharing Preferences so you can SSH in from another machine and run `killall UIKitSystemApp` if you’re in trouble. If you forget or can’t, just hold the power button. There’s no permanent damage — iOSMac is just very unstable right now.

## License
This is based on the [NewTerm](https://github.com/hbang/NewTerm) project, licensed under the GNU General Public License, version 2.0. Refer to [LICENSE.md](LICENSE.md).
