//
//  estudosBase.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 25/07/21.
//

import Foundation
import UIKit

var estudosBase: [CollectionItem] = [CollectionItem(),CollectionItem(),CollectionItem(),CollectionItem(),CollectionItem()]

func criaEstudos(indice:Int){
    if indice == 0{
        let estudos1 = CollectionItem(titulo: "Frutos do espírito",
                                      baseBiblica: "Gálatas 5: 16-26",
                                      contextualizacao: "A carta de Gálatas deixa bem clara a relação que devemos ter com nossa fé: a de liberdade vinda por meio de Cristo. Isso porque, mesmo após a vida e morte de Jesus, muitas pessoas ainda achavam que para ser salvas precisavam viver uma vida regrada de leis (construídas pelos próprios homens), rituais e costumes considerados sagrados. Nessa carta, e mais em específico, na base bíblica dessa devocional, Paulo explica o verdadeiro significado de relacionamento e vida com Deus.",
                                      reflexao: "Quando amamos alguma coisa ou alguém, queremos viver aquele amor. Estampamos em pôsteres, camisetas, fotos, redes sociais, gritamos e choramos para proteger aquele amor. Nós nos apegamos às coisas que amamos e essa é uma das maiores características de nós como seres com almas e sentimentos. Entretanto, muitas pessoas antigamente (como em Gálatas) e até mesmo hoje em dia, insistem em dizer que amam a Deus, quando na verdade, não o amam. Como assim? A verdade é simples e clara: quando amamos a Deus de verdade, produzimos frutos! Frutos esses que são descritos como coisas boas, que fazem bem para nós e para aqueles que nos rodeiam. O que Paulo quer dizer nesse verso é que quando amamos a Deus verdadeiramente plantamos coisas boas e colhemos isso através dos nossos frutos, e tudo isso de forma livre, sem termos que nos apegar em leis, tradições ou rituais pelo simples fato de que Jesus já morreu e ressuscitou para perdoar nossos pecados e nos levar para mais perto de Deus. Jesus em vida, produziu todos esses frutos e nos ensinou através de exemplos práticos, como podemos viver uma vida que planta e colhe apenas frutos inspirados no Amor do Pai. Da mesma forma, é nosso papel nos afastarmos daquilo que oculta e ofusca em nossa a Luz que vem do alto já que não é possível que cultivemos o mesmo tipo de fruto em uma única árvore (vs.17). É algo que vai muito além de uma escolha de vida, e sim, uma escolha diária e constante. ",
                                      conclusao: "Uma vida com frutos do espírito é aquela que está perto de Deus, pois tudo o que é bom dentro de nós reflete diretamente a luz dEle. Precisamos nos perguntar: que tipo de fruto eu estou plantando hoje para colher amanhã? Eu sou uma pessoa que transmite paz para meu próximo? Amor, alegria, fidelidade e paciência fazem parte de quem eu sou, ou eu apenas estou plantando e colhendo frutos que me afastam de Deus? O Pai te convida a colher os frutos do espírito todos os dias.",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase1")!,
                                      link:"https://www.youtube.com/watch?v=BlOtVv6h1rY")
        estudosBase[indice] = estudos1
    }
    else if indice == 1{
        let estudos2 = CollectionItem(titulo: "Religiosidade",
                                      baseBiblica: "Mateus 15:1‭-‬20 ",
                                      contextualizacao: "Na passagem dessa devocional, Jesus enfrenta uma situação onde escribas e fariseus (homens da lei e religiosos) confrontaram a ele e aos seus discípulos por não lavarem as mãos (se purificarem) antes de começarem a comer, afinal, esse era um dos mandamentos de Deus para os homens e essa lei deveria ser seguida a risca. Entretanto, Jesus mostra a eles uma visão diferente da situação e os chama de hipócritas.",
                                      reflexao: "Jesus se entristece pois vê que eles vivem pelas leis em nome de Deus mas não amam a Deus verdadeiramente. Os escribas e fariseus não faziam o bem porque amavam a Deus e sim porque amavam as leis! Você percebe que Jesus veio não somente para nos limpar dos nossos pecados, trazer sua graça e Espírito, mas também para acabar com a Religiosidade que mais prende o ser humano do que preenche o coração? Pois é. Cristo não é mais um ditador religioso ou sociólogo, Ele é o próprio Pai que vem pra nos trazer liberdade. Essa é a palavra. Em Cristo temos Liberdade, o que é diferente da libertinagem. Temos uma melhor palavra, em Cristo temos um relacionamento em que nos é ensinado a maneira certa de viver, com um coração puro e entregue a Deus e que não se contamina com atitudes que não condizem com o caráter de Cristo (vs.20). Deus não está interessado em prisioneiros e muito menos em pessoas que seguem um livro com regras, Deus nos ama a ponto de nos chamar para viver um verdadeiro relacionamento com um coração transformado pela sua graça, isso sim faz parte do Amor de Cristo. Jesus nos ensina que um verdadeiro relacionamento é muito maior do que qualquer religiosidade que nos aprisiona e nos impede de realmente conhecer e viver o amor de Deus.",
                                      conclusao: "Entenda que Deus te chama para um relacionamento. O que você precisa fazer para se afastar da religiosidade e verdadeiramente entrar em uma vida de relacionamento com o Pai? Abra seu coração hoje pra Ele. Cristo quer te ouvir. Fale o que te incomoda, o que te alegra, fale e deixe-se ser levado pelos braços de Amor do Pai.",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase2")!,
                                      link: "https://www.youtube.com/watch?v=_qDKrvstS9c")
        estudosBase[indice] = estudos2

    }
    else if indice == 2{
        let estudos3 = CollectionItem(titulo: "O que é graça?",
                                      baseBiblica: "Efésios 2: 1-10",
                                      contextualizacao: "Éfeso era um porto na costa oeste da Ásia Menor. Efésios então, é uma carta de Paulo escrita para essa igreja que tem como o objetivo, orienta-los sobre o caráter daqueles que verdadeiramente andam com Cristo. É muito comum nessa carta encontrarmos versos que falam sobre a vida de Cristo e tudo o que ele quis ensinar, principalmente, focando no significado da sua morte na Cruz. O texto base da devocional nos explica bastante sobre o nosso caráter (como seres humanos) e o caráter de Cristo.",
                                      reflexao: "Efésios 2 começa nos explicando como antes de Jesus, o homem era escravo de uma vida de pecado, isso porque, não conheciam verdadeiramente a Deus, e assim, viviam seguindo os desejos dos próprios corações: guerras, intrigas, imoralidades de todos os tipos, e isso os afastavam de Deus cada vez mais (vs 1-3). Entretanto, Jesus em vida, veio nos mostrar que o nosso lugar é perto do Pai. Em vida, Ele serviu pessoas, nos ensinou sobre o Amor ao próximo e sobre o Amor a Deus. Jesus morreu por todos os nossos pecados, ou seja, Ele morreu para quebrar a barreira que existia entre o homem e entre Deus. No fim, Ele ressuscitou e disse que um dia voltará para buscar a todos os filhos de Deus. Mas afinal, o que significa tudo isso? Jesus morreu por pessoas que o maltratavam, por pessoas que já tinham morrido e por pessoas que ainda não tinham nascido. Ele morreu, para que nós vivêssemos uma vida de liberdade, conhecendo o verdadeiro caráter de Deus e isso é totalmente imerecido! Nós não merecemos tamanha bondade, e é por isso que o versículo base fala que pela Graça de Deus nós somos salvos e isso não vem de nós, é dado por Deus! Isso significa que não existe nada que você pode fazer para comprar um lugar no céu ou para merecer mais estar lá do que outras pessoas, sabe por quê? Porque você não merece! Ninguém merece, e é por isso que vivemos debaixo da graça de Deus: mesmo não merecendo, Ele enviou Jesus para que pudéssemos ser Filhos de Deus. ",
                                      conclusao: "Pare de querer comprar o seu lugar no céu! Não há nada que você pode fazer para fazer Deus te amar mais do que Ele te ama, porque o Amor dEle é perfeito. Da mesma forma, não há nada que você pode fazer para Ele te Amar menos. Quando entendemos de verdade esse Amor, queremos verdadeiramente viver no centro dEle. Pare para refletir: eu vivo no centro do Amor de Deus? Eu sou fiel à graça Imerecida que a mim foi dada de presente? Analise sua vida e veja tudo aquilo que te afasta de demonstrar a verdadeira gratidão pela Graça e principalmente faça uma análise de tudo aquilo que te afasta de viver essa Graça.",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase3")!,
                                      link: "https://www.youtube.com/watch?v=afI7c26HHEk")
        estudosBase[indice] = estudos3

    }
    else if indice == 3{
        let estudos4 = CollectionItem(titulo: "Buraco da agulha?",
                                      baseBiblica: "Mateus 19: 23-24",
                                      contextualizacao: "O livro de Mateus tem sua autoria atribuída ao Apóstulo Mateus e ele se encarrega de escrever, através de sua visão, a história da vida de Jesus, não só como uma pessoa, mas como o cumprimento da profecia do Antigo Testamento, onde a lei (mandamentos de Deus) ganharia através de Jesus, um novo significado. Jesus em vida passava ensinamentos através de sentidos figurados principalmente porque seguia grande perseguição dos donos da lei na época, já que causava grande impacto na sociedade. No versículo base dessa devocional, Jesus faz o uso de uma analogia um tanto curiosa para passar um ensinamento. ",
                                      reflexao: "Jesus ensina aos seus discípulos que é mais fácil que um camelo passe pelo buraco de uma agulha do que um rico entrar no reino dos céus. De imediato pensamos: nossa, então é impossível que alguém com riquezas vá para o céu. Muitas pessoas acreditam que é correto pensar assim, já que uma baixa condição financeira remete à humildade, um dos traços de caráter de Cristo, entretanto, não é bem sobre isso que Jesus está falando. A agulha, na verdade, era o nome dado a um tipo de porta lateral à porta principal que existia na cidade de Jerusalém. Era uma porta bem pequena e estreita que era usada quando a porta principal estava fechada. Porém, para o camelo passar por essa portinha chamada “agulha” era necessário que ele fosse descarregado (ou seja, se estava com alguma bagagem, ela devia ser retirada), além disso, o camelo também precisava passar ajoelhado, já que a porta além de estreita também era baixa. Agora, quando entendemos o verdadeiro significado da analogia, conseguimos entender melhor o que Jesus quis dizer: precisamos nos desprender de coisas materiais e nos prostrar diante do que realmente importa para entrarmos nos reinos dos céus. Muitas vezes nós nos apegamos em coisas materiais, em status pessoal e até mesmo em outras pessoas. Tudo isso nos afasta de conhecer verdadeiramente a Deus e principalmente de conhecermos o seu Amor, pois decidimos amar todas as outras coisas muito mais. Assim, fica meio óbvio, quando escolhemos as outras coisas, nos colocamos no papel do “rico” na analogia. No final, é tudo uma questão de escolha própria. A porta está aberta, e Ele nos chama, cabe a nós entendermos o chamado e nos colocarmos dispostos. ",
                                      conclusao: "Se desafie a entender o que te impede de conhecer mais a Deus. Quais são as coisas que estão prendendo o seu coração? Quais são as cargas que você precisa deixar para passar pela porta estreita? Entenda o que te afasta de viver uma vida com Deus e viver debaixo da verdadeira riqueza expressada através do amor dEle por nós.  ",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase4")!,
                                      link: "https://www.youtube.com/watch?v=v11UtxKcXTc")
        
        estudosBase[indice] = estudos4
    }
    else{
        let estudos5 = CollectionItem(titulo: "A rainha Ester",
                                      baseBiblica: "Ester 4: 1-17",
                                      contextualizacao: "Acredita-se que a história no livro de Ester se desenrola num período de quatro anos, iniciando no terceiro reinado de Xerxes. O livro se trata de um estudo da sobrevivência do povo de Deus (judeus) em meio à perseguição. Hamã, um homem muito importante no reino (que tinha seu cargo apenas abaixo do rei) manipulava o rei para que os judeus fossem aniquilados já que eles se negavam a adorar a Hamã, pois serviam apenas a Deus. ",
                                      reflexao: "Ester era uma mulher de grande beleza (tanto por dentro quanto por fora) e foi escolhida pelo rei para ser sua esposa, entretanto, ele não sabia que na verdade ela era Judia, o que podia ser um grande problema, já que os judeus eram perseguidos no reino e existiam planos para a aniquilação de todos. Ester podia se calar e aceitar ver seu povo inteiro ser morto em sua frente, porém, ela sabia que  Deus tinha grandes planos e promessas para o povo, que se cumpririam um dia com a vinda de um salvador (no caso, Jesus). Resumidamente, Ester  conversa com o rei para que ele livre o povo judeu da perseguição e graças a ela, o povo passa a ser livre no reino. O livro de Ester mostra o quanto ela foi forte e corajosa já que naquela época, era muito difícil qualquer pessoa fazer pedidos diretos ao rei, muito menos mulheres, dado em conta a época machista em que o mundo se encontrava. Ester orou, jejuou, se identificou com seu povo e encontrou em Deus a coragem que existia dentro de si para passar por uma situação difícil e que colocava em risco sua própria vida. Ester foi uma mulher forte e corajosa que se posicionou por aqueles que amava e até hoje é exemplo feminino de atitude, humildade, interdependência e amor a Deus. A coragem de Ester de interceder frente a um reino inteiro de perseguições pelo seu povo foi tão grandioso, que muitos comparam sua coragem com a de Jesus, já que ela também não se importou de colocar sua vida em risco para salvar e libertar aqueles que ela amava: o seu povo. Por fim, a Rainha Ester nos mostra como uma vida centrada na verdade e em causas que Deus coloca em nossas mãos vale muito mais a pena do que qualquer status ou rótulo que o mundo nos dá.",
                                      conclusao: "Ester se colocou em uma situação onde poderia perder seu trono e até mesmo sua vida, mas para ela, nada valia mais do que a causa pela qual ela estava lutando. Mesmo em um mundo machista e opressor de tantas formas, Deus levanta mulheres gigantes para lutarem pelas causas do reino: Ele nos mostrou através da vida de Ester que todos os filhos de Deus tem voz e em seu reino não há distinção! E você, está se levantando com força, coragem, humildade e fé assim como a Rainha Ester? ",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase5")!,
                                      link: "https://www.youtube.com/watch?v=v_iwCyjpN9o")
        estudosBase[indice] = estudos5
    }
}

