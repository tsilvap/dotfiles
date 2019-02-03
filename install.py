#!/usr/bin/env python3
import os
from subprocess import run, PIPE

pkg_mgr = 'dnf'
repo_dir = '/etc/yum.repos.d'
user_home = '/home/yura'


def main():
    # Ensure we are root.
    if os.geteuid() != 0:
        print('Usage: sudo ./install.py')
        return

    # Install Z shell and Oh My Zsh.
    run([pkg_mgr, 'install', 'zsh'])
    p = run([
        'cat',
        './install-oh-my-zsh.sh'
    ], capture_output=True, text=True)
    run([
        'sh',
        '-c',
        p.stdout
        ])
    
    # Install Vim with clipboard support.
    run([pkg_mgr, 'install', 'gvim'])
    with open(f'{user_home}/.zshrc', 'a') as f:
        f.write('alias vim="gvim -v"')

    # Install Git.
    run([pkg_mgr, 'install', 'git'])

    # Install Node.
    run([pkg_mgr, 'install', 'nodejs'])

    # Install Yarn.
    if not os.path.isfile(f'{repo_dir}/yarn.repo'):
        p = run([
            'curl',
            '--silent',
            '--location',
            'https://dl.yarnpkg.com/rpm/yarn.repo'
            ], capture_output=True, text=True)
        # Write Yarn repo into repos directory as root.
        with open(f'{repo_dir}/yarn.repo', 'w') as f:
            f.write(p.stdout)
    run([pkg_mgr, 'install', 'yarn'])


if __name__ == '__main__':
    main()
