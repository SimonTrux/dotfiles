#!/bin/bash
set_symlink() {
    local target_path="$1"
    local symlink_path="$2"
    local ln_opts="$3"

    # Check if the symlink exists
    if [ -L "$symlink_path" ]; then
        # Resolve the actual target of the symlink
        local actual_target
        actual_target=$(readlink -f "$symlink_path")

        # Compare the resolved target with the intended target
        if [ "$actual_target" == "$(realpath "$target_path")" ]; then
            echo "Symbolic link '$symlink_path' already exists and points to the correct target."
            return 0
        else
            echo "Symbolic link '$symlink_path' exists but points to a different target: $actual_target"
            return 1
        fi
    else
        if ln -s $ln_opts $target_path $symlink_path ; then
            echo "Symbolic link '$symlink_path' now set to '$target_path'"
            return 0
        else
            echo "Symbolic link '$symlink_path' does not exist and could not be set."
            return 2
        fi
    fi
}
