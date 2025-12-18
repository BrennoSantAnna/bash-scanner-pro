#!/bin/bash

# Cores
VERMELHO="\e[31m"
VERDE="\e[32m"
RESET="\e[0m"

# --- FUNÇÕES ---

validar_ferramentas()
{
	# Testando nmap
	if ! which nmap > /dev/null; then
		echo -e "${VERMELHO}Erro: Nmap não instalado!${RESET}"
		exit 1
	fi

	# Testando netcat
	if ! which nc > /dev/null; then
		echo -e "${VERMELHO}Erro: Netcat não instalado!${RESET}"
		exit 1
	fi
}

function pegar_banner()
{
	echo "GET / HTTP/1.0" | nc -v -w 1 $1 $2 2> /dev/null
}

# --- EXECUÇÃO PRINCIPAL ---

# 1. Validação de entrada
ALVO=$1

if [ -z "$ALVO" ]; then
    echo -e "${VERMELHO}ERRO: Você esqueceu do IP!${RESET}"
    echo "Uso: ./scanner_pro.sh <IP_DO_ALVO>"
    exit 1
fi

# 2. Check-up das ferramentas
validar_ferramentas

echo "Iniciando scan no alvo: $ALVO"

# 3. O Loop de Scan
for PORTA in $(nmap -F $ALVO | grep "open" | cut -d "/" -f 1); do
        echo -e "${VERDE}Porta $PORTA aberta. Pegando banner...${RESET}"
       	pegar_banner $ALVO $PORTA
done
