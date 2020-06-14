(:1.Ejercicio
<Ejercicio1_Borja-Benegas>
{
for $pacientes in doc ("centromedico.xml")/centro_medico/pacientes/paciente
order by $pacientes/nombre 
where contains ($pacientes/primera_visita, "2020")
return 
  <Pacientes>
    {$pacientes/nombre} 
    {$pacientes/apellidos}
  </Pacientes>
}
</Ejercicio1_Borja-Benegas>:)
 
 (:2.Ejercicio)
 <Ejercicio2_Borja-Benegas>
{
for $asegurados in doc ("centromedico.xml")//centro_medico/pacientes/paciente[comp_aseguradora="Adeslas"]
return 
  <Pacientes>
    {$asegurados/nombre} 
    {$asegurados/apellidos}
  </Pacientes>
}
</Ejercicio2_Borja-Benegas>:)
 
 (:3.Ejercicio
<Ejercicio3_Borja-Benegas>
{
for $medico in doc ("centromedico.xml")/centro_medico/pacientes/paciente/consultas/consulta
where contains ($medico/@fecha, "2019-02-19")
return 
   <Medicos>
     {$medico/medico/nombre/text()}
   </Medicos>
}
</Ejercicio3_Borja-Benegas>:)

(:4.Ejercicio
<Ejercicio4_Borja-Benegas>
{
for $paciente in doc ("centromedico.xml")/centro_medico/pacientes/paciente/nombre
let $gasto := (doc("centromedico.xml")/centro_medico/pacientes/paciente[nombre]/consultas/consulta/importe)
return 
   <Paciente>
     {$paciente}
     {<gasto>{sum($gasto)}</gasto>}
   </Paciente>
}
</Ejercicio4_Borja-Benegas>:)

(:5.Ejercicio
<Ejercicio5_Borja-Benegas>
{
for $medico in doc ("centromedico.xml")/centro_medico/pacientes/paciente
where $medico/nombre = "Mafalda"
return
 <medico>
   {$medico/consultas/consulta/medico/nombre}
 </medico>
}
</Ejercicio5_Borja-Benegas>:)

(:6.Ejercicio
<Ejercicio6_Borja-Benegas>
{
let $gasto := (doc ("centromedico.xml")//centro_medico/pacientes/paciente/consultas/consulta/importe)
return
 <Gasto_Medio>
   {avg($gasto)}
 </Gasto_Medio>
}
</Ejercicio6_Borja-Benegas>:)

(:7.Ejercicio
<Ejercicio7_Borja-Benegas>
{
let $gasto := max (doc ("centromedico.xml")/centro_medico/pacientes/paciente/consultas/consulta/importe)
for $libro in doc("centromedico.xml")/centro_medico/pacientes/paciente/consultas/consulta[importe = $gasto]
return
 <Consulta_Cara>
   {$libro}
 </Consulta_Cara>
}
</Ejercicio7_Borja-Benegas>:)

(:8.Ejercicio
<Ejercicio8_Borja-Benegas>
{
let $consulta2 := (doc ("centromedico.xml")/centro_medico/pacientes/paciente/consultas/consulta[descripcion="vacunas"])
return
 <Consultas_Vacunas>
  {count($consulta2)}
 </Consultas_Vacunas>
}
</Ejercicio8_Borja-Benegas>:)

(:9.Ejercicio
<Ejercicio9_Borja-Benegas>
{
for $codigo in doc ("centromedico.xml")/centro_medico/pacientes/paciente/consultas/consulta[descripcion="Otitis."]/medico/@codigo
return
 <Codigos>
  {$codigo}
 </Codigos>
}
</Ejercicio9_Borja-Benegas>:)

(:10.Ejercicio
<Ejercicio10_Borja-Benegas>
{
let $ingreso := (doc ("centromedico.xml")/centro_medico/pacientes/paciente/consultas/consulta)

return
 <Ingresos>
  {sum($ingreso/importe)}
 </Ingresos>
}
</Ejercicio10_Borja-Benegas>:)