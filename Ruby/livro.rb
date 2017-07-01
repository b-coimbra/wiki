# encoding: utf-8

class Livro
    attr_accessor :preco
    attr_reader :categoria, :autor, :titulo

    def initialize(titulo, author, isbn = "1", pages, preco, categoria)
        @titulo = titulo
        @categoria = categoria
        @author = author
        @isbn = isbn
        @pages = pages
        @preco = preco
    end

    def to_s
        "Autor: #{@author}, ISBN: #{@isbn}, Páginas: #{@pages},
        #{@categoria}"
    end

    def eql?(outro_livro)
        @isbn = outro_livro.isbn
    end

    def hash
        @isbn.hash
    end
end
