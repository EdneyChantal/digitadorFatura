# Projeto de Automação com Robot Framework

Este projeto é uma base de **automação de testes** construída em **Python** utilizando o **Robot Framework**, com suporte a testes de **interface web (Browser/Playwright)**, **integrações gRPC**, organização de arquivos, e utilitários auxiliares.

O ambiente foi pensado para ser **reprodutível**, **modular** e adequado a cenários corporativos de QA, incluindo automação funcional, testes de API e testes end‑to‑end.

---

## 📌 Tecnologias Principais

- **Python** (ambiente virtual recomendado)
- **Robot Framework** 7.x
- **Playwright (via robotframework-browser)**
- **gRPC / Protobuf**
- **YAML** para configuração

---

## 📦 Dependências

As dependências do projeto estão definidas no arquivo `requirements.txt`.

### Principais bibliotecas

| Biblioteca | Finalidade |
|---------|-----------|
| `robotframework` | Framework principal de automação |
| `robotframework-browser` | Automação web baseada em Playwright |
| `robotframework-assertion-engine` | Asserções avançadas |
| `grpcio` / `grpcio-tools` | Comunicação e geração de código gRPC |
| `protobuf` | Serialização de mensagens gRPC |
| `PyYAML` | Leitura de arquivos YAML |
| `psutil` | Monitoramento de recursos do sistema |
| `natsort` | Ordenação natural de dados |
| `colorama` | Saída colorida no terminal (Windows/Linux) |
| `typing_extensions` | Tipagens adicionais para Python |

---

## ⚙️ Instalação do Ambiente

### 1️⃣ Criar ambiente virtual (recomendado)

```bash
python -m venv venv
```

Ativar:

- **Windows**
```bash
venv\Scripts\activate
```

- **Linux / macOS**
```bash
source venv/bin/activate
```

---

### 2️⃣ Instalar dependências

```bash
pip install -r requirements.txt
```

---

### 3️⃣ Inicializar o Browser (Playwright)

Após instalar as dependências, é obrigatório inicializar o Browser:

```bash
rfbrowser init
```

Isso fará o download dos navegadores necessários (Chromium, Firefox e WebKit).

---

## ▶️ Executando os Testes

### Executar todos os testes

```bash
robot tests/
```

### Executar um teste específico

```bash
robot tests/nome_do_teste.robot
```

### Executar com logs personalizados

```bash
robot --outputdir results tests/
```

---

## 📁 Estrutura Sugerida do Projeto

```text
project-root/
│
├── tests/                 # Casos de teste Robot Framework
├── resources/             # Keywords reutilizáveis
├── libraries/             # Libraries Python customizadas
├── data/                  # Dados de teste (JSON, YAML, CSV)
├── results/               # Logs e relatórios gerados
├── requirements.txt       # Dependências do projeto
└── README.md              # Documentação
```

---

## 🧪 Tipos de Testes Suportados

- ✅ Testes funcionais
- ✅ Testes end‑to‑end (E2E)
- ✅ Testes de API
- ✅ Testes com mock/interceptação
- ✅ Testes gRPC

---

## 🛠️ Observações Importantes

- Este projeto é compatível com **Windows 10/11**, **Linux** e **macOS**.
- Para ambientes corporativos, recomenda‑se fixar a versão do Python utilizada.
- O uso de **CI/CD (Azure DevOps, GitHub Actions, GitLab CI)** é totalmente compatível.

---

## 📄 Licença

Este projeto é de uso interno/educacional. Ajuste este bloco conforme a política da sua organização.

---

## ✍️ Autor

Projeto mantido por **Edney Chantal**.

Automação, QA e Engenharia de Software.

