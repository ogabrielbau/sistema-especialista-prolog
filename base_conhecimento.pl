/* trilha(IA) 
relevancia(trilha, pergunta, relevancia(1-5) 
pergunta(index, "pergunta") 
[IA: countrelevancia, ML: countrelevancia, Dados: countrelevancia, front: countrelevancia] 
perfil: conjunto de respostas das perguntas: resposta(1, s). % Resposta para a pergunta 1 resposta(2, n). % Resposta para a pergunta 2 
ranking: calculo com base nas respostas do perfil manter contador de pontos para cada trilha baseada em perfil cada pergunta eh testada para cada trilha e eh somada sua relevancia ,
no fim retornar ranking baseado em pontos(relevancia) * */


/* Definicao de Trilhas*/
trilha(Inteligencia_Artificial).
trilha(Desenvolvimento_Backend).
trilha(Analise_de_dados).
trilha(DevOps).
trilha(Product_owner).

/* Perguntas */
perguntas(1,'Você tem interesse em treinar ou aplicar modelos de machine learning?').
perguntas(2,'Você gosta de programar regras de negócio e construir APIs?').
perguntas(3,'Você se interessa por analisar grandes volumes de dados para gerar insights?').
perguntas(4,'Você gosta de automatizar processos de infraestrutura e deploy?').
perguntas(5,'Você prefere lidar mais com pessoas, requisitos e gestão de produto do que programar?').
perguntas(6,'Você tem interesse em trabalhar com algoritmos de visão computacional ou NLP?').
perguntas(7,'Você gosta de otimizar consultas em bancos de dados e manipular dados estruturados?').
perguntas(8,'Você tem afinidade com pipelines de integração contínua e monitoramento de sistemas?').
perguntas(9,'Você se sente confortável em traduzir necessidades de clientes em funcionalidades de software?').
perguntas(10,'Você tem interesse em desenvolver soluções escaláveis e de alta performance no backend?').

/* Relevancia IA */
relevancia(Inteligencia_Artificial, 1, 5).
relevancia(Inteligencia_Artificial, 2, 2).
relevancia(Inteligencia_Artificial, 3, 3).
relevancia(Inteligencia_Artificial, 4, 1).
relevancia(Inteligencia_Artificial, 5, 1).
relevancia(Inteligencia_Artificial, 6, 5).
relevancia(Inteligencia_Artificial, 7, 2).
relevancia(Inteligencia_Artificial, 8, 1).
relevancia(Inteligencia_Artificial, 9, 1).
relevancia(Inteligencia_Artificial, 10, 2).

/* Relevancia Backend */
relevancia(Desenvolvimento_Backend, 1, 1).
relevancia(Desenvolvimento_Backend, 2, 5).
relevancia(Desenvolvimento_Backend, 3, 2).
relevancia(Desenvolvimento_Backend, 4, 2).
relevancia(Desenvolvimento_Backend, 5, 1).
relevancia(Desenvolvimento_Backend, 6, 1).
relevancia(Desenvolvimento_Backend, 7, 3).
relevancia(Desenvolvimento_Backend, 8, 2).
relevancia(Desenvolvimento_Backend, 9, 1).
relevancia(Desenvolvimento_Backend, 10, 5).

/* Relevancia Dados */
relevancia(Analise_de_dados, 1, 4).
relevancia(Analise_de_dados, 2, 2).
relevancia(Analise_de_dados, 3, 5).
relevancia(Analise_de_dados, 4, 1).
relevancia(Analise_de_dados, 5, 1).
relevancia(Analise_de_dados, 6, 3).
relevancia(Analise_de_dados, 7, 5).
relevancia(Analise_de_dados, 8, 2).
relevancia(Analise_de_dados, 9, 1).
relevancia(Analise_de_dados, 10, 2).

/* Relevancia DevOps */
relevancia(DevOps, 1, 1).
relevancia(DevOps, 2, 2).
relevancia(DevOps, 3, 1).
relevancia(DevOps, 4, 5).
relevancia(DevOps, 5, 1).
relevancia(DevOps, 6, 1).
relevancia(DevOps, 7, 2).
relevancia(DevOps, 8, 5).
relevancia(DevOps, 9, 1).
relevancia(DevOps, 10, 3).

/* Relevancia Product Owner */
relevancia(Product_owner, 1, 1).
relevancia(Product_owner, 2, 1).
relevancia(Product_owner, 3, 2).
relevancia(Product_owner, 4, 1).
relevancia(Product_owner, 5, 5).
relevancia(Product_owner, 6, 1).
relevancia(Product_owner, 7, 1).
relevancia(Product_owner, 8, 1).
relevancia(Product_owner, 9, 5).
relevancia(Product_owner, 10, 1).
