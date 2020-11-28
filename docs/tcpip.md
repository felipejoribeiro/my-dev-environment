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

Esses bits caminham pelo meio físico, onde os bits são propagados pelos pares emissor receptor através dos enlaces físicos que ficam entre eles. Esses enlaces podem ser via meio guiado (o sinal se propaga por meio sólido como cobre ou fibra), ou fia meio não guiado, que é pelo ar, via rádio. Um dos meios de se fazer essa conexão física é a partir dos cabos trançados. (TP) Estes são os famosos cabos azuis com vários fiozinhos. Eles podem ter de 3(telefones tradicionais) a 5(Ethernet) fios. Também há o cabo coaxial e o de fibra ótica. Esse último tem baixíssima taxa de erro por não sofrer de interferência eletromagnética. Na situação do rádio a informação é transmitida de forma eletromagnética onde não há fios no enlace. Há efeitos do ambiente de reflexão, obstrução e interferência. Há os modais de micro ondas, LAN, e 3G. Além destes há o canal via satélite em que há um certo delay devido às altas distâncias que o sinal deve percorrer até a orbita do satélite.

## O núcleo da rede consiste na infraestrutura de distribuição da informação.
Ele consiste de uma malha de roteadores. Assim um componente da borda envia uma informação, que é dividida em pacotes e esses pacotes são enviados pela rede. Em dado momento pode ocorrer a comutação de circuitos onde mais de um pacote é passado pelo mesmo caminho ao mesmo tempo. Para isso ocorre as divisões em FDM e TDM que são respectivamente por divisão de tempo ou divisão de frequência. Ou seja, pode haver um revesamento da banda para os pacotes no tempo, ou a transmissão deles ao mesmo tempo, mas em diferentes frequências. Assim, se houver vários slots para conexão, mas nem todas forem utilizadas, a velocidade é diminuída. Isso se chama multiplexação de frequências ou por divisão do tempo. A comutação de pacotes é a separação de um informação em pacotes e esses são enviados por vários caminhos. É possível que alguns pacotes cheguem e outros não. Uma das formas em que se podem perder pactes é por enfileiramento, em que um enlace antes de um roteador é muito mais rápido que o posterior o que causa um acúmulo de dados neste nó. Se esse acúmulo ultrapassar a memória da máquina, ela começa a perder pacotes. Em cada roteador eu tenho uma tabela de roteamento, que diz para qual caminho se deve enviar um pacote baseado no endereço que consta em seu cabeçalho. A permutação de pacotes permite que mais pessoas possam usar a rede de computadores.
- Comutação de pacotes permite a mais pessoas o acesso à rede uma vez que existe uma probabilidade delas estarem usando o enlace compartilhado ao mesmo tempo, e, normalmente, essa probabilidade é bem baixa. Assim, se um enlace tem 10 slots, mesmo assim, se 35 usuários usarem a rede simultaneamente, ainda assim, a probabilidade de mais de 10 estarem ativos ao mesmo tempo é menor que 0,004. A comutação de pacotes é ótima para dados em rajadas. É muito simples e tem recursos compartilhados. O problema é que pode ter congestionamento excessivo que resulta em atrasos e perda de dados.

Exemplo humano: Em um prédio muito grande, 

A estrutura da internet, que é a rede das redes, são ligadas entre si (ISP's) de muitas formas. Uma delas é um monte ligados entre si, ou pode haver uma aproximação hierárquica. A interconexão direta entre todos os IPS não é escalonável, pois necessita de O(N^2) enlaces. Sendo de aproximação hierárquica, várias redes locais se conectam com uma rede regional e alguns também conectam-se entre si. As redes regionais também por sua vez todas se conectam com a rede nacional e entre si. (podem haver muitas redes nacionais também). E as redes nacionais conectam-se entre si via cabos submarinos. Essa rede de hosts e clientes é a estrutura da internet.

## Desempenho da rede:
Como os pacotes vão se enfileirar quando o enlace de saída é mais lento que o de entrada, dados são perdidos ou atrasados. O atraso da passagem de informação no nó pode ser definida como : D_nodal = D_processamento + D_fila + D_transmissão + D_propagação.
- D_processamento: verifica erros de bits que possam ter ocorrido no enlace de chegada, determina enlace de saída. Isso ocorre normalmente em micro-segundos.
- D_fila: Tempo de espera para transmissão no enlace de saída. Isso depende do nível de enfileiramento (congestionamento) do roteador.
- D_transmissão: Temos R=largura de banda do enlace (bps), L= tamanho do pacote(bits) e o tempo para enviar=L/R.
- D_propagação: d= tamanho do enlace, s= vel. de propagação (~2x10^8 m/sec), atraso de propagação = d/s.

Uma analogia com o mundo real é  da caravana de carros. Estes carros se propagam a 100 km/h, as cabines de pedágio levam 12 s para atender um carro(tempo de transmissão), temos que cada carro é um bit e cada caravana é um pacote. Assim, esses carros podem se acumular em alguma cabine, dependendo da velocidade de atendimento. Existe uma equação para medir isso: R= largura de banda(bps), L= tamanho do pacote(bits), a= taxa média de chegada de pacotes. Assim, a intensidade de tráfego pode ser medida com L*a/R. Se essa relação for próxima a zera, não há bloqueio e o atraso por enfileiramento é pequeno. Se for menor que 1, atrasos tornam=se brandes a medida que deixam o zero. Se for igual a 1 o atraso médio torna-se infinito e pacotes deixam de ser entregues no destino.

Para resolver essa questão, tem-se o programa Traceroute que fornece medida do atraso da origem ao roteador ao longo do caminho de fim a fim da internet para o destino. Para todo i: - envia três pacotes que alcançarão roteador i no caminho para o destino. - roteador i retornará pacotes ao emissor. Emissor temporiza intervalo entre transmissão e resposta. Quando um nó perde pacote ele pode requisitar a retransmissão do nó anterior. 

Vazão é a medida de bits/unidade de tempo de transmissão de dados no enlace. E essa medida média de todo o percurso dos dados é igual ao do enlace de menor performance. Esses enlaces são chamados de "enlace gargalo" pois eles que atrasam todo o processo.


## Camadas de protocolo e modelos de serviços:
Redes são complexas, pois temos muitas partes: Hospedeiros, roteadores, enlaces de vários meios físicos, aplicações, protocolos, hardware, software. Assim, organizamos tudo isso em uma estrutura em camadas. Cada camada oferece servições e ações para a camada superior. A modularização facilita a manutenção e a atualização do sistema.

Assim, as camadas que temos são:

- Camada de Aplicação: temos o suporte a aplicação de rede, com FTP, SMTP e HTTP.
- Camada de transporte: temos a transferência de dados processo-processo com TCP e UDP.
- Camada de rede: temos o roteamento de datagramas da origem ao destino com IP e protocolos de roteamento.
- Camada de enlace: Temos a transferência de dados entre elementos vizinhos da rede, como PPP e Ethernet.
- Camada física: São os bits nos fios, ou no ar.

No modelo de referência ISO/OSI temos:
- Camada de apresentação: permite que a aplicação interprete significado de dados com criptografia, compactação e conveções específicas da máquina.
- Camada de sessão: Trata da sincronização, verificação e recuperação de dados. Ambas essas camadas não existem no protocolo TCP/IP, pois ambas estão dentro da camada de aplicação. Algumas aplicações necessitam ou não desses serviços e de diferentes rigores, assim é dada a liberdade ao programador de implementa-los conforme a necessidade e da forma que for necessária. 

Entre essas camadas ocorrem encapsulamentos da informação. No hospedeiro ocorrem os seguintes encapsulamentos:

MENSAGEM (gerada na camada da aplicação)|M|  >>  segmento (gerado na camada de transporte) |Ht|M|  >>  datagrama (gerado na camada de rede) |Hn|Ht|M|  >> quadro (gerado na camada de enlace) |HI|Hn|Ht|M| >> (na camada física tudo isso é passado em formato de bits sem adição de informações).

Quando a mensagem chega em um comutador ele desencapsula os dados somente para checar o endereço de envio, e então encaminha para o próximo elemento da rede. Quando esses dados chegam em um roteador, mais uma vez, ele desencapsula os dados e analisa até a camada de rede. Encapsula novamente e envia para o próximo elemento da rede. Chegando no destino os dados são desencapsulados até a camada de aplicação. 

É possível usar o wireshark para analisar esses pacotes até mesmo as camadas. Podemos ver da camada da aplicação até a camada física. Ele só cria cópias dos pacotes que estão entrando e saindo do computador e disponibiliza para análise.

## Wireshark 
Ele mostra o tempo, a fonte e o destino de cada pacote. Também mostra o protocolo (tcp, http), o tamanho e a informação que está sendo mandada ou recebida.
Ele mostra a camada física, de enlace, de internet, de transporte e de aplicação (nessa ordem, na janela do maio, quando disponível). Todas as características nessas camadas serão exploradas no curso. 

## Segurança 
Precisamos defender as redes contra ataques. Assim é necessário se projetar arquiteturas resistentes a ataques. A internet foi criada a um primeiro momento sem preocupações de segurança. Ela foi pensada somente como uma forma de comunicação remota entre clientes confiáveis. No entanto, pessoas más podem colocar Malware (programas maliciosos) nos hospedeiros. Eles podem entrar através de um vírus, worm ou cavalo de Troia. O malware do tipo spyware pode registrar toques, teclas sites visitados na web e enviar as informações coletadas para um servidor. O hospedeiro infectado pode também ser alistado em uma botnet, que pode ser usada para spam e ataques DoS (de negação de serviço).
O Malware normalmente é auto-replicável assim o hospedeiro infectado pode por sua vez passar o programa malicioso adiante.
Temos:
- Cavalo de Troia: Ele se aloja de forma oculta dentro de um software útil. Hoje em dia ele pode vir em uma página web(Active-X, plug-ins);
- Vírus: Infecção ao receber objetos, como anexado a emails. Ele é auto-replicável e necessita ser executado ativamente.
- Worm: Infecção recebendo passivamente objeto a ser executado. Também é auto-replicável.

O ataque Dos (Denial of service) consiste na mobilização de um grande número de computadores ou agentes de borda da rede, e estes enviam pacotes para um servidor alvo que não é capaz de lidar com o tráfego exagerado de informações.
Temos o farejamento de pacotes, em que há o meio broadcast (Ethernet compartilhada, sem fio) e um computador malicioso examina os pacotes que navegam por essa rede. (usando o wireshark, por exemplo). Assim, o meliante é capaz de ver senhas e outras informações.
Temos também o IP spoofing, em que enviamos pacotes com endereço de origem falso. Assim é possível se modificar a carga útil para atividades espúrias.

## História
- 1961: Iniciou-se a comutação de pacotes.
- 1967: Surgiu a arpanet, que foi concedida pela arpa, para instituições de pesquisa.
- 1969: Primeiro nó operacional.
- 1972: Demonstração pública da arpa com 15 nós. Primeiro protocolo (NCP) Escrita de aplicação para ambientes em rede. Primeiro programa de email.
- 1976: Ethernet na xerox parc.
- 1979: ARPAnet tem 200 nós. Nesse momento se pensou na neutralidade da rede.
- 1983: Implantação do protocolo TCP/IP. DNS definido para tradução entre nome-endereço ip 
- 1985: Protocolo ftp.
- 1988: Controle de congestionamento tcp. 100000 de usuários.
- 1990: a ARPAnet é aposentada.
- 1990: início da Web, hipertexto, html, http.
- 2007: 500 milhões de hospedeiros. voz e vídeo por ip. Aplicações p2p.

## Camada de enlace
Hospedeiros e roteadores somos nós. Canais de comunicação que conectam a nós adjacentes pelo caminho de comunicação são **enlaces**. Existem enlaces com fio (cabos submarinos ou elétricos) e enlaces sem fio(Antenas de distribuição) e reses LAN(wifi).

<computador>----ethernet-----|roteador|------------------|roteador|---------------<acesspoint>

               (quadro 1)                  (quadro 2)                 (quadro 3)

Em cada quadro há serviços, como por exemplo detecção e correção de erros. Em cada um desses a informação(datagrama) é codificada de forma diferente (quadro diferente). Assim o data grama é formatado de acordo com o protocolo do modal de transmissão. 

Dentro da camada de enlace, o enquadramento é o serviço que me dá acesso à camada de enlace, o data grama é encapsulado e é adicionado um cabeçalho, com endereço, dentro da camada de enlace. Isso é diferente do IP. O IP é o endereço lógico, enquanto o MAC é o endereço físico. Além disso, pode haver serviços de checagem de erro ponto a ponto. O endereço MAC assim está disponível no cabeçalho do quadro e muda conforme muda o enlace. A placa de internet é responsável por desenvolver o primeiro cabeçalho e endereço MAC ao enviar informações do computador. A partir dali essas informações são mudadas pelo roteador e assim por diante.

Dentro da camada de enlace pode haver um controle de fluxo. Se algo está sobrecarregado, pode haver um controle de fluxo no enlace, onde os dois pontos se comunicam para diminuir o tráfego. Se a comunicação for full duplex, os dois pontos podem mandar informações um para o outro simultaneamente.

A placa de rede do computador tem a responsabilidade de ser o primeiro enlace. Ela tem hardware, software e firmware que garantem seu funcionamento. Ele gera o primeiro quadro que encapsula o datagrama junto com dados de verificação de erro, entrega confiável, controle de fluxo, etc...  O adaptador receptor recebe esse pacote e usa os dados acoplados à informação para checar se há erro.

## Detecção de erros
Aqui temos o código responsável pela detecção e correção de erro. Temos o EDC que são bits de redundância responsáveis por isso. O método não é 100% confiável. Quanto maior o EDC melhor e mais confiável é o processo. Esses bits EDC são redundâncias de informação. Há diversas técnicas para detecção e correção de erro: 

- Paridade de único bit: Detecta erros de único bit. Ele soma todos os nos dados e grava o resultado no EDC (se houver um número par de um's, o EDC é 0 e se for impar é 1). O problema desse método é que se houver dois bits invertidos isso pode gerar um falso negativo na análise de erro.
- Paridade bidimensional: Cria uma matriz de bits com os dados e checa a soma dos bits coluna a coluna e linha a linha, gerando dois vetores de bits resultantes, que por suas vez também são somados.
- Soma de verificação da internet: Também conhecido como checksum. Ao transmitir uma lista de números o remetente envia também a soma negativa destes números. Assim, no destino, o receptor soma todos os números e soma com o valor de checagem esperando um resultado nulo.
- Existe também o método de verificação por redundância cíclica (crc): Ele cria bits adicionais de forma a criar uma redundância no sinal. Esse método de checagem é muito seguro e usado em modais pouco confiáveis como LANs.


## Protocolos de acesso múltiplo 
Existem dois tipos de "enlace", o ponto a ponto, que pode ser o PPP de acesso discado, ou o cabo Ethernet que conecta o comutador e o hospedeiro. E também há o broadcast, de fio ou meio compartilhado. O Ethernet a moda antiga,ou HFC e o LAN sem fio 802.11.
Para o caso do broadcast devem haver métodos de gerenciar esse acesso múltiplo para que não hajam colisões e os dados se misturem. Pra isso existem os protocolos de acesso múltiplo. Assim, esses algoritmos determinam quando um nó pode transmitir. A comunicação responsável por coordenar isso deve ser feita pelo próprio enlace. Ou seja, nada de canais paralelos ponto a ponto para coordenar o enlace broadcast.
Um canal de broadcast de velocidade R bps:
- quando um nó quer transmitir, ele pode enviar na velocidade R.
- quando M nós querem transmitir, cada um pode enviar na velocidade média de transmissão M/R.
- é totalmente descentralizado, isso é, nenhum nó é especial para coordenar a transmissão e não há sincronia de clocks entre os agentes.
- é simples.

Há três classes de protocolo MAC:
- Particionado em canais: divide o canal em "pedaços"(intervalos de tempo, frequência ou código), aloca pedaços ao nó para uso exclusivo.(FDMA e TDMA)
	- TDMA: time division multiple access. Neste o acesso ao canal é dividido em rodadas. Cada estação recebe intervalo de tamanho fixo a cada rodada. Os intervalos não usados ficam ociosos. Um exemplo é a LAN.
	- FDMA: Frequency division multiple access. Espectro do canal é dividido em bandas de frequência. Cada estação recebe banda de frequência fixa. Tempo de transmissão não usados nas bandas de frequência ficam ociosos.

- Acesso aleatório: canal não dividido, permite colisões e ele se "recupera" de colisões.(ALOHA, CSMA, CSMA/CD, CSMA/CA). Todos os pacotes enviados podem usufruir da velocidade total de banda. Não há coordenação a priori, mesmo que haja mais de um nó transmitindo ao mesmo tempo. Ocorrem colisões. O protocolo MAC de acesso aleatório especifica como detectar colisões e recuperar o sinal. São exemplos de protocolo MAC de acesso aleatório os slotted ALOHA, ALOHA, CSMA, CSMA/CD, CSMA/CA:
	- Slotted ALOHA: todos os quadros são do mesmo tamanho, o tempo é dividido em intervalos discretizados, o suficiente para transmitir um quadro. Os nós começas a transmitir somente no início destes intervalos discretizados de tempo. Assim os nós são sincronizados.Se dois ou mais nós transmitem no mesmo intervalo, todos os nós detectam a colisão. Detectada a colisão o nó tentará novamente na próxima rodada, mas um passo a frente. E isso se repete até conseguir. O lado ruim é que os emissores devem estar sincronizados e ocorrem muitas colisões. Na melhor das hipóteses o canal é utilizado para transmissões úteis em somente 37% do tempo. A probabilidade de sucesso pode ser calculada com Np(1-p)^(N-1).
	- ALOHA puro: O tempo não é discretizado, ou seja, os canais não precisam estar sincronizados. A probabilidade de colisão aumenta. Pois uma informação pode começar a ser transmitida no meio da transmissão de outra.
	- CSMA: Acesso múltiplo com sensoriamento da portadora. Ela consiste no princípio de se ouvir antes de falar. Ao se observar um canal ocioso, transmite o quadro inteiro. Se percebe canal ocupado adia transmissão. Mas mesmo assim dois canais podem acabar transmitindo ao mesmo tempo (dentro de uma janela de temo que não permita que eles se percebam). Nessa situação o tempo de transmissão do quadro inteiro é desperdiçado.
	- CSMA/CD: O mesmo do anterior, mas com detecção de colisão. Quando se nota uma colisão os canais param evitando o desperdício de tempo. A detecção é facilmente implementada em LANS com fio, pois basta se medir a intensidade do sinal. Mas é complicado em redes sem fio.

- Revezado: os nós se revezam, mas os nós com mais a enviar podem receber mais tempo.(Reservation, Polling, Token passing). Neste os nós se revezam. Se por um lado o particionado é bom para alta carga, com muitos nós, mas ineficaz para baixa carga, enquanto o de acesso aleatório é bom para baixa carga, ou seja, o contrário, o acesso revezado procura o melhor dos dois mundos.
	- Polling (seleção): nó mestre convida nós escravos a alterarem a transmissão. Normalmente usado com dispositivos burros. Mas isso pode abrir margem para sobrecarga no processo de seleção, latência e no fato de haver somente o ponto de falha do mestre.
	- Permissão: a permissão de controle é passada de um nó para o outro sequencialmente.

## Sobre o endereçamento ARP(address resolution protocol):
Endereço IP (internet protocol) é o endereço para a interface usado na camada de rede (internet). Enquanto o endereço MAC (Media Access Control)(ou LAN ou físico ou Ethernet) tem a função de levar um quadro de informação entre dois pontos de uma interface conectada fisicamente. O endereço MAC tem 48 bits para a maioria das LANs. Na ROM da NIC, às vezes também configurável por software. Exemplo: 1A-2F-BB-76-09-AD. Todo adaptador LAN tem um endereço exclusivo como o exemplificado. A alocação dessas identidades é feita pelo IEEE (institute of electrical engineers). Fabricantes compram parte do espaço de endereços MAC (para garantir exclusividade). Assim ele é imutável e único da sua máquina. O IP é diferente. Ele é atribuído com base da sub-rede ip a qual o nó está conectado. Uma analogia boa é que o MAC é a identidade enquanto o IP é o CEP. Cada nó IP possui uma tabela ARP que mapeia os endereços MAC em endereços IP. Ele pode mudar, o TTL (time to live) é o tempo após o qual o mapeamento de endereço será esquecido (normalmente 20 min). Assim essas tabelas são continuamente renovadas a todo momento. Quando o seu computador quer enviar dados para outro, ele envia o datagrama com o endereço ip de destino e MAC do roteador mais próximo, e esse mac vai sendo atualizado até chegar no IP requisitado.


## Ethernet (IEEE 802.3)
Tecnologia LAN com fio "dominante". Ela é barata e foi a primeira tecnologia LAN utilizada em larga escala. Ela é mais simples e barata que LANs de permissão e ATM. Ela foi capaz de acompanhar a corrida de velocidade 10mb/s até 10Gb/s. Antigamente também era usado para redes intra computadores, em que todos compartilhavam o mesmo barramento e colisões podiam ocorrer. Hoje em dia é organizado em formação em estrela, com um comutador central que organiza as mensagens. O quadro de Ethernet simplesmente acopla 8 byts à informação. 7 são com o padrão 10101010 e o último com o padrão 10101011. Isso é usado para sincronizar o clock do remetente e receptor. Endereços: 6bytes, se adaptador recebe quadro com endereço de destino combinado, ou com endereço de broadcast (p.e., pacote ARP), passa dados do quadro ao protocolo de camada de rede caso contrário, adaptador descarta o quadro. Então vem o tipo que indica o protocolo de camada mais alta (internet), ip, por exemplo. E, depois da carga útil, (46 - 1500 bytes) vem o CRC, que é o verificador de erros(4bytes).





## Características de redes não guiadas:
Redes de computadores com meio não guiado, ou seja, laptops. palmtops, pdas, telefones. Prometem acesso livre à internet a qualquer hora. Há dois desafios importantes:
- Sem fio: Comunicação por elance sem fio
- Mobilidade: Tratar de usuários móveis que mudam de pontos de acesso. 

O hospedeiro de uma rede sem fio é um equipamento para meio não guiado. Ele não tem fio. Eles são capazes de executar aplicações. Eles podem ser estáticos ou não estáticos, como um computador conectado via wi-fi, ou um laptop ou celular. Assim, sem fio nem sempre caracteriza mobilidade, uma vez que a rede WI-FI, por exemplo, limita o alcance do ponto de acesso.
Sempre tem uma estação base, que possui um relay, que liga o modal sem fio a uma rede guiada. Como torres de celulares, pontos de acesso 802.11. Temos também os enlaces sem fio, que permitem a comunicação entre os dispositivos móveis às estações base. Um protocolo de acesso múltiplo permite a conexão simultânea de vários hospedeiros. Existem padrões de largura de banda por método de conexão. Existem limites de abrangência (alcance) e banda para cada modal. Pode ser também uma red ad hoc, que não possui base. Seria uma conexão peer-peer, mas eles comunicam entre si informação.

- No modo infraestrutura a comunicação é centralizada, ou seja, todos os hospedeiros se comunicam com a mesma entidade.



## Camada de rede:
Na camada de rede nós temos o endereço lógico. Temos sub-serviços também, como:
- modelos de serviço da camada de rede;
- repasse versus roteamento;
- como funciona um reteador;
- roteamento (seleção de caminho);
- lidando com escala;
- tópicos avançados: IPV6;

Instanciação, implementação na internet. Ao invés de falarmos de quadro, falamos de datagrama.

## Funções da camada de rede
Uma das funções da camada de rede é o roteamento. Nesse processo, o reteador em questão desencapsula a camada de rede e observa o endereçamento de origem e destino. O roteamento ocorre com a determinação do caminho de repasse dessa informação. Isso ocorre a partir de tabelas de roteamento. ão. Isso ocorre a partir de tabelas de roteamento. 





## Endereçamento lógico 
Falaremos do endereçamento da versão 4 (ipv4). Falaremos do endereçamento, sub-redes, endereçamento sem classe (CIDR- Classless inter-Domain), Falaremos de márcaras também.
Primeiramente o endereço era divididos em classes. Tínhamos a classe A:
7bits no primeiro octeto, e 24 bits representando os hospedeiros, como 10.X.X.X, que seria 00001010.xxxxxxxx.xxxxxxxx.xxxxxxxx, o campo de rede variava de 1 a 127, totalizando 127 redes classe A. Os campos de host variavam de 1 a 254. Endereço de rede 0 e endereço de broadcast 255. Isso totaliza 254 X 254 x 254 = 16772216 hosts. Na classe B teríamos 14 bits de rede, no host teríamos 16 bits, do tipo 172.68.x.x que seria 10101100.01000100.xxxxxxxx.xxxxxxxx. O primeiro campo de rede pode variar de 128 a 191, totalizando 16.320 redes de classe B. Os campos de host podem variar de 1 a 254, totalizando 64516. Na classe C, a rede tem 21 bits, o host tem 8 bits, do tipo 192.168.15.x, com 11000000.10101000.00001111.xxxxxxxx, o primeiro pode variar de 192 a 223, totalizando 2080800 redes classe c. 
O 127 é reservado para loopback, ou seja, testar softwares de comunicação, ele é o tal do endereço localhost 127.0.0.1.
A ideia de se usar subredes é reduzir o congestionamento, dar suporte a diferentes tecnologias e segurança.
Indereço IP é constituído de 4 octetos, na versão ipv4, e ele era dividido em classes. Houve a expansão para uma rede ipv6 quando o número de hosts cresceu muito. O sistema de máscaras é utilizada na criação de sub-redes que foram uma forma de expandir o protocolo ipv4, aproveitando assim endereços que não eram aproveitados em redes. Posso segmentar redes que são grupos menores. Foi deixado um exercício. dois octetos já são reservados para a rede, e como temos um 8, bits já foram emprestados para se estar dentro de uma subrede. Assim, a primeira coisa é descobrir a qual subrede esta rede pertence. Nesse exercício eu pesso que vocês identifiquem o endereço de cada subrede.
