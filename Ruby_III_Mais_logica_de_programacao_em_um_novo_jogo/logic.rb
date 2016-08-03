def le_mapa(numero)
  arquivo = "mapa#{numero}.txt"
  texto = File.read(arquivo)
  mapa = texto.split("\n")
  return mapa
end

def encontrar_jogador(mapa)
  caracter_do_heroi = "H"
  mapa.each_with_index do |linha_atual, linha|
    #cade a linha
    coluna_do_heroi = linha_atual.index caracter_do_heroi
    if coluna_do_heroi != nil
      return [linha, coluna_do_heroi]
    end
  end
  #nao achei
end

def move_fantasma(mapa, linha, coluna)
  posicao = [linha, coluna +1]
  if posicao_valida? mapa, posicao
    caracter_atual = mapa[linha, coluna]
    proximo_caracter = mapa[posicao[0], posicao[1]]
    mapa[linha, coluna] = " "
    mapa[posicao[0], posicao[1]] = "F"
  end
end

def move_fantasmas(mapa)
  caracter_do_fantasma = "F"
  mapa.each_with_index do |linha_atual, linha|
    linha_atual.chars.each_with_index do |caractere_atual, coluna|
      eh_fantasma = caractere_atual == caracter_do_fantasma
      if eh_fantasma
        move_fantasma mapa, linha, coluna
      end
    end
  end
end

def calcula_nova_posicao(heroi, direcao)
  heroi = heroi.dup
  movimentos = {
      "W" => [-1, 0],
      "S" => [+1, 0],
      "A" => [0, -1],
      "D" => [0, +1]
  }
  movimento = movimentos[direcao]
  heroi[0] += movimento[0]
  heroi[1] += movimento[1]
  return heroi
end

def posicao_valida?(mapa, posicao)
  linhas = mapa.size
  colunas = mapa[0].size
  estourou_linha = posicao[0] < 0 || posicao[0] > linhas
  estourou_coluna = posicao[1] < 0 || posicao[1] > colunas
  if estourou_linha || estourou_coluna
    return false
  end
  valor_local = mapa[posicao[0], posicao[1]]
  if valor_local == "X" || valor_local == "F"
    return false
  end
  return true
end