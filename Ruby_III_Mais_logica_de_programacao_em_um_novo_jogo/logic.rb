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

def calcula_nova_posicao(heroi, direcao)
  heroi = heroi.dup
  case direcao
    when "W"
      heroi[0] -= 1
    when "S"
      heroi[0] += 1
    when "A"
      heroi[1] -= 1
    when "D"
      heroi[1] += 1
  end
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
  if mapa[posicao[0]][posicao[1]] == "X"
    return false
  end
  return true
end