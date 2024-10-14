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

RUN python3 -m venv /root/.venv \
    && source /root/.venv/bin/activate \
    && python3 -m pip install --upgrade pip setuptools \
    && python3 -m pip install norminette \
    && echo "export PATH=\$PATH:/root/.venv/bin" >> /root/.shrc \
    && deactivate

CMD ["/bin/bash", "-c", "source /root/.shrc && nvim"]
