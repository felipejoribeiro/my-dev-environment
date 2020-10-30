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
