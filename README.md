## PC as Code

### An Ansible playbook to deploy my personal daily driver Linux box

I'm not even close to ready to commit to a proper, all-encompassing solution such as NixOS, so I conceived this as a happy medium of sorts.

#### Currently sets up:
- System packages and user flatpaks
- Existing Steam library mount points and compatdata according to the [official recommendation](https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows)
- Oh my Zsh setup
- Initial git setup
- Single user Nix package manager for declarative development environments
#### Supported distro families
- REHL
- Debian
