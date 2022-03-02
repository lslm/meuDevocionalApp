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
                                      baseBiblica: refEstudos[indice],
                                      contextualizacao: "A carta de Gálatas deixa bem clara a relação que devemos ter com nossa fé: a de liberdade vinda por meio de Cristo. Isso porque, mesmo após a vida e morte de Jesus, muitas pessoas ainda achavam que para ser salvas precisavam viver uma vida regrada de leis (construídas pelos próprios homens), rituais e costumes considerados sagrados. Nessa carta, e mais em específico, na base bíblica dessa devocional, Paulo explica o verdadeiro significado de relacionamento e vida com Deus.",
                                      reflexao: "Quando amamos alguma coisa ou alguém, queremos viver aquele amor. Estampamos em pôsteres, camisetas, fotos, redes sociais, gritamos e choramos para proteger aquele amor. Nós nos apegamos às coisas que amamos e essa é uma das maiores características de nós como seres com almas e sentimentos. Entretanto, muitas pessoas antigamente (como em Gálatas) e até mesmo hoje em dia, insistem em dizer que amam a Deus, quando na verdade, não o amam. Como assim? A verdade é simples e clara: quando amamos a Deus de verdade, produzimos frutos! Frutos esses que são descritos como coisas boas, que fazem bem para nós e para aqueles que nos rodeiam. O que Paulo quer dizer nesse verso é que quando amamos a Deus verdadeiramente plantamos coisas boas e colhemos isso através dos nossos frutos, e tudo isso de forma livre, sem termos que nos apegar em leis, tradições ou rituais pelo simples fato de que Jesus já morreu e ressuscitou para perdoar nossos pecados e nos levar para mais perto de Deus. Jesus, em vida, produziu todos esses frutos e nos ensinou através de exemplos práticos como podemos viver uma vida que planta e colhe apenas frutos inspirados no Amor do Pai. Não é possível que cultivemos o mesmo tipo de fruto em uma única árvore (vs.17), cabe a nós a escolha diária de qual fruto produzir.",
                                      conclusao: "Uma vida com frutos do espírito é aquela que está perto de Deus, pois tudo o que é bom dentro de nós reflete diretamente a luz dEle. Precisamos nos perguntar: que tipo de fruto eu estou plantando hoje para colher amanhã? Eu sou uma pessoa que transmite paz para meu próximo? Amor, alegria, fidelidade e paciência fazem parte de quem eu sou, ou eu apenas estou plantando e colhendo frutos que me afastam de Deus? O Pai te convida a colher os frutos do espírito todos os dias.",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase1")!,
                                      link:"https://www.youtube.com/watch?v=BlOtVv6h1rY",
                                      storyImage: "estudosStory1")
        estudosBase[indice] = estudos1
    }
    else if indice == 1{
        let estudos2 = CollectionItem(titulo: "Religiosidade",
                                      baseBiblica: refEstudos[indice],
                                      contextualizacao: "Na passagem dessa devocional, Jesus enfrenta uma situação onde escribas e fariseus (homens da lei e religiosos) confrontaram a ele e aos seus discípulos por não lavarem as mãos (se purificarem) antes de começarem a comer, afinal, essa era uma das tradições que eram consideradas sagradas e por isso deveria ser seguida a risca. Assim, Jesus mostra a eles uma visão diferente da situação e até mesmo os chama de hipócritas. Por que afinal, homens tão 'corretos' e religiosos seriam hipócritas?",
                                      reflexao: "Jesus se entristece pois vê que eles vivem pelas leis em nome de Deus mas não amam a Deus verdadeiramente. Os escribas e fariseus não faziam o bem porque amavam a Deus e sim porque amavam as leis e, dessa forma, acabavam sendo prisioneiros da própria religião. Você percebe que Jesus veio não somente para nos limpar dos nossos pecados, trazer sua graça e Espírito, mas também para quebrar a corrente da Religiosidade que mais prende o ser humano do que preenche o coração? Pois é. Cristo não é mais um ditador religioso ou sociólogo, Ele é o próprio Pai que vem pra nos trazer liberdade. Essa é a palavra. Em Cristo temos Liberdade ( o que é diferente da libertinagem). Em Cristo temos um relacionamento em que nos é ensinado sobre o amor de Deus por nós e do nosso amor por Ele, com um coração puro e entregue que não se contamina com atitudes que não condizem com o caráter de Cristo (vs.20). Deus não está interessado em prisioneiros e muito menos em pessoas que seguem regras estabelecidas pelos próprios homens, Deus nos ama a ponto de nos chamar para viver um verdadeiro relacionamento com um coração transformado pela sua graça, isso sim faz parte do Amor de Cristo. É quebrando a corrente da religiosidade que verdadeiramente o seguimos por amor.",
                                      conclusao: "Jesus nos ensina que um verdadeiro relacionamento é muito maior do que qualquer religiosidade que nos aprisiona e nos impede de realmente conhecer e viver o amor de Deus. Entenda que Deus te chama para um relacionamento. O que você precisa fazer para se afastar da religiosidade e verdadeiramente entrar em uma vida de relacionamento com o Pai? Abra seu coração hoje pra Ele. Cristo quer te ouvir. Fale o que te incomoda, o que te alegra, esteja disposto e seja levado pelos braços de Amor do Pai que quebra todas as correntes.",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase2")!,
                                      link: "https://www.youtube.com/watch?v=_qDKrvstS9c",
                                      storyImage: "estudosStory2")
        estudosBase[indice] = estudos2

    }
    else if indice == 2{
        let estudos3 = CollectionItem(titulo: "O que é graça?",
                                      baseBiblica: refEstudos[indice],
                                      contextualizacao: "Éfeso era um porto na costa oeste da Ásia Menor. Efésios, então, é uma carta de Paulo escrita para essa igreja que tem como o objetivo orienta-los sobre o caráter daqueles que verdadeiramente andam com Cristo. É muito comum nessa carta encontrarmos versos que falam sobre a vida de Cristo e tudo o que ele quis ensinar, principalmente focando no significado da sua morte na Cruz. O texto base da devocional nos explica sobre o caráter do ser humano e o caráter de Cristo.",
                                      reflexao: "Efésios 2 começa nos explicando como antes de Jesus, o homem era escravo de uma vida de pecado, isso porque, não conheciam verdadeiramente a Deus, e assim, viviam seguindo os desejos dos próprios corações: guerras, intrigas, imoralidades de todos os tipos, e isso os afastavam de Deus cada vez mais (vs 1-3). Entretanto, Jesus em vida, veio nos mostrar que o nosso lugar é perto do Pai. Em vida, Ele serviu pessoas, nos ensinou sobre o Amor ao próximo e sobre o Amor a Deus. Jesus morreu por todos os nossos pecados, ou seja, Ele morreu para quebrar a barreira que existia entre o homem e entre Deus. No fim, Ele ressuscitou e disse que um dia voltará para buscar a todos os filhos de Deus. Mas afinal, o que significa tudo isso? Jesus morreu por pessoas que o maltratavam, por pessoas que já tinham morrido e por pessoas que ainda não tinham nascido. Ele morreu, para que nós vivêssemos uma vida de liberdade, conhecendo o verdadeiro caráter de Deus e isso é totalmente imerecido! Nós não merecemos tamanha bondade, e é por isso que o versículo base fala que pela Graça dada por Deus nós somos salvos e isso não vem de nós! Todas as vezes que tentamos viver em busca da salvação pelos nossos próprios esforços, e não pela graça, estamos afirmando que Jesus não foi o suficiente.",
                                      conclusao: "Não há nada que você pode fazer para fazer Deus te amar mais do que Ele te ama, porque o Amor dEle é perfeito. Jesus já é o suficiente para nos oferecer uma vida com o pai. Não viva para querer conquistar o seu lugar no céu, viva para ser grato e para reconhecer o Amor daquele que já te garantiu isso pela graça! Quando entendemos de verdade esse Amor, queremos verdadeiramente viver no centro dEle. Reflita: Eu sou fiel à graça Imerecida que a mim foi dada de presente? Analise sua vida e veja tudo aquilo que te afasta de viver em Amor pela Graça.",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase3")!,
                                      link: "https://www.youtube.com/watch?v=afI7c26HHEk",
                                      storyImage: "estudosStory3")
        estudosBase[indice] = estudos3

    }
    else if indice == 3{
        let estudos4 = CollectionItem(titulo: "Buraco da agulha?",
                                      baseBiblica: refEstudos[indice],
                                      contextualizacao: "O livro de Mateus tem sua autoria atribuída ao Apóstulo Mateus, que conta através de sua visão a história da vida de Jesus. Cristo passava ensinamentos através de sentidos figurados principalmente porque seguia grande perseguição dos donos da lei na época. No versículo base dessa devocional, Jesus faz o uso de uma analogia um tanto curiosa para passar um ensinamento: é mais fácil que um camelo passe pelo buraco de uma agulha do que um rico entrar no reino dos céus.",
                                      reflexao: "De imediato pensamos: nossa, então é impossível que alguém com riquezas vá para o céu! Muitas pessoas acreditam que é correto pensar assim, já que uma baixa condição financeira remete à humildade, um dos traços de caráter de Cristo. Entretanto, não é bem sobre isso que Jesus está falando. A agulha, na verdade, era o nome dado a um tipo de porta lateral à porta principal que existia na cidade de Jerusalém. Era uma porta bem pequena e estreita que era usada quando a porta principal estava fechada. Porém, para o camelo passar por essa portinha chamada “agulha” era necessário que todas as bagagens fossem descarregadas. Além disso, o camelo também precisava passar ajoelhado, já que a porta além de estreita também era baixa. Logo, a analogia de Jeus ganha outro sentido ao entendermos esse conceito: precisamos nos desprender de coisas materiais e nos prostrar diante do que realmente importa para entrarmos nos reinos dos céus. Muitas vezes nós nos apegamos em coisas materiais, em status pessoal, rótulos e até mesmo em outras pessoas. Tudo isso nos afasta de conhecer verdadeiramente a Deus e principalmente de conhecermos o seu Amor, pois decidimos continuar carregando as tantas bagagens que nos impedem de passar pela porta.",
                                      conclusao: "No final, é tudo uma questão de escolha própria. A porta está aberta, e Ele nos chama, cabe a nós entendermos o chamado e nos colocarmos dispostos, largarmos nossas bagagens e nos fazermos humildes. Se desafie a entender o que te impede de conhecer mais a Deus. Quais são as coisas que estão prendendo o seu coração? Quais são as cargas que você precisa deixar para passar pela porta estreita? Entenda o que te afasta de viver uma vida com Deus e viver debaixo da verdadeira riqueza expressada através do amor dEle por nós.",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase4")!,
                                      link: "https://www.youtube.com/watch?v=v11UtxKcXTc",
                                      storyImage: "estudosStory4")
        
        estudosBase[indice] = estudos4
    }
    else{
        let estudos5 = CollectionItem(titulo: "A rainha Ester",
                                      baseBiblica: refEstudos[indice],
                                      contextualizacao: "Acredita-se que a história no livro de Ester se desenrola num período de quatro anos, iniciando no terceiro reinado do rei Assuero (acredita-se que esse rei tenha sido Xerxes). O livro se trata de um estudo da sobrevivência do povo de Deus (judeus) em meio à perseguição. Hamã, um homem muito importante no reino (que tinha seu cargo apenas abaixo do rei) manipulava o rei para que os judeus fossem aniquilados já que eles se negavam a adorar a Hamã, pois serviam e amavam apenas a Deus. ",
                                      reflexao: "Ester foi escolhida pelo rei para ser sua esposa. Entretanto, ele não sabia que na verdade ela era Judia, o que podia ser um grande problema, já que os judeus eram perseguidos no reino e existiam planos para a aniquilação de todos. Ester podia se calar e aceitar ver seu povo inteiro ser morto em sua frente, porém, ela sabia que Deus tinha grandes planos e promessas para o povo, que se cumpririam um dia com a vinda de um salvador (no caso, Jesus). Resumidamente, Ester  conversa com o rei para que ele livre o povo judeu da perseguição e, graças a ela, o povo passa a ser livre no reino. O livro de Ester mostra o quanto ela foi forte e corajosa já que, naquela época, era muito difícil qualquer pessoa fazer pedidos diretos ao rei, muito menos mulheres, dado em conta a época machista em que o mundo se encontrava. Ester orou, jejuou, se identificou com seu povo e encontrou em Deus a coragem que existia dentro de si para passar por uma situação difícil e que colocava em risco sua própria vida. Ester foi uma mulher forte e corajosa que se posicionou por aqueles que amava e até hoje é exemplo feminino de atitude, humildade, interdependência e amor a Deus. Rainha Ester nos mostra como uma vida centrada em causas que Deus nos dá é maior que qualquer barreira do mundo.",
                                      conclusao: "Ester nos ensina muito sobre posicionamento. Ela se colocou em uma situação onde poderia perder seu trono e até mesmo sua vida mas, aos seus olhos, nada valia mais do que a causa que Deus lhe deu, pela qual ela estava lutando. Mesmo em um mundo machista e opressor de tantas formas, Deus levanta mulheres gigantes para lutarem pelas causas do reino: Ele nos mostrou através da vida de Ester que todos os filhos de Deus tem voz e em seu reino não há distinção! E você, está se levantando com força, coragem, humildade e fé assim como a Rainha Ester?",
                                      aplicacao1: "",
                                      aplicacao2: "",
                                      aplicacao3: "",
                                      backgroundColor: verde,
                                      backgroundImage: UIImage(named: "estudosBase5")!,
                                      link: "https://www.youtube.com/watch?v=v_iwCyjpN9o",
                                      storyImage: "estudosStory5")
        estudosBase[indice] = estudos5
    }
}

