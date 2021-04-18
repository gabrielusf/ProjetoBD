USE master
GO

IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'BDEditora'
)
CREATE DATABASE BDEditora
GO

USE BDEditora
GO

/********************************************************************************************************************************************************************************
                    C R I A Ç Ã O   D A S   T A B E L A S                    
********************************************************************************************************************************************************************************/

-- CASO DER ERRADO E PRECISAR RECRIAR AS TABELAS
-- SÓ RODAR O COMANDO ABAIXO
-- ---------------------------------------------
IF OBJECT_ID('[dbo].[Pais]', 'U') IS NOT NULL
DROP TABLE [dbo].[Pais]
GO

CREATE TABLE [dbo].[Pais]
(
    [CodigoPais] INT NOT NULL IDENTITY PRIMARY KEY,
    [Nome] VARCHAR(50) NOT NULL,
    [Sigla] VARCHAR(50) NOT NULL,
    [Nacionalidade] VARCHAR(50) NOT NULL
);
GO

IF OBJECT_ID('[dbo].[Autor]', 'U') IS NOT NULL
DROP TABLE [dbo].[Autor]
GO
CREATE TABLE [dbo].[Autor]
(
    [CodigoAutor] INT NOT NULL IDENTITY PRIMARY KEY,
    [Nome] VARCHAR(50) NOT NULL,
    [DataNascimento] DATE NOT NULL,
    [Sexo] CHAR NOT NULL CHECK(Sexo = 'M' or Sexo = 'F'),
    [Pais] INT REFERENCES [Pais](CodigoPais) NOT NULL
);
GO

IF OBJECT_ID('[dbo].[Editora]', 'U') IS NOT NULL
DROP TABLE [dbo].[Editora]
GO
CREATE TABLE [dbo].[Editora]
(
    [CodigoEditora] INT NOT NULL IDENTITY PRIMARY KEY,
    [Nome] VARCHAR(50) NOT NULL,
    [EmailContato] VARCHAR(50) MASKED WITH (FUNCTION = 'email()') NOT NULL,
    [Situacao] CHAR NOT NULL CHECK(Situacao = 'I' or Situacao = 'A')
);
GO

IF OBJECT_ID('[dbo].[Categoria]', 'U') IS NOT NULL
DROP TABLE [dbo].[Categoria]
GO
CREATE TABLE [dbo].[Categoria]
(
    [CodigoCategoria] INT NOT NULL IDENTITY PRIMARY KEY,
    [Nome] VARCHAR(50) NOT NULL
);
GO

IF OBJECT_ID('[dbo].[Livro]', 'U') IS NOT NULL
DROP TABLE [dbo].[Livro]
GO
CREATE TABLE [dbo].[Livro]
(
    [CodigoLivro] INT NOT NULL IDENTITY PRIMARY KEY,
    [Titulo] VARCHAR(50) NOT NULL,
    [DataDePublicacao] DATE NOT NULL,
    [QtdPaginas] INT NOT NULL,
    [ISBN] VARCHAR(100) NOT NULL,
    [Categoria] INT REFERENCES [Categoria](CodigoCategoria) NOT NULL
);
GO

IF OBJECT_ID('[dbo].[LivroAutor]', 'U') IS NOT NULL
DROP TABLE [dbo].[LivroAutor]
GO
CREATE TABLE [dbo].[LivroAutor]
(
    [CodigoLivroAutor] INT NOT NULL IDENTITY PRIMARY KEY,
    [Livro] INT REFERENCES [Livro](CodigoLivro) NOT NULL,
    [Autor] INT REFERENCES [Autor](CodigoAutor) NOT NULL
);
GO

/********************************************************************************************************************************************************************************
                    INSERINDO DADOS NAS TABELAS									  
********************************************************************************************************************************************************************************/

-- INSERINDO EM PAISES
-- Insert rows into table 'Pais' in schema '[dbo]'
INSERT INTO [dbo].[Pais]
( -- Columns to insert data into
    [Nome], [Sigla], [Nacionalidade]
)
VALUES ('Brasil', 'BR', 'Brasileiro'),
       ('Estado Unidos', 'USA', 'Americano'),
	   ('Inglaterra', 'UK', 'Inglês'),
	   ('Canada', 'CA', 'Canadense')
GO

-- INSERINDO CATEGORIAS
-- Insert rows into table 'Categoria' in schema '[dbo]'
INSERT INTO [dbo].[Categoria]
(
    [Nome]
)
VALUES ('Ficção'),
       ('Não Ficção'),
       ('Auto-Ajuda'),
       ('Infanto-Juvenil'),
       ('Negócios')
GO	

-- INSERINDO EDITORA
-- Insert rows into table 'Editora' in schema '[dbo]'
INSERT INTO [dbo].[Editora]
(
    [Nome], [EmailContato], [Situacao]
)
VALUES 
('Academia','contato@academia.com','I'),
('Aeroplano Editora','contato@aeroplanoeditora.com','A'),
('Alaúde','contato@alaúde.com','A'),
('Aleph','contato@aleph.com','I'),
('Aletria','contato@aletria.com','A'),
('Alta Books','contato@altabooks.com','A'),
('Alta Books Editora','contato@altabookseditora.com','A'),
('Alta Life Editora','contato@altalifeeditora.com','I'),
('Alto Astral','contato@altoastral.com','A'),
('Angelus Editora','contato@angeluseditora.com','A'),
('Arqueiro','contato@arqueiro.com','I'),
('Autêntica','contato@autentica.com','A'),
('Ave Maria','contato@avemaria.com','I'),
('Benvirá','contato@benvira.com','I'),
('Bertrand Brasil','contato@bertrandbrasil.com','I'),
('Best Business','contato@bestbusiness.com','A'),
('BestSeller','contato@bestseller.com','A'),
('Biblioteca Azul','contato@bibliotecaazul.com','A'),
('Boitempo Editorial','contato@boitempoeditorial.com','I'),
('Book One Editora','contato@bookoneeditora.com','A'),
('Butterfly Editora','contato@butterflyeditora.com','I'),
('Buzz','contato@buzz.com','A'),
('Canção Nova','contato@cancaonova.com','A'),
('CDG','contato@cdg.com','I'),
('Cia das Letrinhas','contato@ciadasletrinhas.com','A'),
('Ciranda Cultural','contato@cirandacultural.com','A'),
('Citadel','contato@citadel.com','I'),
('Citadel Grupo Editorial','contato@citadelgrupoeditorial.com','A'),
('Civilização Brasileira','contato@civilizacaobrasileira.com','I'),
('Companhia das Letras','contato@companhiadasletras.com','I'),
('Companhia de Bolso','contato@companhiadebolso.com','I'),
('Contexto','contato@contexto.com','A'),
('Crivo Editorial','contato@crivoeditorial.com','A'),
('Culturama','contato@culturama.com','A'),
('DarkSide','contato@darkside.com','A'),
('Distribuidora Loyola','contato@distribuidoraloyola.com','A'),
('Ediouro','contato@ediouro.com','A'),
('Edipro','contato@edipro.com','I'),
('Editora Buqui','contato@editorabuqui.com','A'),
('Editora CLA Cultura','contato@editoraclacultura.com','I'),
('Editora Perspectiva','contato@editoraperspectiva.com','A'),
('Elsevier','contato@elsevier.com','A'),
('Essência','contato@essência.com','A'),
('Estação Brasil','contato@estacaobrasil.com','I'),
('Faro Editorial','contato@faroeditorial.com','A'),
('Fons Sapientiae','contato@fonssapientiae.com','A'),
('Fundamento','contato@fundamento.com','A'),
('Galera Record','contato@galerarecord.com','A'),
('Gente','contato@gente.com','I'),
('Geração Editorial','contato@geracaoeditorial.com','A'),
('Girassol Brasil','contato@girassolbrasil.com','A'),
('Globo','contato@globo.com','A'),
('Globo Alt','contato@globoalt.com','I'),
('Globo Estilo','contato@globoestilo.com','A'),
('Globo Livros','contato@globolivros.com','A'),
('Grupo Companhia das Letras','contato@companhiadasletras.com','A'),
('Grupo Editorial Global','contato@grupoeditorialglobal.com','I'),
('Grupo Editorial Record','contato@grupoeditorialrecord.com','I'),
('Grupo Summus','contato@gruposummus.com','A'),
('HarperCollins Brasil','contato@harpercollinsbrasil.com','A'),
('Hunter Books','contato@hunterbooks.com','I'),
('IBEP','contato@ibep.com','A'),
('Intrínseca','contato@intrinseca.com','A'),
('José Olympio','contato@joseolympio.com','A'),
('L&PM','contato@l&pm.com','I'),
('L&PM POCKET','contato@l&pmpocket.com','I'),
('LeYa','contato@leya.com','A'),
('Literare Books','contato@literarebooks.com','A'),
('Loyola','contato@loyola.com','A'),
('Luz da Serra','contato@luzdaserra.com','A'),
('M.Books','contato@m.books.com','A'),
('MAP - Mentes de Alta Performance','contato@map.com','A'),
('Martin Claret','contato@martinclaret.com','A'),
('Martins Fontes','contato@martinsfontes.com','A'),
('Matrix Editora','contato@matrixeditora.com','I'),
('Melbooks','contato@melbooks.com','A'),
('Melhoramentos','contato@melhoramentos.com','A'),
('Metanoia Editora','contato@metanoiaeditora.com','A'),
('Mundo Cristão','contato@mundocristao.com','A'),
('N-1 Edições','contato@n-1ediçoes.com','A'),
('Nobel','contato@nobel.com','I'),
('Nova Fronteira','contato@novafronteira.com','I'),
('Novo Conceito','contato@novoconceito.com','A'),
('Novo Século','contato@novoséculo.com','A'),
('Objetiva','contato@objetiva.com','A'),
('On Line Editora','contato@onlineeditora.com','A'),
('Outro Planeta','contato@outroplaneta.com','A'),
('Panda Books','contato@pandabooks.com','I'),
('Pandorga','contato@pandorga.com','I'),
('Panini','contato@panini.com','A'),
('Pão Diário','contato@paodiario.com','A'),
('Papirus','contato@papirus.com','A'),
('Paralela','contato@paralela.com','A'),
('Paulus Editora','contato@pauluseditora.com','A'),
('Planeta','contato@planeta.com','A'),
('Planeta do Brasil','contato@planetadobrasil.com','A'),
('Pólen Livros','contato@polenlivros.com','A'),
('Publifolha','contato@publifolha.com','A'),
('Quadrinhos na Cia','contato@quadrinhosnacia.com','A'),
('Record','contato@record.com','A'),
('Rideel','contato@rideel.com','A'),
('Rocco','contato@rocco.com','I'),
('Rocco Jovens Leitores','contato@roccojovensleitores.com','I'),
('Rosa dos Tempos','contato@rosadostempos.com','A'),
('Saraiva','contato@saraiva.com','A'),
('Saraiva Jur','contato@saraivajur.com','A'),
('Seguinte','contato@seguinte.com','I'),
('Senac São Paulo','contato@senacsaopaulo.com','A'),
('Sextante','contato@sextante.com','A'),
('Somos Educação','contato@somoseducacao.com','A'),
('Suma de Letras','contato@sumadeletras.com','A'),
('Todavia Livros','contato@todavialivros.com','I'),
('Única','contato@unica.com','A'),
('Universo dos Livros','contato@universodoslivros.com','A'),
('Valentina','contato@valentina.com','I'),
('Verus','contato@verus.com','A'),
('Vida e Consciência','contato@vidaeconsciencia.com','I'),
('Viva Livros','contato@vivalivros.com','A'),
('Vozes','contato@vozes.com','A'),
('VR Editora','contato@vreditora.com','A'),
('WMF Martins Fontes','contato@wmfmartinsfontes.com','A'),
('Zahar','contato@zahar.com','I')
GO

-- INSERINDO EM AUTORES
-- Insert rows into table 'Autor' in schema '[dbo]'
INSERT INTO [dbo].[Autor]
( -- Columns to insert data into
    [Nome], [DataNascimento], [Sexo], [Pais]
)
VALUES
('Stephenie Meyer', '12-24-1973', 'F', 1 --Americana)
GO

-- INSERINDO EM LIVROS
-- Insert rows into table 'Livro' in schema '[dbo]'
INSERT INTO [dbo].[Livro]
(
    [Titulo], [DataDePublicacao], [QtdPaginas], [ISBN], [Categoria]
)
VALUES
('Sol da meia-noite', '2005', '536', '978-65-55600-29-2', 1 -- Ficcao)
GO
