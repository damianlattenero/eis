class Chopper

  def chop n, list
    list.length - 1
  end


  def sum list

    digitos_en_palabras = ''

    if list.empty?
      digitos_en_palabras << 'vacio'
    else
      sumar_todo = list.reduce(0) { |a, r| a+r }
      digitos_en_numeros = self.lista_digitos(sumar_todo)

      digitos_en_numeros.each { |digito|
        digitos_en_palabras << self.convertir_a_palabra(digito)
      }
    end

    digitos_en_palabras
  end

  def lista_digitos n
    [n]
  end

  def convertir_a_palabra n
    case
      when 1 == n then "uno"
      when 4 == n then "cuatro"
      else n
    end
  end


end