# All of the Trend statuses: (Put into a armorstatus.sh file, chmod +x, then ./armorstatus.sh)
# Requires installation of the 'jq' package, sudo apt-get update; sudo apt-get install jq -y
#!/bin/bash
/opt/armor/armor trend status | sed -n '/time=/!p' | sed 's/[^{]*\({.*\)/\1/' | jq '.' > armorstatus.txt 2>/dev/null
jq '{ "hostName", "lastIPUsed", "platform" }' armorstatus.txt 2>/dev/null
jq  '"File Integrity Monitoring (FIM):", {"integrityMonitoring state": .integrityMonitoring.state, "integrityMonitoring status": .integrityMonitoring.moduleStatus.agentStatus, "integrityMonitoringmessage": .integrityMonitoring.moduleStatus.agentStatusMessage}' armorstatus.txt 2>/dev/null
jq  '"Intrusion Detection/Prevention (IDS/IPS):", {"intrusionPrevention state": .intrusionPrevention.state, "intrusionPrevention status": .intrusionPrevention.moduleStatus.agentStatus, "intrusionPrevention message": .intrusionPrevention.moduleStatus.agentStatusMessage}' armorstatus.txt 2>/dev/null
jq  '"Anti-Virus/Anti-Malware (AV):", {"antiMalware state": .antiMalware.state, "antiMalware status": .antiMalware.moduleStatus.agentStatus, "antiMalware message": .antiMalware.moduleStatus.agentStatusMessage}' armorstatus.txt 2>/dev/null
