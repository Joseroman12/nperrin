---
pre-title: Guía
title: Introducción a JavaScript
url: /es/tech/guia-introduccion-a-js
description: Guía introductoria teórica y práctica de JavaScript
date: 2019/06/18 00:00:00
show-toc: true
toc-title: Tabla de contenidos
includes-code: true
---

## Introducción

En esta guía van a encontrar explicaciones y ejercicios de los conceptos que considero básicos de programación en JavaScript.

Hay otra guía un poco más amena que se llama "[JavaScript para gatos](https://jsparagatos.com/)". Recomiendo que lean esa guía y en todo caso si les quedó alguna consulta, guiarse por la tabla de contenidos de esta guía. O si confían en mi estilo, leerla directamente.

También recomiendo la guía de MDN "[JavaScript](https://developer.mozilla.org/es/docs/Learn/JavaScript)".

**Hago los ejercicios?** Aunque pueden saltearse un ejercicio, no lo recomiendo. Quizás parezca trivial y piensen que saben cómo resolverlo, de ser así, más razón para hacerlos. Los ejercicios no van a ser muy largos y los va a ayudar a consolidar lo que acaban de leer.

## Motivación

Cada uno tiene sus objetivos, pero les puedo decir que

- JavaScript es uno de los lenguajes de programación más populares que existen... en realidad creo que es el más popular que existe.
- Suele ser solicitado en puestos de trabajo como programador (trabajo que suele pagarse bien).
- Pueden empezar a programar solo con un navegador web.
- Es fácil y divertido de aprender al tener feedback rápido en el desarrollo.
- Tiene [comunidades geniales](#comunidades-geniales) siempre dispuestas a ayudar, en especial a los que empiezan.
- No solo se usa en la web, se usa para aplicaciones, robots, servidores, ...

Ya sea que quieren conseguir un trabajo o crear algo por ustedes, es una muy buena opción para empezar.

## Requisitos previos

- Un navegador web instalado, recomiendo [Brave](https://brave.com/) o [Google Chrome](https://www.google.com/chrome/).

Nada más 😁

## Tener en cuenta

- Al ejecutar todo en un navegador web, no vamos a entrar en problemas con la compu. A lo sumo si nos quedamos trabados podemos recargar la página y volver a escribir lo que habíamos puesto.
- Los errores de sintaxis son muy frecuentes al empezar. Recomiendo llevar nota de la sintaxis al principio (aunque hay un [cheat sheet](#cheat-sheet) también), para consultar rápido al escribir una instrucción de código.
- No copien y peguen, escriban las instrucciones siempre así se acostumbran a la sintaxis y ven mejor lo que ponen.
- No le tengas miedo a los errores. Los errores nos dicen (en inglés) qué hicimos mal. Es parte del proceso. Generalmente son buenos indicando exactamente cuál fue nuestro problema. Más adelante vamos a ver alguno de los errores más comunes que nos podemos encontrar.
- Probá todo lo que se te ocurra en el snippet o consola de desarrollador, no te quedes con dudas. Yo espero que si pongo un pedazo de código, lo pruebes y veas qué pasa.
- Si hay algo que no te quedó claro, googlea. Si no encontraste respuesta después de buscar, podés contactarme y feliz de responderte.
- Pueden comentar su código agregando una línea así `// comentario, esto no se va a ejecutar`.

## Qué es JavaScript

Es un **lenguaje de programación**, con el cual vamos a **definir las instrucciones** a seguir para **lo que estemos programando**.

Mucha gente que aprende JavaScript lo hace para desarrollo web, o sea, darle comandos a una página web para que haga algo. Pero tengan en cuenta que también se puede usar para darle comandos a una computadora, celular, robot, y más.

Al estar en un entorno web, cuando escribamos código le vamos a decir a nuestra página web qué pasos debe hacer.

Es importante saber también que debemos respectar por completo la sintaxis, de lo contrario nuestro programa no funcionará (o funcionará mal).

## Empezando

Les voy a introducir su entorno de desarrollo. Para abrirlo sigan estos pasos: [Video demostración abriendo snippets](/video/tech/guia-introduccion-a-js/demo-snippet.mp4).

Si quieren saber más acerca de los "snippets" pueden ver esta [entrada sobre snippets](https://developers.google.com/web/tools/chrome-devtools/javascript/snippets) que hizo Google.

Cada línea que escriban en ese editor va a ser una "sentencia" o instrucción para el navegador web, el cual va a leer esa instrucción y va a hacer lo que le digan a través de esa instrucción.

Por ejemplo podemos escribir

```javascript
alert("Hola mundo!");
```

y cuando lo ejecutemos apretando "Run" vamos a ver que aparece una ventana molesta con nuestro mensaje.

Si nos molesta mucho esa ventana podemos escribir

```javascript
console.log("Hola mundo!");
```

y el mensaje va a aparecer en la consola, y no una ventana molesta.

Podemos escribir varias de estas sentencias, una debajo de la otra.

```javascript
console.log("Hola");

console.log("Cómo estás?");

console.log("Que bien!");
```

### Ejercicio

Para entender lo molesto que puede llegar a ser un `alert`, escribir 10 mensajes con alert, cada mensaje que indique el número de mensaje que es.

Luego hacer lo mismo pero con `console.log`.

## Strings

Lo que escribimos antes era un string: "Hola Mundo".

A tener en cuenta con los strings, (o textos), deben empezar **y** terminar con comillas simples `'` o dobles `"`.

Si queremos juntar 2 strings los podemos hacer así

```javascript
console.log("Hola, me llamo " + "Norman");
```

### Ejercicio

Imprimir 10 mensajes por consola o ventana de alerta (alert), haciendo 1 concatenación más por cada nuevo mensaje que hagan.

Por ejemplo si hago un nuevo mensaje, teniendo en cuenta el anterior mensaje que escribí, podría ser

```javascript
console.log("Hola, me llamo " + "Norman " + " y escribí una guía.");
```

## Valores y variables

Primer concepto clave.

> Una variable es un lugar donde puedo guardar un valor.

Entonces, qué es un valor? y para qué puedo querer guardar uno ahí?

> Los valores son datos que puede manejar un programa, estos pueden ser de distinto tipo.

En JavaScript los tipos de datos que puede manejar son strings, números, funciones, listas, ... y sigue, pero hasta acá por ahora.

### Declaración

Y cómo guardo un valor en una variable?

```javascript
var nombre = "Norman";
var edad = 24;
```

Cuando el tipo es numérico, no hace falta ponerlo entre comillas el valor, sino que ya entiende que es un número si empieza con un dígito.

### Partes

Vemos que esta sentencia tiene 4 partes.

- `var`: palabra reservada en JavaScript para declarar una variable.
- `nombre`: nombre de la variable, con la que luego voy a poder identificarla para obtener su valor. No pueden poner caracteres especiales, espacios o números al principio para definir la variable.
- `=`: la asignación, esto delimita el lado izquierdo y derecho de la declaración. En el lado izquierdo siempre voy a tener el nombre de la variable, identificar, del lado derecho siempre voy a tener el valor.
- `"Norman"`: valor que le asigno a la variable llamada `nombre`. Nos damos cuenta que es un valor al estar rodeado de comillas dobles.

Si al definir una variable usamos la asignación podemos acordarnos como regla que

> Del izquierdo de la asignación va un nombre identificador para la variable, del lado derecho de la asignación, un valor.

### Uso

Y cómo uso esta variable luego?

```javascript
var nombre = "Norman";

console.log(nombre);
console.log("Hola, " + nombre);
```

Obtenemos el valor de la variable por el nombre que le dimos.

Cuando se va a ejecutar una sentencia con una referencia a una variable podemos pensar en que se reemplaza la variable por el valor que tiene. Entonces una vez que encuentra el valor las sentencias quedan así

```javascript
var nombre = "Norman";

console.log("Norman");
console.log("Hola, " + "Norman");
```

### Reasignación

Y es importante saber que `nombre` puede tener otros valores que `"Norman"`, como `"Juan"`, `"Chocolate"`, ... cualquier cosa que se nos ocurra. Pero nosotros siempre vamos a obtener su valor llamando a la variable por su nombre `nombre`.

Luego podemos ponerle otro valor si queremos.

```javascript
var nombre = "Pepe";

console.log("Hola, " + nombre);

nombre = "Mr. Freeman";

console.log("Hola, " + nombre);

var nombre = "tortuga";

console.log("Hola, " + nombre);
```

Aunque el valor cambia, las sentencias son iguales.

### Caso real

Hay veces que queremos guardar valores para usarlos después. Por ejemplo un programa que pregunta por tu nombre 1 vez, guarda tu nombre en una variable y luego siempre que te habla hace referencia a esa variable para saber cómo llamarte.

Las explicaciones quedan abstractas, vamos a hacer ese programa.

```javascript
var nombre = prompt("Cuál es tu nombre?");

alert("Hola, " + nombre);
```

Hay código desconocido.

Qué es ese `prompt`?

Si lo ejecutás te vas a dar cuenta.

Es como un `alert` pero te deja ponerle un valor, y lo que devuelve puede ser asignado a una variable.

Algo a tener en cuenta con `prompt` es que siempre te devuelve un valor tipo `string`. Por lo tanto si preguntamos por la edad, luego no podemos usar ese valor que retorna el `prompt` como si fuese un número. Lo tenemos que convertir de `string` a `number`. Para eso podemos usar la función `Number` de la siguiente manera

```javascript
var edad_texto = prompt("Cuál es tu edad?");
var edad_numero = Number(edad);
var edad_cumpleanios = edad_number + 1;

alert("Cuando cumplas años vas a tener " + edad_cumpleanios);
```

### Errores comunes

Poner del lado izquierdo un valor.

```javascript
// const 1 = 1; //> solo se pone un nombre identificador, no un valor.
```

Esto es un valor, por lo tanto va a darnos un error.

```javascript
// const "uno" = 1; //> el nombre se pone sin comillas, ya que no es un valor el lado izquierdo.
```

Poner espacios en el nombre.

```javascript
// const una variable = 1; //> el nombre del identificador va sin espacios y caracteres especiales.
const una_variable = 1; //> se suele poner notación "camel case" o "snake_case" (como en este caso) cuando se tiene más de 1 palabra.
```

Usar un nombre reservado como nombre del identificador.

```javascript
// const const = 1; //> si pudiésemos, luego no habría forma de saber a qué nos referimos cuando ponemos `const`, si estamos declarando una variable o
```

### Ejercicio

1. Definir 5 variables que sean de tipo string y mostrarlas por consola.
1. Definir 5 variables que sean de tipo numéricas y mostrarlas por consola.
1. Definir 1 variable y mostrarla por consola, luego reasignarle otro valor del mismo tipo y volverla a mostrar por consola, 5 veces.
1. Pedir el nombre y edad a a través de `prompt` y luego mostrar esos valores por consola. Anteponiendo al nombre el texto `"Buen día, "` cuando se moestra por consola, y el texto `"Tu edad es "` cuando quieran mostrar la edad por consola.

## Operadores

Una de las razones por las cuales hay tipos de datos es para que estos datos según su tipo respondan a diferentes operaciones.

Por ejemplo, si yo hago

```javascript
console.log(1 + 1);
```

Esto me va a mostrar `2` por la consola. Ya que entiende que son numéricos y por lo tanto hace la suma.

En cambio si tengo algo como

```javascript
console.log("1" + "1");
```

Me va a retornar `"11"` por consola. No está mal, ya que un valor entre comillas es un string, por lo tanto el `+` lo entiende como concatenación, no como suma.

Entonces podemos decir que un tipo de dato está asociado a distintos operadores.

Como la suma podemos hacer una resta `-`, multiplicación `*`, división `/`, resto `%`.

### Orden

En matemática se dice que el orden de la suma no importa, en nuestro caso sí.

Cuál piensan que va a ser el mensaje si hacemos algo como

```javascript
console.log("Tres más dos es: " + 3 + 2);
```

JavaScript nos va a mostrar por consola `"Tres más dos es: 32"`, lo cuál sería correcto si nos referimos a strings, porque estaría haciendo una concatenación, pero nosotros queremos que lo sume y después muestre el resultado como string.

Lo aconsejable para no entrar en problemas es calcular las partes por separado y después mostrarlo por consola. Por ejemplo

```javascript
var resultado = 3 + 2;

console.log("Tres más dos es: " + resultado);
```

De esta forma se calcula primero la cuenta numérica y luego se hace la concatenación.

Entonces si tenemos la expresión anterior: `"Tres más dos es: " + 3 + 2` se va a evaluar de la siguiente forma:

1. `"Tres más dos es: " + 3 //> "Tres más dos es: 3"`

Tiene un string y un número con la suma, JavaScript permite esta operación, pero tiene que transformar el número a string para poder hacer esta operación. Así que transforma el 3 a string y luego los concatena.

2. `"Tres más dos es: 3" + 2 //> "Tres más dos es: 32"`

Volvió a repetir lo de arriba, pero ahora en vez de transformar un 3 transformó un 2 a string.

### Paréntesis

Por suerte podemos agrupar y priorizar ciertas operaciones, igual que en matemática, con los paréntesis.

```javascript
console.log("Tres más dos es: " + (3 + 2));
```

Y ahora el paréntesis se va a resolver antes y luego su resultado (5) va a ser concatenado igual que antes.

### Ejercicio

1. Mostrar por consola la suma, multiplicación, división, resto de 2 números.
1. Mostrar la concatenación de 2 strings.

## Funciones

> Una función es un valor, que ejecutado, realiza una serie de instrucciones que le hayamos definido.

Así que por un lado agrupa instrucciones y las ejecuta en orden.

Por otro hay una diferencia marcada entre la **definición** de una función, y su posterior **ejecución**.

Veamos un ejemplo

```javascript
// definición
function saludar() {
  console.log("Voy a saludar al usuario");
  alert("Hola, Norman");
}

// ejecución
saludar();
```

Prueben de ejecutar ese pedazo de código a ver que pasa.

Después de ejecutar el código, pueden probar de ejecutar la función que definieron desde la consola, volviendo a escribir `saludar()`.

Una función puede ser llamada las veces que quieran luego de haber sido definida.

```javascript
saludar();
saludar();
saludar();
```

### Parámetros

Está genial con que podamos reutilizar código, poniéndole un nombre más entendible al código que queremos ejecutar, pero si quiero que ese "Norman" no esté, y en cambio esa variable tenga como valor lo que me ingresan?

Podríamos usar parámetros

```javascript
function saludar(parametro_nombre) {
  console.log("Voy a saludar al usuario llamado: " + parametro_nombre);
  alert("Hola, " + parametro_nombre);
}

var nombre = prompt("Cuál es tu nombre?");
saludar(nombre);
```

Ahora la función llamada `saludar` va a obtener un nombre como parámetro de entrada, para luego usarlo dentro de la función.

Es importante marcar que cuando **defino** la función le indico un nombre al parámetro, como una variable. Pero cuando la **ejecuto** le paso un valor a la función.

Si quiero pasar más de 1 parámetro

```javascript
function saludar(saludo, nombre) {
  alert(saludo + ", " + nombre);
}

saludar("Buen día", "Norman");
```

Cada parámetro está separado por una coma, tanto cuando se define como cuando se ejecuta una función.

### Retorno

Una característica importante de las funciones es que pueden retornar valores.

Por ejemplo la función concatenar.

```javascript
function concatenar(texto1, texto2) {
  return texto1 + texto2;
}

var concatenacion = concatenar(texto1, texto2);

console.log(concatenacion);
```

Quizás ahora se estén dando cuenta que ya veníamos usando funciones.

`alert` y `console.log` son funciones, a los cuales le pasamos un string como valor cuando las ejecutamos.

Pero estas funciones no devuelven nada, sino que **hacen** algo, que en estos casos es mostrar una ventana de alerta o un texto en la consola.

Hay otras funciones que devuelven valores, como `prompt`, que además de **hacer**, mostrar un mensaje al usuario, **retorna** un valor.

Importante a tener en cuenta, cuando una función retorna, no ejecuta más código. O sea que si tenía más instrucciones después del `return`, las ignora. Esto hace que la función solamente pueda retornar 1 valor.

### Partes

- `function`: palabra reservada para declarar una función.
- `saludar`: nombre de la función.
- `(parametro1, parametro2)`: parámetros de la función. No son valores, son nombres que les damos.
- `{ /* ...bloque de código... */ }`: instrucciones que queremos que ejecute nuestra función.
- `return`: dentro del bloque de código podemos retornar un valor para usarlo después.

### Ejercicio

Mitad del ejercicio es definir la función, la otra mitad es ejecutarla y mostrar el resultado por consola de ser necesario.

1. Definir una función que imprima un mensaje por consola.
1. Definir una función que imprima por consola el texto que reciba por parámetro.
1. Definir la función llamada `suma`, que reciba 2 números y retorne la suma de los mismos.
1. Definir la función multiplicación, división y resta, que reciba 2 números y haga lo que tenga que hacer, devolviendo el resultado.
1. Con la función anterior, ejecutar la suma de 2 números y usar ese retorno para sumarlo con otro número.
1. Definir la función `decir_lo_obvio`, que reciba un nombre y apellido como parámetros separados, imprima por consola "Te llamas Nombre, y tu apellido es Apellido" (haciendo el reemplazo que se imaginan), y retorne el mismo valor que imprimió por consola.

## JavaScript en nuestro HTML

Ahora que estamos por la mitad, tomemos un respiro y veamos algo sencillo, un poco diferente de lo que veníamos viendo.

Quizás les queda abstracto ejecutar código JavaScript desde el navegador, así que vamos a disparar funciones desde un botón en nuestro HTML.

Les digo cómo...

### Aclaraciones

Antes algunas aclaraciones

- Se suele usar el nombre "index" como archivo principal de la carpeta en donde esté.
- Usen nombres descriptivos.
- No pongan caracteres especiales, espacios ni mayúsculas en los nombres de archivos. Reemplacen los espacios por `_` o `-` y dejen todo en minúscula.

### Ahora sí

1. Creen una carpeta, en algún lado accesible, como el escritorio.
2. Creen un archivo `index.html` dentro de esa carpeta, con este contenido.

```html
<html>
  <head></head>

  <body>
    <button>Botón</button>
  </body>
</html>
```

Genial!

Queremos que botón dispare una función cuando se le haga click, para eso deberíamos usar el evento de botón `onclick` y aclararle qué función disparar.

```html
<button onclick="hacer_algo_re_loco()">Botón</button>
```

Si queremos ejecutar esto nos va a salir un error 😟

El problema es que nunca definimos esa función.

Para eso vamos a crear un archivo JavaScript llamado `script.js`, aunque el nombre lo pueden elegir ustedes, siempre y cuando tenga la extensión `.js` al final.

En este archivo vamos a seguir escribiendo JavaScript como veníamos haciendo antes, entonces si tengo que definir una función, en el archivo voy a escribir algo como

```javascript
function hacer_algo_re_loco() {
  alert("Ho-La");
}
```

Pero eso no es suficiente. Si volvemos a apretar el botón vamos a seguir teniendo un error de función no definida... El problema está en que nunca vinculamos esos archivos. La forma de vincularlos es incluyendo al script desde el HTML, de la siguiente forma

```html
<body>
  <!-- tags HTML...  -->

  <script src="./script.js"></script>
</body>
```

La inclusión del script la vamos a escribir abajo de todo en el body, antes del cierre de la etiqueta. Se puede hacer de otras formas, pero por ahora vamos a usar esta.

Entonces ahora si apretamos ekl botón, el botón hace lo que tiene que hacer!

Felicitaciones, ya saben cómo ejecutar código JavaScript desde una página web.

No es mucho, pero ya saben cómo vincularlos. Más adelante vamos a ver casos más divertidos obteniendo información de formularios, trayendo información de afuera, animando elementos, ... Por ahora espero que les haya sido útil para saber cómo se vinculan.

## Condicionales

Los condicionales son una parte fundamental de la programación.

Y para introducirles este concepto voy a explicarles un tipo de valor que evité hasta ahora para que lo podamos ver en conjunto con los condicionales

### Boolean

El booleano es un tipo de dato, como un número, texto, o función pero que solo puede ser verdadero `true` o falso `false`.

He aquí la sintaxis

```javascript
var es_mayor_de_edad = true;
var se_llama_norman = true;
var es_pelado = false; // por ahora (2019)

console.log(es_mayor_de_edad, se_llama_norman, es_pelado);
```

Se usa para "decidir" caminos en la ejecución de nuestro programa.

Generalmente se obtienen como resultado de una operación, evaluando cierta condición, como si un número es más grande a otro, si un texto es igual a otro texto, and so on. Por lo tanto debería introducirles unos nuevos operadores.

### Operadores de booleanos

Estos operadores son como la suma o resta, pero en vez de devolver un número, devuelven un `true` o `false`.

He aquí la sintaxis

```javascript
var nombre_del_profesor = "Norman";
var nombre_ingresado = prompt("Cuál es tu nombre?");

var es_profesor = nombre_ingresado === nombre_del_profesor;
console.log(es_profesor);
```

Empezamos a entender cómo nos puede ayudar esto en nuestros programas, y cómo esto puede decidir distintos "caminos".

En este ejemplo con `es_profesor` podría mostrar cierta pantalla si es un profesor y otra diferente si no lo es. Pero no les dije cómo.

### Ahora sí

```javascript
var nombre = prompt("Cuál es tu nombre?");
var es_profesor = nombre === "Norman";

if (es_profesor) {
  alert("Bienvenido querido profesor! 😁");
} else {
  alert("Hola");
}
```

Si saben inglés ya deben haberse imaginado de cómo funciona esto. La traducción de esta sentencia sería

> Si pasa esto, hace esto, sino, hace esto otro.

La idea es que si es `true` lo que está entre paréntesis después del `if`, se ejecuta el primer bloque de código. Si es `false` se ejecuta el bloque de código después del `else`.

En el bloque de código pueden ir el número de sentencias que queramos, como en las funciones.

Otra cosa a tener en cuenta es que no hace falta que haya un `else`. Por ejemplo, supongamos que tenemos un sistema que toma los nombres de la gente que llega a clase, se saluda a todos los que llegan, pero si es un profesor se le da una manzana.

```javascript
var nombre_del_profesor = "Norman";

var nombre_del_ingresante = prompt("Hola! Cómo te llamás?");

if (nombre_del_ingresante === nombre_del_profesor) {
  alert("Tomá una manzana");
}

alert("Bienvenido, " + nombre_del_ingresante);
```

No hizo falta poner un else, porque en el caso en el que no era profesor, no había un comportamiento específico. Luego el último `alert` se va a ejecutar tanto para el profesor, como para el que no es profesor.

Sigamos con el ejemplo anterior. Pero ahora, si el ingresante se llama "Nicolás", vamos a hacer un `alert` diciéndole que tiene un ananá de regalo. Manteniendo las condicones anteriores iguales. Entonces queda

- Te llamás Nicolás -> `alert("Tomá un ananá")`
- Te llamás Norman -> `alert("Tomá una manzana")`
- Para todos -> `alert("Bienvenido, " + nombre_del_ingresante)`

Ok? Entonces quedaría así

```javascript
var nombre = prompt("Hola! Cómo te llamás?");

if (nombre === "Nicolás") {
  alert("Tomá un ananá");
}

if (nombre === "Norman") {
  alert("Tomá una manzana");
}

alert("Bienvenido, " + nombre);
```

Genial!

Estaría bueno que los sistemas sean así de simples, aunque por lo general son más complejos, así que vamos a ponerle un poco de complejidad.

### Condiciones añadidas

Seguimos con lo anterior, ahora vamos a decir que se acaban de unir 2 mundos que antes eran paralelos, en uno se habla normal, en otro se dicen las palabras al revés. El programa ahora debería ser algo así

```javascript
var respuesta_mundo_normal = prompt("Estamos en el mundo normal?");
var es_mundo_normal = respuesta_mundo_normal === "Sí";

if (es_mundo_normal) {
  var nombre = prompt("Hola! Cómo te llamás?");

  if (nombre === "Nicolás") {
    alert("Tomá un ananá");
  }

  if (nombre === "Norman") {
    alert("Tomá una manzana");
  }

  alert("Bienvenido, " + nombre);
} else {
  var nombre = prompt("Aloh! Omoc et samall?");

  if (nombre === "Salocin") {
    alert("Amot nu ánana");
  }

  if (nombre === "Namron") {
    alert("Amot anu anaznam");
  }

  alert("Odinevneib, " + nombre);
}
```

Si quieren invertir un string pueden hacer `"norman".split("").reverse().join("")`, pero más de eso después.

Nada nos dice que no podemos tener un `if` adentro de otro. En nuestro bloque de código podemos poner cualquier línea de código que se nos ocurra.

### Operadores lógicos

Último tema de condicionales, sus operadores, y no me refiero a los de comparación que usamos recién, como la igualdad, sino otros que operan entre booleanos.

Los solemos usar cuando tenemos condiciones más complejas que queremos evaluar.

Contamos con el operador

- `!`: negación.
- `&&`: el "y" lógico.
- `||`: el "o" lógico.

El primer operador es fácil, el de negación simplemente transforma un `true` a `false` y luego al revez, un `false` a `true`. Se escribe así

```javascript
var fui_al_mundial = false;
var soy_argentino = true;

console.log(!fui_al_mundial); //> true
console.log(!soy_argentino); //> false
console.log(!!soy_argentino); //> true
```

Después seguimos con los otros operadores. Estos otros operadores se usan como el `+`, `*`, ... o sea con 2 valores de cada lado. Estos valores deben ser de tipo booleano. Y al usarlos nos devuelve otro booleano.

Su sintaxis es la siguiente

```javascript
var es_profesor = true;
var es_pelado = false;

// es profesor y es pelado: las 2 deben cumplirse para que sea true.
console.log(es_profesor && es_pelado); //> false

// es profesor o es pelado: alguna de las 2 debe cumplirse para que sea true.
console.log(es_profesor || es_pelado); //> true

es_pelado = false;

// ya con que alguno de los valores sea falso cuando se opera con &&, el resultado va a ser falso.
console.log(es_profesor && es_pelado); //> false

// si es todo falso, va a ser falso sin importar el operador que se aplique.
console.log(es_profesor || es_pelado); //> false
```

Todas las posibilidades de resultados están en esta tabla, para que lo vean mejor

| p       | q       | `&&` (y) | `||` (o) |
| ------- | ------- | -------- | -------- |
| `true`  | `true`  | `true`   | `true`   |
| `true`  | `false` | `false`  | `true`   |
| `false` | `true`  | `false`  | `true`   |
| `false` | `false` | `false`  | `false`  |

Ahora que conocemos estos operadores, vamos a usarlo con el anterior ejemplo.

```javascript
var respuesta_mundo_normal = prompt("Estamos en el mundo normal?");
var es_mundo_normal = respuesta_mundo_normal === "Sí";

if (es_mundo_normal) {
  prompt("Hola! Cómo te llamás?");
} else {
  var nombre = prompt("Aloh! Omoc et samall?");
}

if (es_mundo_normal && nombre === "Nicolás") {
  alert("Tomá un ananá");
}

if (es_mundo_normal && nombre === "Norman") {
  alert("Tomá una manzana");
}

if (!es_mundo_normal && nombre === "Salocin") {
  alert("Amot nu ánana");
}

if (!es_mundo_normal && nombre === "Namron") {
  alert("Amot anu anaznam");
}

alert("Odinevneib, " + nombre);
```

Ufff que largo condicionales, vamos a hacer algo de práctica para repasar.

### Ejercicios

Dado una orda de marcianos que invaden el planeta, obtener una respuesta adecuada que daría la humanidad según las siguientes condiciones.

**Aclaración**: obtener variables preguntando por prompt y las comunicaciones con ellos se realizan con `alert`.

1. Preguntar si los marcianos son amigables, las respuestas posibles son `"Jai"` que significa que sí, o "Neh" que significa que no. En caso de responder negativamente avisarles por `alert` que vamos a fusilarlos.
1. A la condición anterior se agrega que en caso que sean amigables, les comunicamos con `alert` que vamos a darles una caja de chocolates.
1. Ahora vamos a preguntarles también cuántos vinieron al planeta. Si la respuesta es menor a 100, decirles que necesitan a 10 marcianos para inspecciones, si la respuesta es mayor a 10000 entonces decirles que están para lo que necesiten, y si la respuesta está entre 100 y 10000, decirles que el Hipódromo de Palermo está abierto las 24hs.
1. Finalmente, preguntarles si la batata es mejor que el membrillo, y si toman el mate amargo o dúlce. Si prefieren el la batata y el mate dúlce, decirles que están en guerra. Si prefieren la batata y toman mate amargo, o si prefieren el membrillo y toman mate dulce, decirles que pueden quedarse unos días. Finalmente si prefieren el membrillo y toman mate amargo decirles que pueden quedarse el tiempo que necesiten.

## Objetos

Algo que ya veníamos usando y quizás no se dieron cuenta.

Los objetos son otro tipo de dato, como texto, número o función, y que nos permite agrupar valores.

```javascript
var persona = {
  nombre: "Norman",
  apellido: "Perrin",
  edad: 24,
  puede_volar: false
};
```

Si ven la variable `persona` está declarando dentro de sí otras variables. Luego para acceder a los valores de las "subvariables", usamos el `.`.

```javascript
console.log(persona.nombre);
console.log(persona.puede_volar);
console.log(persona);
```

### Partes

- `{}`: apertura y cierre de llaves, adentro se ponen los atributos - valores que queramos. Este es un objeto vacío, es sintaxis válida.
- `nombre`: atributo, o lo que decíamos antes como "subvariable". También se la llama propiedad. Este es un identificador, igual que como declaramos una variable.
- `:` el dos puntos separa el atributo del valor. Del lado izquierdo va el identificador, del derecho el valor.
- `"Norman"`: valor del atributo.
- `,`: los distintos atributos valores se separan con una coma entre ellos. En el último atributo - valor no hace falta poner una coma, ya que no hay uno que le siga.

### Cuándo se usa?

Como dije antes, cuando quieran agrupar valores.

Por ejemplo si quieren agrupar comandos para mostrar información en consola con cierto formato, pueden hacer lo siguiente.

```javascript
function mostrar_informacion(mensaje) {
  console.log("[i]: " + mensaje);
}

function mostrar_error(mensaje) {
  console.log("[e]: " + mensaje);
}

var consola = {
  info: mostrar_informacion,
  error: mostrar_error
};

consola.info("Se cargó la página correctamente!");
consola.error("Hubo un problema al completar el formulario");
```

Agrupamos atributos que son parte de la consola, en esa misma variable. Entonces no tenemos varias funciones sueltas como `mostrar_informacion` o `mostrar_error`, sino que podemos acceder a ellas a través de `consola`.

Incluso si no saben los atributos que tiene un objeto, la consola de chrome es tan amigable que nos da sugerencias.

Por ejemplo, si escribimos en la consola (no snippet), `console.` cuando apretemos el `.` nos va a dar una lista de propiedades que podemos llamar.

Cuando aparezca un símbolo parecido a una `ƒ` abajo, significa que el valor de ese atributo es de tipo función, pero como vimos en la definición de `persona`, también puede ser de tipo numérico, texto o booleano. Todo lo que pueda ser un valor... y si un objeto es un valor, adivinen, podemos poner un objeto como valor de un atributo, porque al final es otro tipo de dato, o sea un valor.

```javascript
var planeta = {
  nombre: "Melmac",
  habitantes: 1000000000,
  habitante: {
    dientes: 4,
    frase_caracteristica: "No hay problema",
    comida_preferida: "gato"
  }
};
```

Si queremos acceder a los valores más añadidos en la definición de ese objeto

```javascript
console.log(
  "La comida preferida de alguien que vive en " +
    planeta.nombre +
    " es " +
    planeta.habitante.comida_preferida
);
```

Y váyanse familiarizando con esta sintaxis, porque JavaScript está lleno de objetos.

### Ejercicios

Todo este ejercicio debe resolverse definiendo **un** objeto. Pueden definir las funciones por separado.

1. Crear un objeto que tenga atributos característicos de un cliente de una tienda de mascotas. El mismo debe tener 3 atributos, uno de tipo texto, otro numérico y por último un booleano.
1. Agregar a la definición anterior, un atributo llamado "mascota" de tipo objeto, en ese objeto pueden haber los atributos que elijan.
1. Agregar un atributo al cliente llamada "saludar" que sea de tipo función. Esta función debe recibir un nombre a saludar por parámetro y mandarle un saludo por `alert` a la persona, como `"Buen día " + nombre`. Luego de definir la función al cliente, llamarla pasándole su nombre.
1. Agregarle el mismo atributo al perro, pero ahora en vez de decir `"Buen día " + nombre`, tiene que decir `"Ouf Ouf " + nombre`.
1. Crear una función que obtenga un cliente, como el recién definido, por parámetro, y
1. muestre por `alert` el nombre del cliente (o el atributo tipo texto que hayan elegido).
1. ejecute la función `saludar` del perro, con el nombre del cliente.

## Arrays

O también llamadas: listas, vectores, arreglos... Para nosotros arrays o listas.

Y qué son?

> Tipo de valor que agrupa valores de forma ordenada

Primero se puede decir que es una agrupación como los objetos, o sea que estos valores están contenidos en 1 lugar.

Luego que estos valores están dispuestos de forma ordenada. Esto significa que podemos decir que un valor está antes o después que otro.

Para que se entienda mejor

```javascript
var lista_de_alumnos = ["Camila", "Gabriel", "Martín", "Sol"];
```

Como vemos tiene una sintáxis parecida a los objetos, pero en vez de llaves `{}` se usan corchetes `[]`, y no se le dan nombres a los atributos, sino que se ponen directamente los valores.

### Cómo accedo a los valores

Al no tener nombres los atributos, se accede a través de su índice, el cual depende del orden que tenga ese valor dentro de la lista.

```javascript
console.log(lista_de_alumnos[0]);
console.log(lista_de_alumnos[1]);
console.log(lista_de_alumnos[2]);
console.log(lista_de_alumnos[3]);
```

Si se fijan el primer elemento es el que tiene índice 0 y para acceder el último tiene como índice el tamaño de la lista menos 1 (4 - 1 = 3).

Para saber el tamaño de la lista podemos usar un atributo del array llamado `length`.

```javascript
console.log(lista_de_alumnos.length); //> 4
```

Y de dónde salió ese `length`?

### Atributos auto definidos

Yo lo llamo así, o propiedades, porque son como lo de los objetos, pero quizás tenga otro nombre...

No solo los arrays, sino todos los tipos de valores tienen atributos auto definidos. Qué son estos?

Son atributos o propiedades a las que podemos acceder según el tipo de valor que manejemos. Por ejemplo, una lista o un texto va a tener un atributo `length`.

```javascript
console.log("norman".length); //> 6
console.log(["n", "o", "r", "m", "a", "n"].length); //> 6
```

Mientras que un número o booleano no tienen esos atributos.

Ustedes pueden ver qué funciones o atributos pueden llamar envolviendo un valor entre paréntesis y poniéndole punto, en consola

```javascript
("norman"). //> les va a auto sugerir qué poner
```

Los más interesantes de estos, están en los arrays, ya que nos dan formas de recorrerlo, transformarlo, filtrar elementos, y mucho más.

Veamos algunos atributos interesantes de arrays.

#### map

El `map` recibe una lista de un tamaño y devuelve otra lista del mismo tamaño, pero con alguna transformación de sus elementos. Esa transformación es aplicada por una función que definimos nosotros, y se pasa como parámetro de la función `map`. Ejemplo:

```javascript
function doble(numero) {
  return numero * 2;
}

var numeros = [2, 4, 6];
var doble_de_los_numeros = numeros.map(doble);

console.log(doble_de_los_numeros); //> [4, 8, 12]
```

Es importante definir bien la función a aplicar y tener en cuenta lo que recibe y devuelve.

Como primer argumento el `map` recibe el valor actual que está recorriendo. `map` va a recorrer la lista de forma ordenada, aplicando la función a cada valor por separado.

Luego el retorno va a ser un valor en la nueva lista, respetando el orden de recorrido.

Otro ejemplo

```javascript
function transformar_texto_a_minuscula(texto) {
  return texto.toLowerCase();
}

var nombres = ["Norman", "maRtín", "camIla", "JuaN"];
var nombres_minuscula = nombres.map(transformar_texto_a_minuscula);

console.log(nombres_minuscula); //> ["norman", "martín", "camila", "juan"]
```

#### filter

El `filter` recibe una lista de un tamaño y devuelve otra lista del mismo tamaño o menor, con los mismos valores que tenía. Recibe como parámetro una función que retorna un booleano, según si debe o no filtrar el elemento. Un ejemplo:

```javascript
function es_nombre_de_superheroe(nombre) {
  var tamanio_nombre = nombre.length;
  var ante_penultima_letra = nombre[tamanio_nombre - 3];
  var ante_ultima_letra = nombre[tamanio_nombre - 2];
  var ultima_letra = nombre[tamanio_nombre - 1];

  // me fijo si el nombre termina en "man"
  if (
    ante_penultima_letra === "m" &&
    ante_ultima_letra === "a" &&
    ultima_letra === "n"
  ) {
    return true;
  } else {
    return false;
  }
}

var nombres = ["spiderman", "nicolás", "norman", "ironman"];
var superheroes = nombres.filter(es_nombre_de_superheroe);

console.log(superheroes); //> una lista de todos los elementos menos nicolás.
```

Y si supiesen las funciones de string, podrían haber definido la función de esta otra manera

```javascript
function es_nombre_de_superheroe(nombre) {
  return nombre.slice(-3) === "man";
}
```

Igual les dejo que exploren eso por su cuenta.

#### forEach

A diferencia del `map` o `filter`, el `forEach` no devuelve un nuevo array, sino que **hace** algo por cada elemento que itera. El **hace** queda definido por la función que recibe el `forEach` por parámetro. Veamos un ejemplo

```javascript
var mensajes_molestos = [
  "No te olvides de desactivar el adblock",
  "Subscribite a nuestro newsletter",
  "Hemos detectado un virus en su máquina"
];

mensajes_molestos.forEach(alert);
```

Es importante entender el propósito de cada función, el `forEach` es para **hacer** algo por cada elemento que itera.

### Ejercicios

Mucha info. Necesitamos algo de práctica

1. Crear un array que tenga 4 elementos,
1. todos de tipo string
1. todos de tipo objeto
1. todos de tipo función
1. todos de tipo array
1. Crear una función que tome un array de números como primer parámetro y devuelva la suma del primer y último número.
1. Crear una función que tome un array de números y devuelva un array del mismo tamaño, pero que los valores de salida sean la mitad de los de entrada. O sea que calcule la mitad de todos los números.
1. Crear una función que reciba un array de objetos que tengan un atributo `nombre`, y retorne un array de solo los nombres.
1. Crear 3 funciones que toman un número por parámetro y retornar alguna operación con ese número (el doble, el siguiente, la mitad, etc). Luego crear una función que tome una lista de 3 funciones como primer parámetro, un número como segundo parámetro y devuelva una lista de 3 elementos con los resultados de las funciones ejecutadas con el número pasádo por segundo parámetro.

## Cheat Sheet

### General

| Instrucción                                 | Descripción                                     |
| ------------------------------------------- | ----------------------------------------------- |
| `// comentario en línea`                    | Comentario en línea                             |
| `/* comentario en bloque */`                | Comentario en bloque (pueden ser varias líneas) |
| `console.log("Hola mundo!")`                | Mostrar "Hola mundo!" por consola               |
| `alert("Hola mundo!")`                      | Mostrar "Hola mundo!" por ventana de alerta     |
| `var nombre = prompt("Cuál es tu nombre?")` | Mostrar input con mensaje                       |

### Variables

| Instrucción                      | Descripción                  |
| -------------------------------- | ---------------------------- |
| `var nombre = "Norman"`          | Declarar variable            |
| `nombre = "Juan"`                | Asignar o reasignar un valor |
| `console.log("Hola, " + nombre)` | Usar la variable             |

### Operadores

#### Numéricos

| Instrucción | Descripción    |
| ----------- | -------------- |
| `1 + 1`     | Suma           |
| `1 - 1`     | Resta          |
| `1 * 1`     | Multiplicación |
| `1 / 1`     | División       |
| `1 % 1`     | Resto          |

#### Texto

| Instrucción                                | Descripción   |
| ------------------------------------------ | ------------- |
| `"Hola " + "Norman" + ". " + "Todo bien?"` | Concatenación |

### Booleanos

#### Comparación

| Instrucción | Descripción |
| ----------- | ----------- |
| `1 > 1`     | Mayor       |
| `1 < 1`     | Menor       |
| `1 === 1`   | Igual       |
| `1 !== 1`   | Distinto    |

#### Lógicos

Actúan sobre valores booleanos

Negación

```javascript
console.log(!true); //> false
console.log(!false); //> true
console.log(!!true); //> true
```

Se ejecuta como `p && q` o `p || q`.

| p       | q       | `&&` (y) | `||` (o) |
| ------- | ------- | -------- | -------- |
| `true`  | `true`  | `true`   | `true`   |
| `true`  | `false` | `false`  | `true`   |
| `false` | `true`  | `false`  | `true`   |
| `false` | `false` | `false`  | `false`  |

### Funciones

#### Declarar

```javascript
function nombre(parametro1, parametro2, parametro3) {
  /* Instrucciones */
  var concatenacion = parametro1 + parametro2 + parametro3;
  return concatenacion;
  // lo que esté debajo no se ejecuta
}
```

#### Ejecutar

```javascript
var concatenacion = nombre("Hola, ", "cómo estás? ", "todo bien?");
console.log(concatenacion);
```

### Objetos

#### Declarar

```javascript
var planeta = {
  nombre: "Melmac",
  habitantes: 1000000000,
  habitante: {
    dientes: 4,
    frase_caracteristica: "No hay problema",
    comida_preferida: "gato"
  }
};
```

#### Acceder a valores

```javascript
console.log(planeta.nombre);
console.log(planeta.habitante.dientes);
```

### Arrays

#### Declarar

```javascript
var lista = [
  {nombre: "Norman"},
  {nombre: "Pepe"},
  {nombre: "Mariana"}
]
```

#### Acceder a valores

```javascript
console.log(lista[0].nombre)
console.log(lista[1].nombre)
console.log(lista[2].nombre)
```

## Comunidades geniales

- [Free Code Camp BA](https://freecodecampba.org/): grupo para juntarse a programar y aprender de tecnología, tienen un chat muy activo donde pueden ayudarte. Orientado a todo tipo de desarrollo, web principalmente.
- [MeetupJS](https://meetupjs.com.ar/): mismo que el anterior pero orientado a JavaScript principalmente.
- [ComunidadIT](http://www.comunidadit.org/): organización que da cursos y becas a estudiantes de programación.
- [Puerta18](http://www.puerta18.org.ar/): hacking space que da talleres gratuitos de programación, entre otros.
