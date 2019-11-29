# robot-framework-docker

Inicio rápido
===========

Clone este repositorio

    git clone http://192.168.1.100/onvacation/docker/test-funcionales.git

Pull the image.

    docker pull onvacation/docker
    
Run the tests

    cd selenium && ./run_tests.sh
    

Contents
========

Esta imagen contiene lo siguiente para facilitar la prueba del robot

Xvfb
----

Puede usarlo para iniciar una visualización y encender un navegador para realizar pruebas de IU.
 
Ejemplo (suites/ejemplo_con_robot_framework.robot):

    Start Virtual Display    1920    1080
    

Selenium2Library
----------------

Mas detalles aquí  http://robotframework.org/Selenium2Library/Selenium2Library.html

También eche un vistazo a **suites/ejemplo_con_robot_framework.robot**



    
robotframework
-------------------------

Mas detalles aquí https://github.com/robotframework/QuickStartGuide/blob/master/QuickStart.rst






