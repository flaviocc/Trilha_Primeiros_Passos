require_relative 'ui'
require_relative 'logic'

def joga(nome)
  mapa = le_mapa(2)
  while true
    desenha mapa
    # direcao = pede_movimento
    heroi = encontrar_jogador mapa
    nova_posicao = calcula_nova_posicao heroi, "A"
    if ! posicao_valida? mapa, nova_posicao
      next
    end
    mapa[heroi[0]][heroi[1]] = " "
    mapa[nova_posicao[0]][nova_posicao[1]] = "H"
    move_fantasmas mapa
  end
end

def inicia_fogefoge
  # nome = da_boas_vindas
  joga "flavio"
end