defmodule Questao7 do
  defmodule Sistema do
    def principal() do
      loop()
    end

    def loop() do
      IO.puts "Sistema Final"
      IO.puts "============="
      IO.puts "1. Criar"
      IO.puts "2. Listar"
      IO.puts "3. Atualizar"
      IO.puts "4. Excluir"
      IO.puts "5. Sair"
      IO.puts "Entre com sua opção: "

      opcao = IO.gets("") |> String.trim() |> String.to_integer()

      case opcao do
        1 -> criar()
        2 -> listar()
        3 -> atualizar()
        4 -> excluir()
        5 -> sair()
        _ -> IO.puts "Opção inválida. Tente novamente."
      end

      loop()
    end

    def criar() do
      IO.puts "Função Criar"
    end

    def listar() do
      IO.puts "Função Listar"
    end

    def atualizar() do
      IO.puts "Função Atualizar"
    end

    def excluir() do
      IO.puts "Função Excluir"
    end

    def sair() do
      IO.puts "Saindo do sistema. Até logo!"
      System.halt(0)
    end

  end

  Sistema.principal()

end
