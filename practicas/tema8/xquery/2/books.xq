(:1.Buscar Titulos: Donde aparezca la etiqueta padre, es decir que esté bien formado, y combiar la etiqueta title por titulo

<libros>
{for $x in doc("books.xml")/bookstore/book/title/text()
return <titulo> {$x} </titulo>}
</libros>:)

(:2.Buscar libros cuyo precio sea meno o igual que 30, y combiar la etiqueta title por titulo
for $precio in doc ("books.xml")/bookstore/book
where $precio/price <=30
return <titulo> {$precio}</titulo>:)

(:3.Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a 30.:)
for $precio in doc ("books.xml")/bookstore/book/title
where $precio/../price <=30
return <titulo> {$precio}</titulo>