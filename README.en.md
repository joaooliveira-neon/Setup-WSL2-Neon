# Windows-Onboarding-AI-Team

[Clique aqui para a versão em português](README.md)

The purpose of this document is to assist new members arriving with Windows in setting up their development environment. After completing the setup outlined in this document, you can proceed with the steps described in the AI Eng Docs Hub.

## Notes
- Use the **Software Center** to install the necessary software.

## First Steps
1. Install the following software:
   - **Git Client**
   - **Windows Terminal**
   - **VS Code**

## Development Environment (VS Code and WSL2)
Although it is possible to develop directly on Windows, this can be complicated due to the team's adaptation to Unix-like environments. My recommendation is to use **[WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)** integrated with **VS Code** for a smoother experience.

To install WSL2, I recommend following [this tutorial](https://drive.google.com/file/d/1-RrB01Yrr5svAGy0sPaRNa4L34dralqc/view) for installing Podman here at Neon, as the steps and the order of WSL2 package installations are also covered there.

To install a Linux distribution, download the `.appx` file [here](https://learn.microsoft.com/en-us/windows/wsl/install-manual#downloading-distributions) and run it. Open the new executable via the Start Menu, and after the initial setup, your Linux will be accessible through a tab in Windows Terminal (if everything goes well).

### Network Issue with WSL2
I had network access issues with WSL2, and the solution I found is [in this repository](https://github.com/joaooliveira-neon/WSL2-network-fix).

## Extras
Some optional but definitely recommended items.

### Cursor
Cursor is a fork of VS Code focused on AI. Ask a team member to send you the invitation and install it. It can import the VS Code settings and has the same integration with WSL2.

### Ubuntu 24.04 Setup (ZSH, plugins, and packages)
The `setup.sh` script in this repository will:
1. Update and upgrade the system packages
2. Install essential tools and utilities for development
3. Install and configure Zsh with Oh My Zsh
4. Install Zsh plugins (autosuggestions, syntax highlighting, fzf-history-search)
5. Install pyenv for managing Python versions
6. Install the PostgreSQL client
7. Install WSL utilities
8. Set Zsh as the default shell

### PowerShell v7
I recommend installing and customizing **PowerShell v7** to enhance the command line experience on Windows.
