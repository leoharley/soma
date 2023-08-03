<?php
function save($dados){
	try{
		$pdo = new PDO("mysql:host=localhost; dbname=u699148595_inventario_hom;", "u699148595_u699148595_som", "5;K+5qbi",[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
		$sql = 'INSERT INTO tb_clientes(nome, cpf, telefone, email, nascimento, estado, cidade, bairro, rua, numero) VALUES (:nome, :cpf, :telefone, :email, :nascimento, :estado, :cidade, :bairro, :rua, :numero);';
		$stmt = $pdo->prepare($sql);
		$stmt->bindValue(':nome', $dados['nome']);
		$stmt->bindValue(':cpf', $dados['cpf']);
		$stmt->bindValue(':telefone', $dados['telefone']);
		$stmt->bindValue(':email', $dados['email']);
		$stmt->bindValue(':nascimento', $dados['dtnasc']);
		$stmt->bindValue(':estado', $dados['estado']);
		$stmt->bindValue(':cidade', $dados['cidade']);
		$stmt->bindValue(':bairro', $dados['bairro']);
		$stmt->bindValue(':rua', $dados['rua']);
		$stmt->bindValue(':numero', $dados['numero']);
		$stmt->execute();
	}
	catch (\PDOException $e){
		echo $e->getMessage();
	}finally{
		$pdo = null;
	}
}
save($_POST);
?>