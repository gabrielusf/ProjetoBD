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
                    C R I A C A O   D A S   T A B E L A S                    
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
    [Titulo] VARCHAR(100) NOT NULL,
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

-- Categoria Não Ficção
------------ Companhia das Letras
('Mindset','2006-02-28', 328,'978-85-47000-24-0',2),
('21 lições para o século 21','2018-08-23', 432,'978-85-35930-91-7',2),
('Pequeno manual antirracista','2011-07-15', 136,'978-85-35932-87-4',2),
('Minha história','2018-11-13', 448,'978-85-47000-64-6',2),
('Uma terra prometida','2020-11-17', 764,'978-85-35933-96-3',2),
('Homo Deus','2015-05-23', 448,'978-85-35928-19-8',2),
('Prólogo, ato, epílogo','2019-05-28', 392,'978-85-35932-55-3',2),
('A organização','2015-07-24', 640,'978-85-35933-99-4',2),
('Tormenta','2019-03-11', 272,'978-85-35933-15-4',2),
('Sapiens (nova edição)','2011-06-16', 472,'978-85-35933-92-5',2),
('Sejamos todos feministas','2019-10-23', 64,'978-85-35925-47-0',2),
('No labirinto do cérebro','2020-09-14', 640,'978-85-47001-07-0',2),
('A vida não é útil','2011-11-11', 128,'978-85-35933-69-7',2),
('Metrópole à beira-mar','2019-10-31', 504,'978-85-35932-86-7',2),
('O oráculo da noite','2020-03-30', 488,'978-85-35932-17-1',2),
('Um paciente chamado Brasil','2020-09-20', 228,'978-85-47001-14-8',2),
('Ideias para adiar o fim do mundo','2013-11-17', 64,'978-85-35932-41-6',2),
('Minhas plantas','2016-05-11', 280,'978-85-84390-85-4',2),
('Quem tem medo do feminismo negro?','2020-05-25', 120,'978-85-35931-13-6',2),
('Sapiens (Edição em quadrinhos)','2015-07-24', 248,'978-85-35933-82-6',2),
('Notas sobre a pandemia','2006-02-28', 128,'978-85-35933-70-3',2),
('A máquina do ódio','2019-05-28', 196,'978-85-35933-62-8',2),
('A bailarina da morte','2018-08-23', 368,'978-85-35933-91-8',2),
------------ Sextante
('De cu pra lua','2013-05-29', 480,'978-65-57330-04-3',2),
('Jardim secreto','2016-05-11', 96,'978-85-43101-63-7',2),
('Floresta encantada','2006-02-28', 84,'978-85-43101-95-8',2),
('Mundo das flores','2020-11-17', 80,'978-85-43108-78-0',2),
('Oceano perdido','2020-04-15', 464,'978-85-43102-42-9',2),
('Vó, me conta a sua história','2019-10-06', 160,'978-85-43106-71-7',2),
('A guerra contra o Brasil','2013-05-29', 208,'978-85-56080-58-5',2),
('Mãe, me conta sua história?','2019-10-31', 160,'978-85-43106-70-0',2),
('Queime depois de escrever','2015-07-24', 144,'978-65-55640-00-7',2),
('A incrível viagem de Shackleton','2020-09-14', 352,'978-85-75421-38-3',2),
('Selva mágica','2019-05-28', 88,'978-85-43103-82-2',2),
('Como desenhar paraísos encantados','2020-03-30', 96,'978-65-55640-07-6',2),
------------ Loyola
('A imitação de Cristo','2012-08-11', 208,'978-85-15005-65-9',2),
('Beato Oscar Romero','2016-05-11', 48,'978-85-63042-20-0',2),
('Carta Encíclica do Santo Padre Francisco "Fratelli Tutti - Todos irmãos"','2020-11-17', 144,'978-65-55040-47-0',2),
('Devocionário e novena a Nossa Senhora Aparecida','2006-02-28', 48,'978-85-15044-13-9',2),
('Devocionário e novena a Santa Rita de Cássia','2013-05-29', 48,'978-85-15026-71-5',2),
('Devocionário ao coração de Jesus','2020-04-15', 56,'978-85-15026-39-5',2),
('Manual do coração de Jesus','2019-10-06', 256,'978-85-15003-32-7',2),
('Retiro de Advento e Natal 2020','2017-03-29', 80,'978-65-55040-41-8',2),
('Devocionário e novena a Nossa Senhora Auxiliadora','2019-10-31', 96,'978-85-15044-08-5',2),
('Devocionário e novena a São Miguel Arcanjo','2010-05-21', 56,'978-85-15026-61-6',2),
------------ Globo
('Escravidão','2020-04-15', 504,'978-65-80634-01-9',2),
('O livro da psicologia','2016-05-11', 352,'978-85-25062-49-9',2),
('Memórias','2006-02-28', 272,'978-65-55670-15-8',2),
('O livro da filosofia','2017-03-29', 352,'978-85-25063-09-0',2),
('Woody Allen: a autobiografia','2020-11-17', 324,'978-65-55670-28-8',2),
('O livro da história','2013-05-29', 352,'978-85-25064-14-1',2),
('O livro da ciência','2015-07-24', 352,'978-85-25062-48-2',2),
('Abuso','2020-09-14', 320,'978-65-86047-25-7',2),
('Cozinheiros em ação','2019-10-31', 184,'978-85-25065-98-8',2),
------------ Grupo Editorial Record
('Economia do desejo','2017-11-26', 96,'978-85-20014-14-1',2),
('Aprendizados','2013-05-29', 240,'978-85-46501-27-4',2),
('O diário de Anne Frank','2016-11-30', 352,'978-85-01044-45-7',2),
('Mulheres de minha alma','2006-02-28', 238,'978-85-28624-79-3',2),
('O mito da beleza','2015-07-24', 490,'978-85-01113-52-8',2),
('Justiça - O que é fazer a coisa certa','2020-11-17', 352,'978-85-20010-30-3',2),
('Conservadorismo','2017-03-29', 154,'978-85-01114-51-8',2),
------------ Planeta
('Batismo de fogo','2019-10-06', 144,'978-65-55351-35-4',2),
('O dilema do porco-espinho','2016-05-11', 192,'978-85-42214-36-9',2),
('Por que lutamos?','2017-11-26', 160,'978-85-42217-70-4',2),
('Elis e eu','2010-05-21', 192,'978-85-42217-71-1',2),
('Se quiser mudar o mundo','2019-10-31', 192,'978-65-55352-02-3',2),
('Se quiser mudar o mundo','2006-02-28', 192,'978-65-55351-74-3',2),
('Pai de menina','2020-03-30', 216,'978-85-42213-68-3',2),
------------ Alta Books
('Como ser antirracista','2010-05-21', 320,'978-85-50814-55-1',2),
('O grande sucessor','2017-03-29', 320,'978-85-50815-64-0',2),
('O lado certo da história','2013-05-29', 272,'978-85-50809-26-7',2),
('O efeito gaslight','2012-08-11', 304,'978-85-50807-94-2',2),
('O complô para destruir a democracia','2020-03-30', 352,'978-85-50804-54-5',2),
------------ Citadel Grupo Editorial
('A felicidade é inútil','2020-04-15', 288,'978-65-50470-22-7',2),
('Os segredos da longevidade','2019-10-06', 288,'978-65-50470-02-9',2),
('Além da prevenção','2016-05-11', 144,'978-65-50470-37-1',2),
('Será que ele me ama?','2016-11-30', 256,'978-65-50470-54-8',2),
('Morte a Vossa Excelência','2013-05-29', 480,'978-65-50470-34-0',2),
------------ Intrínseca
('Destrua este diário ( capa vermelha)','2020-11-17', 224,'978-85-80575-76-7',2),
('Breves respostas para grandes questões','2015-07-24', 256,'978-85-51004-31-9',2),
('Destrua este diário','2010-05-21', 224,'978-85-80574-16-6',2),
('Uma breve história do tempo','2006-02-28', 265,'978-85-80576-46-7',2),
('Só pode ser brincadeira, Sr. Feynman!','2019-10-31', 400,'978-85-51004-84-5',2),
------------ Angelus Editora
('O poder do sangue de jesus','2017-03-29', 164,'978-65-99142-50-5',2),
('Caminhos da reconciliação','2019-10-06', 144,'978-65-99142-59-8',2),
('Conexão e Fé','2020-09-14', 150,'978-65-99142-54-3',2),
('Pare de se maltratar','2012-08-11', 124,'978-65-99142-56-7',2),
------------ Distribuidora Loyola
('Orações selecionadas','2020-04-15', 168,'978-85-63042-64-4',2),
('Quaresma de São Miguel','2016-05-11', 60,'978-85-63042-15-6',2),
('Do profundo de nosso coração','2017-11-26', 104,'978-85-63042-78-1',2),
('As associações de fiéis','2016-11-30', 256,'978-85-63042-58-3',2),
------------ Ediouro
('O mundo pós-pandemia','2015-07-24', 416,'978-85-20945-82-7',2),
('Vencemos juntos','2013-05-29', 176,'978-85-55462-77-1',2),
('Brasileiros','2010-05-21', 448,'978-85-20934-99-9',2),
('O espelho infiel','2019-10-31', 360,'978-65-56400-59-4',2),
------------ Ediouro
('O mundo pós-pandemia','2019-10-06', 416,'978-85-20945-82-7',2),
('Vencemos juntos','2006-02-28', 176,'978-85-55462-77-1',2),
('Brasileiros','2020-04-15', 448,'978-85-20934-99-9',2),
('O espelho infiel','2017-03-29', 360,'978-65-56400-59-4',2),
------------ Aeroplano Editora
('Box - O essencial da Psicologia','2017-11-26', 512,'978-85-65042-89-5',2),
('Box - O essencial da 2ª guerra mundial','2015-07-2', 384,'978-85-65042-47-5',2),
('Box - O essencial da política','2006-02-28', 480,'978-85-65042-55-0',2),



-- Categoria AutoAjuda
('Nunca foi sorte','2020-03-07', 192,'978-85-93156-95-3',3),
('Desperte seu poder','2018-05-12', 208,'978-85-93156-28-1',3),
('Magra para sempre','2019-06-10', 160,'978-85-93156-96-0',3),
('Escolha sua vida','2017-03-29', 152,'978-65-86077-04-9',3),
('Tamo junto','2015-08-08', 240,'978-85-93156-82-3',3),
('Doidas no divã','2016-07-15', 232,'978-65-80435-37-1',3),
('O que realmente importa?','2014-07-01', 160,'978-85-93156-03-8',3),
('Do zero ao infinito','2013-08-17', 160,'978-65-86077-58-2',3),
('Lições de um monge para viver no século 21','2020-10-05', 224,'978-65-80435-59-3',3),
('A favela venceu','2018-06-08', 168,'978-65-86077-00-1',3),
('Pega a visão','2019-11-08', 208,'978-85-93156-72-4',3),
('DNA da cocriação','2017-11-30', 288,'978-85-45203-86-5',3),
('Atitude positiva diária','2015-08-29', 128,'978-65-55440-49-2',3),
('Eu sou, eu posso!','2016-07-03', 400,'978-65-55440-41-6',3),
('Meu livro da consciência','2014-08-04', 400,'978-85-45202-12-7',3),
('A era da integridade','2013-05-29', 208,'978-65-55440-19-5',3),
('Obrigada, de nada','2020-04-15', 144,'978-85-45203-83-4',3),
('Pílulas de resiliência','2018-04-13', 208,'978-85-45203-98-8',3),
('Acredite, a vida sem dor é possível','2019-10-06', 256,'978-65-55440-23-2',3),
('Guerreiros não nascem prontos','2017-11-29', 192,'978-85-45200-54-3',3),
('Pare de dar murro em ponta de faca','2015-09-19', 168,'978-85-45202-10-3',3),
('A coragem de ser imperfeito','2016-03-09', 208,'978-85-43104-33-1',3),
('A morte é um dia que vale a pena viver','2014-04-05', 192,'978-85-43107-20-2',3),
('O poder do agora','2013-01-20', 224,'978-85-75420-27-0',3),
('Nunca desista de seus sonhos','2012-06-07', 160,'978-85-43102-55-9',3),
('As coisas que você só vê quando desacelera','2012-01-11', 256,'978-85-43105-29-1',3),
('Como fazer amigos e influenciar pessoas','2020-07-22', 256,'978-85-43108-68-1',3),
('O segredo','2011-10-30', 216,'978-85-43101-96-5',3),
('Pai, me conta a sua história?','2010-05-21', 160,'978-85-43107-79-0',3),
('Como evitar preocupações e começar a viver','2020-08-19', 320,'978-85-43109-29-9',3),
('12 regras para a vida : um antídoto para o caos','2014-04-03', 448,'978-85-50802-75-6',3),
('O poder dos momentos','2013-11-15', 320,'978-85-50804-46-0',3),
('Papo reto','2020-05-28', 248,'978-65-55201-41-3',3),
('A introdução definitiva à PNL','2018-10-06', 160,'978-85-50810-84-3',3),
('Hábitos atômicos','2019-10-05', 320,'978-85-50807-56-0',3),
('Os 100 segredos das pessoas felizes','2017-06-18', 160,'978-85-50811-86-4',3),
('O melhor de mim','2015-04-15', 352,'978-85-50810-22-5',3),
('A álgebra da felicidade','2016-11-30', 256,'978-85-50814-03-2',3),
('Mais esperto que o diabo','2014-10-21', 200,' 978-85-68014-00-4',3),
('Mais esperto que o diabo (edição de bolso)','2013-01-23', 144,' 978-85-68014-93-6',3),
('O manuscrito original (edição de bolso)','2012-01-19', 144,' 978-85-68014-92-9',3),
('Atitude mental positiva','2012-08-11', 312,' 978-85-68014-05-9',3),
('Como se tornar sobrenatural','2020-08-28', 424,' 978-65-50470-51-7',3),
('Quem assiste enriquece','2011-09-27', 240,' 978-65-50470-53-1',3),
('Atitude mental positiva ( edição de bolso)','2014-03-23', 144,' 978-65-50470-13-5',3),
('O milagre da manhã','2013-01-26', 196,' 978-85-76849-94-0',3),
('O poder do subconsciente','2020-07-29', 308,' 978-85-46501-45-8',3),
('Os quatro segredos sagrados para o amor e a prosperidade','2018-06-23', 196,' 978-85-46502-09-7',3),
('Pense & enriqueça','2019-05-16', 336,' 978-85-46501-46-5',3),
('Quem mexeu no meu queijo?','2017-11-26', 112,' 978-85-01112-06-4',3),
('O cavaleiro preso na armadura','2015-08-15', 112,' 978-85-01057-44-0',3),
('O poder do subconsciente (edição de bolso)','2016-02-19', 288,' 978-85-81030-13-5',3),
('Desperte a sua vitória','2014-06-24', 224,' 978-85-64463-91-2',3),
('Manifesto da autoestima','2013-03-21', 296,' 978-65-88484-00-5',3),
('Fitoenergética - Edição comemorativa de 15 anos','2012-03-22', 400,' 978-85-64463-63-9',3),
('A oração mais poderosa de todos os tempos','2012-01-10', 160,' 978-85-64463-83-7',3),
('Como ser um imã para o dinheiro','2020-11-30', 200,' 978-85-64463-92-9',3),
('Cresça, apareça e enriqueça','2011-04-10', 216,' 978-65-88485-01-9',3),
('Felicidade','2014-01-20', 160,' 978-85-42216-81-3',3),
('Por onde for o teu passo, que lá esteja o teu coração','2013-02-15', 232,' 978-85-42215-49-6',3),
('Por que fazemos o que fazemos?','2020-03-17', 176,' 978-85-42207-41-5',3),
('Especialista em pessoas','2018-07-15', 224,' 978-85-42218-75-6',3),
('Demos graças a Deus','2019-09-20', 128,' 978-85-42215-25-0',3),
('A sutil arte de ligar o foda-se','2017-04-21', 224,' 978-85-51002-49-0',3),
('F*deu geral','2015-11-26', 288,' 978-85-51004-90-6',3),
('Não se humilha, não','2016-06-13', 320,' 978-85-51006-09-2',3),
('Coleção Isabela Freitas','2014-02-26', 752,' 978-85-51004-54-8',3),
('Ora ação','2013-11-28', 112,' 978-65-99142-52-9',3),
('Duas estradas, um só caminho','2012-04-29', 240,' 978-65-89083-00-9',3),
('Ensina-me a fazer tua vontade','2012-08-28', 120,' 978-65-99142-55-0',3),
('Todo santo dia','2020-04-14', 295,' 978-85-94551-72-6',3),
('NeoMindfulness','2011-11-13', 168,' 978-65-86939-14-9',3),
('O código T','2014-05-17', 176,' 978-85-94551-25-2',3),
('O tempo da felicidade','2013-07-11', 208,' 978-85-95086-82-1',3),
('O maior segredo','2020-02-20', 272,' 978-65-55110-72-2',3),
('Como fazer amigos e influenciar pessoas','2018-07-19', 312,' 978-85-04018-02-8',3),
('A grande promessa do sacratíssimo coração de Jeus','2019-07-30', 40,' 978-85-15001-97-2',3),
('Arrependimento - Porta da misericórdia','2017-08-27', 64,' 978-85-63042-16-3',3),
('Ansiedade - Como enfrentar o mal do século','2015-02-14', 160,' 978-85-02218-48-2',3),
('Ansiedade 2 – Autocontrole','2016-10-14', 192,' 978-85-57170-43-8',3),
('Minutos de sabedoria','2014-09-25', 288,' 978-85-32604-91-0',3),
('Encontro diário com Deus - Orações e mensagens 2020','2013-07-11', 216,' 789-85-63141-58-1',3),
('A menina índigo','2012-03-23', 224,' 978-85-68674-12-3',3),
('500 dias sem/com você','2012-10-03', 212,' 978-85-66019-93-3',3),
('As muralhas vão cair','2020-10-25', 176,' 978-85-82781-70-8',3),
('A arte da sabedoria','2011-03-08', 128,' 978-85-95810-34-1',3),
('O poder do hábito','2010-05-24', 408,' 978-85-39004-11-9',3),
('As cinco linguagens do amor','2020-07-20', 216,' 978-85-73258-92-9',3),
('Barriga dos sonhos','2011-08-23', 256,' 978-65-81119-05-8',3),
('Novena do Espírito Santo','2020-01-15', 88,' 978-85-34901-15-4',3),
('Limite zero','2020-06-13', 239,' 978-85-32524-20-1',3),
('Criando com empatia','2015-10-09', 160,' 978-85-39631-56-8',3),
('Como convencer alguém em 90 segundos','2020-10-04', 200,' 978-85-79303-19-7',3),
('O discreto charme do intestino','2020-05-30', 308,' 978-85-46901-75-3',3),

--Categoria Negócios
('Decida vencer', '2011', '208', '978-85-45203-89-6', 5 -- Negócios),
('O poder da autorresponsabilidade', '2013', '160', '978-85-45202-21-9', 5 -- Negócios),
('Seja foda!', '2019', '208', '978-85-45203-89-6', 5 -- Negócios),
('Os segredos da mente milionária', '2012', '176', '978-85-75422-39-7', 5 -- Negócios),
('Pai rico, pai pobre - Edição de 20 anos', '2010', '336', '978-85-50801-48-3', 5 -- Negócios),
('Quem pensa enriquece: o legado', '2008', '364', '978-85-68014-54-7', 5 -- Negócios),
('O poder da ação', '2002', '256', '978-85-45200-34-5', 5 -- Negócios),
('O homem mais rico da Babilônia', '2003', '160', '978-85-95081-53-6', 5 -- Negócios),
('Me poupe!', '2001', '176', '978-85-43105-81-9', 5 -- Negócios),
('Enfodere-se!', '2002', '208', '978-65-80435-23-4', 5 -- Negócios),
('Essencialismo', '2011', '272', '978-85-43102-14-6', 5 -- Negócios),
('O poder da ação ( edição de luxo)', '2007', '256', '978-85-45203-72-8', 5 -- Negócios),
('O investidor inteligente', '2009', '672', '978-85-95080-80-5', 5 -- Negócios),
('Na raça', '2015', '240', '978-85-51006-05-4', 5 -- Negócios),
('Rápido e devagar', '2004', '608', '978-85-39003-83-9', 5 -- Negócios),
('Quem pensa enriquece : o legado (edição de bolso)', '2018', '144', '978-65-50470-16-6', 5 -- Negócios),
('O jeito Harvard de ser feliz', '2011', '208', '978-85-45203-89-6', 5 -- Negócios),
('Vade Mecum Saraiva 2020- 29ª Edição', '2013', '160', '978-85-45202-21-9', 5 -- Negócios),
('O seu direito de ser rico', '2019', '208', '978-85-45203-89-6', 5 -- Negócios),
('Box - Paulo Vieira', '2012', '944', '978-85-45202-15-8', 5 -- Negócios),
('Assuma o comando da sua vida', '2008', '192', '978-65-55440-50-8', 5 -- Negócios),
('Faça o tempo enriquecer você', '2020', '224', '978-85-45203-90-2', 5 -- Negócios),
('Sonhe, acredite e faça', '2017', '192', '978-65-55440-29-4', 5 -- Negócios),
('Excelência para obstinados', '2016', '192', '978-85-45203-51-3', 5 -- Negócios),
('O futuro do dinheiro', '2015', '208', '978-85-45203-70-4', 5 -- Negócios),
('Mentalidade', '2014', '224', '978-85-45201-40-3', 5 -- Negócios),
('Gestão fácil', '2017', '176', '978-85-45203-05-6', 5 -- Negócios),
('Bora varejo', '2018', '224', '978-65-55440-12-6', 5 -- Negócios),
('A decisão que o mundo precisa', '2021', '192', '978-85-45203-30-8', 5 -- Negócios),
('Viva a sua melhor versão', '2019', '192', '978-65-55440-48-5', 5 -- Negócios),
('Crie seu mercado no mundo digital', '2011', '208', '978-85-45202-68-4', 5 -- Negócios),
('Empreendedores', '2012', '240', '978-85-45203-31-5', 5 -- Negócios),
('Estratégia adaptativa', '2020', '304', '978-65-55440-32-4', 5 -- Negócios),
('Audaz', '2017', '224', '978-85-45202-67-7', 5 -- Negócios),
('Faça suas próprias leis', '2014', '224', '978-85-45202-76-9', 5 -- Negócios),
('Faça simples', '2002', '192', '978-85-45203-35-3', 5 -- Negócios),
('Sonhar alto, pensar grande', '2014', '224', '978-85-45200-92-5', 5 -- Negócios),
('Acorda! Sonhar não basta', '2017', '128', '978-85-45202-58-5', 5 -- Negócios),
('O único livro que todo empresário precisa ler', '2018', '160', '978-85-45201-95-3', 5 -- Negócios),
('Desperte seu conhecimento milionário', '2021', '160', '978-85-45203-32-2', 5 -- Negócios),
('Se vira, moleque', '2019', '224', '978-65-55440-21-8', 5 -- Negócios),
('12 princípios para uma vida extraordinária', '2011', '160', '978-85-45203-65-0', 5 -- Negócios),
('A sabedoria do dinheiro', '2012', '224', '978-85-45203-94-0', 5 -- Negócios),
('Transformação radical', '2020', '304', '978-65-55440-46-1', 5 -- Negócios),
('Seja um líder de heróis', '2017', '256', '978-85-45203-27-8', 5 -- Negócios),
('Bora vender', '2014', '224', '978-85-45203-21-6', 5 -- Negócios),
('Quero ficar rico', '2002', '144', '978-85-45201-22-9', 5 -- Negócios),
('A nova lógica do sucesso', '2002', '192', ' 978-85-45200-50-5', 5 -- Negócios),
('Problemas? Oba!', '2014', '160', ' 978-85-73127-53-9', 5 -- Negócios),
('O novo código da cultura', '2017', '224', '978-85-45203-29-2', 5 -- Negócios),
('Pai rico, pai pobre - Edição de 20 anos', '2011', '336', '978-85-50801-48-3', 5 -- Negócios),
('De zero a 50 milhões', '2012', '240', '978-65-55201-25-3', 5 -- Negócios),
('A universidade da Berkshire Hathaway', '2020', '384', '978-85-50810-58-4', 5 -- Negócios),
('Empatia assertiva', '2017', '328', '978-85-50810-78-2', 5 -- Negócios),
('Keynes e os Pós-Keyneasianos', '2014', '288', '978-85-50811-78-9', 5 -- Negócios),
('Dominando o Ciclo de Mercado', '2002', '336', '978-85-50808-78-9', 5 -- Negócios),
('Master selling', '2002', '256', ' 978-65-55201-36-9', 5 -- Negócios),
('Empresas feitas para vencer', '2014', '368', '978-85-50805-24-5', 5 -- Negócios),
('Empresas humanizadas', '2017', '368', '978-85-50807-53-9', 5 -- Negócios),




