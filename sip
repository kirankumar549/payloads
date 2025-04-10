nmap -p 5060 --script sip-enum-users --script-args sip-enum-users.username=100-999 <TARGET_IP>
1. Basic SIP Port Scan
bash
Copy
Edit
nmap -sU -p 5060 <target-ip>
✅ This checks if UDP 5060 (SIP) is open. SIP often runs on UDP, but TCP might also be used:

bash
Copy
Edit
nmap -sS -p 5060 <target-ip>
Or both:

bash
Copy
Edit
nmap -sS -sU -p 5060 <target-ip>
🔍 2. Detect SIP Service and Fingerprint It
bash
Copy
Edit
nmap -sU -p 5060 --script=sip-methods <target-ip>
✅ This script will:

Enumerate supported SIP methods like INVITE, REGISTER, OPTIONS

Help identify open SIP endpoints

🛠️ 3. Run Multiple SIP-Related NSE Scripts
bash
Copy
Edit
nmap -sU -p 5060 --script "sip* and not brute" <target-ip>
✅ This will run scripts like:

sip-methods

sip-options

sip-enum-users

sip-enum-domains

sip-authenticate

💡 Add -v or -vv for verbose output.

👤 4. SIP User Enumeration (Bruteforce)
bash
Copy
Edit
nmap -sU -p 5060 --script=sip-enum-users --script-args "sip-enum-users.bruteforce=true" <target-ip>
✅ Tries to enumerate valid SIP usernames like 1000, admin, etc.

You can specify a custom user list:

bash
Copy
Edit
--script-args "userdb=/path/to/users.txt"
🔓 5. SIP Authentication Brute Force
bash
Copy
Edit
nmap -sU -p 5060 --script=sip-brute <target-ip>
✅ Attempts to brute-force SIP usernames and passwords (basic/digest auth).

Add custom wordlists:

bash
Copy
Edit
--script-args userdb=users.txt,passdb=pass.txt
🔥 6. Example: Full Aggressive SIP Scan
bash
Copy
Edit
nmap -sU -p 5060 -n -Pn -T4 \
  --script=sip-methods,sip-enum-users,sip-enum-domains,sip-brute \
  --script-args "sip-enum-users.bruteforce=true,userdb=users.txt,passdb=pass.txt" \
  <target-ip>
