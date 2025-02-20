-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/02/2025 às 21:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sa_lojaderoupa`
--
CREATE DATABASE IF NOT EXISTS `sa_lojaderoupa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sa_lojaderoupa`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `mySp_estoqueDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_estoqueDelete` (IN `v_produto_id_produto` INT)   BEGIN
IF ((v_produto_id_produto>0)&&(v_produto_id_produto !='')) 
THEN
DELETE FROM estoque 
WHERE produto_id_produto = v_produto_id_produto;
ELSE
SELECT 'O identificador do registro não foi informado!' 
AS Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_estoqueInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_estoqueInsert` (`v_data_entrada` VARCHAR(45), `v_fornecedor_id_fornecedor` INT(11), `v_produto_id_produto` INT(11), `v_quantidade` INT(11))   BEGIN
IF ((v_data_entrada !='') && (v_fornecedor_id_fornecedor !='') && (v_produto_id_produto !='') && (v_quantidade !='')) THEN
INSERT INTO estoque
(data_entrada, fornecedor_id_fornecedor, produto_id_produto, quantidade)
VALUES
(v_data_entrada, v_fornecedor_id_fornecedor, v_produto_id_produto, v_quantidade);
ELSE
SELECT 'DATA DE ENTRADA, QUANTIDADE devem ser fornecidos para o cadastro!'
AS Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_fornecedorDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_fornecedorDelete` (IN `v_id` INT)   BEGIN
IF ((v_id>0)&&(v_id!='')) 
THEN
DELETE FROM fornecedor 
WHERE id_fornecedor = v_id;
ELSE
SELECT 'O identificador do registro não foi informado!' 
AS Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_fornecedorInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_fornecedorInsert` (`v_id_fornecedor` INT, `v_cnpj` VARCHAR(45), `v_marca` VARCHAR(45), `v_telefone` VARCHAR(45))   BEGIN
IF ((v_cnpj !='') && (v_marca !='') && (v_telefone !='') && (v_id_fornecedor !=''))  THEN
INSERT INTO fornecedor (cnpj, marca, telefone)
VALUES
(v_cnpj, v_marca, v_telefone);
ELSE
SELECT 'CNPJ, MARCA e TELEFONE devem ser fornecidos para o cadastro!'
AS Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_fornecedorUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_fornecedorUpdate` (`v_id_fornecedor` INT, `v_cnpj` VARCHAR(45), `v_marca` VARCHAR(45), `v_telefone` VARCHAR(45))   BEGIN
IF (((v_id_fornecedor>0)&&(v_id_fornecedor !=''))&&(v_cnpj !='')&&(v_marca !='')&&(v_telefone !='')) THEN 
UPDATE fornecedor SET cnpj=v_cnpj, marca=v_marca, telefone=v_telefone
WHERE fornecedor_id_fornecedor=v_id_fornecedor;
ELSE
SELECT 'O novos CNPJ, MARCA e TELEFONE devem ser informados!'
AS Msg;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dt_nasc` varchar(10) NOT NULL,
  `sexo` varchar(9) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `telefone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tabela truncada antes do insert `cliente`
--

TRUNCATE TABLE `cliente`;
-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE `estoque` (
  `produto_id_produto` int(11) NOT NULL,
  `fornecedor_id_fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data_entrada` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tabela truncada antes do insert `estoque`
--

TRUNCATE TABLE `estoque`;
-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tabela truncada antes do insert `fornecedor`
--

TRUNCATE TABLE `fornecedor`;
-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dt_admissao` varchar(11) NOT NULL,
  `cpf` varchar(13) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `cargo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tabela truncada antes do insert `funcionario`
--

TRUNCATE TABLE `funcionario`;
-- --------------------------------------------------------

--
-- Estrutura para tabela `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE `itemvenda` (
  `id_itemVenda` int(11) NOT NULL,
  `qntd_venda` int(11) NOT NULL,
  `produto_id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tabela truncada antes do insert `itemvenda`
--

TRUNCATE TABLE `itemvenda`;
-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `tamanho` varchar(45) NOT NULL,
  `preco` decimal(4,2) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tabela truncada antes do insert `produto`
--

TRUNCATE TABLE `produto`;
-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

DROP TABLE IF EXISTS `venda`;
CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL,
  `itemVenda_id_itemVenda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tabela truncada antes do insert `venda`
--

TRUNCATE TABLE `venda`;
--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD KEY `fk_estoque_produto1` (`produto_id_produto`),
  ADD KEY `fk_estoque_fornecedor1` (`fornecedor_id_fornecedor`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices de tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD PRIMARY KEY (`id_itemVenda`),
  ADD KEY `fk_itemVenda_produto1` (`produto_id_produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_venda_cliente` (`cliente_id_cliente`),
  ADD KEY `fk_venda_funcionario1` (`funcionario_id_funcionario`),
  ADD KEY `fk_venda_itemVenda1` (`itemVenda_id_itemVenda`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_estoque_fornecedor1` FOREIGN KEY (`fornecedor_id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estoque_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD CONSTRAINT `fk_itemVenda_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_funcionario1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_itemVenda1` FOREIGN KEY (`itemVenda_id_itemVenda`) REFERENCES `itemvenda` (`id_itemVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
