//
//  vidaBase.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 25/07/21.
//

import Foundation
import UIKit

var vidaBase: [CollectionItem] = [CollectionItem(),CollectionItem(),CollectionItem(),CollectionItem(),CollectionItem(), CollectionItem()]

func criaVida(indice: Int){
    if indice == 0{
        let vida1 = CollectionItem(titulo: "Paternidade",
                                   baseBiblica: refVida[indice],
                                   contextualizacao: "O livro de Gálatas é uma carta que Paulo escreveu às igrejas na província de Galácia, uma área da Ásia Menor que incluía as cidades de Antioquia, Icônio, Listra e Derbe aproximadamente nos anos 55-56 d.C. O motivo de ele escrever essa carta é que muitos legalistas da região pregavam a obrigatoriedade de Leis do antigo testamento e o cumprimento de diversos costumes estabelecidos na época para atingir a salvação de Deus. A base bíblica da devocional explica que através de Jesus, não somos mais servos dessa lei.",
                                   reflexao: "Paulo conhecia o que Jesus ensinou: Deus não faz acepção de pessoas e você não pode salvar a si próprio. Jesus já salvou a todos nós! A graça de Deus para nossa vida foi nos dada de presente. Através de Jesus nos tornamos filhos e isso não é algo que conseguimos conquistar cumprindo regras estabelecidas por homens (Efésios 2:8), porque Jesus já conquistou por nós! É exatamente sobre isso que o texto base de hoje ensina. Jesus veio para mostrar que não somos mais escravos de leis ou escravos do pecado, através da vida de Jesus podemos chamar Deus de Pai. Isso acontece porque, antes de Jesus, estávamos separados de Deus por causa do pecado. Antes de Jesus, não conhecíamos a Deus de verdade. Assim como o povo de Galácia, muitas pessoas achavam que Deus era alguém raivoso, que os obrigava a seguir um livro de regras, que explodia de ira caso alguém não cumprisse uma das leis. Entretanto, Jesus veio para ensinar que na verdade, Deus é um Deus de Amor, e por Amor somos salvos. Ele veio para mostrar que estamos livres da Lei. Por amor, escolhemos fazer o bem ou o mal e por amor, decidimos nos afastar dos nossos pecados para, assim, nos aproximarmos dEle. É exatamente sobre isso que Paulo queria falar para os Gálatas: a vida em Cristo é a liberdade de filhos e filhas.",
                                   conclusao: "O caráter Paterno de Deus inclui muitas coisas como amor, proteção, conselhos e amizade. O que estamos fazendo para cultivar essa relação com Ele? O mais importante, nós vivemos verdadeiramente o papel de Filhos de Deus? Dentre os pontos principais para praticarmos e lembrarmos, podemos frisar: Busque em 1° lugar (Mateus 6:33), não seja escravo das amarras do mundo (1 Coríntios 6:12) e, por fim, espalhe o Amor (Eclesiastes 11:9). Se desafie a aplicar e viver verdadeiramente a liberdade e o relacioonamento para os quais o Pai te chama.",
                                   aplicacao1: "",
                                   aplicacao2: "",
                                   aplicacao3: "",
                                   backgroundColor: verde,
                                   backgroundImage: UIImage(named: "vidaBase1")!,
                                   link: "https://www.youtube.com/watch?v=ENCCAYD8kpc",
                                   storyImage: "vidaStory1")
        vidaBase[indice] = vida1
    }
    else if indice == 1{
        let vida2 = CollectionItem(titulo: "Fidelidade",
                               baseBiblica: refVida[indice],
                               contextualizacao: "Paulo escreve a carta à Filipenses como forma de gratidão pela vida daquela igreja. Em Atos 16.12-40 é registrada a fundação dessa igreja em Filipo e nessa carta à Filipenses, Paulo tem o propósito de agradecer pela vida deles e ao mesmo tempo apelar para que eles permaneçam unidos e estáveis como igreja. O principal caráter da carta de Filipenses é a Alegria que Paulo sentia em ver seus amigos amados viverem em Cristo. Além disso, em acompanhar aquela igreja que estava se desenvolvendo de maneira fiel a Deus.",
                               reflexao: "Quando a gente gosta muito de um cantor, time, artista ou alguma figura famosa, a gente faz questão de mostrar para todo mundo, né? Por exemplo, além de de seguir os conteúdos referentes à aquilo em todas as redes sociais, nós literalmente vestimos a camisa! Para Paulo, não é diferente com Deus, e é por isso que ele sempre faz questão de falar do caráter de Deus em suas cartas. Ele é fiel a Deus, porque Deus é fiel a ele. No versículo base dessa devocional ele fala sobre duas características de Deus: fidelidade e justiça. Além disso, fala da certeza de que Deus é fiel e como eles podem descansar, se alegrarem e ficar em paz: as coisas que precisam acontecer vão acontecer, porque Ele é Fiel e Justo e isso não vai mudar. Que privilégio, né? Saber que apesar de todas as coisas difíceis pelas quais estamos passando, temos um Pai que cuida de nós, que quer nos ver bem e que é Justo para cumprir tudo aquilo que nos promete, é um verdadeiro presente. Para Paulo, que no momento que escreveu essa carta estava preso (por ser perseguido por pregar o Evangelho), lhe trazia segurança saber que ele tinha um pai Fiel que estava segurando em suas mãos apesar daquele momento difícil, e por isso ele quis passar toda essa alegria e confiança aos Filipenses. Paulo era Fiel a aquele que era fiel a ele.",
                               conclusao: "É confortante saber que podemos nos alegrar mesmo em momentos difíceis e quando nos sentimos abandonados pelas pessoas porque temos um Pai Fiel e Justo, porém, o que podemos fazer para sermos fiéis a Ele? Muitas vezes, depositamos nossa confiança em pessoas, coisas ou status, porém, nada disso é realmente fiel a nós. Se desafie a se aproximar de Deus e conhecer de pertinho a sua fidelidade e reflita: o que me afasta de confiar na Fidelidade de Deus? Que a nossa confiança esteja depositada nas mãos do Pai. ",
                               aplicacao1: "",
                               aplicacao2: "",
                               aplicacao3: "",
                               backgroundColor: verde,
                               backgroundImage: UIImage(named: "vidaBase2")!,
                                   link: "https://www.youtube.com/watch?v=wSKKEAnLTDw",
                                   storyImage: "vidaStory2")
        vidaBase[indice] = vida2
    }
    else if indice == 2{
        let vida3 = CollectionItem(titulo: "Me sentindo próximo",
                               baseBiblica: refVida[indice],
                               contextualizacao: "Na passagem dessa devocional, Jesus está dando um sermão na montanha para várias pessoas e fala sobre muitos assuntos relevantes para nós que buscamos ser pessoas melhores inspiradas em Deus. Entretanto, não há como sermos inspirados por Deus se não estivermos próximos a Ele e, por isso, Jesus utiliza três verbos que resumem o nosso papel no relacionamento com Deus: pedi, buscai e batei, verbos no presente do imperativo que nos chamam para uma ação, uma atitude e tomada de decisão contínua.",
                               reflexao: "Os três verbos no presente nos ensinam sobre constância. Em qualquer tipo de relacionamento, seja com Deus ou com pessoas da nossa vida, devemos ser constantes. Temos que cultivar relacionamentos e cuidar com mestria daquilo que queremos preservar e amamos. Deus não vai invadir o seu particular a menos que você peça. Deus não vai te obrigar a seguir a Ele, muito menos te impedir de tomar alguma decisão ou atitude. Entretanto, ele oferece amor, e é por isso que devemos buscar: para encontrar (vs. 8). O quão perto Deus pode estar de nós? MUITO. Nesse trecho em Mateus 7 fica claro que nós devemos nos sentir próximos de Deus. Ele é aquele que primeiro nos amou. Vergonha, medo, desespero ou ansiedade, nada pode te afastar de Deus, porque quando você fica longe, Ele se aproxima novamente. Está feliz? Vê como Deus realmente está perto? Bata na porta e Ele abrirá para te receber. Às vezes, quando nos sentimos vazios e perdidos, sabemos que algo maior falta, não é? É porque fomos feitos para mais: fomos criados para vivermos um relacionamento com Deus e sentimos saudade daquele que é Eterno e é por isso que não nos sentimos verdadeiramente completos enquanto não o encontramos ou quando nos afastamos. Ele é seu Pai, melhor amigo. Ele está perto!",
                               conclusao: "Todo relacionamento é composto por duas partes dispostas e constantes. Deus já está te chamando e faz a parte dEle por você todos os dias! Entretanto, muitas vezes dizemos 'não' para Ele que nos estende a mão. Reflita: o que te impede hoje de viver um relacionamento com Deus? O que te impede de olhar para Ele com amor de Pai e Amigo? O melhor, eu diria, é ir para o seu quarto no seu particular e chegar perto de Cristo: estar disposto a ouvir. Que tal viver a experiência que uma vida perto dEle pode oferecer? Peça, busque e bata à porta!",
                               aplicacao1: "",
                               aplicacao2: "",
                               aplicacao3: "",
                               backgroundColor: verde,
                               backgroundImage: UIImage(named: "vidaBase3")!,
                                   link: "https://www.youtube.com/watch?v=_qDKrvstS9c",
                                   storyImage: "vidaStory3")
        
        vidaBase[indice] = vida3
    }
    else if indice == 3{
        let vida4 = CollectionItem(titulo: "Nutrição da alma",
                               baseBiblica: refVida[indice],
                               contextualizacao: "A passagem presente na base bíblica dessa devocional conta um momento da história de Jesus onde ele e seus discípulos precisavam passar por Samaria. Existia na época grande hostilidade entre judeus e samaritanos e um dos ensinamentos importantes nessa passagem é o exemplo de Jesus ao enfrentar preconceitos sócio-culturais e até mesmo machistas da época, ao conversar, aconselhar e consolar a mulher samaritana e lhe apresentar uma visão de vida que a transformou.",
                               reflexao: "É muito comum que busquemos conquistar coisas, status ou cumprir metas que estabelecemos para nós mesmos para nos sentirmos mais completos. A mulher samaritana representa um exemplo de como vivemos uma vida buscando coisas para nos definirem. No caso dela, que achava que se definia pela quantidade de casamentos que já teve ou até mesmo pelas coisas que a sociedade podia vir a falar dela. Jesus entretanto, mostrou uma visão diferente para ela: a visão de que não existe nada que nos preencha mais do que viver uma vida completa em espírito e em Verdade. No caso, Ele fala sobre a água da vida que mata a sede, ou seja, quando encontramos verdadeiramente a nutrição da alma através de uma vida de relacionamento com Deus, paramos de tentar nos completar com coisas passageiras e externas porque Ele já nos completa. A parte mais legal de todas é que Jesus fala que esse tipo de água também jorra em todos os que estão ao nosso redor (vs. 14) e assim, quando vivemos uma vida em Deus, nós nos sentimos bem ao fazer bem ao nosso próximo, já que estamos vivendo no centro da vontade do Pai para nós. Tudo depende de nós: dizer sim ou não para essa água e, assim como a mulher samaritana, conhecermos o que realmente pode nos completar.",
                               conclusao: "O que podemos fazer hoje para aceitar beber dessa água que nos preenche verdadeiramente? Será que estamos dando importância para coisas passageiras ou permitindo que coisas fracas nos preencham momentaneamente? Com o que eu tenho nutrido a minha alma? Que estejamos dispostos a nutrir nossa alma com aquele que verdadeiramente pode nos oferecer algo verdadeiro, preciso e infalível. Que sejamos seguros de que não estamos sozinhos e somos completos através da identidade que o Pai nos oferece.",
                               aplicacao1: "",
                               aplicacao2: "",
                               aplicacao3: "",
                               backgroundColor: verde,
                               backgroundImage: UIImage(named: "vidaBase5")!,
                                   link: "https://www.youtube.com/watch?v=3upP3B-By_E",
                                   storyImage: "vidaStory5")
        
        vidaBase[indice] = vida4
    }
    else if indice == 4{
        let vida5 = CollectionItem(titulo: "O meu bem",
                               baseBiblica: refVida[indice],
                               contextualizacao: "A carta de Paulo à romanos foi escrita aproximadamente em sua terceira viagem missionária e nela Paulo conta da sua vontade de visitar o povo mas, ao mesmo tempo, passa para eles, através da carta, diversos conhecimentos sobre os princípios do Evangelho (a vida e palavra de Cristo). No versículo base dessa devocional, Paulo fala sobre uma verdade vinda do caráter de Deus em seu relacionamento conosco: Ele faz com que todas as coisas cooperem para o bem daqueles que amam a Ele.",
                               reflexao: "Mas afinal, o que é esse bem? Significa que se eu amar a Deus sobre todas as coisas tudo vai dar certo na minha vida? Eu vou me dar “bem” em tudo? Essa é uma interpretação que pode ser feita de imediato, porém, como tudo na Bíblia, é importante que tenhamos vontade de ir mais a fundo e entender o real sentido da palavra. Um pouco mais à frente (vs. 29) entendemos que o verdadeiro sentido de “bem” no contexto é: a construção de um caráter parecido com o de Cristo. Logo, Paulo quer dizer que todas as coisas que vivemos, situações que passamos e enfrentamos cooperam para moldar nosso caráter para ser cada vez mais parecido com o de Cristo! Quando entendemos isso, vemos a real relação entre amar a Deus e ter as coisas cooperando para o nosso bem: se amarmos a Deus, entendemos nosso propósito para o Reino e assim vivemos uma vida onde somos verdadeiramente Cristãos (pessoas parecidas com Cristo). Com certeza é muito difícil e vamos enfrentar muitas coisas difíceis durante nossa caminhada. Por esse motivo, também podemos lembrar dos versos escritos em 1 Tessalonicenses 5:18 que nos diz para darmos graças em todas as situações (mesmo as mais difíceis) porque delas, podemos segurar na mão de Deus e falar: eu quero usar essa situação para ficar mais parecido com Cristo! ",
                               conclusao: "Jesus viveu uma vida espalhando Amor, sabedoria e cuidado para com o próximo. Logo, ser 'Cristão' é muito mais do que um rótulo, é o caráter daquele que se parece com Cristo. Que tipo de situação estamos vivendo hoje que podem ser usadas para nos tornarem mais parecidos com Ele? Que tipos de frutos você está produzindo em sua vida para ter uma identidade cristã verdadeira? Que sejamos pessoas parecidas com Cristo, que desfrutam do espírito e verdadeiramente espalham o Amor para o próximo.",
                               aplicacao1: "",
                               aplicacao2: "",
                               aplicacao3: "",
                               backgroundColor: verde,
                               backgroundImage: UIImage(named: "vidaBase4")!,
                                   link: "https://www.youtube.com/watch?v=KClZAZC2vyY",
                                   storyImage: "vidaStory4")
        
        vidaBase[indice] = vida5
    }
    else{
        let vida6 = CollectionItem(titulo: "Sabedoria e inteligência",
                               baseBiblica: refVida[indice],
                               contextualizacao: "O versículo base da devocional usa o termo “conformar” em um sentido de comparação com “esquema” padrão ou aparência externa que gera certa zona de conforto. Nesse sentido, Paulo aconselha aos Romanos para que eles não se percam em uma zona de conforto, mas que sim, renovem seus entendimentos para entenderem a vontade de Deus. O entendimento citado, pode ser interpretado como sabedoria e inteligência. Mas, afinal, de que tipo de sabedoria e inteligência o autor estava falando?",
                               reflexao: "Nós sabemos que uma pessoa inteligente é aquela que consegue aplicar com determinada maestria algum tipo de conhecimento em alguma área. Por outro lado, quando pensamos em sabedoria, logo nos vêm à mente pessoas mais velhas, que por suas experiências de vida são consideradas sábias. Ao focalizarmos no significado das duas palavras, entendemos o que Paulo quis dizer aos romanos. Devemos ter inteligência para agir nas situações e essa inteligência nós conseguimos quando buscamos entender a palavra de Deus e o que ela tem a nos oferecer de maneira profunda. Por outro lado, sabedoria está atrelado a tudo aquilo que guardamos em nossa memória e cultivamos em nossos corações. Tudo isso, sabedoria e inteligência atreladas, fazem parte do nosso processo de decisão em cada situação. Dessa forma, entendemos que o conselho de Paulo gira em torno do entendimento de uma vida com Deus baseada em aprendizado e vivência, para que assim, consigamos tomar decisões sábias e que cooperam para o nosso bem no cotidiano. É importante que estejamos dispostos a adquirir sabedoria em nossa vida, de maneira guiada por Deus, e pela sua vontade que é boa, perfeita, agradável e no afasta da conformidade com o mundo que nos oferece tanto sofrimento e dor.",
                               conclusao: "Deus nos chama para viver uma vida com sabedoria, inteligência e posicionamento onde não nos conformamos com as coisas ruins que vemos ao nosso redor. É algo bem normal tomarmos decisões impulsivas, preferirmos estar em uma zona de conforto, e insistirmos em ouvir nosso coração que muitas vezes não nos diz nada. O que você pode fazer para viver de forma mais sábia? O que te afasta de escutar a Deus nos momentos onde você deve se posicionar? Que estejamos dispostos a viver com sabedoria junto daquele que nos Ama e quer o melhor para nós. ",
                               aplicacao1: "",
                               aplicacao2: "",
                               aplicacao3: "",
                               backgroundColor: verde,
                               backgroundImage: UIImage(named: "vidaBase6")!,
                                   link: "https://www.youtube.com/watch?v=3UyhjqMVMfg",
                                   storyImage: "vidaStory6")
        
        vidaBase[indice] = vida6
        
    }
}
