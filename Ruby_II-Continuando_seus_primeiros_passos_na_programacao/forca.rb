require_relative "ui"
require_relative "rank"

def sorteia_palavra_secreta
  avisa_escolhendo_palavra
  texto = File.read("dicionario.txt")
  todas_as_palavras = texto.split("\n")
  numero_aleatorio = rand(todas_as_palavras.size)
  palavra_secreta = todas_as_palavras[numero_aleatorio]
  avisa_palavra_escolhida palavra_secreta
  return palavra_secreta.strip.downcase
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho_de_tentativas chutes, erros, mascara
  loop do
    chute = pede_um_chute
    if chutes.include? chute
      avisa_chute_repetido chute
    else
      return chute
    end
  end
end

def definir_mascara(palavra_secreta, chutes)
  mascara = ""
  for letra in palavra_secreta.chars
    if chutes.include? letra
      mascara += letra
    else
      mascara += "_"
    end
  end
  return mascara
end

def joga(nome)
  avisa_campeao_do_rank ler_rank
  palavra_secreta = sorteia_palavra_secreta
  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    mascara = definir_mascara palavra_secreta, chutes

    chute = pede_um_chute_valido chutes, erros, mascara

    chutes << chute
    chutou_uma_unica_letra = chute.size ==1

    if (chutou_uma_unica_letra)
      total_encontrado = palavra_secreta.count(chute[0])
      if total_encontrado == 0
        avisa_letra_nao_encontrada
        erros += 1
      else
        avisa_letra_encontrada total_encontrado
      end
    else
      acertou = chute == palavra_secreta
      if acertou
        avisa_acertou_palavra
        pontos_ate_agora += 100
        break;
      else
        avisa_errou_palavra
        pontos_ate_agora -= 30
        erros += 1
      end
    end

  end
  avisa_pontos pontos_ate_agora
  return pontos_ate_agora
end

def jogo_da_forca
  total_de_pontos = 0
  nome = boas_vindas

  loop do
    total_de_pontos += joga nome
    salvar_rank nome, total_de_pontos
    break if nao_quer_jogar?
  end d
end
