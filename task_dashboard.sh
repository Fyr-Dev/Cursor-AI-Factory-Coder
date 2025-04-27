#!/bin/bash
if ! command -v taskmaster &> /dev/null; then
    echo "Taskmaster AI not installed."
    exit 1
fi
while true; do
    clear
    echo "=== Taskmaster Live Dashboard ==="
    taskmaster list
    echo ""
    echo "Commands:"
    echo " [n] Next Task"
    echo " [u] Update Task"
    echo " [q] Quit"
    read -p "Enter command: " cmd
    case $cmd in
        n)
            echo "Moving to Next Task..."
            taskmaster next
            ;;
        u)
            read -p "Enter Task ID to Update: " id
            read -p "Enter Update Prompt: " prompt
            taskmaster update id=$id prompt="$prompt"
            ;;
        q)
            echo "Exiting Dashboard."
            break
            ;;
        *)
            echo "Invalid Command."
            ;;
    esac
done
