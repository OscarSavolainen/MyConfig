#!/bin/bash

# Check if tmux is already running, if not start a new session
if ! tmux has-session -t main 2>/dev/null; then
    # Create a new session named "main" and set the first window
    tmux new-session -d -s main -n kserve -c /home/oscar/NScale/repos/kserve-manifests/

    # Create additional windows with their respective names and starting directories
    tmux new-window -t main:1 -n bench -c /home/oscar/NScale/repos/vLLM-benchmark
    tmux new-window -t main:2 -n config -c /home/oscar/Coding/Mine/MyConfig/config-files
    tmux new-window -t main:3 -n scratch -c /home/oscar/NScale/connecting/workstation
    tmux new-window -t main:4 -n ai-proxy -c /home/oscar/NScale/repos/ai-proxy
    tmux new-window -t main:5 -n home -c /home/oscar

    # Select the first window
    tmux select-window -t main:0
else
    echo "Tmux session 'main' already exists. Attaching to it..."
fi

# Attach to the session
tmux attach-session -t main
