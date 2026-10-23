# Laboratorio de Estadística aplicada a la producción agrícola

Material del Dr. Byron González.

Material de apoyo para explorar métodos de muestreo y diseños experimentales utilizados en investigación agronómica. El repositorio reúne scripts de R y hojas de cálculo con datos de ejemplos de producción y crecimiento vegetal. Cada práctica permite seguir el análisis desde la lectura de los datos hasta el análisis de varianza y, cuando corresponde, la comparación de medias.

## Contenido del repositorio

| Carpeta o archivo | Contenido y alcance |
|---|---|
| [`dca/`](dca/) | Diseño completamente al azar: análisis de la longitud de raíz para distintas concentraciones. |
| [`dba/`](dba/) | Diseño en bloques completos al azar: efecto de la densidad sobre el rendimiento de apio, considerando bloques. |
| [`dcl/`](dcl/) | Diseño de cuadrado latino: análisis de la altura de pino considerando tratamientos, pendiente y exposición solar. |
| [`factorial combinatorio/`](factorial%20combinatorio/) | Arreglo factorial de dos factores en bloques: espacio y edad del rizoma en la altura de bambú, incluida su interacción. |
| [`parcelas divididas/`](parcelas%20divididas/) | Diseño de parcelas divididas en bloques: edad y fecha de siembra sobre la altura de pinabete. Incluye análisis de varianza, comparaciones, transformación y una alternativa con modelos mixtos. |
| [`contrastes_ortogonales/`](contrastes_ortogonales/) | Contrastes planificados para comparar grupos de fertilizantes en la producción de arroz. |
| [`prueba múltiple de medias/`](prueba%20m%C3%BAltiple%20de%20medias/) | Comparación de medias de tratamientos de nitrógeno en arroz mediante Tukey. |
| [`muestreo simple aleatorio/`](muestreo%20simple%20aleatorio/) | Ejemplo de selección aleatoria de unidades, estimación del tamaño de muestra para una precisión establecida e intervalo de confianza para la altura de pino blanco. Es un ejercicio de muestreo, no un diseño experimental. |
| [`data/`](data/) | Libros de Excel usados por los scripts como fuentes de datos. |
| [`pdpinabete.pdf`](pdpinabete.pdf) | Documento complementario asociado al ejercicio de parcelas divididas en pinabete. |
| [`LICENSE`](LICENSE) | Información sobre la licencia del repositorio. |

## Guía de prácticas y archivos de datos

Los scripts leen los archivos de Excel desde la carpeta `data/`. La tabla indica las variables que aparecen en cada análisis; los nombres de columnas se conservan tal como están en el código.

| Práctica / script | Método o diseño | Datos | Variables analizadas en el script |
|---|---|---|---|
| [`dca/longitud de raiz.r`](dca/longitud%20de%20raiz.r) | Diseño completamente al azar (DCA); ANOVA y prueba de Tukey | [`data/lraiz.xlsx`](data/lraiz.xlsx) | `concentracion` (tratamiento), `longraiz` (respuesta) |
| [`dba/densidades en apio.r`](dba/densidades%20en%20apio.r) | Diseño en bloques completos al azar (DBC); ANOVA y comparaciones de medias | [`data/apiodens.xlsx`](data/apiodens.xlsx) | `densidad` (tratamiento), `bloque`, `rend` (respuesta) |
| [`dcl/altura_pino.r`](dcl/altura_pino.r) | Diseño de cuadrado latino; ANOVA y comparaciones para tratamientos, filas y columnas | [`data/alturapino.xlsx`](data/alturapino.xlsx) | `trat`, `pendiente`, `esolar` (factores), `altura` (respuesta) |
| [`factorial combinatorio/bambufact.r`](factorial%20combinatorio/bambufact.r) | Factorial de dos factores en bloques; ANOVA y comparación de combinaciones | [`data/alturabambu.xlsx`](data/alturabambu.xlsx) | `espacio`, `edad_rizoma`, `rep` (bloques), `altura` (respuesta) |
| [`parcelas divididas/pinabetepd.r`](parcelas%20divididas/pinabetepd.r) | Parcelas divididas en bloques; análisis con errores de parcela grande y pequeña, transformación de respuesta y modelo mixto | [`data/pdpinabete.xlsx`](data/pdpinabete.xlsx) | `edad`, `fecha_siembra`, `rep`, `altura`; también crea `alturat` como respuesta transformada |
| [`contrastes_ortogonales/contrastes_arroz.r`](contrastes_ortogonales/contrastes_arroz.r) | ANOVA con contrastes ortogonales planificados | [`data/arrozcontrast.xlsx`](data/arrozcontrast.xlsx) | `trat` (fertilizante), `prod_arroz` (respuesta); `rep` se convierte a factor |
| [`prueba múltiple de medias/tukey_arroz.r`](prueba%20m%C3%BAltiple%20de%20medias/tukey_arroz.r) | ANOVA y comparación múltiple de medias de Tukey | [`data/arroznitrog.xlsx`](data/arroznitrog.xlsx) | `trat` (tratamiento), `prod_arroz` (respuesta) |
| [`muestreo simple aleatorio/tamaño de muestra_msa.r`](muestreo%20simple%20aleatorio/tama%C3%B1o%20de%20muestra_msa.r) | Muestreo simple aleatorio, cálculo de tamaño de muestra e intervalo de confianza | [`data/alturapblanco.xlsx`](data/alturapblanco.xlsx) | `alturapblanco` (variable de interés) |

## Cómo ejecutar las prácticas

1. Instala R y abre el proyecto en RStudio u otro entorno compatible.
2. Establece como directorio de trabajo la carpeta raíz del repositorio, donde está este README. Los scripts usan rutas relativas como `data/lraiz.xlsx`.
3. Abre y ejecuta el script de la práctica que quieras estudiar. Revisa sus comentarios y adapta el análisis únicamente si comprendes cómo afecta al diseño y a la interpretación.

Los scripts usan paquetes de R para leer hojas de cálculo y realizar análisis estadísticos. Varios comprueban si los paquetes requeridos están instalados y, si no, intentan instalarlos desde CRAN; para ello se necesita conexión a Internet y permiso para instalar paquetes. Los resultados se muestran en la sesión de R; los scripts no definen una salida común que se guarde automáticamente en archivos.

## Alcance y uso didáctico

El repositorio ofrece ejemplos para estudiar la estructura de tratamientos, factores, bloques y errores experimentales, además de técnicas de comparación de medias y contrastes. El ejercicio de muestreo complementa los diseños experimentales, pero aborda la selección de observaciones y la estimación, no la asignación de tratamientos.

Los datos y análisis son materiales de práctica: antes de aplicar los métodos a una investigación, verifica los supuestos del modelo, la estructura real del experimento, las unidades de medida y la interpretación agronómica de las variables. Los nombres de las carpetas identifican los temas; consulta cada script para conocer el análisis implementado.

> Nota: `data/~$apiodens.xlsx` tiene el prefijo que Excel utiliza para archivos temporales de bloqueo. No es uno de los conjuntos de datos de la práctica y no debe usarse como entrada.
