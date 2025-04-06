#!/bin/bash

# Check if we're already in a tmux session
if [ -n "$TMUX" ]; then
    # Already in tmux, do nothing
    return 0
fi

# Check if tmux server is running (meaning some session exists)
tmux list-sessions &> /dev/null
TMUX_RUNNING=$?

if [ $TMUX_RUNNING -eq 0 ]; then
    # Tmux is already running, attach to the main session
    tmux attach-session -t main
else
    # Tmux is not running, create a new session with all windows
    echo "Starting new tmux session with predefined windows..."
    
    # Create a new session named "main" and set the first window
    tmux new-session -d -s main -n kserve -c /home/oscar/NScale/repos/kserve-manifests/
    
    # Create additional windows with their respective names and starting directories
    tmux new-window -t main:2 -n bench -c /home/oscar/NScale/repos/vLLM-benchmark
    tmux new-window -t main:3 -n config -c /home/oscar/Coding/Mine/MyConfig/config-files
    tmux new-window -t main:4 -n scratch -c /home/oscar/NScale/connecting/workstation
    tmux new-window -t main:5 -n ai-proxy -c /home/oscar/NScale/repos/ai-proxy
    tmux new-window -t main:6 -n home -c /home/oscar
    
    # Select window
    tmux select-window -t main:2
    
    # Attach to the session
    tmux attach-session -t main
fi
