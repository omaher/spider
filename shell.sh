View container logs: docker logs <container_id_or_name>
Check container exit code: docker inspect <container_id_or_name> --format='{{.State.ExitCode}}'
Enter a running container: docker exec -it <container_id_or_name> /bin/bash
Check real-time resource usage: docker stats <container_id_or_name>
View Docker daemon logs: sudo journalctl -u docker.service | sudo systemctl status docker
Monitor Docker events: docker events


docker run -d -p 8080:80 --name my-container nginx
8080 host port, 80 container port
We can connect to nginx server using http://<host-ip>:8080

Network types - Bridge, Host, Overlay, None, Container

ss and netstat: Useful for listing open ports and connections on your local system. (netstat -tuln)
lsof: Can show which processes are using open ports. (sudo lsof -i -n -P | grep LISTEN)
firewalld / iptables: To check if a firewall is allowing connections to specific ports. (sudo firewall-cmd --list-ports)
nmap: Useful for scanning open ports on both local and remote hosts. (sudo nmap -p 20-1000 localhost)
telnet / nc: To test connectivity to a specific port on the local or remote system. (telnet localhost 80)

most memory on a Linux system
ps aux --sort=-%mem | head -n 10
top and press Caps H
top -b -n 1 | head -n 12 --- -b: Enables batch mode ---- -n 1: Runs for one iteration
cat /proc/<pid>/status | grep VmRSS

Shell conditions
if ! head -n 1 "$INPUT_FILE" | grep -qE '^username,email'; then
cut -d',' -f1,2 "$INPUT_FILE" > "$TEMP_FILE"
sort -u "$TEMP_FILE" > "$OUTPUT_FILE"

while IFS= read -r SERVER; do
done < "$SERVER_LIST"
if ping -c 1 -W 2 "$SERVER" &>/dev/null; then
if [[ -s "$LOG_FILE" ]]; then
mail -s "Unreachable Servers Alert" "$EMAIL" < "$LOG_FILE"

Size of file = stat --printf="%s" "$LOG_FILE"
tail -F "$LOG_FILE" | while read -r LINE; do
if echo "$LINE" | grep -q "ALERT"; then
Filter Specific Alerts:  "grep -E "CRITICAL|WARNING|ALERT"
Log Alerts to a Separate File: = echo "$LINE" >> /path/to/alerts.log

DATE=$(date +%Y%m%d)
scp "${BACKUP_DIR}/${BACKUP_FILE}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +30 -exec rm -f {} \;

INACTIVE_USERS=$(lastlog -b 30 -u 0-60000 | awk 'NR>1 && $4=="**Never logged in**" {print $1}')

find "$TARGET_DIR" -type f -size +"${SIZE_THRESHOLD}M" -exec ls -lh {} \; > large_files.txt
find "$LOG_DIR" -type f -mtime +"${DAYS_THRESHOLD}" -exec ls -lh {} \; > old_files.txt
read -p "Do you want to proceed with deletion? (y/n): " CONFIRM
if [[ "$CONFIRM" == "y" ]]; then
critical files - find "$LOG_DIR" -type f -mtime +"${DAYS_THRESHOLD}" ! -name "important_file.log" -exec rm -f {} \;

Check if PID exists - if ! ps -p $PID > /dev/null; then
CPU_USAGE=$(ps -p $PID -o %cpu --no-headers | awk '{print int($1)}')
MEM_USAGE=$(ps -p $PID -o rss --no-headers | awk '{print int($1/1024)}') # Convert KB to MB

: > app.log

wc -l filename
grep "ERROR" filename > error_lines.txt
grep -o "ERROR" filename | sort | uniq -c | sort -nr | head -10
tee -a "$LOG_FILE"

# Find files modified in the last 7 days and zip them
find "$TARGET_DIR" -type f -mtime -7 -print0 | zip -@ "$OUTPUT_ZIP" --null

# Get the second highest mark and print the corresponding name
echo "$data" | awk '{print $2, $3}' | sort -nr | awk 'NR==2 {print $2}'