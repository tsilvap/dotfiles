#!/usr/bin/env python3
import os
from subprocess import run

pkg_mgr = 'dnf'
repo_dir = '/etc/yum.repos.d'


def main():
    # Install Z shell and Oh My Zsh.
    run(['sudo', pkg_mgr, 'install', 'zsh'])
    p = run([
        'sh',
        '-c',
        '"$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
        ])
    
    # Install Vim with clipboard support.
    run(['sudo', pkg_mgr, 'install', 'gvim'])
    with open(os.path.expanduser('~/.zshrc'), 'a') as f:
        f.write('alias vim="gvim -v"')

    # Install Git.
    run(['sudo', pkg_mgr, 'install', 'git'])

    # Install Node.
    run(['sudo', pkg_mgr, 'install', 'nodejs'])

    # Install Yarn.
    if not os.path.isfile(f'{repo_dir}/yarn.repo'):
        p = run([
            'curl',
            '--silent',
            '--location',
            'https://dl.yarnpkg.com/rpm/yarn.repo'
            ], capture_output=True, text=True)
        # Write Yarn repo into repos directory as root.
        run(['sudo', 'su'])
        with open(f'{repo_dir}/yarn.repo', 'w') as f:
            f.write(p.stdout)
        run(['exit'])
    run(['sudo', pkg_mgr, 'install', 'yarn'])


if __name__ == '__main__':
    main()
