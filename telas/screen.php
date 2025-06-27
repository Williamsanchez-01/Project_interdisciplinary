<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Sistema de Depósito - Materiais de Construção</title>
  <link rel="stylesheet" href="art.css" />
</head>
<body>
  <header>
    <h1>Depósito de Materiais de Construção</h1>
  </header>

  <nav>
    <a href="#produtos">Produtos</a>
    <a href="tela.html">Entradas</a>
    <a href="#saidas">Saídas</a>
    <a href="#fornecedores">Fornecedores</a>
  </nav>

  <div class="container">
    <section id="produtos">
      <h2>Produtos</h2>
      <div class="form-group">
        <label for="produto_info">Escolha um produto</label>
        <select id="produto_info" >
          <option value="">Selecione um prodDuto</option >
          
          
          <?php
          include '../conexoes/fetch_produtos.php';
          if ($results->num_rows > 0) {
            while ($row = $results->fetch_assoc()){
              echo "<option value='" . $row['id'] . "'>" . $row['nome'] . "</option>";
            }
          
          }
          else{

            echo "<script> alert('olha ai rapaz'); </script>";
          }
          ?>
      </select>
      </div>
      <table id="tabela_produto_info">
        <thead>
          <tr>
            <th>Nome</th>
            <th>Categoria</th>
            <th>Estoque</th>
            <th>Preço</th>
            <th>Fornecedor</th>
          </tr>
        </thead>
        <tbody id="detalhes_produto">
          <tr>
            <td id = Nome  ></td>
            <td id = Categoria ></td>
            <td id = Estoque></td>
            <td id = Preço></td>
            <td id = Fornecedor></td>
          </tr>
        </tbody>
      </table>
    </section>

    <section id="entradas">
      <h2>Entradas de Estoque</h2>
      <form action="../conexoes/inserir_entrada.php" method="post">
        <div class="form-group">
          <label for="produto">Produto</label>
          <select id="produto_entrada" name="id_produto">
            <option value=""></option>

          <?php
          include '../conexoes/fetch_produtos.php';
          if ($results->num_rows > 0) {
            while ($row = $results->fetch_assoc()){
              echo "<option value='" . $row['id'] . "'>" . $row['nome'] . "</option>";
            }
          }
          else{
            echo "<script> alert('olha ai rapaz'); </script>";
          }
          ?>
          </select>
        
        
        </div>
        <div class="form-group">
          <label for="quantidade">Quantidade</label>
          <input type="number" id="quantidade" name="quantidade" min="1" required />
        </div>
        <button type="submit">Registrar Entrada</button>
      </form>
    </section>

    <section id="saidas">
      <h2>Saídas de Estoque</h2>
      <form action="../conexoes/inserir_saida.php" method="post">
        <div class="form-group">
          <label for="produto_saida">Produto</label>
          <select id="produto_saida" name="id_produto">
            <option value=""></option>
            <?php
            include '../conexoes/fetch_produtos.php';
            if ($results->num_rows > 0) {
              while ($row = $results->fetch_assoc()){
                echo "<option value='" . $row['id'] . "'>" . $row['nome'] . "</option>";
              }
            }
            else{
              echo "<script> alert('olha ai rapaz'); </script>";
            }
            ?>
          </select>
        </div>
        <div class="form-group">
          <label for="quantidade_saida">Quantidade</label>
          <input type="number" id="quantidade_saida" name="quantidade" min="1" required />
        </div>
        <button type="submit">Registrar Saída</button>
      </form>
    </section>

   

  <script src="script.js"></script>
</body>
</html>
