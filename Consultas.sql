/*

1) Exibir o título do livro, o ISBN e a quantidade de páginas dos livros ordenados pela quantidade de páginas de forma decrescente.

2) Exibir os autores de código par que o código sejam menores do que 20

3) Exibir os livros que foram publicados entre 2019 e 2020

4) Exibir o código da categoria, e a quantidade de livros que cada categoria possui ordenados por quantidade de livros 

5) Exibir os top 5 livros com maior quantidade de páginas ordenado pela quantidade de páginas.

*/

USE BDEditora
GO

-- 1) Exibir o título do livro, o ISBN e a quantidade de páginas dos livros ordenados pela quantidade de páginas de forma decrescente.
SELECT Titulo, ISBN, QtdPaginas
FROM [dbo].[Livro]
ORDER BY (QtdPaginas) DESC

-- 2) Exibir os autores de código par que o código sejam menores do que 20
SELECT *
FROM [dbo].[Autor]
WHERE Autor.CodigoAutor < 20
GO

-- 3) Exibir os livros que foram publicados entre 2019 e 2020
SELECT *
FROM [dbo].[Livro]
-- WHERE DataDePublicacao BETWEEN '2019-01-01' AND '2020-12-12'
WHERE DataDePublicacao BETWEEN '2019' AND '2020' --Também funciona
GO

-- 4) Exibir o código da categoria, e a quantidade de livros que cada categoria possui ordenados por quantidade de livros 
SELECT
    Livro.Categoria,
    Categoria.Nome,
    COUNT(Livro.CodigoLivro) AS QtdPorCategoria
FROM Livro INNER JOIN Categoria ON Livro.Categoria = Categoria.CodigoCategoria
GROUP BY Livro.Categoria, Categoria.Nome

-- 5) Exibir os top 5 livros com maior quantidade de páginas ordenado pela quantidade de páginas.
SELECT
    TOP 5
    Livro.Titulo,
    Livro.QtdPaginas,
    RANK() over (ORDER BY Livro.QtdPaginas DESC) AS Rank
FROM Livro
GO
