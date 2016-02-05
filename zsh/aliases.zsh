alias reload!='. ~/.zshrc'

# Generic process finder 
alias p="ps aux | grep"

# grep
alias grin='grep -rin'

alias ll='ls -pliah'
alias find-recently-modified="print -rl **/*(.0m)"

# Move to /tmp instead of hard delete
alias rmv="mv -t /tmp"

# Enhanced WHOIS lookups
#alias whois="whois -h whois-servers.net"

# Misc
alias youtube-dl-mp3="youtube-dl --extract-audio --audio-format mp3 --title --no-mtime"

# WAN IP
alias lan-ip="ipconfig getifaddr en0"
alias wan-ip="dig +short myip.opendns.com @resolver1.opendns.com"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Serve current directory on port (default 3000)
# Usage: serve 80
function serve {
  port="${1:-3000}"
  ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}
