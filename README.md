# Linux as Code

Declarative deployment powered by [Ansible] and [Nix]

## What is this about?
I've been working towards a fully declarative userspace setup for some time now. I do a significant amount of development on remote, sometimes short-lived environments and, honestly, I don't want to ever run a install script again if I can help it. Although I'm not fully there yet because of a few hard to tame dependencies (looking at you, neovim plugins!), [Nix] and [Home Manager] have all but gotten me to the coveted 100% declarative holy grail.

My end goal was to have a setup I could point at a new SSH-accessible machine and then shortly have everything I care about the most set up comfortably and without any interaction, and it's now a reality.

Previous iterations have been worked on in private, but I've finally cleaned it up enough that I'm comfortable with it now living in a public repository. I've learned a lot from the examples of others so I think it's only right.

## Base Features
Bare minimum CLI-oriented features I always want at hand
- [x] CLI
  - [x] Select [Nerd Fonts] for patched fonts with extra glyphs
  - [x] Productivity and QoL tools such as htop, mcfly, tldr, ripgrep and zoxide
  - [x] Text editors: vim, neovim, kakoune and helix <sub>Why, yes, I *have* been experimenting with modal editors, how could you tell?</sub>
  - [x] ZSH with oh-my-zsh plugins
  - [x] [Nushell](https://www.nushell.sh/)
  - [x] Starship prompt
- [x] Git
  - [x] Default user name and email
  - [x] Deployment of specified GitHub SSH keys

## Extra features
Those are intended for daily driver machines and include GUI applications and storage management. As of now, they're only applied to hosts in the `daily-driver` group.
- [x] Storage setup
  - [x] fstab mounts
  - [x] Linking of Steam compatdata from existing drives to local drive as per the [official recommendation](https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows)
- [ ] GUI applications
  - [ ] [Home Manager] managed
  - [x] Flatpak installs
  - [x] System-level applications for things Flatpaks aren't able to handle well or at all
- [ ] Borg backups

## How it works
The playbook sets up the base features for all hosts, and the extra ones for devices in the daily driver group.

It does so by using Ansible to deploy Nix through the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer), installing [Home Manager] through [a custom role](https://github.com/lpchaim/ansible-roles/tree/main/home-manager) and having the latter do the heavy-lifting. Custom nix modules are copied to HM's config folder and imported in the `home.nix` file, and `home-manager switch` is then run as needed.

## Usage

<details>
<summary>Requirements</summary>
If you have [Nix] installed, running the following command should get you a development shell with all the dependencies you'll need
```sh
nix-shell
```

Otherwise, try your hand at manually installing the python dependencies. This was tested with version `3.11`.
```sh
pip install -r requirements.txt
```
</details>

For a minimal, single host run (the trailing comma matters!)
```sh
ansible-playbook minimal.yml --inventory user@host, --ask-become-pass
```

[ansible]: https://www.ansible.com/
[home manager]: https://nix-community.github.io/home-manager/
[nerd fonts]: https://www.nerdfonts.com/
[nix]: https://nixos.org/
