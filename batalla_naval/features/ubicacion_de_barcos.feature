Feature: Como usuario quiero ubicar mis barcos

  Scenario: ubico mi barco exitosamente
    Given la posicion del juego 1,1 que esta vacía y un barco tipo submarino
    When ubico un barco tipo "submarino"
    Then se ubica exitosamente submarino


  Scenario: ubico mi barco exitosamente
    Given la posicion del juego 1,1 y 1,2 que estan vacías y un barco tipo crucero
    When ubico un barco tipo "crucero" "horizontal"
    Then se ubica exitosamente crucero

  Scenario: ubico mi barco exitosamente
    Given la posicion del juego 1,1 1,2 y 1,3 que estan vacías y un barco tipo acorazado
    When ubico un barco "acorazado" "horizontal"
    Then se ubica exitosamente acorazado

  Scenario: ubico mi barco y ya hay uno
    Given la posicion 1,1 que tiene un "submarino" ya ubicado y voy a ubicar un barco tipo submarino
    When ubico un barco tipo "submarino" en posicion ocupada
    Then no lo puedo ubicar


  Scenario: ubico mi barco y ya hay uno
    Given la posicion 1,1 y 1,2 que tiene un "submarino" ya ubicado en 2,1 y voy a ubicar un barco tipo "crucero"
    When ubico un barco tipo "crucero" "horizontal" en 1,1 en posicion ocupada
    Then no lo puedo ubicar al crucero

  Scenario: ubico mi barco fuera del tablero
    Given un batalla naval de 20 por 20 y la posicion 21,20 y un barco tipo submarino
    When ubico mi barco tipo "submarino"
    Then no lo puedo ubicar fuera del tablero