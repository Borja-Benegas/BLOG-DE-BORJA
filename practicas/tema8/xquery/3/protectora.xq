(:1.Consulta
<Ejercicio1_Borja>
{
 for $animal in doc ("protectora.xml")/protectora/mascotas/categoria/perro[@fecha_llegada="2020"]
 order by $animal/perro/edad
 return
 <Nombre_Animal>
  {$animal/nombre}
 </Nombre_Animal>
}
</Ejercicio1_Borja>:)

(:2.Consulta
<Ejercicio2_Borja>
{
 for $animal in doc ("protectora.xml")/protectora/mascotas/categoria/perro
 return
 <Nombre_Raza>
  {$animal/nombre}
  {$animal/raza}
 </Nombre_Raza>
}
</Ejercicio2_Borja>:)

(:3.Consulta
<Ejercicio3_Borja>
{
 for $animal in doc ("protectora.xml")/protectora/mascotas/categoria/perro[nombre="Filipa"]
 return
 <Tratamientos>
  {$animal/cartilla_sanitaria/consulta/descripcion}
 </Tratamientos>
}
</Ejercicio3_Borja>:)

(:4.Consulta
<Ejercicio4_Borja>
{
 for $animal in doc ("protectora.xml")/protectora/mascotas/categoria/gato[nombre="Roma"]
 return
 <Nombre_Medicos>
  {$animal/cartilla_sanitaria/consulta/veterinario/nombre}
 </Nombre_Medicos>
}
</Ejercicio4_Borja>:)

(:5.Consulta
<Ejercicio5_Borja>
{
let $gato := (doc ("protectora.xml")/protectora/mascotas/categoria/gato/cartilla_sanitaria/consulta/importe)
 return
 <Gasto_Gato>
  <Gasto_Medio>{avg($gato)}</Gasto_Medio>
  <Gasto_Total>{sum($gato)}</Gasto_Total>
 </Gasto_Gato>
}
</Ejercicio5_Borja>:)

(:6.Consulta
<Ejercicio6_Borja>
{
let $importe := max (doc ("protectora.xml")/protectora/mascotas/categoria/gato/cartilla_sanitaria/consulta/importe)
for $consulta in doc ("protectora.xml")/protectora/mascotas/categoria/gato[cartilla_sanitaria/consulta[importe=$importe]]
 return
 <Gato>
  <Nombre>{$consulta/nombre}</Nombre>
  <Tratamiento>{$consulta/cartilla_sanitaria/consulta/descripcion}</Tratamiento>
 </Gato>
}
</Ejercicio6_Borja>:)

(:7.Consulta
<Ejercicio7_Borja>
{
for $animales1 in doc ("protectora.xml")/protectora/mascotas/categoria
let $animales := (doc ("protectora.xml")/protectora/mascotas/categoria/perro)
return
  <Animales_Perro>
    <Categoria>{$animales1/@nombre}</Categoria>
    <N_Animales>{count($animales)}</N_Animales>
  </Animales_Perro>
  }
</Ejercicio7_Borja>:)

(:8.Consulta  
<Ejercicio8_Borja>
{
let $animales := (doc ("protectora.xml")/protectora/mascotas/categoria/perro[@fecha_llegada="2020"])
return
  <Numero_Mascotas_Perro>
    <N_Animales>{count($animales)}</N_Animales>
  </Numero_Mascotas_Perro>
  }
</Ejercicio8_Borja>:)

(:9.Consulta
<Ejercicio9_Borja>
{
for $nombre in doc ("protectora.xml")/protectora/mascotas/categoria/perro[raza="PastorAleman"]/nombre
return
 <Nombre_Pastor_Aleman>
   {$nombre}
 </Nombre_Pastor_Aleman>
 }
</Ejercicio9_Borja>:)
(:10.Consulta
for $mascotas in  doc ("protectora.xml")/protectora/mascotas/categoria/perro/cartilla_sanitaria/consulta/descripcion=[Desparasitacion]
return 
  <Mascotas_Desparasitadas>
  {count($mascotas)}
  </Mascotas_Desparasitadas>:)