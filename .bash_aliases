YD="$HOME/Yandex.Disk"

if [ -f "$YD/config/.env" ]; then
    . "$YD/config/.env"
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='composer'
alias hs='history'
alias dl='cd ~/Downloads'
alias yd="cd $YD"
alias yds='yandex-disk status'
alias app='cd ~/Apps'
alias pro='cd ~/Projects'
alias conf='cd ~/.config'
alias www='cd /var/www/html'
alias sites='cd /etc/nginx/sites-enabled'
alias t='tty-clock -c'
alias e='eza'
alias tr='trans en:ru'
alias te='trans ru:en'
alias ys='yadm status'
alias yr='yadm reset --hard HEAD'
alias yu='yadm reset --hard HEAD && yadm pull'
alias ld='lazydocker'
alias lg='lazygit'
alias dbl='doublecmd'
alias w='curl wttr.in'
alias wk='curl wttr.in/kimry'
alias m='micro'
alias n='nvim'
alias ws='webstorm'
alias yt='yt-dlp --format bestaudio --extract-audio --audio-format mp3 \
    -o "$YD/_media/%(title)s [%(id)s].%(ext)s" \
    --cookies-from-browser chrome \
    --proxy "$PROXY_HTTPS"'

# package
alias i='yay -S'
alias r='yay -Rcs'
alias u='yay -Syu'
alias up='all_proxy=$PROXY_HTTP ALL_PROXY=$PROXY_HTTP yay -Syu'
alias yp='yay -Qq > $YD/config/packages_$(hostname -s).txt \
    && yadm commit -a -m "Update: $(date +\"%Y-%m-%d\ %H:%M:%S\")" \
    && yadm push \
    && echo "---------" \
    && yadm show --name-only --pretty=format: HEAD'

# git
alias gs='git status'
alias gf='git fetch'
alias grs='git reset --hard HEAD'
alias gcm='git checkout master'
alias grf='git restore --source origin/master -- '

# docker
alias d='docker'
alias dc='docker compose'
alias dcu='dc up -d'
alias dcd='dc down'
alias dcr='dcd && dcu'
alias dce='docker compose exec'

# tools
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias f="fzf"
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias zed='zeditor'
alias clip='xclip -selection clipboard <'
alias bt='btop'

# 
alias dcw='dce backend bash'
alias dcf='dce frontend bash'
alias dct='dce backend vendor/bin/codecept run -d'
alias dctd='dce backend php -dxdebug.start_with_request=yes ./vendor/bin/codecept run'
alias cc='dce backend rm -rf /app/backend/tests/_output/coverage \
	&& dce backend find /app/backend/logs -type f \( -name \*.log \) -delete \
	&& dce backend find /app/backend/tests/_output -type f \( -name \*.html -o -name \*.json \) -delete \
	&& dce backend find /app/backend/files -type f \( -name \*.csv \) -delete'
alias cons='docker compose exec backend php bin/console'
alias consd='dce backend php -dxdebug.start_with_request=yes bin/console'

# 2fas
alias 2fa-gitlab='oathtool -b --totp "$OTP_GITLAB" | xclip -selection clipboard'
alias 2fa-github='oathtool -b --totp "$OTP_GITHUB" | xclip -selection clipboard'
alias 2fa-binance='oathtool -b --totp "$OTP_BINANCE" | xclip -selection clipboard'
alias 2fa-gosuslugi='oathtool -b --totp "$OTP_GOSUSLUGI" | xclip -selection clipboard'
