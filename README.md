# Dockerización de escenarios de prácticas

Este repositorio se ha creado con la intención de aglutinar el proyecto de "dockerización" de distintos escenarios de prácticas de los ciclos de la familia de informática en el IES Severo Ochoa de Elche.


## XAMPP + Laravel

Este proyecto utiliza PHP8.

Para ilustrar este despliegue se utiliza una aplicación de muestra, obtenida de aquí: [https://github.com/JeffreyWay/Laravel-From-Scratch-Blog-Project](https://github.com/JeffreyWay/Laravel-From-Scratch-Blog-Project)

Podría desplegarse la aplicación cuando se hiciese el `docker-compose up -d` pero lo he dejado como está para que pueda ser genérico y pueda desplegarse otra aplicación si se prefiere.

Una vez los contenedores están corriendo habría que ir al contenedor del servidor web:

`docker exec -it apache-laravel`

Instalar dependencias:

`composer install`

Tras ello se debe crear la BBDD que está indicada en el archivo `.env` del proyecto de Laravel, en mi caso *miBBDD*. Esto se podria hacer desde el phpmyadmin que ya estaría corriendo en **http://localhost:8001** o bien mediante instrucciones por terminal desde el mismo contenedor del servidor web en el que estamos.

Tras ello:

`php artisan migrate --seed`

Y por último:

`php artisan key:generate`

Ya sólo quedaría darle los permisos adecuados a la carpeta del servidor web para que podamos acceder:

`chown -R www-data:wwww-data /var/www/html`

Y podremos acceder al blog (o aplicación desplegada) en ***http://localhost:8000***
