# Building systemd rpms in-place, directly from git

- check out this git repo $somewhere
- go to your systemd git
    ln -s $somewhere/[a-z]* .
- call eg ./bb

## how to update

Base:System moves on. To include the changes rebase on it

create a worktree systemd_spec-base_system based on the base_system
branch in the current directory

Run

    ./update_base_system

Check out a new branch with your changes and rebase. Important: the master
branch tracks only merges. This avoids force pushes. The real content is in the
second parent.

    git checkout -b base_system-xxx-mine master^2
    git rebase base_system

When happy update master and push stuff

    git update-ref refs/heads/master $(git commit-tree HEAD^{tree} -p master -p HEAD -m "merge $(git branch --show-current)")
    git push base_system-xxx-mine
    git push origin base_system
    git push origin master
