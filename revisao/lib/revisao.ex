defmodule Revisao do
  #questão 1
   def mundo do
    "Olá mundo!"
   end
  #questao 2
   def exibir_nome do
    IO.puts "Digite seu nome: "
    nome = IO.gets("") |> String.trim()
    IO.puts "Olá #{nome}!"
   end
  #questão 3
   def saudacaoidade do
      IO.puts "Digite seu nome: "
      nome = IO.gets("") |> String.trim()

      IO.puts "Digite seu ano de nascimento: "
      ano_nascimento = String.to_integer(ano_nascimento)
      ano_atual = DateTime.utc_now().year
      idade = ano atual - ano_nascimento
      IO.puts "Olá #{nome}, você tem #{idade} anos."
   end
  #questao 4
    def calcular_imc do
      imc = peso_kg / (altura_m * altura_m)
      "Olá #{nome}, seu IMC é de #{imc |> Float.round(1) |> Float.to_string}."

      IO.puts("Digite seu nome: ")
      nome = IO.gets("") |> String.trim()

      IO.puts("Digite seu peso em Kg: ")
      peso = IO.gets("") |> String.trim() |> String.to_float()

      IO.puts("Digite sua altura em metros: ")
      altura = IO.gets("") |> String.trim() |> String.to_float()

      mensagem = CalculoIMC.calcular_imc(nome, peso, altura)
      IO.puts(mensagem)
    end
   #questão 5
    def ler_e_exibir_inverso do
      numeros = ler_numeros(n)
      inverso = Enum.reverse(numeros)
      IO.puts("Sequência inversa: #{inverso}")

      IO.puts("Digite a sequência de #{n} números inteiros (um por linha): ")
      Enum.map(1..n, fn _ ->
      IO.gets("") |> String.trim() |> String.to_integer()

      IO.puts("Digite a quantidade de números:")
      quantidade = IO.gets("") |> String.trim() |> String.to_integer()
      SequenciaInversa.ler_e_exibir_inverso(quantidade)
    end
    #questão 6
      def ler_e_armazenar do
        matriculas_nomes = ler_matriculas_nomes(n)
        dicionario = Enum.into(matriculas_nomes, %{})
        IO.inspect(dicionario)

        IO.puts("Digite os pares matrícula/nome (um por linha):")
        Enum.map(1..n, fn _ ->
          {matricula, nome} = ler_matricula_nome()
          {matricula, nome}

        IO.puts("Matrícula: ")
        matricula = IO.gets("") |> String.trim()

        IO.puts("Nome: ")
        nome = IO.gets("") |> String.trim()

        {matricula, nome}
        IO.puts("Digite a quantidade de pares matrícula/nome:")
        quantidade = IO.gets("") |> String.trim() |> String.to_integer()

        ArmazenarMatriculasNomes.ler_e_armazenar(quantidade)

end
