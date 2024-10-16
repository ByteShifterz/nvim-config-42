FROM archlinux:latest

# Installation des paquets nécessaires, y compris Zsh
RUN pacman -Syu --noconfirm \
      git \
      nodejs \
      npm \
      neovim \
      ripgrep \
      base-devel \
      wget \
      curl \
      unzip \
      ttf-jetbrains-mono-nerd \
      python3 \
      zsh \
      && npm install -g yarn

RUN git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1

RUN python3 -m venv /root/.venv \
    && source /root/.venv/bin/activate \
    && python3 -m pip install --upgrade pip setuptools \
    && python3 -m pip install norminette \
    && echo "export PATH=\$PATH:/root/.venv/bin" >> /root/.zshrc \
    && deactivate

# Change le shell par défaut à Zsh
CMD ["/bin/zsh", "-c", "source /root/.zshrc && nvim"]
