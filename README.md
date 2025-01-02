# Windows Onboarding AI Team

[Click here for English version](README.en.md)

O objetivo deste documento é auxiliar novos membros que cheguem com Windows a configurar seu ambiente de desenvolvimento. Após terminar a configuração que está nesse documento, pode continuar com os passos descritos no AI Eng Docs Hub.

## Observações
- Utilize a **Central de Software** para instalar os softwares necessários.

## Primeiros Passos
1. Instale os seguintes softwares:
   - **Git Client**
   - **Windows Terminal**
   - **VS Code**

## Ambiente de Desenvolvimento (VS Code e WSL2)
Embora seja possível desenvolver diretamente no Windows, isso pode ser complicado devido à adaptação da equipe a ambientes Unix-like. Minha recomendação é utilizar o **[WSL2](https://learn.microsoft.com/pt-br/windows/wsl/install)** integrado ao **VS Code** para uma experiência mais fluida.

Para instalar o WSL2, recomendo seguir [este tutorial](https://drive.google.com/file/d/1-RrB01Yrr5svAGy0sPaRNa4L34dralqc/view) de instalação do Podman aqui na Neon, pois os passos e a ordem de instalação dos pacotes do WSL2 estão lá também.

Para instalar uma distribuição Linux de fato, baixe o arquivo `.appx` [aqui](https://learn.microsoft.com/pt-br/windows/wsl/install-manual#downloading-distributions) e execute-o. Abra o executável novo via Menu Iniciar e, após a configuração inicial, seu Linux estará acessível através de uma guia do Windows Terminal (se tudo correr bem).

### Problema com a rede no WSL2
Eu tive problemas com acesso à rede no WSL2, a solução que encontrei está [nesse repositório](https://github.com/joaooliveira-neon/WSL2-network-fix).

## Extras
Algumas coisas opcionais, mas definitavamente recomendadas.

### Cursor
O Cursor é um fork do VS Code com foco em AI. Peça para algum membro do time te enviar o convite e instale. Ele é capaz de importar as configurações do VS Code e tem a mesma integração com o WSL2.

### Setup do Ubuntu 24.04 (ZSH, plugins e pacotes)
O script `setup.sh` contido nesse repositório vai:
1. Atualizar e fazer upgrade dos pacotes do sistema
2. Instalar ferramentas e utilitários essenciais para desenvolvimento
3. Instalar e configurar o Zsh com o Oh My Zsh
4. Instalar plugins do Zsh (autosuggestions, syntax highlighting, fzf-history-search)
5. Instalar o pyenv para gerenciamento de versões do Python
6. Instalar o cliente PostgreSQL
7. Instalar utilitários do WSL
8. Definir o Zsh como shell padrão

### PowerShell v7
Recomendo instalar e customizar o **PowerShell v7** para melhorar a experiência com a linha de comando no Windows.
