<?php
include 'koneksi.php';
$id = $_GET ['idd'];
mysqli_query ($conn, "DELETE FROM masarakat WHERE nik ='$id'");
header ("location: user_masarakat.php");
?>