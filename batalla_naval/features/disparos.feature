Feature: Como usuario quiero disparar a los barcos enemigos

  Scenario: disparar y tocar agua
    Given la posicion 1,1 del juego sin barco
    When disparo en posicion
    Then toco agua

  Scenario: disparar y encontrar barco con mas de una celda
    Given la posición 1,1 con barco tipo "crucero" en la posicion 1,1 y 1,2 sin tener disparos
    When disparo en esa posicion
    Then lo toco pero no lo hundo


  Scenario: disparar y encontrar barco con tan solo una celda
    Given dada la posicion 1,1 y 2,1 con un barco tipo "crucero" en dichas
    When disparo en esa posicion en posicion 1,1
    And disparo en esa posicion en posicion 2,1
    Then lo hundo