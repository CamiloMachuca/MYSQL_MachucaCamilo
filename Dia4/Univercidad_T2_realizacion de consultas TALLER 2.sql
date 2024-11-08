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





-- Taller 2 

-- 1. Devuelve todos los datos del alumno más joven.
select * from alumno where year(fecha_nacimiento) order by fecha_nacimiento asc limit 1;

-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.
select * from profesor p inner join departamento d where p.id_departamento is null ;
select * from departamento;
select * from profesor;

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.
select * from departamento inner join profesor p where p.id_departamento is null;
select * from departamento;

-- 4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
select distinct p.nombre as nombre_profesor, d.nombre as Departamento, a.id_profesor as asignaturas_asignadas from profesor p inner join departamento d on p.id_departamento= d.id inner join asignatura a where a.id_profesor is null;

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select a.nombre, id_profesor from asignatura a where a.id_profesor is null;

-- 6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
select distinct d.nombre as Departamento, a.id_profesor as asignaturas_asignadas from profesor p 
inner join departamento d on p.id_departamento= d.id 
inner join asignatura a on p.id=a.id_profesor;

-- 7. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

select d.nombre as Departamento, a.id_profesor as asignaturas_asignadas from profesor p inner join departamento d on p.id_departamento= d.id inner join asignatura a on a.id_profesor =p.id inner join grado g where a.nombre='Grado en Ingeniería Informática (Plan 2015)';
select * from grado;

-- 8. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
-- El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

select d.nombre as departamento,p.apellido1,p.apellido2,p.nombre  from profesor p left join departamento d on d.id=p.id_departamento order by d.nombre asc;


-- 9.Devuelve un listado con los profesores que no están asociados a un departamento.

select * from profesor where id_departamento is null;




