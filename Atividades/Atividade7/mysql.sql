-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 04/02/2025 às 15:10
-- Versão do servidor: 8.0.41
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_empresa`
--
CREATE DATABASE IF NOT EXISTS `db_empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_empresa`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_CLIENTES`
--

CREATE TABLE `TB_CLIENTES` (
  `id` int NOT NULL,
  `nomeCliente` varchar(255) DEFAULT NULL,
  `sobrenomeContato` varchar(255) DEFAULT NULL,
  `primeiroNomeContato` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco1` varchar(255) DEFAULT NULL,
  `endereco2` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `funcionarioResponsavel_id` int DEFAULT NULL,
  `limiteCredito` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_CLIENTES`
--

INSERT INTO `TB_CLIENTES` (`id`, `nomeCliente`, `sobrenomeContato`, `primeiroNomeContato`, `telefone`, `endereco1`, `endereco2`, `cidade`, `estado`, `cep`, `pais`, `funcionarioResponsavel_id`, `limiteCredito`) VALUES
(1, 'Cliente X', 'Silva', 'João', '123456789', 'Rua A, 123', NULL, 'São Paulo', 'SP', '01000-000', 'Brasil', 1, 5000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ESCRITORIOS`
--

CREATE TABLE `TB_ESCRITORIOS` (
  `id` int NOT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco1` varchar(255) DEFAULT NULL,
  `endereco2` varchar(255) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `territorio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_ESCRITORIOS`
--

INSERT INTO `TB_ESCRITORIOS` (`id`, `cidade`, `telefone`, `endereco1`, `endereco2`, `estado`, `pais`, `cep`, `territorio`) VALUES
(1, 'São Paulo', '11999999999', 'Rua A, 123', NULL, 'SP', 'Brasil', '01000-000', 'Sul');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_FUNCIONARIOS`
--

CREATE TABLE `TB_FUNCIONARIOS` (
  `id` int NOT NULL,
  `sobrenome` varchar(255) DEFAULT NULL,
  `primeiroNome` varchar(255) DEFAULT NULL,
  `ramal` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `codigoEscritorio_id` int DEFAULT NULL,
  `chefe_id` int DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_FUNCIONARIOS`
--

INSERT INTO `TB_FUNCIONARIOS` (`id`, `sobrenome`, `primeiroNome`, `ramal`, `email`, `codigoEscritorio_id`, `chefe_id`, `cargo`) VALUES
(1, 'Silva', 'Carlos', '101', 'carlos@email.com', 1, NULL, 'Gerente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PAGAMENTOS`
--

CREATE TABLE `TB_PAGAMENTOS` (
  `id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `numeroCheque` varchar(50) DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PAGAMENTOS`
--

INSERT INTO `TB_PAGAMENTOS` (`id`, `cliente_id`, `numeroCheque`, `dataPagamento`, `valor`) VALUES
(1, 1, 'CHK123456', '2025-02-05', 250.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PEDIDOS`
--

CREATE TABLE `TB_PEDIDOS` (
  `id` int NOT NULL,
  `dataPedido` date DEFAULT NULL,
  `dataRequerida` date DEFAULT NULL,
  `dataEnviada` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `comentarios` text,
  `cliente_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PEDIDOS`
--

INSERT INTO `TB_PEDIDOS` (`id`, `dataPedido`, `dataRequerida`, `dataEnviada`, `status`, `comentarios`, `cliente_id`) VALUES
(1, '2025-02-04', '2025-02-10', '2025-02-06', 'Entregue', 'Pedido sem observações', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PEDIDOS_DETALHES`
--

CREATE TABLE `TB_PEDIDOS_DETALHES` (
  `id` int NOT NULL,
  `pedido_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `precoUnitario` decimal(10,2) DEFAULT NULL,
  `numeroLinha` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUTOS`
--

CREATE TABLE `TB_PRODUTOS` (
  `id` int NOT NULL,
  `produtoNome` varchar(255) DEFAULT NULL,
  `produtoLinha_id` int DEFAULT NULL,
  `produtoEscala` varchar(50) DEFAULT NULL,
  `produtoFornecedor` varchar(255) DEFAULT NULL,
  `produtoDescricao` text,
  `quantidadeEmEstoque` int DEFAULT NULL,
  `precoCompra` decimal(10,2) DEFAULT NULL,
  `precoVenda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PRODUTOS`
--

INSERT INTO `TB_PRODUTOS` (`id`, `produtoNome`, `produtoLinha_id`, `produtoEscala`, `produtoFornecedor`, `produtoDescricao`, `quantidadeEmEstoque`, `precoCompra`, `precoVenda`) VALUES
(1, 'Produto A', 1, '1:10', 'Fornecedor X', 'Descrição do Produto A', 100, 50.00, 75.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUTOS_LINHAS`
--

CREATE TABLE `TB_PRODUTOS_LINHAS` (
  `id` int NOT NULL,
  `textDescription` text,
  `htmlDescription` text,
  `image` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PRODUTOS_LINHAS`
--

INSERT INTO `TB_PRODUTOS_LINHAS` (`id`, `textDescription`, `htmlDescription`, `image`) VALUES
(1, 'Linha de Produtos A', '<p>Descrição HTML da linha A</p>', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionarioResponsavel_id` (`funcionarioResponsavel_id`);

--
-- Índices de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_FUNCIONARIOS`
--
ALTER TABLE `TB_FUNCIONARIOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigoEscritorio_id` (`codigoEscritorio_id`),
  ADD KEY `chefe_id` (`chefe_id`);

--
-- Índices de tabela `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `TB_PEDIDOS_DETALHES`
--
ALTER TABLE `TB_PEDIDOS_DETALHES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtoLinha_id` (`produtoLinha_id`);

--
-- Índices de tabela `TB_PRODUTOS_LINHAS`
--
ALTER TABLE `TB_PRODUTOS_LINHAS`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_FUNCIONARIOS`
--
ALTER TABLE `TB_FUNCIONARIOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PEDIDOS_DETALHES`
--
ALTER TABLE `TB_PEDIDOS_DETALHES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PRODUTOS_LINHAS`
--
ALTER TABLE `TB_PRODUTOS_LINHAS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  ADD CONSTRAINT `TB_CLIENTES_ibfk_1` FOREIGN KEY (`funcionarioResponsavel_id`) REFERENCES `TB_FUNCIONARIOS` (`id`);

--
-- Restrições para tabelas `TB_FUNCIONARIOS`
--
ALTER TABLE `TB_FUNCIONARIOS`
  ADD CONSTRAINT `TB_FUNCIONARIOS_ibfk_1` FOREIGN KEY (`codigoEscritorio_id`) REFERENCES `TB_ESCRITORIOS` (`id`),
  ADD CONSTRAINT `TB_FUNCIONARIOS_ibfk_2` FOREIGN KEY (`chefe_id`) REFERENCES `TB_FUNCIONARIOS` (`id`);

--
-- Restrições para tabelas `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD CONSTRAINT `TB_PAGAMENTOS_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD CONSTRAINT `TB_PEDIDOS_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PEDIDOS_DETALHES`
--
ALTER TABLE `TB_PEDIDOS_DETALHES`
  ADD CONSTRAINT `TB_PEDIDOS_DETALHES_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `TB_PEDIDOS` (`id`),
  ADD CONSTRAINT `TB_PEDIDOS_DETALHES_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `TB_PRODUTOS` (`id`);

--
-- Restrições para tabelas `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD CONSTRAINT `TB_PRODUTOS_ibfk_1` FOREIGN KEY (`produtoLinha_id`) REFERENCES `TB_PRODUTOS_LINHAS` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
