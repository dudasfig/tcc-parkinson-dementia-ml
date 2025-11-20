#!/bin/bash

echo "==============================================="
echo "   🔥 Otimizando Mac antes de rodar os modelos"
echo "==============================================="

# 1) Fechar aplicativos pesados
echo "➡️ Fechando aplicativos pesados..."
osascript -e 'quit app "Google Chrome"' >/dev/null 2>&1
osascript -e 'quit app "Slack"' >/dev/null 2>&1
osascript -e 'quit app "Discord"' >/dev/null 2>&1
osascript -e 'quit app "Spotify"' >/dev/null 2>&1
osascript -e 'quit app "Telegram"' >/dev/null 2>&1
osascript -e 'quit app "WhatsApp"' >/dev/null 2>&1

# 2) Limpar processos zumbis
echo "➡️ Encerrando processos zumbis de Python, Jupyter e Chrome..."
pkill -f "python" >/dev/null 2>&1
pkill -f "jupyter" >/dev/null 2>&1
pkill -f "Google Chrome Helper" >/dev/null 2>&1

# 3) Limpar RAM
echo "➡️ Limpando memória RAM..."
sudo purge

# 4) Limpar caches
echo "➡️ Limpando caches do sistema..."
sudo rm -rf /Library/Caches/*
sudo rm -rf ~/Library/Caches/*

# 5) Resetar swap
echo "➡️ Resetando arquivos de SWAP..."
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist
sudo rm -f /private/var/vm/swapfile*
sudo launchctl load /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist

# 6) Desativar Spotlight (ganho de CPU)
echo "➡️ Desativando indexação Spotlight temporariamente..."
sudo mdutil -a -i off

# 7) Limpar histórico de buffers
echo "➡️ Limpando buffers..."
sync && sudo purge

echo "==============================================="
echo "   ✅ Pronto! Seu Mac está otimizado"
echo "   Agora pode rodar o SVM/GB tranquilamente ✨"
echo "==============================================="

