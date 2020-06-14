(:1.Mostrar cada uno de los nombres de los bailes con la etiqueta "losbailes
for $x in doc("bailes.xml")/bailes/baile/nombre/text()
return <losbailes> {$x} </losbailes>
:)

(:2.Mostrar los nombres de los bailes seguidos con el número de plazas entreparéntesis, ambos dentro de la misma etiqueta "losbailes"
for $baile in doc("bailes.xml")/bailes/baile
return <losbailes>{$baile/nombre/text()} ({$baile/plazas/text()})</losbailes>:)

(:3.Mostrar los nombres de los bailes cuyo precio sea mayor de 30
doc ("bailes.xml")/bailes/baile[precio>30]/nombre:)

(:4.Mostrar los nombres de los bailes cuyo precio sea mayor de 30.
for $x in doc ("bailes.xml")/bailes/baile[precio>30]/nombre
where $x/../precio[@moneda="euro"]
return $x:)

(:5.Mostrar los nombres y la fecha de comienzo de los bailes que comiencen el mes de enero (utiliza para buscarlo la cadena de texto "/1/"
for $baile in doc("bailes.xml") /bailes/baile
where contains($baile/comienzo, "/1/")
return 
   <baile>
      {$baile/profesor}
      {$baile/comienzo}
   </baile>:)
   
(:6.Mostrar los nombres de los profesores y la sala en la que dan clase, ordénalos por sala
for $baile in doc("bailes.xml")/bailes/baile
order by $baile/sala
return 
   <baile>
      {$baile/profesor}
      {$baile/sala}
   </baile>:)

(:7.Mostrar los nombres de los profesores eliminando los repetidos y acampañar
cada nombre con todas las salas en la que da clase, ordénalos por nombre
for $profesor in distinct-values(doc("bailes.xml")/bailes/baile/profesor)
let $salas := (doc("bailes.xml")/bailes/baile[profesor=$profesor]/sala)
order by $profesor
return 
   <profesores>
     <nombre>{$profesor}</nombre>
     {$salas}
   </profesores>:)


(:8.Mostrar la media de los precios de todos los bailes
let $baile := (doc ("bailes.xml")/bailes/baile)
return <media>{avg($baile/precio)}</media>:)

(:9.Mostrar la suma de los precios de los bailes de la sala 1
let $baile := (doc ("bailes.xml")/bailes/baile[sala=1])
return <total_sala_1>{sum($baile/precio)}</total_sala_1>:)

(:10.Mostrar cuántas plazas en total oferta el profesor "Jesus Lozano".
let $plazas:= (doc ("bailes.xml")/bailes/baile[profesor="Jesus Lozano"]/plazas)
return <plazastotales> {sum ($plazas)}  </plazastotales>:)

(:11.Mostrar el dinero que ganaría la profesora "Laura Mendiola" si se completaran todas las plazas de su baile, sabiendo que sólo tiene un baile.
let $sueldo:= (doc ("bailes.xml")/bailes/baile[profesor="Laura Mendiola"]/precio)
return <sueldo>{sum ($sueldo)*18}</sueldo>:)

(:12.Mostrar el dinero que ganaría el profesor "Jesus Lozano" si se completaran todas las plazas de su baile, pero mostrando el beneficio de cada baile por separado.
for $baile in doc("bailes.xml")/bailes/baile
where $baile/profesor = "Jesus Lozano"
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>:)

(:13.Mostrar el dinero que ganaría la profesora "Laura" (no conocemos su apellido) si se completaran todas las plazas de su baile.
for $baile in doc ("bailes.xml")/bailes/baile[starts-with(profesor, "Laura")]
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>:)

(:14.Mostrar el nombre del baile, su precio y el precio con un descuento del 15% para familias numerosas. Ordenar por el nombre del baile
for $baile in doc("bailes.xml") /bailes/baile
order by $baile/nombre
return 
   <baile>
      {$baile/nombre}
      <precio>{$baile/precio/text()}</precio>
      <fam_numerosa>{$baile/precio * 0.85}</fam_numerosa>
   </baile>:)
   
(:15.Mostrar todos los datos de cada baile excepto la fecha de comienzo y de fin.
for $baile in doc("bailes.xml")/bailes/baile
return <baile>{$baile/* except $baile/comienzo except $baile/fin}</baile>:)

(:16.Mostrar en una tabla de HTML los nombres de los bailes y su profesor, cada uno en una fila.:)
<table> {
  for $baile in doc ("bailes.xml")/bailes/baile
  return <tr><td>{$baile/nombre/text()}</td><td>{$baile/profesor/text()}</td></tr>
} </table>