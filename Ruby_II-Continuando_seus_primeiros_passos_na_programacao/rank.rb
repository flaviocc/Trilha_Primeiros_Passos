def salvar_rank(nome, pontos)
  conteudo = "#{nome}\n#{pontos}"
  File.write "rank.txt", conteudo
end

def ler_rank
  conteudo = File.read("rank.txt")
  rank = conteudo.split("\n")
  return rank
end
