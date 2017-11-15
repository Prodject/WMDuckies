# WMDuckies

## Overview
WMDuckies (Weapons of Mass Duckies) is an exploit framework for the USB Rubber Ducky created by Gavin Youker. The purpose of this project is to provide a quick and easy way deploy multiple exploits and payloads.

This framework use Visual Basic Scripting (.vbs) as it is native to the Windows environment. Every payload is ran from lib/run.vbs where the includes, payloads, and exploits are executed from. Execution starts by running the inject.bin file, which launches lib/run.vbs. From there, every payload and exploit is ran from the configuration file at lib/config.txt (see docs/usages.md for more information).

## Disclaimer
This software was created for demonstration and educational purposes only. I do not condone using this software for any other reason. Specifically, please do not use this software in a malicious manner or to conduct any illegal activities.