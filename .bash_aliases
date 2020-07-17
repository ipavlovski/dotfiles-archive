alias ls='ls --color=auto'
alias la='ls -A'
alias ll='LC_COLLATE=C ls -Alh --time-style=+[%y-%m-%d\ %T] --group-directories-first'
alias ip='ip -c'
alias gping='sudo ping -c 3 www.google.com'
alias cal='cal -n 3 -m'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ac='apt-cache search'
alias ag='sudo apt-get install'
alias cs='config status'
alias rs='rsync -avzzh --partial-dir=.rsync-partial --progress'
alias pacman='pacman --color=always'
alias yay='yay --color=always'

alias sps='sudo pacman -S --noconfirm'

alias find-grep='find . -type f -iname "*.sh" -exec grep --color=auto -iH "query" {} \;'
alias spring-jpa='spring init -d=jpa,mysql,lombok --build=maven --package-name ipcode --java-version 1.11 -n Application application-name'
alias pwgen-copy='pwgen -s 15 1 | xsel -b'
alias grep-sort='grep -r --include="*.sh" -l query | xargs grep -c query | sort -n -t: -k2,2 -r'
alias find-root='find / -type f -name "filename" 2>/dev/null'

alias vpn-gpl-on='sudo nmcli con up GPL --ask'
alias vpn-gpl-off='sudo nmcli con down GPL'

alias testdb-exec='mysql -u $USER testdb -e'
alias testdb-read='mysql -u $USER testdb <'
alias mysql-testdb='mysql -u testuser -p testdb'

alias copy-headers="xsel -bo | tr '\n' ',' | csv2md | xsel -bi"
alias copy-body="xsel -bo | sed 's/\t/,/g' | csv2md | sed 2d | xsel -bi"

alias s='subl3 -n'
alias R='R --no-save'

alias temp='TEMP=$(mktemp -d -p /tmp tmp-XXXXX) && cd $TEMP'

alias grepc="grep -hri -C 0 --group-separator=\$'\n-\n'"
