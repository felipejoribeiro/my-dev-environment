#!/bin/bash 
WARNED = false

for f in `ls -A linux_home`; do
  if [ -e ~/$f ] && ! $WARNED; then
    echo Warning: Files will be overwritten if you continue.
    
    while true; do
      echo -n "Continue? (y/n) "
      read user_in
      if ["$user_in" = "y"]; then
        WARNED = true
        break
      elif ["$user_in" = "n"]; then
        exit 0
      fi
    done
  fi
  echo Copying linux_home/$f into place...
  cp linux_home/$f ~ 
done
echo Done


