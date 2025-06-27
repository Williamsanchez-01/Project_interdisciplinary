<?php
include 'conect.php';

$lista = "SELECT * FROM produtos WHERE id_produto";

$resultado = $conn-> query($lista);
?>