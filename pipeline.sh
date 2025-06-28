#!/bin/bash
# Script para instalar os projetos JP_Paddle_OCR e LLM_Gladiator hospedado no github
# Autor: Atn4s com ajuda da IA 👾

LLM_PATH="LLM_Gladiator/LLM_Gladiator"
OCR_PATH="JP_Paddle_OCR/PaddleOCR"

# Menu_PaddleOCR+LLM_Gladiator
menu_usuario() {
    clear
    echo "[PaddleOCR + LLM_Gladiator]"
    echo "======================="
    echo "1. Instalar PaddleOCR e LLM_Gladiator"
    echo "2. Executar ambos projetos"
    echo "3. Sair"
    echo "======================="
}

instalacao_Paddle_LLM(){
    git clone https://github.com/Atn4s/JP_Paddle_OCR || { echo "Falha no git clone"; exit 1; }
    git clone https://github.com/Atn4s/LLM_Gladiator || { echo "Falha no git clone"; exit 1; }
    cd JP_Paddle_OCR/
    bash install.sh
    cd ..
    rm -rf JP_Paddle_OCR/PaddleOCR/images
    sleep 10
    clear
    cd LLM_Gladiator/
    bash install.sh
    cd ..
    rm -rf LLM_Gladiator/LLM_Gladiator/images
    sleep 10
    clear 
    mkdir images
    ln -s "$(pwd)/images" LLM_Gladiator/LLM_Gladiator/images
    ln -s "$(pwd)/images" JP_Paddle_OCR/PaddleOCR/images
    echo "A instalação do PaddleOCR e LLM_Gladiator foi realizada!"
    echo "Insira suas as imagens na pasta images (ela é um link simbólico para ambos os projetos)"
    echo "Coloque seu arquivo .env no diretório: LLM_Gladiator/LLM_Gladiator"
    sleep 10
}


executar_modelos(){
    pushd "$OCR_PATH"
    if [ -f "bin/activate" ]; then
        source bin/activate
    else
        echo "Ambiente virtual não encontrado em $PWD"
        return 1
    fi
    bash processa_imagens.sh
    echo "O Paddle processou as imagens, elas estão salvas em:"
    echo "Imagens + .txt: PaddleOCR/Resultados_OCR"
    echo "JSON: PaddleOCR/Saida_Processada"
    deactivate
    sleep 10
    clear
    popd
    pushd "$LLM_PATH"
    if [ -f "bin/activate" ]; then
        source bin/activate
    else
        echo "Ambiente virtual não encontrado em $PWD"
        return 1
    fi
    bash processa_LLM.sh
    echo "O LLM_Gladiator processou as imagens, elas estão salvas em:"
    echo "Resultados do LLM: LLM_Gladiator/results"
    echo "JSON Formatado: LLM/Gladiator/resultados_limpos"
    deactivate
    sleep 10
    clear
    popd
    
    mkdir Resultados
    cp LLM_Gladiator/LLM_Gladiator/resultados_limpos/* Resultados/
    cp JP_Paddle_OCR/PaddleOCR/Resultados_OCR/* Resultados/
    cp JP_Paddle_OCR/PaddleOCR/Saida_Processada/* Resultados/
}

while true; do
    menu_usuario
    read -p "Escolha uma opção (1/2/3): " escolha_usuario

    case $escolha_usuario in
        1)
            instalacao_Paddle_LLM
            ;;
        2)
            executar_modelos
            ;;
        3)
            echo "Saindo do programa."
            sleep 1
            clear
            break
            ;;
        *)
            echo "Opcao Invalida, tente novamente."
            ;;
    esac
done
