# Usages

## Variables
### Path_Root
PATH_ROOT is the root of the framework. In most cases this is the drive letter. 
Example: D:/

### Path_Loot
PATH_LOOT is the dynamic folder that is created upon exploit. The folder name is in timestamp format.
Example: 11-15-2017_16-05-14

### Clip
CLIP is used to copy the user clipboard before the exploit runs so it can be restored later.

## Functions
### Execute
The Execute function is used to include code from an external location.
Example: Execute("lib\includes\is_admin.vbs")

### IsAdmin
IsAdmin Function is used to check if the running user is an administrator. This returns a true or false value.
Example: If IsAdmin() = True Then

### BuildExe
BuildExe is used to compile an executable file (.exe) from a base64 encoded hex string into the user's %TEMP% location. This also returns the executable's path.
Example: exePath = BuildExe("VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIDEzIGxhenkgZG9ncy4=")

### Log
Log is a subprocedure used to write specific instances to the log file.
Example: Log "START", "The exploit has now been started and running."

## Configuration
### Information
The configuration file is used to define specific variables to be used in the framework. If a variable needs to be in an array fassion, the variable can be definded twice.

Variables are defined by the name is capital letters, an equals sign, and the value. Comments are definded by a hashtag symbol (no inline commenting is allowed).

Required variables are PAYLOAD, DEV, and LOG.

### Exampels
&#35; Payloads to set.<br>
PAYLOAD=lib\payloads\shell_netcat.vbs<br>
PAYLOAD=lib\payloads\creds_wlan.vbs<br>

&#35; Listener settings.<br>
LHOST=192.168.6.131<br>
LPORT=4444<br>
