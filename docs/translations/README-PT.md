# 🛰️ @synapxlab/tracking-npm

[![npm version](https://img.shields.io/npm/v/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Rastreie o uso real do seu pacote NPM em produção.
Lista completa de **domínios** que usam seu pacote.

## 📦 Instalação

### 1️⃣ Obtenha sua chave de instalação

1. Faça login em **https://synapx.fr/OAuth/** via GitHub (grátis e rápido)
2. Na seção **"Tracking NPM"**, adicione o nome do seu pacote npm
3. Copie o código JS gerado com sua chave (64 caracteres hexadecimais)

### 2️⃣ Código JS e chave de instalação disponível para copiar/colar

```bash
npm install @synapxlab/tracking-npm
```

### 3️⃣ Cole em sua biblioteca

Exemplo de saída:

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

trackingnpm.init({
  package_key: 'SUA_CHAVE_64_CARACTERES_AQUI', // gerada em synapx.fr
  version: '1.0.0'
});
```

### Configuração avançada

```javascript
trackingnpm.init({
  package_key: 'sua-chave-64-caracteres',
  version: '1.0.0',
  DELAY_MS: 15000,  // Esperar 15 segundos em vez de 10
  CHANCE: 0.05      // 5% de probabilidade em vez de 1%
});
```

## 📝 Documentação para adicionar ao seu README

Informe seus usuários que você usa este rastreador:

```markdown
## Tracking
Este pacote integra @synapxlab/tracking-npm para coletar 
estatísticas anônimas sobre `o nome do seu pacote`.
```

## ✨ Como funciona?

- **⏱️ Execução atrasada**: Espera 10 segundos antes de executar
- **🎯 Detecção de ociosidade**: Usa `requestIdleCallback` (fallback de 1s)
- **📊 Amostragem probabilística**: 1% de chance de execução por padrão (configurável)
- **🪶 Zero dependências**: Leve e autônomo **1kb**
- **🔒 Focado em privacidade**: Rastreia apenas a versão do pacote e o domínio
- **⚡ Não bloqueante**: Nunca impacta o desempenho da sua aplicação
- **⚡ Tracking**: Envia um POST leve para `https://npm.synapx.fr` **< 20ms**

**O que é rastreado**:

- ✅ Nome do domínio (host)

**O que NÃO é rastreado**:

- ❌ Nenhum dado pessoal
- ❌ Nenhuma informação do usuário
- ❌ Nenhum histórico de navegação
- ❌ Nenhum dado sensível

## 🔒 Privacidade e segurança

- ✅ Endpoint com CORS ativado
- ✅ Sem cookies
- ✅ Sem localStorage
- ✅ Código aberto
- ✅ Coleta mínima de dados
- ✅ Respeita a privacidade do usuário

## 📊 Veja suas estatísticas

1. Faça login em **https://synapx.fr**
2. Acesse seu painel de controle
3. Consulte as estatísticas dos seus pacotes:
   - 📈 Número de instalações
   - 🌍 Domínios usando seu pacote e a versão em produção


### 📦 Download
File name : `PakageName.json`
```json
{
  "package": "@synapxlab/cookie-consent",
  "sk_live": "8c0cf425d8bf3a7a5591d41916ba4357bf5f48d6ea5fe9e5e5c6ab98eb7cec7c",
  "total_hosts": 2,
  "hosts": [
    {
      "host": "example.com",
      "version": "2.1.3",
      "last_ping": "2025-10-27 09:12:00",
      "total_pings": 5
    },
    {
      "host": "another-site.fr",
      "version": "2.1.3",
      "last_ping": "2025-10-27 09:12:00",
      "total_pings": 15
    }
  ]
}

```
>    Os campos last_ping e total_pings são essenciais para ajustar de forma inteligente a frequência de ping no lado do cliente (escala, atraso, etc.).
>   O objetivo é alcançar uma configuração estável com cerca de um ping por semana por domínio, suficiente para garantir estatísticas fiáveis sem criar carga desnecessária.
> 
> ⏳ Os dados são eliminados automaticamente após 90 dias para cumprir os princípios de minimização de dados e os requisitos do RGPD.


## ❓ FAQ

### O rastreamento deixa minha aplicação mais lenta?

Não!

- Espera 10 segundos antes de executar
- Executa durante o tempo ocioso do navegador
- Executa apenas em 1% dos casos
- Falha silenciosamente sem impactar seu código

### Meus usuários devem ser informados?

Sim! Por transparência, mencione o uso do rastreador no seu README.

### É compatível com todos os frameworks?

Sim!

- ✅ React / Next.js / Remix
- ✅ Vue / Nuxt
- ✅ Angular
- ✅ Svelte / SvelteKit
- ✅ Vanilla JavaScript
- ✅ Node.js (com fallback)

### Quanto custa?

É grátis! 🎉

## 🔧 Suporte

- Painel: https://synapx.fr
- Suporte: [contact@synapx.fr](mailto:contact@synapx.fr)

### Documentação

- Guia completo: https://synapx.fr/sdk/Tracking_NPM/
- NPM: https://www.npmjs.com/package/@synapxlab/tracking-npm
- 🐙 [Repositório GitHub](https://github.com/synapxLab/tracking-npm)
- 📦 [Pacote NPM](https://www.npmjs.com/package/@synapxlab/tracking-npm)
- 🔑 [Obter uma chave](https://synapx.fr/OAuth/)
- 📊 [Painel](https://synapx.fr/)

## 📄 Licença

MIT © [Synapx Lab](https://synapx.fr/)
