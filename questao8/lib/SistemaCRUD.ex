defmodule SistemaCRUD do
  defstruct nome: "", cor: "", x: 0, y: 0

  @objetos %{}

  def principal do
    menu()
  end

  def menu do
    IO.puts("Sistema de Manipulação de Objetos")
    IO.puts("==================================")
    IO.puts("1. Criar objeto")
    IO.puts("2. Listar objetos")
    IO.puts("3. Atualizar objeto")
    IO.puts("4. Excluir objeto")
    IO.puts("5. Translação")
    IO.puts("6. Escala")
    IO.puts("7. Rotação")
    IO.puts("8. Reflexão")
    IO.puts("9. Sair")
    IO.puts("Entre com sua opção:")

    opcao = IO.gets(" |> ")
    opcao = String.trim(opcao) |> String.to_integer()

    case opcao do
      1 -> criar_objeto()
      2 -> listar_objetos()
      3 -> atualizar_objeto()
      4 -> excluir_objeto()
      5 -> translacao()
      6 -> escala()
      7 -> rotacao()
      8 -> reflexao()
      9 -> sair()
      _ -> menu()
    end
  end

  def criar_objeto do
    IO.puts("Função Criar Objeto")
    IO.puts("Digite o nome do objeto:")
    nome = IO.gets(" |> ") |> String.trim()

    IO.puts("Digite a cor do objeto:")
    cor = IO.gets(" |> ") |> String.trim()

    IO.puts("Digite a coordenada x:")
    x = IO.gets(" |> ") |> String.trim() |> String.to_integer()

    IO.puts("Digite a coordenada y:")
    y = IO.gets(" |> ") |> String.trim() |> String.to_integer()

    objeto = %SistemaCRUD{nome: nome, cor: cor, x: x, y: y}
    @objetos = Map.put(@objetos, nome, objeto)

    IO.puts("Objeto criado com sucesso!")
    menu()
  end

  # Funções de listar e atualizar permanecem as mesmas.

  def translacao do
    IO.puts("Função Translação")
    IO.puts("Digite o nome do objeto a ser transladado:")
    nome = IO.gets(" |> ") |> String.trim()

    objeto = Map.get(@objetos, nome)

    if objeto do
      IO.puts("Digite o fator de translação em x:")
      tx = IO.gets(" |> ") |> String.trim() |> String.to_integer()

      IO.puts("Digite o fator de translação em y:")
      ty = IO.gets(" |> ") |> String.trim() |> String.to_integer()

      objeto = %SistemaCRUD{x: objeto.x + tx, y: objeto.y + ty | objeto}
      @objetos = Map.put(@objetos, nome, objeto)

      IO.puts("Translação realizada com sucesso!")
    else
      IO.puts("Objeto não encontrado.")
    end

    menu()
  end

  def escala do
    IO.puts("Função Escala")
    IO.puts("Digite o nome do objeto a ser escalado:")
    nome = IO.gets(" |> ") |> String.trim()

    objeto = Map.get(@objetos, nome)

    if objeto do
      IO.puts("Digite o fator de escala em x:")
      sx = IO.gets(" |> ") |> String.trim() |> String.to_float()

      IO.puts("Digite o fator de escala em y:")
      sy = IO.gets(" |> ") |> String.trim() |> String.to_float()

      objeto = %SistemaCRUD{x: objeto.x * sx, y: objeto.y * sy | objeto}
      @objetos = Map.put(@objetos, nome, objeto)

      IO.puts("Escala realizada com sucesso!")
    else
      IO.puts("Objeto não encontrado.")
    end

    menu()
  end

  def rotacao do
    IO.puts("Função Rotação")
    IO.puts("Digite o nome do objeto a ser rotacionado:")
    nome = IO.gets(" |> ") |> String.trim()

    objeto = Map.get(@objetos, nome)

    if objeto do
      IO.puts("Digite o ângulo de rotação em graus:")
      angulo = IO.gets(" |> ") |> String.trim() |> String.to_float()

      radianos = angulo * Math.PI / 180.0
      {new_x, new_y} = {
        objeto.x * Math.cos(radianos) - objeto.y * Math.sin(radianos),
        objeto.x * Math.sin(radianos) + objeto.y * Math.cos(radianos)
      }

      objeto = %SistemaCRUD{x: new_x, y: new_y | objeto}
      @objetos = Map.put(@objetos, nome, objeto)

      IO.puts("Rotação realizada com sucesso!")
    else
      IO.puts("Objeto não encontrado.")
    end

    menu()
  end

  def reflexao do
    IO.puts("Função Reflexão")
    IO.puts("Digite o nome do objeto a ser refletido:")
    nome = IO.gets(" |> ") |> String.trim()

    objeto = Map.get(@objetos, nome)

    if objeto do
      IO.puts("Escolha o eixo de reflexão:")
      IO.puts("1. Reflexão em relação ao eixo x")
      IO.puts("2. Reflexão em relação ao eixo y")

      opcao = IO.gets(" |> ") |> String.trim() |> String.to_integer()

      case opcao do
        1 -> objeto = %SistemaCRUD{x: objeto.x, y: -objeto.y | objeto}
        2 -> objeto = %SistemaCRUD{x: -objeto.x, y: objeto.y | objeto}
        _ -> IO.puts("Opção inválida.")
      end

      @objetos = Map.put(@objetos, nome, objeto)

      IO.puts("Reflexão realizada com sucesso!")
    else
      IO.puts("Objeto não encontrado.")
    end

    menu()
  end

  def sair do
    IO.puts("Saindo do sistema. Adeus!")
  end
end

# Inicie o sistema chamando a função principal
SistemaCRUD.principal()

