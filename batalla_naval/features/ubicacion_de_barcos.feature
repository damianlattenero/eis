Feature: Como usuario quiero ubicar mis barcos
  @wip
  Scenario: ubico mi barco exitosamente
    Given la posicion del juego 1,1 que esta vacía y un barco tipo submarino
    When ubico mi barco
    Then se ubica exitosamente

  @wip
  Scenario: ubico mi barco exitosamente
    Given la posicion del juego 1,1 y 1,2 que estan vacías y un barco tipo crucero
    When ubico mi barco
    Then se ubica exitosamente

  @wip
  Scenario: ubico mi barco exitosamente
    Given la posicion del juego 1,1 1,2 y 1,3 que estan vacías y un barco tipo acorazado
    When ubico mi barco
    Then se ubica exitosamente

  @wip
  Scenario: ubico mi barco y ya hay uno
    Given la posicion 1,1 que tiene un submarino ya ubicado y un barco tipo submarino
    When ubico mi barco
    Then no lo puedo ubicar

  @wip
  Scenario: ubico mi barco fuera del tablero
    Given un batalla naval de 20 por 20 y la posicion 21,20 y un barco tipo submarino
    When ubico mi barco
    Then no lopuedo ubicar