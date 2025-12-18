# Service Banner Grabber

Um script de automação em Bash para reconhecimento de redes (Recon).
Esta ferramenta identifica portas abertas em uma alvo e captura os "banners" dos serviços serviços rodando, permitindo identificar versões de software e potenciais vulnerabilidades.

> **Nota Educacional:** Ferramenta desenvolvida para fins de estudo em Cibersegurança ou Administração de Sistemas.

## Funcionalidades

- **Port Scanning Automático:** Utiliza o `nmap` para varredura rápida (-F). 
- **Banner Grabbing:** Interage com as portas abertas via `netcat` para extrair cabeçalhos HTTP e SSH.
- **Feedback Visual:** Saída colorida para diferenciar sucessos, erros e status.
- **Robustez:** Verifica dependências e valida entradas antes da execução.
- **Modularidade:** Código organizado em funções para facilitar a manutenção.

## Pré-requisitos

Para funcionar, o script depende das seguintes ferramenteas instaladas no Linux:

- Nmap
- Netcat (versão tradicional ou OpenBSD)

```bash
# No Ubuntu/Debian/Kali:
sudo apt update 
sudo apt install nmap netcat-traditional
```

## Instalação e Uso
1. Clone o repositório:
```bash
git clone [https://github.com/BrennoSantAnna/bash-scanner-pro](https://github.com/BrennoSantAnna/bash-scanner-pro)
cd nome-do-repo
```

2. Dê permissão de execução:
```bash
chmod +x scanner_pro.sh
```

3. Execute apontando para o alvo:
```bash
./scanner_pro.sh 192.168.1.10
# Ou
./scanner_pro.sh scanme.nmap.org
```

## Exemplo de Saída
```bash
Iniciando scan no alvo: scanme.nmap.org
Porta 22 aberta. Pegando banner...
SSH-2.0-OpenSSH_7.4
Porta 80 aberta. Pegando banner...
HTTP/1.1 200 OK
Server: Apache/2.4.6 (CentOS)
```

## Contribuição
Este é um projeto de estudo. Sinta-se à vontade para fazer forks e sugerir melhorias!