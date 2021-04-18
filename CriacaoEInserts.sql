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
--CONTINUAR O CADASTRO PARA AS CATEGORIAS FICÇÃO, NÃO FICÇÃO, INFANTO JUVENIL E NEGÓCIOS
