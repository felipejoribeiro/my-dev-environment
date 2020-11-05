# Introdução:
Interessante mostrar as terminologias mais utilizadas: Existem vários modelos que representam a arquitetura TCP/IP, é possível se ter a rede móvel, rede doméstica, rede institucional, rede ISP regional. Elas são camadas de comunicação e estão interligadas resultando em um grupo interconectado de troca de informações, que é a internet. Apesar da diversidade, todas seguem os padrões ditados pelo protocolo TCP/IP que estudaremos na disciplina. 
Vamos estudar a borda e o núcleo da rede, e quais os protocolos são utilizados? Aliás, o que são protocolos?
Vamos ver a borda da rede, com  hospedeiros, rede de acesso, meio físico.
Vamos ver o núcleo da rede, com pacote/comutação de circuitos, estrutura da internet.
Vamos ver sobre desempenho, o que causa perda de pacotes, atraso e vazão.
Vamos ver sobre segurança.
Como funciona as camadas de protocolos e serviços.
E veremos sobre a história da internet.

## A internet é uma rede de computadores interconectados. Nesse contexto temos:
- Hospedeiros: São os equipamentos que são os sistemas finais, os fins desse ramo que são os receptores e lançadores finais e primários das informações. São os dispositivos que estão rodando os aplicativos web que usam da infraestrutura de rede. Hoje em dia, com a internet das coisas, estes dispositivos vem se multiplicando exponencialmente, com todo tipo de comunicação e aplicação imaginável.
- Enlaces: São equipamentos que estão conectados, via cabo de fibra, ou cobre, ou mesmo um meio não guiado como torres de rádio e satélite. Para cada tipo de enlace existe uma largura de banda dedicada que dita o tanto de informação que pode percorrer pelo enlace de forma simultânea.
- Roteadores: São computadores intermediários que recebem informações dos enlaces e redirecionam para que ele chegue no endereço correto. São equipamentos de rota na infraestrutura de conexão e vão dês de o roteador de sua casa, até grandes centros de redistribuição de sinal de seu contratante de internet e da rede local. Eles guiam o sinal até o servidor requisitado. Ou seja, a estrutura Enlace + Roteadores ligam dois computadores hospedeiros de acordo com suas requisições de acesso.
- Protocolos: É uma regra de controle de comunicação entre os dispositivos. Assim, as mensagens seguem regras de formatação que servem para tornar estes sinais legíveis nos dois pontos da comunicação. São exemplos: TCP, IP, HTTP, Skype, Ethernet, etc...
- Internet: É a rede das redes, ou seja, tem-se uma rede local, que está conectada a uma rede regional que está conectada à rede global. Existe uma hierarquia vaga, assim, é necessário que se esteja conectado à rede local, para que se esteja conectado à regional, e assim por diante. Ela é algo público, mas existem as Intranets, que são privadas de empresas, mas usam os mesmos protocolos.
- Padrões da internet: RFC - Request for Comment, e IETF - Internet Engineering task forces. São os responsáveis pela padronização que vemos neste curso.
- Infra estrutura de comunicação: Ela observa os serviços que são requiridos e fornece Enlaces e roteadores capazes de suportar eles.Estes serviços podem ser Web, VoIP, e-mail, jogos, e-commerce, compartilhamento de arquivos.
- Serviços de comunicação fornecidos à aplicação: Entrega de dados confiável ou não confiável. Existe uma comunicação entre as aplicações e o modal de transporte, de forma que a aplicação consegue dizer se a informação pode ser transportada com mais ou menor rigor ou confiabilidade. Isso oscila muito por exemplo entre o email e serviços de streaming como twitchTV. Existem protocolos para assegurar a informação, mas nem sempre a aplicação opta por usar ela.

## Um protocolo é uma forma de comunicação. A língua portuguesa é um protocolo de comunicação entre dois seres humanos.
Nos protocolos de redes, ao invés de dois humanos temos duas máquinas. Ela também deve falar uma língua padrão para ser entendida pela outra máquina. O protocolo define o formato, a ordem das mensagens, e as ações tomadas sobre a transmissão e recepção de mensagens. Exemplo:

Computador1: -Solicito uma conexão TCP. (pacotes com informações que significam essa requisição).
Computador2: -Entendi sua mensagem, posso enviar.
Computador1: -Solicito http://www.google.com.
Computador2: -<arquivos> (html, js, etc...)

## Borda da rede são os hospedeiros, a rede de acesso e o meio físico.
Aqui rodam as aplicação e é onde ocorre a interação máquina-homem. Aqui é onde o desktop trabalha. Podem haver dois modelos de comunicação entre hospedeiros sendo eles:
- peer-peer: Onde a estrutura é paralela e ambos os computadores são iguais na comunicação e os protocolos são simétricos. São exemplos o Skype e o BitTorrent.  
- cliente-servidor: Aqui há uma hierarquia, onde os protocolos de comunicação são assimétricos. O cliente faz a solicitação de pacotes e serviços e o servidor está o tempo todo ligado e ouvindo atento para atender aos pedidos. São exemplos serviços de email e hospedagem de websites.

Para conectar computadores à internet é necessário provedores de acesso local. Estes podem ser de redes móveis, de redes residenciais ou de redes institucionais como escolas e empresas. Exemplos são a rede 4G, acessos wifi residenciais ou institucionais. A largura de banda (bits por segundo) varia muito entre cada modalidade. Além disso a rede pode ser dedicada ou compartilhada. O mais comum é ser compartilhada, ou seja, você usa a mesma infraestrutura de comunicação que muitas outras pessoas.

São exemplos de acesso:

- DSL: Digital Subscriber Line: É usada na infraestrutura telefônica existente. Em que passa pela central DSLAM para separar o que é telefone do que é internet, possui largura de banda de até 1Mbps de upload e 8Mbps de download. Mas sendo bem menos atualmente. A linha física é dedicada até a central telefônica.
- Hoje em dia é utilizado mais tecnologia a cabo que usa a tecnologia de tv a cabo para distribuir informação. Essa tecnologia é compartilhada, assim, as pessoas acessa o mesmo fio elétrico mas por diferença de frequência de comunicação cada um acessa uma parte da banda. Há também o sistema híbrido, onde a internet é a cabo até um sistema de distribuição a partir da qual passa a ser óptica, além de, é claro, a em fibra óptica completa, que vai até o seu roteador via fibra óptica. 

Todas essas tecnologias chegam até o modem em sua casa, que possui o endereço IP real. Esse modem se conecta a um roteador, que distribui a conexão entre os dispositivos de final de curso dentro de sua casa via protocolo NAT, além disso normalmente ele possui Firewall. Esse roteador local também pode distribuir as informações via wifi ou cabo ethernet.

Outra forma é nas redes institucionais que podem ter Ethernet switches e roteadores ao lado de servidores e roteadores em toda uma infraestrutura interna de rede, mas claro, também ligada à internet externa via um roteador institucional que também pode ter firewalls e outras estruturas de segurança. Essa conexão com o mundo externo é feita a partir de um ISP (institutional link to internet).

Acessos sem fio podem ser pontos de acesso de wireless LAN, que podem ser 802.11b/g/n, que são as WI-FI que existem nas casas e tem taxas de transmissão menores que a cabo e são projetadas para pequenas distribuições. Além delas você pode ter as de wide-area, que são fornecidas através de grandes antes, com serviços de empresas de telecom como 3G e 4G.

Quando queremos enviar uma mensagem pela internet, pegamos nossa informação e dividimos em pacotes de tamanho L, e transmitimos esses pacotes a uma taxa R, assim, a velocidade de transmissão da informação depende diretamente da largura de banda e dessa taxa de transmissão de pacotes. (bits por segundo)

Esses bits caminham pelo meio físico, onde os bits são propagados pelos pares emissor receptor através dos enlaces físicos que ficam entre eles. Esses enlaces podem ser via meio guiado (o sinal se propaga por meio sólido como cobre ou fibra), ou fia meio não guiado, que é pelo ar, via rádio. Um dos meios de se fazer essa conexão física é a partir dos cabos trançados. (TP) Estes são os famosos cabos azuis com vários fiozinhos. Eles podem ter de 3(telefones tradicionais) a 5(Ethernet) fios. Também há o cabo coaxial e o de fibra ótica. Esse último tem baixíssima taxa de erro por não sofrer de interferência eletromagnética. Na situação do rádio a informação é transmitida de forma eletromagnética onde não há fios no enlace. Há efeitos do ambiente de reflexão, obstrução e interferência. Há os modais de micro ondas, LAN, e 3G. Além destes há o canal via satélite em que há um certo 



## Camada de enlace
Hospedeiros e roteadores somos nós. Canais de comunicação que conectam a nós adjacentes pelo caminho de comunicação são **enlaces**. Existem enlaces com fio (cabos submarinos ou elétricos) e enlaces sem fio(Antenas de distribuição) e reses LAN(wifi).

       
<computador>----ethernet-----|roteador|------------------|roteador|---------------<acesspoint>

               (quadro 1)                  (quadro 2)                 (quadro 3)

Em cada quadro há serviços, como por exemplo detecção e correção de erros. Em cada um desses a informação(datagrama) é codificada de forma diferente (quadro diferente). Assim o data grama é formatado de acordo com o protocolo do modal de transmissão. 

Dentro da camada de enlace, o enquadramento é o serviço que me dá acesso à camada de enlace, o data grama é encapsulado e é adicionado um cabeçalho, com endereço, dentro da camada de enlace. Isso é diferente do IP. O IP é o endereço lógico, enquanto o MAC é o endereço físico. Além disso, pode haver serviços de checagem de erro ponto a ponto. 

Dentro da camada de enlace pode haver um controle de fluxo. Se algo está sobrecarregado, pode haver um controle de fluxo no enlace, onde os dois pontos se comunicam para diminuir o tráfego. Se a comunicação for full duplex, os dois pontos podem mandar informações um para o outro simultaneamente.

A placa de rede do computador tem a responsabilidade de ser o primeiro enlace. Ela tem hardware, software e firmware que garantem seu funcionamento. Ele gera o primeiro quadro que encapsula o datagrama junto com dados de verificação de erro, entrega confiável, controle de fluxo, etc...  O adaptador receptor recebe esse pacote e usa os dados acoplados à informação para checar se há erro.

## Detecção de erros
Aqui temos o código responsável pela detecção e correção de erro. Temos o EDC que são bits de redundância responsáveis por isso. O método não é 100% confiável. Quanto maior o EDC melhor e mais confiável é o processo. Esses bits EDC são redundâncias de informação. Há diversas técnicas para detecção e correção de erro: 

- Paridade de único bit: Detecta erros de único bit. Ele soma todos os nos dados e grava o resultado no EDC (se houver um número par de um's, o EDC é 0 e se for impar é 1). O problema desse método é que se houver dois bits invertidos isso pode gerar um falso negativo na análise de erro.
- Paridade bidimensional: Cria uma matriz de bits com os dados e checa a soma dos bits coluna a coluna e linha a linha, gerando dois vetores de bits resultantes, que por suas vez também são somados.


## 



- Detecção e correção de erros:


- Compartilhamento de um canal de broadcast
- Endereçamento da camada de enlace



## Características de redes não guiadas:
Redes de computadores com meio não guiado, ou seja, laptops. palmtops, pdas, telefones. Prometem acesso livre à internet a qualquer hora. Há dois desafios importantes:
- Sem fio: Comunicação por elance sem fio
- Mobilidade: Tratar de usuários móveis que mudam de pontos de acesso. 

O hospedeiro de uma rede sem fio é um equipamento para meio não guiado. Ele não tem fio. Eles são capazes de executar aplicações. Eles podem ser estáticos ou não estáticos, como um computador conectado via wi-fi, ou um laptop ou celular. Assim, sem fio nem sempre caracteriza mobilidade, uma vez que a rede WI-FI, por exemplo, limita o alcance do ponto de acesso.
Sempre tem uma estação base, que possui um relay, que liga o modal sem fio a uma rede guiada. Como torres de celulares, pontos de acesso 802.11. Temos também os enlaces sem fio, que permitem a comunicação entre os dispositivos móveis às estações base. Um protocolo de acesso múltiplo permite a conexão simultânea de vários hospedeiros. Existem padrões de largura de banda por método de conexão. Existem limites de abrangência (alcance) e banda para cada modal. Pode ser também uma red ad hoc, que não possui base. Seria uma conexão peer-peer, mas eles comunicam entre si informação.

- No modo infraestrutura a comunicação é centralizada, ou seja, todos os hospedeiros se comunicam com a mesma entidade.
