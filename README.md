Com certeza! Vou criar um README.md completo para o seu projeto Prolog de recomendação de trilha acadêmica, incluindo a explicação do funcionamento e como rodar.

---

## README.md

# Sistema Especialista para Recomendação de Trilha Acadêmica

## Visão Geral do Projeto

Este projeto consiste em um Sistema Especialista desenvolvido em Prolog, cujo objetivo é auxiliar estudantes de cursos de tecnologia a escolher uma trilha de especialização. O sistema interage com o usuário através de um questionário dinâmico, coleta suas preferências e habilidades e, com base em uma base de conhecimento predefinida e um motor de inferência, sugere uma ou mais trilhas acadêmicas, justificando as recomendações.

## Código de Ética

Este trabalho é um esforço individual ou em grupo. É permitido discutir com colegas, professores e consultar diversas fontes (livros, bibliotecas, internet). No entanto, o uso de ferramentas de Inteligência Artificial para gerar o trabalho é estritamente proibido. **Qualquer indicação de plágio ou uso de IA para desenvolver o trabalho resultará na anulação.**

## Avaliação e Entrega

Os trabalhos serão avaliados quanto à originalidade, autoria do código e correção. A entrega é feita através de um link para um repositório público no GitHub. A participação individual será validada pelos logs de commit. Uma prova de autoria oral será realizada, e a falha implicará em redução da nota.

## Tecnologias Utilizadas

*   **Prolog**: Linguagem de programação lógica.
*   **SWI-Prolog** (ou similar): Ambiente para execução do código Prolog.

## Estrutura do Repositório

O repositório está organizado da seguinte forma:

```
.
├── base_conhecimento.pl
├── perfil1.pl
├── perfil2.pl
├── perfil3.pl
└── README.md
```

*   **`base_conhecimento.pl`**: Contém toda a lógica do sistema, incluindo fatos (trilhas, perfis, perguntas) e regras (motor de inferência, cálculo de pontuação, exibição de resultados).
*   **`perfil1.pl`**, **`perfil2.pl`**, **`perfil3.pl`**: Arquivos de teste que simulam diferentes perfis de alunos com respostas predefinidas para as perguntas.
*   **`README.md`**: Este arquivo, com a documentação do projeto.

## Como Compilar e Executar

### Pré-requisitos

Certifique-se de ter um interpretador Prolog instalado, como o [SWI-Prolog](https://www.swi-prolog.org/download/stable).

### Modo Interativo (Questionário)

Para rodar o sistema no modo interativo, onde o usuário responde às perguntas:

1.  Clone este repositório para sua máquina local:
    ```bash
    git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
    cd SEU_REPOSITORIO
    ```
2.  Abra o interpretador SWI-Prolog.
3.  Carregue o arquivo `base_conhecimento.pl` usando o predicado `consult/1`:
    ```prolog
    ?- consult('base_conhecimento.pl').
    ```
4.  Inicie o sistema chamando o predicado `iniciar/0`:
    ```prolog
    ?- iniciar.
    ```
    O sistema fará uma série de perguntas (s/n). Responda `s` para "sim" e `n` para "não".
    
    ```
    Sistema Especialista para Recomendação de Trilha Acadêmica
    Você tem interesse em treinar ou aplicar modelos de machine learning? (s/n)? s
    Você gosta de programar regras de negócio e construir APIs? (s/n)? n
    ...
    ```

### Modo de Teste (Com Perfil Pré-definido)

Para testar o sistema com um perfil de aluno pré-definido (sem a necessidade de responder às perguntas):

1.  Siga os passos 1 e 2 do "Modo Interativo" para clonar o repositório e abrir o interpretador Prolog.
2.  Carregue o arquivo `base_conhecimento.pl`:
    ```prolog
    ?- consult('base_conhecimento.pl').
    ```
3.  Execute o sistema com um dos arquivos de perfil de teste (ex: `perfil1.pl`):
    ```prolog
    ?- iniciar_com_perfil('perfil1.pl').
    ```
    Você pode substituir `'perfil1.pl'` por `'perfil2.pl'` ou `'perfil3.pl'` para testar outros perfis.

### Execução Online (Opcional)

Se o aluno desejar, o sistema pode ser executado em ambientes online como o [SWISH Prolog](https://swish.swi-prolog.org/). Basta copiar o conteúdo de `base_conhecimento.pl` para o editor do SWISH e executar os predicados `iniciar.` ou `iniciar_com_perfil('perfil1.pl').` diretamente na área de consulta.

## Como Funciona o Sistema

O sistema especialista é construído sobre três pilares principais:

1.  **Base de Conhecimento (`base_conhecimento.pl`)**:
    *   **Fatos**: Descrevem o domínio do problema.
        *   `trilha(Nome, Descricao)`: Define as trilhas de especialização (ex: 'Inteligencia Artificial', 'Desenvolvimento Backend') e suas descrições.
        *   `perfil(Trilha, Caracteristica, Peso)`: Associa características de perfil (ex: `machine_learning`, `programacao_backend`) a cada trilha com um peso de relevância (1 a 5).
        *   `pergunta(Id, Texto, Caracteristica)`: Mapeia cada pergunta do questionário a uma característica de perfil.
    *   **Regras**: Definem a lógica de raciocínio.
        *   Controlam o fluxo do questionário (`faz_perguntas`, `perguntar_usuario`).
        *   Armazenam dinamicamente as respostas do usuário (`assertz(resposta(Id, Resp))`).
        *   Calculam a pontuação de compatibilidade para cada trilha (`calcula_pontuacao`, `calcula_todas_trilhas`).
        *   Ordenam as trilhas por pontuação (`ordena_trilhas`).
        *   Identificam a(s) trilha(s) mais recomendada(s) (`encontra_melhor_trilha`).
        *   Exibem os resultados e as justificativas de forma organizada (`exibe_todas_trilhas`, `exibe_resultado`, `exibe_justificativa`).

2.  **Motor de Inferência**: É o próprio mecanismo de resolução do Prolog. Ele usa as regras definidas na base de conhecimento para:
    *   Fazer perguntas ao usuário sequencialmente.
    *   Coletar e registrar as respostas.
    *   Ativar as regras que calculam a pontuação de cada trilha com base nas respostas "sim" do usuário e nos pesos das características de perfil.
    *   Identificar a(s) trilha(s) com a maior pontuação.
    *   Gerar uma justificativa, mostrando quais características e perguntas contribuíram para a recomendação.

3.  **Interface com o Usuário**: A interação é via terminal, com perguntas de "sim" ou "não" e a apresentação dos resultados ao final.

## Divisão de Tarefas Sugerida (Exemplo de Projeto em Grupo)

Para um projeto em grupo, as tarefas podem ser divididas da seguinte forma:

*   **Aluno 1: Modelagem da Base de Conhecimento**
    *   Responsabilidades: Definir trilhas, características de perfil e seus pesos, e elaborar as perguntas.
    *   Entregável: `base_conhecimento.pl` (fatos iniciais).

*   **Aluno 2: Implementação do Motor de Inferência**
    *   Responsabilidades: Desenvolver as regras em Prolog para calcular pontuações, ordenar e encontrar as melhores trilhas.
    *   Entregável: Predicados como `recomenda/2`, `calcula_pontuacao/3`, etc.

*   **Aluno 3: Interface com o Usuário e Fluxo de Execução**
    *   Responsabilidades: Implementar predicados para interação (perguntas, leitura de respostas) e o fluxo principal do programa.
    *   Entregável: Predicados como `iniciar/0`, `faz_perguntas/0`, `exibe_resultado/1`.

*   **Aluno 4: Testes, Documentação e Gerenciamento do Repositório**
    *   Responsabilidades: Criar os arquivos de teste (`perfil_X.pl`), desenvolver predicados para carregá-los, manter o GitHub e escrever o `README.md`.
    *   Entregável: `perfil_X.pl`, predicados de teste e `README.md` completo.

## Contribuições

Este projeto foi desenvolvido por:

*   **Bernardo czizyk** (Usuário GitHub: `@BBernardoC`)
*   **Mateus Filipe Monfort Vieira da Cunha** (Usuário GitHub: `@MateusMonfort`)
*   **Gregory Keune Rodrigues** (Usuário GitHub: `@gregorykeune`)
*   **Gabriel Baú Herkert** (Usuário GitHub: `@ogabrielbau`)

**Instituição:** PUCPR
**Disciplina:** Programação Lógica e Funcional
**Professor:** FRANK COELHO DE ALCANTARA


---
