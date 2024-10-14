# Nvim through docker

## How to:

### Clone the repo (mostly at ~/)
```bash
git clone https://github.com/ByteShifterz/nvim-config-42
```

### Add aliases in your shell rc
```bash
alias remount-nvim='nvim-config-42/remount.sh'
alias reattach-nvim='docker attach --detach-keys="ctrl-d" nvim'
```

### Add USER and MAIl in shell rc
```bash
USER=
MAIL=
```
