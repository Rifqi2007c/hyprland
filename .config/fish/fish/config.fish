if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    sttt scanline --scanline-reverse true -d 0.8
    set -g fish_greeting
end
