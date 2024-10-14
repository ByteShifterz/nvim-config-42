FROM archlinux:latest

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
      && npm install -g yarn

RUN git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1

CMD ["nvim"]
