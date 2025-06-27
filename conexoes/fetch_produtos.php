<?php
include 'conect.php';

$select = "SELECT * FROM produtos";

$results = $conn-> query($select);
?>