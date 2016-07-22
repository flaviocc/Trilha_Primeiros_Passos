def boas_vindas
  puts "Bem vindo ao jogo de adivinhação"
  puts "Qual o seu nome"
  nome = gets.strip
  puts "\n\n\n"
  puts "Começamos o jogo para voce, #{nome}"
  return nome
end

def sorteia_numero_secreto(dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end
  puts "Escolhendo um número secreto entre 1 e #{maximo}..."
  sorteado = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje o nosso número secreto?"
  return sorteado
end

def pede_um_numero(tentativa, limite_de_tentativas, chutes)
  puts "\n\n\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Você ja chutou até agora os números: #{chutes}"
  puts "Entre com o número"
  chute = gets.strip;
  puts "Será que acertou? Você chutou , #{chute}"
  return chute.to_i
end



def verifica_se_acertou(numero_secreto, chute)
  acertou = chute == numero_secreto

  if acertou
    puts "Acertou!"
    return true;
  end
    puts "Errou!"
    menor = chute < numero_secreto
    if menor
      puts "O número chutado, é ménor do que o número escolhido."
    else
      puts "O número chutado, é maior do que o número escolhido."
    end
    return false;
end

def pede_dificuldade
  puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 díficil)"
  return dificuldade = gets.to_i
end

def joga(nome, dificuldade)
  numero_secreto = sorteia_numero_secreto dificuldade

  limite_de_tentativas = 3

  chutes = []

  for tentativa in 1..limite_de_tentativas

    chute = pede_um_numero tentativa, limite_de_tentativas, chutes
    chutes << chute

    if (nome == "Flávio")
      acertou = true
      puts "Acertou!"
      break
    end

    acertou = verifica_se_acertou numero_secreto, chute
    if (acertou)
      break
    end

  end

  if !acertou
    puts "O número sorteado foi #{numero_secreto}"
  end
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "N"
end

nome = boas_vindas
dificuldade = pede_dificuldade

loop do
  joga nome, dificuldade
  break if nao_quer_jogar?
end
