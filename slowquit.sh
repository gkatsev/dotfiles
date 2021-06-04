# SlowQuitApps Managing cmd tool
slowquit()
{
    if [ "$1" = 'help' ]; then
        cat <<EOF
slowquit
    is a command line tool to manage https://github.com/dteoh/SlowQuitApps,
    which can delay to quit when pressing the cmd+Q.

Usage:
    slowquit { restart | start | stop } : retart|start|stop SlowQuitApps
    slowquit update                     : update SlowQuitApp
    slowquit config                     : show config
    slowquit delay <number>             : how many ms to wait before quit an app
    slowquit overlay { on|1 | off|0 }   : whether to display the circle with resting wating time
    slowquit whitelist { {ls|clear} | {add|delete} '<app-name>' ['<app-name>' ...] }
                                        : whiltelist apps will be quited without waiting
                                          see /Applications/<app-name>.app for <app-name>
    slowquit doc                        : jump to the online doc
EOF
    elif [ "$1" = 'restart' ]; then
        [ $# -ne 1 ] && slowquit help | grep --color=never -E '(Usage|restart)' && return
        killall SlowQuitApps
        open -a SlowQuitApps
    elif [ "$1" = 'start' ]; then
        [ $# -ne 1 ] && slowquit help | grep --color=never -E '(Usage|start)' && return
        open -a SlowQuitApps
    elif [ "$1" = 'stop' ]; then
        [ $# -ne 1 ] && slowquit help | grep --color=never -E '(Usage|stop)' && return
        killall SlowQuitApps
    elif [ "$1" = 'doc' ]; then
        [ $# -ne 1 ] && slowquit help | grep --color=never -E '(Usage|doc)' && return
        echo 'online doc: https://github.com/dteoh/SlowQuitApps'
        open -a 'Safari' 'https://github.com/dteoh/SlowQuitApps'
    elif [ "$1" = 'update' ]; then
        [ $# -ne 1 ] && slowquit help | grep --color=never -E '(Usage|slowquit update)' && return
        # method1
        brew update
        brew cask reinstall slowquitapps
        # method2
        # brew tap buo/cask-upgrade
        # brew cu slowquitapps

        # take effect
        slowquit restart
    elif [ "$1" = 'config' ]; then
        [ $# -ne 1 ] && slowquit help | grep --color=never -E '(Usage|slowquit config)' && return
        defaults read com.dteoh.SlowQuitApps
    elif [ "$1" = 'delay' ]; then
        shift
        if [ $# -ne 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
            slowquit help | grep --color=never -E '(Usage|slowquit delay)'
        else
            defaults write com.dteoh.SlowQuitApps delay -int "$1"
            slowquit restart
        fi
    elif [ "$1" = 'overlay' ]; then
        shift
        if [ $# -ne 1 ] || ! [[ "$1" =~ ^(on|1|off|0)$ ]]; then
            slowquit help | grep --color=never -E '(Usage|slowquit overlay)'
            return
        elif [ "$1" = 'on' ] || [ "$1" = '1' ]; then
            defaults write com.dteoh.SlowQuitApps displayOverlay -bool YES
            slowquit restart
        elif [ "$1" = 'off' ] || [ "$1" = '0' ]; then
            defaults write com.dteoh.SlowQuitApps displayOverlay -bool NO
            slowquit restart
        fi
    elif [ "$1" = 'whitelist' ]; then
        shift
        if [ "$1" = 'ls' ] || [ "$1" = 'clear' ]; then
            local action="$1"
            shift
            if [ $# -ne 0 ]; then
                slowquit help | grep --color=never -E '(Usage|slowquit whitelist)'
                return
            fi
            local whitelist_not_exist="$( \
            (defaults read com.dteoh.SlowQuitApps whitelist 1>/dev/null) 2>&1 | \
                grep 'The domain/default pair of (com.dteoh.SlowQuitApps, whitelist) does not exist')"

            if [ "${whitelist_not_exist}" != '' ]; then
                if [ "$action" = 'ls' ]; then
                    echo "("$'\n'")"
                elif [ "$action" = 'clear' ]; then
                    :
                fi
            else
                if [ "$action" = 'ls' ]; then
                    defaults read com.dteoh.SlowQuitApps whitelist
                elif [ "$action" = 'clear' ]; then
                    defaults delete com.dteoh.SlowQuitApps whitelist
                    # set an empty whitelist
                    defaults write com.dteoh.SlowQuitApps whitelist -array
                    slowquit restart
                fi
            fi
        elif [ "$1" = 'add' ] || [ "$1" = 'delete' ] ; then
            local action="$1"
            shift
            if [ $# -eq 0 ]; then
                slowquit help | grep --color=never -E '(Usage|slowquit whitelist)'
                return
            fi

            while [ $# -gt 0 ]; do
                local app_name="$1"
                shift
                local id_of_app=$(osascript -e "id of app \"${app_name}\"" 2>/dev/null)

                [ "${id_of_app}" = '' ] && echo "'${app_name}': app id not dound," \
                    ' see `/Applications/<app-name>.app` for <app-name>' && continue

                local exist_in_list=$(defaults read com.dteoh.SlowQuitApps whitelist 2>&1 | grep "${id_of_app}")

                if [ "$action" = 'add' ]; then
                    [ "$exist_in_list" != '' ] && echo "'${app_name}' : already in the whitelist." && continue
                    defaults write com.dteoh.SlowQuitApps whitelist -array-add ${id_of_app}
                    echo "'${app_name}' : added successfully"
                elif [ "$action" = 'delete' ]; then
                    [ "$exist_in_list" = '' ] && echo "'${app_name}' : not in whitelist." && continue

                    local list_id_od_app=()
                    local line=
                    while IFS=$'\n' read -r line; do
                        list_id_od_app+=("${line}")
                    done < <( \
                        defaults read com.dteoh.SlowQuitApps whitelist | grep -E '".+"' | \
                        perl -pe 's/^.*?"//' |  perl -pe 's/".*?$//' | \
                        grep -v "${id_of_app}"
                    )

                    defaults write com.dteoh.SlowQuitApps whitelist -array "${list_id_od_app[@]}"
                    echo "'${app_name}' : deleted successfully"
                fi
            done
            slowquit restart
        else
            slowquit help | grep --color=never -E '(Usage|whitelist)'
        fi
    else
        slowquit help
    fi
}