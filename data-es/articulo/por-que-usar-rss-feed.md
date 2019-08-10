---
pre-title: Artículo
title: Por qué usar RSS feed
url: /es/articulo/por-que-usar-rss-feed
date: 2019/07/30 00:00:00
description: Estuve usando RSS feed por un mes ya. Le veo algunos beneficios que quiero compartir
---

Estuve usando RSS feed por un mes ya. Le veo algunos beneficios que quiero compartir

Pero primero, puede que no estés familiarizado con lo que es, así que una explicación:

## Qué es?

RSS (Really Simple Syndication) es una manera de compartir actualizaciones de un sitio de forma estandarizada.

La forma en la que funciona es muy simple.

Hay archivos RSS y clientes.

### Archivos RSS

Si querés tener uno, primero tenés que tener en cuenta cierto [formato](https://validator.w3.org/feed/docs/rss2.html) con la información que querés compartir. Ese archivo va a ser actualizado cuando haya algún cambio en el sitio. Un ejemplo común es de actualizar el archivo cuando se agrega un nuevo artículo en la página.

Tenés que subir ese arhivo a un dominio tuyo, como [`https:nperrin.io/feed/index.xml`](/es/feed/index.xml), y asegurarte de actualizarlo.

Muchos sitios exponen sus archivos RSS. Podés tener tu lista de sitios de interés y obtener actualizaciones de ellos con un cliente RSS, todo en un lugar y sabiendo a qué estás subscripto, a diferencia de una subscripción vía e-mail.

### Clientes RSS

Los clientes RSS consultan los archivos RSS por su url, cada X tiempo. Verifican si hubo alguna actualización, si hubo, muestra una indicación de eso, quizás un artículo fue agregado, entonces podrías saber que hay nuevo contenido para consumir.

## Lo bien

### Todo en un lugar

No tenés que ir a diferentes plataformas, que siguen tu comportamiento en internet y te muestran publicidades. Tenés todo desde el cliente RSS.

### Implementación

Como creador de contenido, si querés notificar a tus subscriptores de una actualización, solamente tenés que modificar el archivo RSS. Es muy simple de implementar.

### Sabés la fuente

Quizás es algo particular mío.

Leyendo noticias en twitter puede que me encuentre con una url random de una noticia, voy a leerla y seguir a lo mío sin saber si esa fuente era confiable o no.

Tener una lista de sitios de noticias de los cuales obtener información me hace tener una mejor idea si son o no confiables, ya que sigo otras noticias de ellos también.

Aunque existen algunas extensiones como [News Guard](https://www.newsguardtech.com/), creo que es mejor tener y conocer un grupo chico de fuentes de información en los cuales uno pueda confiar.

### Tenés el control

Como creador de contenidos, vos elegís qué notificar. No vas a ser censurado. Mientras seas dueño de tu archivo RSS.

### Spam

Cuando alguien te pide tu e-mail para un newsletter, supongo que no solo van a usar tu e-mail para mandarte actualizaciones.

Tu e-mail puede ser vendido a otra companía (ya que los subscriptores pueden mostrar un interés en cómún, y una empresa puede apuntar a ese público).

El sitio puede recibir incentivos para publicar publicidades. Solo hace falta que le muestre la cantidad de e-mails que tiene para que una companía le pague.

Así que para usuarios que quieran mantenerse libre de spam, esta es una buena alternativa.

## Lo no tan bien

### Nuevo contenido

Cuando tenés una lista fija de canales, es difícil descubrir nuevos, ya que solo consumís contenido, no tenés las recomendaciones.

El problema de la burbuja también se encuentra en canales con recomendaciones. Pero creo que tenés una mejor chance de descrubrir nuevo contenido por alguna recomendación o navegando por internet de forma random.

Una posible solución a esto, sería buscar proactivamente diferentes miradas sobre un tema de interés ([DuckDuckGo](https://duckduckgo.com)...), y mirar si los sitios que uno consume tienen recomendaciones.

## Conclusión

Hay un montón de cosas que no sé. Subí mi [rss feed](/es/feed/index.xml) ayer (28 Jul), así que sentite libre de corregirme si ves que puse algo mal.

Finalmente, les dejo algunos links por si están interesados en leer más del tema:

- [My RSS feed](/feed/index.xml).
- [Thunderbird](https://www.thunderbird.net/en-US/thunderbird/all/) (is a RSS client too).
- [RSS reference](https://validator.w3.org/feed/docs/rss2.html).
- [Some RSS utils](https://github.com/NormanPerrin/utils/tree/master/rss).
- [RSS wiki entry](https://en.wikipedia.org/wiki/RSS).
