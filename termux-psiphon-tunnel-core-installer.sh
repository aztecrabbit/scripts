#!/bin/bash

CC='[0m'
R1='[31;1m'
G1='[32;1m'
Y1='[33;1m'

log()
{
    echo -e "${G1}${2}${1}${CC}"
}

execute()
{
    log "Executing \"$*\""
    log
    log

    if $* 2>&1; then
        log
        log

    else
        log
        log
        log "Executing \"$*\" Failed" ${R1}
        exit

    fi
}

printf "\ec"

log "Termux Psiphon Tunnel Core Installer [Version. 1.3.191106]"
log "(c) 2019 Aztec Rabbit."
log

execute pkg upgrade
execute pkg install git golang

cd ~

execute rm -rf ~/go/src/github.com/Psiphon-Labs/psiphon-tunnel-core ~/psiphon-tunnel-core
execute go get -u github.com/Psiphon-Labs/psiphon-tunnel-core
execute cd ~/go/src/github.com/Psiphon-Labs/psiphon-tunnel-core/ConsoleClient
execute go build -ldflags="-s -w" -o ~/psiphon-tunnel-core

cd ~

log "Done"
