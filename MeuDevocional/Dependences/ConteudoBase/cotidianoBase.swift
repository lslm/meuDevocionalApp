//
//  baseDevocionais.swift
//  MeuDevocional
//  Arquivo com as devocionais base presentes no aplicativo
//  Created by Beatriz Duque on 23/07/21.
//

import Foundation
import UIKit

var cotidianoBase: [CollectionItem] = [CollectionItem(),CollectionItem(),CollectionItem(),CollectionItem(),CollectionItem()]

func criaCotidiano(indice: Int){

    if indice == 0{
        let cotidiano1 = CollectionItem(titulo: "O que eu cultivo no meu coração?",
                                        baseBiblica: refCotidiano[0],
                                        contextualizacao: "O livro de provérbios foi escrito por Salomão, um rei considerado um dos mais sábios e uma das coisas mais importantes na sua história era que ele sempre pedia sabedoria para Deus: para tomar decisões, aprender coisas novas e principalmente para entender as coisas que aconteciam em sua vida e que envolviam os planos de Deus. O livro de provérbios nos ensina muito sobre o caráter daqueles que querem ser filhos de Deus e como tudo isso nos conduz à integridade e satisfação.",
                                        reflexao: "Já parou para olhar dentro de si e entender afinal: o que eu cultivo dentro do meu coração? As vezes, isso pode parecer muito abstrato, porém é um tipo de reflexão muito importante. O verso base da devocional foi escrito por Salomão, um rei que teve o trono por 40 anos e, em provérbios, ele deixou registrada toda a sua sabedoria adquirida no decorrer dos anos junto de Deus. Ele foi considerado um dos reis mais sábios, e em provérbios, ele dedica essa sabedoria ao Pai. Ok, já entendemos que temos que ser sábios, mas afinal, como? A dica principal do verso de hoje deixa isso bem claro: guardando o nosso coração. Ao guardarmos nosso coração, estamos preservando quem nós somos em espírito e em Verdade. É importante que protejamos nossa mente, emoções e vontades, já que nem sempre fazemos aquilo que é o melhor para nós. Muitas vezes, nos colocamos em situações de autocobrança, julgamento e autopunição que deturpam a imagem que nós temos de nós mesmos, ou seja, tiram de nós o valor que Deus quer que nós enxerguemos. Quando guardamos nosso coração de coisas que não têm o caráter puro, amoroso, bondoso e perfeito do Pai, caminhamos para a integridade e satisfação pessoal, afinal nossa vida depende da essência que carregamos em nós.",
                                        conclusao: "O verso de hoje nos ensina sobre como o que colhemos em nossa vida reflete diretamente o que cultivamos em nossos corações. Se desafie a pensar: o que eu tenho cultivado em meu coração? Essas coisas que cultivam, refletem a luz e o Amor que Jesus me ensinou? O que eu preciso mudar, para encher meu coração de coisas boas e, como consequência, ajudar as pessoas próximas a mim a cuidarem do coração delas também? Que você se sinta motivado a abandonar tudo o que está firmado no seu coração que te afasta do Pai.",
                                        aplicacao1: "",
                                        aplicacao2: "",
                                        aplicacao3: "",
                                        backgroundColor: verde,
                                        backgroundImage: UIImage(named:"cotidianoBase1")!,
                                        link: "https://www.youtube.com/watch?v=OXBCV5WixCU",
                                        storyImage: "cotidianoStory1")
        cotidianoBase[indice] = cotidiano1
    }
    ///Tomando decisões
    else if indice == 1{
        let cotidiano2 = CollectionItem(titulo: "Tomando decisões",
                                        baseBiblica: refCotidiano[1],
                                        contextualizacao: "O livro de Salmos tem sua autoria atribuida a diversos autores (como por exemplo, Davi, Asafe, Filhos de Corá, etc), entretanto, o livro inteiro é muito rico por apresentar passagens que demonstram uma vida de comunhão com Deus em oração e louvor. Uma das coisas que o versículo base dessa devocional pode nos ensinar é exatamente sobre isso: comunhão e relacionamento. Deus nos mostra que uma vida de relacionamento com Ele afasta de nós todo o medo e insegurança.",
                                        reflexao: "Às vezes nos sentimos em situações difíceis e não sabemos qual decisão tomar. Pra onde tenho que ir? O que eu tenho que escolher? Isso acontece muitas vezes porque temos medo do que pode acontecer se tomarmos determinada decisão ou até mesmo ficamos ansiosos ao pensar no que pode acontecer depois. Quando nos sentimos assim, temos que olhar para dentro do nosso coração e perguntar: porque eu quero seguir por esse caminho? A partir do momento que entendemos a motivação de cada caminho que queremos seguir, temos que nos perguntar: isso se alinha com a vontade de Deus para minha vida? A vontade de Deus para muitos pode ser misteriosa, mas, na verdade, Jesus em vida ensinou que é bem simples seguir a vontade do Pai: temos que estar próximos dele. Quando temos um melhor amigo, sabemos o que ele quer, ou se ele gostou de alguma piada solta na rodinha só pelo olhar dele, não é? Com Deus é a mesma coisa: se o conhecermos e formos próximos, saberemos em qual direção seguir. A vontade de Deus é boa, perfeita e agradável, Ele quer que sejamos felizes (vs. 4), e principalmente, que vivamos uma vida relevante em Espírito e em Verdade. Dessa forma, fica muito mais fácil tomar decisões, já que temos um Pai que está lado a lado, em cada passo que damos (vs.5).",
                                        conclusao: "Ao tomarmos decisões tendemos a querer controlar tudo e confiar apenas no nosso próprio julgamento, e é por isso que temos sempre que lembrar de entregar o caminho para Ele. Reflita: Como isso se alinha com a vontade de Deus para minha vida? Ore, fale com Deus, pergunte e não tenha medo de tomar alguma decisão! Confia naquele que te Ama e que está ao seu lado. Lembre do que Jesus ensinou: ame aos próximos como a ti mesmo e ame a Deus sobre todas as coisas. Que suas decisões girem em torno dessa verdade!",
                                        aplicacao1: "",
                                        aplicacao2: "",
                                        aplicacao3: "",
                                        backgroundColor: verde,
                                        backgroundImage: UIImage(named:"cotidianoBase2")!,
                                        link: "https://www.youtube.com/watch?v=ePdRgBWhvog",
                                        storyImage: "cotidianoStory2")
        cotidianoBase[indice] = cotidiano2
    }
    ///Por que estou passando por isso?
    else if indice == 2 {
        let cotidiano3 = CollectionItem(titulo: "Por que estou passando por isso?",
                                        baseBiblica: refCotidiano[indice],
                                        contextualizacao: "Paulo tem uma história incrível. Ele perseguia cristãos e era cheio de ódio em seu coração, até que um dia, conheceu o Amor de Jesus de verdade (Atos 9) e se apaixonou. Depois disso, fez-se disposto a espalhar aquilo que ele mais amava para outras pessoas. Na passagem base dessa devocional, Paulo está se defendendo diante de um tribunal que quer atribuir a ele uma pena de morte já que autoridades da época se incomodavam com a pregação da palavra de Cristo.",
                                        reflexao: "Ao meditarmos nesse capítulo podemos perceber que a vida de Paulo não foi nada fácil. Ele passou por muita coisa muito ruim e difícil, e muitos, no lugar dele, teriam desistido. É muito mais fácil abandonarmos algo para pararmos de ser confrontados por aquilo e, então, vivermos uma vida mais confortável. É muito mais fácil não fazermos quando estamos cobertos do medo de errar ou falhar. É muito mais fácil desistir. Porém, Paulo sabia que o amor dele por pregar o evangelho era muito maior do que qualquer aflição que ele iria passar e mais do que isso: a felicidade de viver o seu propósito era muito maior do que qualquer tristeza momentânea. Além disso, sua história foi a prova em vida de como o amor de Jesus salva e é transformador. Muitas vezes, nos pegamos pensando: Por que eu estou passando por isso? Por que isso só acontece comigo? Por que não é mais fácil? Bom, essas são perguntas que nunca poderemos responder mesmo. Porém, assim como Paulo, podemos ser gratos ao cumprirmos o nosso chamado. E mais: podemos usar nossas experiências de vida para ajudar outras pessoas, assim como ele fez! Pode ser difícil e às vezes podemos nos sentir assustados, mas temos um Pai que segura nossa mão e enfrenta o caminho difícil junto da gente.",
                                        conclusao: "Em João 16:33 Jesus fala que o mundo é muito difícil e que no meio do caminho vamos encontrar muitos problemas, mas não podemos nos abalar por causa disso. Ele, em vida, mostrou que apesar de todos os problemas, podemos viver uma vida feliz cumprindo o nosso chamado e ajudando aqueles que estão ao nosso redor. Que tal nos desafiarmos a tirar dos momentos difíceis forças para continuar? E se usarmos nossas experiências de vida para ajudar aqueles que estão passando por ele? Que assim como Paulo, nosso caráter esteja fundado no Amor de Jesus.",
                                        aplicacao1: "",
                                        aplicacao2: "",
                                        aplicacao3: "",
                                        backgroundColor: verde,
                                        backgroundImage: UIImage(named:"cotidianoBase3")!,
                                        link: "https://www.youtube.com/watch?v=V5ixXXGYdPE",
                                        storyImage: "cotidianoStory3")
        cotidianoBase[indice] = cotidiano3
    }
    ///Faça o que eles dizem?
    else if indice == 3{
        let cotidiano4 = CollectionItem(titulo: "Faça o que eles dizem?",
                                        baseBiblica: refCotidiano[indice],
                                        contextualizacao: "O livro de Gálatas é uma carta de Paulo endereçada à uma igreja em uma região da Ásia menor. Vemos uma grande preocupação de Paulo em mostrar que nossos próprios esforços não nos salvam do mundo, e sim que a morte de Jesus é que na verdade nos traz liberdade para vivermos uma vida onde somos libertos do pecado, quando aceitamos a Jesus. A base bíblica dessa devocional fala muito sobre a nossa maneira de estarmos apegados naquilo que os outros pensam de nós, em cobranças e fardos.",
                                        reflexao: "Por que nos preocupamos tanto com o que os outros dizem ou com a visão que vamos passar no meio em que estamos? O primeiro motivo de tudo isso é a sensação de reconhecimento pessoal. Às vezes, nosso egoísmo faz a gente pensar que só seremos felizes de verdade quando vivermos uma vida constante de agrado próprio e, dessa forma, acabamos virando escravos do nosso próprio ego. Isso é um grande problema, porque nos traz um fardo grande e pesado, sendo que, quando não conseguimos realizar algo que alimentaria esse ego, ficamos extremamente frustados e nos sentindo insuficientes. Além disso, fazemos o que os outros dizem porque somos influenciáveis e temos medo do que podem dizer para nós, o que podem pensar e até mesmo como vão nos apontar os dedos. Por último, um dos motivos de vivermos com medo do que os outros dizem e sermos tão influenciáveis é o de vivermos parcialmente para Deus, já que nós só aceitamos seguir aquilo que nos convém. Nós sabemos que Deus quer uma coisa pra nossa vida, que Ele nos chama pra viver algo novo, mas preferimos obedecer o nosso coração enganoso ou até mesmo seguir um conselho, uma atitude ou vontade que nos afasta de Deus. Algo pode te preencher momentâneamente, mas ao mesmo tempo te entristecer por te afastar de Deus.",
                                        conclusao: "Jesus foi uma pessoa que viveu a vida dele inteira (e principalmente no momento de sua morte) sendo julgado por homens. Sabe qual a parte mais impressionante? Jesus era perfeito. Mas mesmo assim, arrumavam motivos para julgar a ele. Entretando, a opinião que mais importava, para Ele, era a de Deus. Ele nos convida para vivermos uma vida sem medo, uma vida livre, através da vida dEle, onde nosso foco central deve ser: qual a visão que Deus tem de mim? Porque a visão daquele que mais te ama e mais te quer o bem é a que mais importa.",
                                        aplicacao1: "",
                                        aplicacao2: "",
                                        aplicacao3: "",
                                        backgroundColor: verde,
                                        backgroundImage: UIImage(named:"cotidianoBase4")!,
                                        link: "https://www.youtube.com/watch?v=2CeP-CutFiM",
                                        storyImage: "cotidianoStory4")
        cotidianoBase[indice] = cotidiano4
    }
    ///Minha vocação
    else{
        let cotidiano5 = CollectionItem(titulo: "Minha vocação",
                                        baseBiblica: refCotidiano[indice],
                                        contextualizacao: "A carta de Paulo é destinada a Timóteo e ela tem o objetivo de avisar como era importante que ele realmente vivesse aquilo que Deus tinha separado para ele. Paulo deixa claro em suas cartas como é importante que nós nos entreguemos de corpo e alma para cumprir aquilo que nos é designado (no caso de Timóteo, cuidar de uma igreja e da pregação do evangelho). No verso base da devocional, Paulo incentiva Timóteo a viver uma vida sem medo de cumprir o propósito que Deus o designou.",
                                        reflexao: "Assim como Timóteo, diversas vezes nos encontramos em situações que nos colocam à prova e que exigem muito de nós. É muito comum que tentemos sempre fazer aquilo que é mais confortável, que gera menos risco e que nos desafie pouco né? Afinal, ninguém aqui gosta de falhar. Entretanto, Paulo nos apresenta um pensamento bem diferente desse que temos geralmente: ele fala que Deus nos dá um espírito de força, de amor e de moderação (sabedoria, pensar de forma inteligente). Quantas vezes não nós pegamos tentando entender qual a nossa vocação pra determinada coisa, não é? Será que sou bom nisso? Será que tenho que fazer isso e enfrentar tantas coisas? Será que eu consigo? O filme UP, altas aventuras é um bom exemplo desse tipo do tipo de comportamento que Deus espera de nós: que sejamos fortes, corajosos e tenhamos um plano em mente, visando a nossa linha de chegada! E o principal de tudo: mesmo se tivermos medo e muitas pessoas tentando impedir nossos caminhos, nossos sonhos e vocações, nosso coração vai estar centrado naquilo que amamos e na verdadeira vontade de Deus. No caso do filme, cumprir uma promessa ao verdadeiro amor, no caso da nossa vida Cristã, cumprir a promessa de Deus em nós e amar isso sobre todas as coisas. ",
                                        conclusao: "Não fique preocupado, com medo ou se cobrando a todo momento quando parar para refletir sobre suas vocações, objetivos ou até mesmo metas. Deus nos deu uma vida cheia de propósito para vivermos todos os dias sem medo de cumprirmos os sonhos que Ele sonhou para nós. Reflita hoje: o que foi designado para mim? Família, amigos, um emprego, um projeto, um cargo na minha igreja local? E siga o conselho de Paulo para Timóteo: que tenhamos força, amor e moderação (vs.7) para seguir a vocação que nos é determinada.",
                                        aplicacao1: "",
                                        aplicacao2: "",
                                        aplicacao3: "",
                                        backgroundColor: verde,
                                        backgroundImage: UIImage(named:"cotidianoBase5")!,
                                        link: "https://www.youtube.com/watch?v=0RjojWKqsFY",
                                        storyImage: "cotidianoStory5")
        cotidianoBase[indice] = cotidiano5
    }
}
