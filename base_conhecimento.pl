:- dynamic resposta/2.

% --- Definição das trilhas com descrição ---
trilha('Inteligencia Artificial', 'Treinamento e aplicação de modelos de machine learning e IA.').
trilha('Desenvolvimento Backend', 'Programar APIs, regras de negócio e soluções escaláveis no backend.').
trilha('Analise de Dados', 'Análise de grandes volumes de dados para extrair insights e conhecimento.').
trilha('DevOps', 'Automatizar processos de infraestrutura, deploy e monitoramento de sistemas.').
trilha('Product Owner', 'Gerenciar produtos, requisitos e traduzir necessidades de clientes em funcionalidades.').

% --- Características de Perfil: Habilidades e interesses com peso de relevância (1 a 5) ---
perfil('Inteligencia Artificial', machine_learning, 5).
perfil('Inteligencia Artificial', analise_dados, 3).
perfil('Inteligencia Artificial', visao_computacional, 5).


perfil('Desenvolvimento Backend', programacao_backend, 5).
perfil('Desenvolvimento Backend', manipulacao_dados, 3).
perfil('Desenvolvimento Backend', backend_performance, 5).

perfil('Analise de Dados', machine_learning, 4).
perfil('Analise de Dados', analise_dados, 5).
perfil('Analise de Dados', manipulacao_dados, 5).

perfil('DevOps', infraestrutura, 5).
perfil('DevOps', pipelines_ci, 5).
perfil('DevOps', backend_performance, 3).

perfil('Product Owner', analise_dados, 2).
perfil('Product Owner', gestao_pessoas, 5).
perfil('Product Owner', comunicacao_cliente, 5).

% --- Perguntas para o Usuário: Mapeiam interesses do usuário às características de perfil ---
pergunta(1, 'Você tem interesse em treinar ou aplicar modelos de machine learning?', machine_learning).
pergunta(2, 'Você gosta de programar regras de negócio e construir APIs?', programacao_backend).
pergunta(3, 'Você se interessa por analisar grandes volumes de dados para gerar insights?', analise_dados).
pergunta(4, 'Você gosta de automatizar processos de infraestrutura e deploy?', infraestrutura).
pergunta(5, 'Você prefere lidar mais com pessoas, requisitos e gestão de produto do que programar?', gestao_pessoas).
pergunta(6, 'Você tem interesse em trabalhar com algoritmos de visão computacional ou NLP?', visao_computacional).
pergunta(7, 'Você gosta de otimizar consultas em bancos de dados e manipular dados estruturados?', manipulacao_dados).
pergunta(8, 'Você tem afinidade com pipelines de integração contínua e monitoramento de sistemas?', pipelines_ci).
pergunta(9, 'Você se sente confortável em traduzir necessidades de clientes em funcionalidades de software?', comunicacao_cliente).
pergunta(10, 'Você tem interesse em desenvolver soluções escaláveis e de alta performance no backend?', backend_performance).

% --- Início do programa ---
iniciar :-
    write('Sistema Especialista para Recomendação de Trilha Acadêmica'), nl,
    faz_perguntas,
    calcula_todas_trilhas(TrilhasComPontuacao),
    ordena_trilhas(TrilhasComPontuacao, TrilhasOrdenadas),
    exibe_todas_trilhas(TrilhasOrdenadas),
    encontra_melhor_trilha(TrilhasOrdenadas, TrilhasFinais),
    exibe_resultado(TrilhasFinais),
    exibe_justificativa(TrilhasFinais).

iniciar_com_perfil(ArquivoPerfil) :-
    consult(ArquivoPerfil),
    calcula_todas_trilhas(TrilhasComPontuacao),
    ordena_trilhas(TrilhasComPontuacao, TrilhasOrdenadas),
    exibe_todas_trilhas(TrilhasOrdenadas),
    encontra_melhor_trilha(TrilhasOrdenadas, TrilhasFinais),
    exibe_resultado(TrilhasFinais),
    exibe_justificativa(TrilhasFinais).

% --- Perguntar usuário ---
faz_perguntas :-
    pergunta(Id, Texto, _),
    perguntar_usuario(Texto, Resp),
    assertz(resposta(Id, Resp)),
    fail.
faz_perguntas.

perguntar_usuario(Texto, Resp) :-
    format('~w (s/n)? ', [Texto]),
    read(R),
    ( (R = s ; R = n) -> Resp = R
    ; write('Resposta inválida. Digite s ou n.'), nl,
      perguntar_usuario(Texto, Resp)).

% --- Exibe todas as trilhas com pontuação ---
exibe_todas_trilhas([]).
exibe_todas_trilhas([Trilha-Pont|T]) :-
    trilha(Trilha, Desc),
    nl,
    format('Trilha: ~w -> Pontuação: ~w~nDescrição: ~w~n~n', [Trilha, Pont, Desc]),
    exibe_todas_trilhas(T).

% --- Exibir resultado ---
exibe_resultado([]).
exibe_resultado([Trilha]) :-
    format('~nTrilha recomendada: ~w~n', [Trilha]).
exibe_resultado(Trilhas) :-
    format('~nTrilhas recomendadas (empate): ~w~n', [Trilhas]).

% --- Justificativa melhorada ---
exibe_justificativa([]).
exibe_justificativa([Trilha|T]) :-
    format('~nJustificativa para a trilha ~w:~n', [Trilha]),
    forall(
        (resposta(Id, s), 
         pergunta(Id, TextoPergunta, Caracteristica),
         perfil(Trilha, Caracteristica, Pontos), 
         Pontos > 0),
        (format('Pergunta: ~w~n', [TextoPergunta]),
         format('Característica: ~w -> Pontos: ~w~n~n', [Caracteristica, Pontos]))
    ),
    exibe_justificativa(T).

% --- Calcula pontuação de todas as trilhas ---
calcula_todas_trilhas(ListaTrilhas) :-
    findall(Trilha-Pont,
        (trilha(Trilha, _),
         calcula_pontuacao(Trilha, Pont)),
        ListaTrilhas).

% --- Calcula pontuação de uma trilha ---
calcula_pontuacao(Trilha, Total) :-
    findall(Pontos,
            (resposta(Id, s), 
            pergunta(Id, _, Caracteristica),
            perfil(Trilha, Caracteristica, Pontos)),
            ListaPontos),
    sum_list(ListaPontos, Total).

% --- Ordena trilhas por pontuação decrescente ---
ordena_trilhas(Lista, Ordenada) :-
    sort(2, @>=, Lista, Ordenada).

% --- Encontra todas as trilhas com maior pontuação ---
encontra_melhor_trilha(Lista, TrilhasFinais) :-
    findall(Pont, member(_-Pont, Lista), Pontos),
    max_list(Pontos, Max),
    findall(Trilha, member(Trilha-Max, Lista), TrilhasFinais).
