# Inteli - Instituto de Tecnologia e Liderança 

<p align="center">
<a href= "https://www.inteli.edu.br/"><img src="https://www.inteli.edu.br/wp-content/uploads/2021/08/20172028/marca_1-2.png" alt="Inteli - Instituto de Tecnologia e Liderança" border="0"></a>
</p>

# Alagoritmo

## all_4_one

## Integrantes: <a href="https://www.linkedin.com/in/ana-carolina-cremonezi-martire-2a7335268">Ana "Kakau" Martire</a>, <a href="https://www.linkedin.com/in/cec%C3%ADlia-alonso-gon%C3%A7alves-3aa4bb271/">Cecília Gonçalves</a>, <a href="https://www.linkedin.com/in/felipe-braga-69607126a/">Felipe Braga</a>, <a href="https://www.linkedin.com/in/felipe-sabino-spina-b33372271/">Felipe Spina</a>, <a href="https://www.linkedin.com/in/lucasdeluccas/">Lucas de Luccas</a>, <a href="https://www.linkedin.com/in/mauro-das-chagas-junior-7306a71b9/">Mauro das Chagas</a>, <a href="https://www.linkedin.com/in/renan-feitosa-44328524a">Renan Feitosa</a>, Ricardo Novaes

## Descrição

Alagoritmo é um jogo educativo focado no ensino de matemática e pensamento computacional para crianças do ensino público de Alagoas. Com um design simples e marcado pela cultura Alagoana, Alagoritmo visa tornar o aprendizado mais dinâmico e de fácil identificação, assim contornando dificuldades e democratizando o acesso ao aprendizado de computação.
<br><br>

<br><br>

Alagoritmo visa ensinar o pensamento computacional e matemática para crianças do ensino básico de Alagoas de forma lúdica e dinâmica, para isso ele foi estruturado como um RPG de turnos no qual o jogador precisa passar pelas 4 fases do pensamento computacional: Reconhecimento de padrões, decomposição, abstração e algoritmo. Em um primeiro momento, a criança terá a oportunidade de ver a movimentação/acontecimentos de uma fase, a partir disso é esperado que ela desenvolva seu reconhecimento de padrões. Após isso, ela terá que decompor esses padrões em partes menores para que assim possa abstrair a situação e gerar um algoritmo que solucione o problema que está sendo proposto pelo jogo. Por meio dessa sequência de ações, esperamos que a criança consiga desenvolver suas habilidades computacionais e de matemática de forma lúdica e dinâmica.
<br><br>

## 🛠 Estrutura de pastas

-Raiz<br>
|<br>
|-->código<br>
|-->docs<br>
|-->documentos<br>
  &emsp;|-->antigos<br>
  &emsp;|GDD.docx ou Documentação.docx<br>
|-->executáveis<br>
  &emsp;|-->Android<br>
  &emsp;|-->HTML<br>
  &emsp;|-->Windows<br>
|-->imagens<br>
|-->src<br>
|-->versoesAntigasExecutaveis
|readme.md<br>

A pasta raiz contem dois arquivos que devem ser alterados:

<b>README.MD</b>: Arquivo que serve como guia e explicação geral sobre seu projeto. O mesmo que você está lendo agora.

Há também 4 pastas que seguem da seguinte forma:

<b>docs</b>: Aqui serão colocados os arquivos compilados em HTML do jogo.
<b>documentos</b>: Aqui estarão todos os documentos do projeto, mas principalmente o <b>GDD (Game Design Document)/Documentação do Sistema</b>. Há uma pasta <b>antigos</b> onde estarão todas as versões antigas da documentação.

<b>executáveis</b>: Aqui estarão todos os executáveis do jogo, prontos para rodar. Há no mínimo 3 pastas, uma para binários <b>Windows</b>, uma para binários <b>android</b> e uma para a <b>Web/HTML</b>

<b>imagens</b>: Algumas imagens do jogo/sistema e logos prontos para serem utilizados e visualizados.

<b>src</b>: Nesta pasta irá todo o código fonte do jogo/sistema, pronto para para ser baixado e modificado.

## 🛠 Instalação

<b>HTML:</b>

Não há instalação!
Encontre o index.html na pasta executáveis e execute-o como uma página WEB (através de algum browser). Ou acesse diretamente clicando <a href="https://2023m1t7-inteli.github.io/grupo2/">aqui</a>

## 💻 Configuração para Desenvolvimento

1 - Faça o download do GODOT e deste repositório. <br>
2 - Abra o GODOT, ao ser prontificado clique em IMPORTAR. <br>
3 - Selecione a pasta onde descompactou este repositório.

Para abrir este projeto você necessita das seguintes ferramentas:

* <a href="https://godotengine.org/download">GODOT</a>

## 🗃 Histórico de lançamentos

* 3.4.0 - 05/04/2023
    * Versão 3.4.0 do alagoritmo upada para o Github.
    * CORRIGIDO: Mudanças nos arquivos de áudio e otimização do jogo.
        * Correção necessária devido o arquivo da 3.3 ter ficado extremamente grande sem nenhuma necessidade.
* 3.3.0 - 05/04/2023
    * Versão 3.3.0 do alagoritmo upada para o Github.
    * CORRIGIDO: Bug da tela de derrota aparecer no estágio 5 do boss final mesmo o jogador vencendo o jogo.
    * ADD: Cutscenes foram adicionadas ao jogo para dar maior contextualização sobre a história.
    * ADD: Sons foram adicionados ao jogo: Som de dano, vitória, apertar das cartas, música de fundo e etc.
    * ADD: Tela de configurações e de informações adicionadas ao jogo.
    * ADD: Diálogos inseridos dentro do jogo.
    * ADD: Tela final de créditos adicionada quando o jogador vence o jogo.
    * ADD: Tela inicial alterada para a logo do jogo aparecendo enquanto ele carrega.
    * ADD: Transição entre troca de cenas.
* 2.8.1 - 01/04/2023
    * Versão 2.8.1 do alagoritmo upada para o Github.
    * CORRIGIDO: Bug das fases não estarem passando após fazer as contas.
* 2.8.0 - 30/03/2023
    * Versão 2.8 do alagoritmo upada para o Github.
    * CORRIGIDO: Bug nas posições entre os estágios da fase do Lume (boss final) e do cangaceiro.
    * CORRIGIDO: Bug da conta do estágio 5 sumir muito rápido da tela.
    * CORRIGIDO: Bug dos estágios da fase do Lume (boss final) não estarem salvando.
        * Correção necessária porque causava muita frustração para os testers porque perdiam todo seu progresso.
    * CORRIGIDO: Links das telas de vitória e derrota corrigidos, agora mandam para as telas corretas.
    * CORRIGIDO: Bug do cangaceiro já começar levando dano no começo do estágio 5.
    * CORRIGIDO: Bug do jogador poder ir para baixo das plataformas e sair da área jogável do game.
    * CORRIGIDO: Bug do jogo travar quando o jogador coloca o looping na última posição das instruções.
    * CORRIGIDO: Bug da conta no último estágio da fase do Lume (boss final) não estar sendo considerada como correta.
    * CORRIGIDO: Bug de ser possível passar dos estágios dos bosses sem fazer as contas.
    * MUDANÇA: Agora as contas são mantidas entre os estágios para que o jogador possa fazê-las com mais calma.
    * MUDANÇA: Botão de rodar as intruções fica desativado no nível 1 enquanto o jogador não apertar a primeira carta.
    * MUDANÇA: Botão "pronto" agora fica desabilitado enquanto o botão de padrões estiver ativo.
    * ADD: Tela com uma breve explicação sobre o funcionamento da carta de "espera" e do botão de "padrões".
        * Adição necessária porque muitos testers ainda tiveram dificuldade de compreender essas duas mecânicas.
* 2.4.0 - 24/03/2023
    * Versão 2.4 do alagoritmo upada para o Github.
    * CORRIGIDO: Bug da tela de vitória travando a fase do Lume.
    * CORRIGIDO: Colisão que deletava as instâncias do Aluado na fase 04.
    * CORRIGIDO: Links dos menus ajustados.
* 2.3.0 - 23/03/2023
    * Versão 2.3 do alagoritmo upada para o Github.
    * CORRIGIDO: Mudança nos sprite da carta "esperar", colocamos uma ampulheta para facilitar a visualização.
    * CORRIGIDO: Bug na posição do personagem ao iniciar a fase.
    * CORRIGIDO: Bug nos links dos botões de cada cena.
    * MUDANÇA: Nova reestruturação das pastas para melhorar a organização.
    * MUDANÇA: Troca das 3 fases de tutorial por novas 5 fases novas, reestruturadas e mais didáticas.
        * Mudança necessária por conta da dificuldade que muitos testers tiveram para compreender a mecânica.
    * MUDANÇA: Mudança da posição, tamanho e usabilidade do botão de verificação de padrão dos inimigos.
        * Mudança necessária porque muitos testers tiveram dificuldade para usar essa mecânica.
    * ADD: Mais sprites que foram usados para o desenvolvimento das fases.
    * ADD: Introdução de um tutorial com "mãos" que indicam aonde o jogador deve clicar para facilitar a compreensão.
        * Adição necessária por conta da dificuldade de compreender as mecânicas do jogo de alguns testers.
    * ADD: Adição da fase do "Lume" o principal antagonista de alagoritmo (fase com 6 estágios e todas as mecânicas do jogo).
    * ADD: Adição da última mecânica do jogo: Carta que simula um looping da programação.
* 1.9.7 - 07/03/2023
    * Versão 1.9.7 (Muito parecida com a 1.9.6, apenas com breves correções antes dos testes).
    * CORRIGIDO: Bug das cartas não serem desativadas após serem clicadas.
    * CORRIGIDO: Bug em um desafio do "Boss Cangaceiro" (conta estava dando errado mesmo acertando o resultado).
    * CORRIGIDO: Exclusão de algumas pastas que não estavam sendo utilizadas no jogo.
    * CORRIGIDO: Melhora na organização e estruturação das pastas.
    * ADD: Cartas ficam opacas enquanto desativadas (ainda não em todas as fases).
    * ADD: Algumas labels direcionando ações para auxiliar os testers durante a testagem do jogo.
* 1.9.6 - 07/03/2023
    * Versão 1.9.6 do alagoritmo upada para o Github com objetivo de testarmos o jogo.
    * MUDANÇA: Troca das 2 fases de introdução por 3 fases que introduzem as duas mecânicas do jogo.
    * ADD: Mais sprites que foram usados para o desenvolvimento das fases.
    * ADD: Mecânica da movimentação por setas.
    * ADD: Mecânica do botão de visualização dos padrões dos inimigos.
    * ADD: Botão para excluir as instruções que foram selecionadas incorretamente.
    * ADD: Fase do "Boss Cangaceiro" com 5 estágios e uma mescla de todas as mecânicas do jogo.
    * ADD: Carta especial com a função de esperar uma rodada.
    * ADD: Efeito (brilhante) de dash movimentação do personagem (Obrigado Renan =]).
    * ADD: Efeito (brilhante) de shake para quando o personagem leva dano (Obrigado Kakau =]).
    * ADD: Animação de dano no "Boss Cangaceiro" para quando ele é acertado por algum golpe.
* 1.2.0 - 23/02/2023
    * Versão 1.2 do alagoritmo upada para o Github.
    * ADD: Criação de duas fases que demonstram brevemente a mecânica do jogo.
    * ADD: Mecânica das contas matemáticas.
    * ADD: Mais sprites que foram usados para o desenvolvimento das fases.
    * ADD: Pixel art baseada no farol da ponta verde para ser o background do jogo.
    * ADD: Classe da tela de vitória e tela de derrota.
    * ADD: Botão de configuração e de informações (embora ainda não façam nada).
    * ADD: Organização em pastas para estruturar as fases do jogo.
    * ADD: Criação da tela de seleção de nível.
    * ADD: Primeiro inimigo colocado em um nível.
* 0.7.0 - 09/02/2023
    * Versão 0.7 do alagoritmo upada para o Github.
    * O jogo possuia apenas uma interface simples de menu e um esboço do nível 1.

## 📋 Licença/License

<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/Spidus/Teste_Final_1">MODELO GIT INTELI</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.yggbrasil.com.br/vr">INTELI, VICTOR BRUNO ALEXANDER ROSETTI DE QUIROZ</a> is licensed under <a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"></a></p>

## 🎓 Referências

Aqui estão as referências usadas no projeto.

1. <https://laart.art.br/blog/cordeis-famosos/>
2. <http://www.ablc.com.br/o-cordel/cordeis-digitalizados/>
3. Créditos da música de fundo: <https://www.youtube.com/@Eki_Ms>
4. Arquivo de referências: <https://docs.google.com/document/d/1EEntEbpoMxJFLGPAsPr16n96g_bd3Fmm1Wt_mVEWNkQ/edit>
