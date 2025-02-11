-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/02/2025 às 21:00
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rafaellycassiane`
--
CREATE DATABASE IF NOT EXISTS `rafaellycassiane` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rafaellycassiane`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cod_Cliente` int(11) NOT NULL COMMENT 'Este campo é responsável pelo código do cliente.',
  `Cep` varchar(10) NOT NULL COMMENT 'Este campo é responsável pelo cep do cliente.',
  `Nome_cliente` varchar(50) NOT NULL COMMENT 'Este campo é responsável pelo nome do cliente.',
  `Endereço` varchar(50) NOT NULL COMMENT 'Este campo é responsável pelo endereço do cliente.',
  `cidade` varchar(50) NOT NULL COMMENT 'Este campo é responsável pela cidade do cliente.',
  `cnpj` varchar(30) NOT NULL COMMENT 'Este campo é responsável pelo cnpj do cliente.',
  `uf` char(2) NOT NULL COMMENT 'Este campo é responsável  armazenar a unidade federativa do cliente.',
  `ie` int(10) NOT NULL COMMENT 'Este campo é responsável por  formalizar a situação da empresa e permitir a comercialização de produtos e a emissão de nota fiscal.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`Cod_Cliente`, `Cep`, `Nome_cliente`, `Endereço`, `cidade`, `cnpj`, `uf`, `ie`) VALUES
(20, '25679-300', 'Beth', 'Av Climério n. 45', 'São Paulo', '43542241/3322-46', 'SP', 9280),
(110, '30078-500', 'Jorge', 'Rua Caiapó 13', 'Curitiba', '13857742/5259-37', 'PR', 3901),
(130, '30079-300', 'Edmar', 'Rua da Prais 863', 'Salvador', '99106266/4963-86', 'BA', 7121),
(157, '85285-428', 'Paulo', 'Tv. Moraes c/3', 'Londrina', '10036086/0579-88', 'PR', 1923),
(180, '30077-500', 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '53867452/0664-68', 'SC', 7573),
(222, '22124-391', 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '28949012/9439-45', 'MG', 2985),
(234, '22841-650', 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '17635240/2597-40', 'DF', 2931),
(260, '30046-500', 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '92595988/9695-14', 'RJ', 2530),
(290, '30225-900', 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '10745191/7140-53', 'SP', 1820),
(390, '30438-700', 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '15018113/4552-27', 'MG', 9071),
(410, '30078-900', 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '53810669/0537-08', 'RJ', 7431),
(720, '24358-310', 'Ana', 'Rua 17 n. 19', 'Niteroi', '12113197/0000-00', 'RJ', 2134),
(830, '30126-830', 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '43369113/1949-09', 'SP', 9343),
(870, '22763-931', 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '23106567/3804-19', 'SP', 4631);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_de_pedido`
--

CREATE TABLE `item_de_pedido` (
  `num_pedido` int(11) NOT NULL,
  `Cod_Produto` int(11) NOT NULL,
  `QNTDE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_de_pedido`
--

INSERT INTO `item_de_pedido` (`num_pedido`, `Cod_Produto`, `QNTDE`) VALUES
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 53, 32),
(203, 31, 6),
(189, 78, 45),
(105, 78, 10),
(111, 25, 10),
(111, 78, 70),
(103, 53, 37),
(91, 77, 40),
(138, 22, 10),
(138, 77, 35),
(138, 53, 18),
(108, 13, 17),
(119, 77, 40),
(119, 13, 6),
(119, 22, 10),
(119, 53, 43),
(137, 13, 8),
(101, 78, 10),
(143, 78, 18);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL,
  `prazo_de_entrega` int(11) NOT NULL,
  `cod_Vendedor` int(11) NOT NULL,
  `Cod_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`num_pedido`, `prazo_de_entrega`, `cod_Vendedor`, `Cod_Cliente`) VALUES
(91, 20, 11, 260),
(97, 20, 101, 720),
(98, 20, 209, 410),
(101, 15, 101, 720),
(103, 20, 11, 260),
(104, 30, 101, 110),
(105, 15, 240, 180),
(108, 15, 310, 290),
(111, 20, 240, 260),
(119, 30, 250, 390),
(121, 20, 209, 410),
(127, 10, 11, 410),
(137, 20, 720, 720),
(138, 20, 11, 260),
(143, 30, 111, 20),
(148, 20, 101, 720),
(189, 15, 213, 870),
(203, 30, 250, 830);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `Cod_Produto` int(11) NOT NULL COMMENT 'Este campo é responsável pelo código do produto.',
  `unid_produto` varchar(10) NOT NULL COMMENT 'Este campo é responsável pela medida do produto.',
  `desc_produto` varchar(50) NOT NULL COMMENT 'Este campo é responsável pela descrição do produto.',
  `valor_unit` decimal(15,2) NOT NULL COMMENT 'Este campo é responsável pelo valor unitário do produto.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`Cod_Produto`, `unid_produto`, `desc_produto`, `valor_unit`) VALUES
(13, 'G', 'Ouro', 6.18),
(22, 'M', 'Linho', 0.11),
(25, 'Kg', 'Queijo', 0.97),
(30, 'SAC', 'Açucar', 0.30),
(31, 'Bar', 'Chocolate', 0.87),
(45, 'M', 'Madeira', 0.25),
(53, 'M', 'Linha', 1.80),
(77, 'M', 'Papel', 1.05),
(78, 'L', 'Vinho', 2.00),
(87, 'M', 'Cano', 1.97);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `cod_Vendedor` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o código do vendedor.',
  `nome_vendedor` varchar(50) DEFAULT NULL COMMENT 'Este campo é responsável pelo nome do vendedor.',
  `sal_fixo` decimal(15,2) DEFAULT NULL COMMENT 'Este campo é responsável pelo salário fixo do vendedor.',
  `faixa_comissão` char(2) DEFAULT NULL COMMENT 'Este campo é responsável pela faixa de comissão do vendedor.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendedor`
--

INSERT INTO `vendedor` (`cod_Vendedor`, `nome_vendedor`, `sal_fixo`, `faixa_comissão`) VALUES
(11, 'João', 2780.00, 'C'),
(101, 'João', 2650.32, 'C'),
(111, 'Carlos', 2490.00, 'A'),
(209, 'José', 1800.00, 'C'),
(213, 'Jonas', 2300.50, 'A'),
(240, 'Antonio', 9500.00, 'C'),
(250, 'Mauricío', 2930.00, 'B'),
(310, 'Josias', 870.00, 'B'),
(720, 'Felipe', 4600.00, 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cod_Cliente`);

--
-- Índices de tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD KEY `fk_Cod_Produto` (`Cod_Produto`),
  ADD KEY `fk_num_pedido` (`num_pedido`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `fk_cod_Vendedor` (`cod_Vendedor`),
  ADD KEY `fk_Cod_Cliente` (`Cod_Cliente`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Cod_Produto`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`cod_Vendedor`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD CONSTRAINT `fk_Cod_Produto` FOREIGN KEY (`Cod_Produto`) REFERENCES `produto` (`Cod_Produto`),
  ADD CONSTRAINT `fk_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedido` (`num_pedido`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Cod_Cliente` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`Cod_Cliente`),
  ADD CONSTRAINT `fk_cod_Vendedor` FOREIGN KEY (`cod_Vendedor`) REFERENCES `vendedor` (`cod_Vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
