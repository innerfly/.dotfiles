YD="$HOME/Yandex.Disk"

alias ll='ls -alF'
alias la='ls -A'
alias c='composer'
alias hs='history'
alias dl='cd ~/Downloads'
alias yd="cd $YD"
alias yds='yandex-disk status'
alias ydr='yandex-disk stop && yandex-disk start'
alias app='cd ~/Applications'
alias pro='cd ~/Projects'
alias conf='cd ~/.config'
alias www='cd /var/www/html'
alias sites='cd /etc/nginx/sites-enabled'
alias t='tty-clock -c'
alias tr='trans en:ru'
alias te='trans ru:en'
alias ys='yadm status'
alias yr='yadm reset --hard HEAD'
alias yu='yadm reset --hard HEAD && yadm pull'
alias ydf='yadm diff'
alias ld='lazydocker'
alias lg='lazygit'
alias dbl='doublecmd'
alias w='curl wttr.in'
alias wk='curl wttr.in/kimry'
alias m='micro'

alias yt='yt-dlp \
    --proxy "$PX" \
    --format bestaudio \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 0 \
    --output "$YD/_media/%(title)s [%(id)s].%(ext)s" \
    --cookies-from-browser chrome'

# package
alias i='paru -S'
alias r='paru -Rcs'
alias u='paru -Syu'

alias yp='paru -Qq > $YD/config/packages_$(hostname -s).txt \
    && cp $HOME/.env $YD/config/ \
    && cp $HOME/.config/zed/*.json $YD/config/zed/ \
    && cp -r $HOME/.ssh $YD/config/ \
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
alias l='eza -lh --group-directories-first --icons=auto'
alias z='zellij'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias f="fzf"
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias zed='zeditor'
alias open='nautilus'
alias clip='xclip -selection clipboard <'
alias bt='btop'
alias oc='opencode'
alias gem='gemini'
alias pxt='cd ~/Projects/proxy-health-checker/ && go run main.go && cd -'

# gm
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
alias 2fa-sklad='oathtool -b --totp "$OTP_SKLAD" | xclip -selection clipboard'
alias 2fa-flexcard='oathtool -b --totp "$OTP_FLEXCARD" | xclip -selection clipboard'
