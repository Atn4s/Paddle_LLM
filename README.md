# 🧠 JP_PaddleOCR + 🤖 LLM_Gladiator Automation Script

Este projeto é um script Bash criado para automatizar a instalação e execução dos projetos [JP_Paddle_OCR](https://github.com/Atn4s/JP_Paddle_OCR) e [LLM_Gladiator](https://github.com/Atn4s/LLM_Gladiator).

---

## ⚙️ O que esse script faz?

- Clona automaticamente os dois repositórios
- Executa os scripts de instalação de cada projeto
- Ativa os ambientes virtuais respectivos
- Processa as imagens com o OCR (PaddleOCR)
- Processa os resultados dos modelos inseridos no LLM_Gladiator:
  - Gemini 2.0 Flash / Gemini 2.5 Pro
  - Gemma 3
  - Llama 3.2 (11B e 90B)
  - Llama 4 (Scout / Maverick)
  - Mistral Medium 3 / Pixtral-12b
  - GPT-4.1 / GPT-4o / GPT-4o-mini
  - Phi-3.5 / Phi-4 multimodal
---

## 🧾 Requisitos

Antes de rodar o script, tenha certeza de que seu ambiente possui:

- Git
- Bash 
- Python 3.12
- Permissões de execução:  
  ```bash
  chmod +x pipeline.sh


## 📂 Diretórios após realizar a instalação

```
Paddle_LLM
├── JP_Paddle_OCR/
│   ├── .git
│   ├── .gitignore
│   ├── install.sh
│   ├── README.md
│   └── PaddleOCR/     
│       ├── bin/activate
│       ├── Modulos/               # Modulos do processamento do PaddleOCR
│       ├── Resultados_OCR/        # Saida dos resultados processados
│       ├── OCRDatabase/           # Diretório onde você deve colocar as imagens para o OCR
│       ├── OCR_schema.py          # Gera JSON estruturado a partir dos resultados
│       ├── PaddleGUI.py           # Script principal do OCR + visualização 
│       └── processa_imagens.sh    # script para fazer OCR em todos as imagens dentro de OCRDatabase/ 
├── LLM_Gladiator/
│   ├── LLM_Gladiator/
│   │       ├── bin/activate
│   │       ├── images/            # Diretório onde você deve colocar as imagens já processadas
│   │       ├── llm_wrappers/      # Configuração dos modelos multimodais utilizados por API
│   │       ├── processa_LLM.sh    # Processamento das imagens e chama o metodo limpeza_json.py
│   │       ├── limpeza_json.py    # limpeza e organização dos JSONs gerados pelos LLMs
│   │       ├── LLM_Gladiator.py   # Script principal de execução
│   │       └── .env               # config. com tokens, credenciais, etc
│   ├── .git
│   ├── .gitignore
│   ├── install.sh
│   └── README.md       
├── .git
├── README.md
└── pipeline.sh
```


## 🚀 Como usar

Basta rodar o script no terminal:

```bash pipeline.sh```

Você verá um menu interativo como este:

```
[PaddleOCR + LLM_Gladiator]
=======================
1. Instalar PaddleOCR e LLM_Gladiator
2. Executar ambos projetos
3. Sair
=======================
```


## Opção 1 - Instalar

Clona os repositórios e executa os scripts install.sh de cada um.


## Opção 2 - Executar

Ativa os ambientes virtuais e roda os scripts de processamento:

    processa_imagens.sh no PaddleOCR

    processa_LLM.sh no LLM_Gladiator

## Opção 3 - Sair


## 📦 Resultados Gerados

    📁 JP_Paddle_OCR/PaddleOCR/Resultados_OCR/: imagens processadas + arquivos .txt

    📁 JP_Paddle_OCR/PaddleOCR/Saida_Processada/: arquivos .json do OCR

    📁 LLM_Gladiator/LLM_Gladiator/results/: saída bruta do LLM

    📁 LLM_Gladiator/LLM_Gladiator/resultados_limpos/: JSON formatado e limpo

## 📌 Observações Finais

    O projeto ainda está em desenvolvimento — fique à vontade para sugerir melhorias!    
