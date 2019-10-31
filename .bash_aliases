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
alias rs='rsync -avzh --partial-dir=.rsync-partial'
alias pacman='pacman --color=always'



alias find-grep='find . -type f -iname "*.sh" -exec grep -iH "query" {} \;'
alias mysql-root='sudo mysql -u root -p'
alias spring-jpa='spring init -d=jpa,mysql,lombok --build=maven --package-name ipcode --java-version 1.11 -n Application application-name'
