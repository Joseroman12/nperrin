# Guía introducción a JavaScript

Esta guía van a encontrar explicaciones y ejercicios de los conceptos que considero básicos de programación en JavaScript.

Hay otra guía un poco más amena que se llama "[JavaScript para gatos](https://jsparagatos.com/)". Recomiendo que lean esa guía y en todo caso si les quedó alguna consulta, guiarse por la tabla de contenidos de esta guía. O si confían en mi estilo, leerla directamente.

También recomiendo la guía de MDN "[JavaScript](https://developer.mozilla.org/es/docs/Learn/JavaScript)".

Aunque pueden saltearse un ejercicio, no lo recomiendo. Quizás parezca trivial y piensen que saben cómo resolverlo, de ser así, más razón para hacerlos. Los ejercicios no van a ser muy largos y los va a ayudar a consolidar lo que acaban de leer.

## Tabla de contenidos

- [Requisitos previos](#requisitos-previos).
- [Tener en cuenta](#tener-en-cuenta).
- [Qué es JavaScript](#qué-es-javascript).
- [Empezando](#empezando).
- [Strings](#strings).
- [Valores y variables](#valores-y-variables).
- [Operadores](#operadores).
- [Funciones](#funciones).
- [Condicionales](#condicionales).
- [Cheat Sheet](#cheat-sheet)

## Requisitos previos

- Un navegador web instalado, recomiendo [Brave Browser](https://brave.com/) o [Google Chrome](https://www.google.com/chrome/).

Nada más 😁.

## Tener en cuenta

- Al ejecutar todo en un navegador web, no vamos a entrar en problemas con la compu. A lo sumo si nos quedamos trabados podemos recargar la página y volver a escribir lo que habíamos puesto.
- Los errores de sintaxis son muy frecuentes al empezar. Recomiendo llevar nota de la sintaxis al principio, para consultar rápido al escribir una instrucción de código.
- No le tengas miedo a los errores. Los errores nos dicen (en inglés) qué hicimos mal. Es parte del proceso. Generalmente son buenos indicando exactamente cuál fue nuestro problema. Más adelante vamos a ver alguno de los errores más comunes que nos podemos encontrar.
- Probá todo lo que se te ocurra en el snippet o consola de desarrollador, no te quedes con dudas. Yo espero que si pongo un pedazo de código, lo pruebes y veas qué pasa.
- Si hay algo que no te quedó claro, googlea. Si no encontraste respuesta después de buscar, podés contactarme y feliz de responderte.

## Qué es JavaScript

Es un **lenguaje de programación**, con el cual vamos a **definir las instrucciones** a seguir para **lo que estemos programando**.

Mucha gente que aprende JavaScript lo hace para desarrollo web, o sea, darle comandos a una página web para que haga algo. Pero tengan en cuenta que también se puede usar para darle comandos a una computadora, celular, robot, y más.

Al estar en un entorno web, cuando escribamos código le vamos a decir a nuestra página web qué pasos debe hacer.

Es importante saber también que debemos respectar por completo la sintaxis, de lo contrario nuestro programa no funcionará.

## Empezando

Les voy a introducir su entorno de desarrollo. Para abrirlo sigan estos pasos: [Video demostración abriendo snippets](/video/tech/guia-introduccion-a-js/demo-snippet.mp4).

Si quieren saber más acerca de los "snippets" pueden ver esta [entrada sobre snippets](https://developers.google.com/web/tools/chrome-devtools/javascript/snippets) que hizo Google.

Cada línea que escriban en ese editor va a ser una "sentencia" o instrucción para el navegador web, el cual va a leer esa instrucción y va a hacer lo que le digan a través de esa instrucción.

Por ejemplo podemos escribir

```javascript
alert("Hola mundo!");
```

y cuando lo ejecutemos aprentando "Run" vamos a ver que aparece una ventana molesta con nuestro mensaje.

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

Está genial con que podamos reutilizar código, poníendole un nombre más entendible al código que queremos ejecutar, pero si quiero que ese "Norman" no esté, y en cambio esa variable tenga como valor lo que me ingresan?

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

## Condicionales

Los condicionales son una parte fundamental de la programación.

Y para introducirles este concepto voy a explicarles un tipo de valor que evité hasta ahora para que lo podamos ver en conjunto con los condicionales

### Boolean

El booleano es un tipo de dato, como un número o texto, pero que solo puede ser verdadero `true` o falso `false`.

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

### Condicionales

WIP...

## Cheat Sheet

### General

| Instrucción                                 | Descripción                                 |
| ------------------------------------------- | ------------------------------------------- |
| `console.log("Hola mundo!")`                | Mostrar "Hola mundo!" por consola           |
| `alert("Hola mundo!")`                      | Mostrar "Hola mundo!" por ventana de alerta |
| `var nombre = prompt("Cuál es tu nombre?")` | Mostrar input con mensaje                   |

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

#### Booleanos

| Instrucción | Descripción |
| ----------- | ----------- |
| `1 > 1`     | Mayor       |
| `1 < 1`     | Menor       |
| `1 === 1`   | Igual       |
| `1 !== 1`   | Distinto    |

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
