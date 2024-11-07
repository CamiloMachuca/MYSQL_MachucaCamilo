USE universidad_T2;

-- Ejemplos en clase
select apellido1 as apellido_1, apellido2 as apellido2, nombre as Nombre from alumno order by 1, 2, 3 asc;
select nombre, apellido1, apellido2 from alumno where telefono is null;
select * from asignatura;
select * from asignatura where cuatrimestre= 1 and (curso=3) and (id_grado=7);
select asignatura.nombre from asignatura inner join grado on asignatura.id_grado= grado.id where grado.nombre = 'Grado en Ingeniería Informatica (Plan 2015)';
select * from alumno inner join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_alumno= alumno.id inner join asignatura on alumno_se_matricula_asignatura.id_asignatura= asignatura.id inner join curso_escolar ce on ce.id= alumno_se_matricula_asignatura.id_curso_escolar where ce.anyo_inicio= '2017' and ce.anyo_fin='2018';
select * from alumno_se_matricula_asignatura;


-- TALLER
-- 1. Devuelve el número total de alumnas que hay.
select count(sexo) as total_alumnas from alumno where sexo='M';

-- 2. Calcula cuántos alumnos nacieron en 1999.
select count(fecha_nacimiento) as Fecha_Nacimiento from alumno where year(fecha_nacimiento) ='1999';

-- 3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento.
--  El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

select d.nombre as departamento,count(p.id_departamento) as cantidad_profesores from profesor p inner join departamento d on d.id=p.id_departamento group by 1 order by 2 desc;

-- 4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. 
-- Estos departamentos también tienen que aparecer en el listado.

select d.nombre as departamento,count(p.id_departamento) as cantidad_profesores from profesor p right join departamento d on d.id=p.id_departamento group by 1;

-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas.
-- Estos grados también tienen que aparecer en el listado. 
-- El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

select G.nombre as grado, count(A.id_grado) as asignaturas from grado G left join asignatura A on A.id_grado= G.id group by 1 order by 2 desc;

-- 6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
select G.nombre as grado, count(A.id_grado) as asignaturas from grado G left join asignatura A on A.id_grado= G.id group by 1 having count(A.id_grado)>40 order by 2 desc ;

-- 7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. 
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.
--  Ordene el resultado de mayor a menor por el número total de crédidos.
select G.nombre as nombre_grado, A.tipo as tipo_asignatura,sum(A.creditos) as total_creditos from grado G left join asignatura A on A.id_grado= G.id group by G.nombre, A.tipo order by total_creditos desc;
-- select * from asignatura;
-- select * from grado;

-- 8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
-- El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

select cs.anyo_inicio as año_inicio,count(am.id_alumno) as alumnos_matriculados from alumno_se_matricula_asignatura am inner join alumno a on a.id=am.id_alumno inner join curso_escolar cs on am.id_curso_escolar=cs.id group by 1; 

-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor. 
-- El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
-- El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
-- El resultado estará ordenado de mayor a menor por el número de asignaturas.
select p.id, p.nombre as nombre_profesor, p.apellido1, p.apellido2, count(a.id_profesor) as numero_asignaturas from profesor p left join asignatura a on p.id=a.id_profesor group by 1 order by numero_asignaturas desc;
-- select * from profesor;