# clase2_TTT
## Herramientas de productividad 

En GitHub: menú principal  -> signo + -> new repository -> nombrarlo, hacerlo público y crear read me file -> crear -> copiar URL
En RStudio: file / esquina sup izq -> crear new project -> versión control -> git -> pegar URL -> poner nombre -> crear.
Debe aparecer en RStudio en files (inferior der) .gitgnore y debe estar la pestaña Git en sup der.

En GitHub: botón commit changes -> upload files -> arrastrarlos o cargarlos.

Contiene los archivos 


# CODIGOS UNIX
## $ es el indicador de que estás en Unix.
## puedes cambiar configuración en tools > global options > terminal > New terminal opens with > Git Bash

## pwd te da la ubicación actual
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi uni
$ pwd 
/g/Mi unidad/Drive Academico/2025/Train the train

## mkdir crea nuevo directorio (carpeta)
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi uniiners/clase2_TTT/Unix (main)
$ mkdir New

## ls enlista el contenido del directorio
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi uniiners/clase2_TTT/Unix (main)
$ ls
ciencia.txt  datos.csv  New/

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi uniiners/clase2_TTT/Unix (main)
$ mkdir New
mkdir: cannot create directory ‘New’: File exists

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi uniiners/clase2_TTT/Unix (main)
$ mkdir Repositorios

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi uniiners/clase2_TTT/Unix (main)
$ ls
ciencia.txt  datos.csv  New/  Repositorios/

## touch genera nuevos archivos en blanco
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unirain the trainers/clase2_TTT/Unix (main)
$ touch codes.txt baseD.csv

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unirain the trainers/clase2_TTT/Unix (main)
$ ls
baseD.csv  ciencia.txt  codes.txt  datos.csv  Newsitorios/

## rm remove -> elimina files
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unive Academico/2025/Train the trainers/clase2_TTT/Uin)
$ rm New
rm: cannot remove 'New': Is a directory

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unii unidad/Drive Academico/2025/Train the trainers/clase2_TTT/Unix (main)
$ ls                                        
baseD.csv  ciencia.txt  codes.txt  datos.csv  New/  Repositorios/                  

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025/Train the trainers/clase2_TTT/Unix (main)
$ rm ciencia.txt

## con ls compruebas que se haya borrado el archivo
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025/Train the trainers/clase2_TTT/Unix (main)
$ ls
baseD.csv  codes.txt  datos.csv  New/  Repositoriners/clase2_TTT/Unix (main)
$ rm ciencia.txt

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/025/Train the trainers/clase2_TTT/Unix (main)
$ ls
baseD.csv  codes.txt  datos.csv  New/  Repositorios/

## cp = copy -> cp + file name + new location
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/025/Train the trainers/clase2_TTT/Unix (main)
$ cp codes.txt /g/Mi\ unidad/Drive\ Academico/2025/Train\ the\ traines/clase2_TTT/Unix/
cp: 'codes.txt' and '/g/Mi unidad/Drive Academico/2025/Train the traiers/clase2_TTT/Unix/codes.txt' are the same file

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025/Train the trainers/clase2_TTT/Unix (main)
$ pwd
/g/Mi unidad/Drive Academico/2025/Train the trainers/clase2_TTT/Unix

## cd = change directory -> cambia la ubicación a la indicada o te sube un escalón en la jerarquía
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025/Train the trainers/clase2_TTT/Unix (main)
$ cd

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ pwd
/c/Users/NeuroPsicologia

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ ls
'3D Objects'/
 AppData/
'Application Data'/
'Configuración local'@
 Contacts/
 Cookies@
'Datos de programa'@
 Desktop/
 Documents/
 Downloads/
 eeg_options.m
'Entorno de red'@
 Favorites/
 Impresoras@
 IntelGraphicsProfiles/
 Links/
'Menú Inicio'@
'Mis documentos'@
 Music/
 NTUSER.DAT
 ntuser.dat.LOG1
 ntuser.dat.LOG2
 NTUSER.DAT{53b39e88-18c4-11ea-a811-000d3aa4692b}.TM.blf
 NTUSER.DAT{53b39e88-18c4-11ea-a811-000d3aa4692b}.TMContainer00000000000000000001.regtrans-ms
 NTUSER.DAT{53b39e88-18c4-11ea-a811-000d3aa4692b}.TMContainer00000000000000000002.regtrans-ms
 ntuser.ini
 OneDrive/
 Pictures/
 Plantillas@
 PruebaR/
 Reciente@
'Saved Games'/
 Searches/
 SendTo@
 Videos/

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ cd

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ cp codes.txt /g/Mi\ unidad/Drive\ Academico/2025/Train\ the\ trainers/clase2_TTT/Unix/
cp: cannot stat 'codes.txt': No such file or directory

## no funcionó porque no tiene la ruta completa
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ cd Unix
bash: cd: Unix: No such file or directory

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ pwd
/c/Users/NeuroPsicologia
## no funcionó porque tiene / al final
NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ cd /g/Mi unidad/Drive Academico/2025/
bash: cd: too many arguments

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ pwd
/c/Users/NeuroPsicologia

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 ~
$ cd /g/Mi\ unidad/Drive\ Academico/2025/Train\ the\ trainers/clase2_TTT/

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025/Train the trainers/clase2_TTT (main)
$ ls
clase2_TTT.Rproj  README.md  Unix/

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025/Train the trainers/clase2_TTT (main)
$ cd /g/Mi\ unidad/Drive\ Academico/2025

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025
$ ls
'AAG_Carta cumplimiento.docx'
 AAG_Coursera.pdf
'AbundisGtz_Formato reporte académico 2024.docx'
 acuerdoproinnova.pdf
'Almitra RE'/
'Avance lectoría 2025 LUIS.pdf'
'Avances 2025 VANESSA REYES.pdf'
 Chapala/
'CICS_Capítulo 12.docx'
'CONDUSEF _ Diplomado en Educación Financiera - RECUPERA ACCESO.pdf'
'Consentimiento informado_Bio-Well.docx'
 Criterios_AVA_25A.pdf
 cronometra-te.xlsx
 Diplomado_CONDUCEF/
 Documento1.pdf
 EFEES/
'Evidencias biorretrolaimentación.docx'
'Evidencias biorretrolaimentación.pdf'
 Justificantes.xlsx
'Modelos Invitación Alicia Abundis Gutiérrez.pdf'
 Personal/
'Ponente_Coloquio CUSur.pdf'
'PROGRAMA SOLICITUD DE PRATICANTES  DE PSICOLOGÍA (6).docx'
 PROINNIVA/
'SERVICIO SOCIAL_Propuesta de programa 25B_AliciaAbundis.docx'
'SERVICIO SOCIAL_Propuesta de programa 25B_AliciaAbundis_Tecnologias.docx'
'Train the trainers'/
'Versión Final EFEES 4.1.2 060225.docx'
'Versión Final EFEES_RevAlicia.docx'

NeuroPsicologia@DESKTOP-G754R9Q MINGW64 /g/Mi unidad/Drive Academico/2025
$
## con flecha arriba te va dando los comandos usados anteriormente en orden
## tab va completando el nombre de cada escalon de la ruta con diagonal invertida indicando espacio

## clear limpia la terminal
