# ThinkPad-E480-OpenCore-EFI
This is a configuration for ThinkPad E480 to boot macOS Ventura. To boot other versions of macOS, changes to configuration are required.


|**Parts**  | **Model** |
|--|--|
| CPU | Intel Core i5-7200U |
| RAM | 32GB DDR4 2133MHz
| WLAN/BT | Intel AC7265NGW |
| Audio | Conexant (`alcid=15`) |
| SSD | Generic 480GB SATA SSD |

# What's Working?
| Feature | Status |
|--|--|
| Touchpad | Working |
| TrackPoint | Working |
| WLAN/BT | Working, WLAN powered by `itlwm`<sup>[1]</sup> or `AirportItlwm.kext` |
| Audio/Mic | Working |
| Sleep | Working<sup>[2]</sup> |
| Native power management | Working<sup>[3]</sup> |

[1]  `itlwm` and HeliPort are used in this EFI configuration for the purpose to connect to hidden networks. It is recommended to use `AirportItlwm.kext` if you do not have such needs.

[2] Sleep itself works without problem, but there are some trivial imperfections after waking up from sleep. It will be explained in the following section.

[3] This requires a hardware SOP8 flash programmer (e.g. `CH341a`) and taking apart the laptop to extract, modify and flash a custom version of BIOS (Skyra1n). After doing so, the CFG Lock (`MSR 0xE2`) register could be written to and disabled. If you do not have such equipments, less-than-optimal power management still works by setting `AppleCpuPmCfgLock` and `AppleXcpmCfgLock` to `True` in `config.plist`.

# What's Not Working?
| Feature | Status |
|--|--|
| AirDrop and other continuity features | Not Working<sup>[1]</sup> |
| iCloud | Not Working<sup>[2]</sup> |
| Hotkeys for brightness, volume, etc. | Partially Working <sup>[3]</sup> |
| Battery remaining percentage display | Partially Working <sup>[4]</sup> |

[1] This can be fixed by using `AirportItlwm.kext`. If you do not have the need to connect to a hidden network, do that.

[2] Should be very easily fixed with tons of tutorials online. I am lazy so it remains broken.

[3] This seems to be a universal problem faced by everyone who has attempted to boot macOS on the E480. After the computer wakes up from sleep, the `FnLock` is permanently enabled until the next reboot, which means you can't use the hotkeys to conveniently adjust brightness, volume, etc.

[4] Another universal problem that's yet to be solved. After waking up from sleep, if the state of battery charging is changed since the last state when the computer is awake (e.g. you plug in and start charging the computer, or unplugging the previously plugged in charger prior to waking up from sleep), the battery icon would still display the previous state instead of what it's doing currently. This can be fixed by manually putting the computer to sleep and waking it up once again.



