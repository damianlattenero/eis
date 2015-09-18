class Chopper

  def chop n, list
    list.inject(-1) { |r, a|
      if n == a
        return r + 1
      else
        r + 1
      end
    }
  end


  def sum list

    digitos_en_palabras = ''
    sumar_todo = list.inject(0) { |a, r| a+r }

    if list.empty?
      return "vacio"
    elsif sumar_todo > 99
      return "demasiado grande"
    else

      digitos_en_numeros = self.lista_digitos(sumar_todo)

      digitos_en_numeros.each { |digito|
        digitos_en_palabras << self.convertir_a_palabra(digito) << ','
      }

      return digitos_en_palabras.chop
    end


  end


  def lista_digitos n
    ret = []

    digito = n

    while digito > 10
      ret << digito % 10
      digito = digito.to_i / 10
    end

    ret << digito
    ret.reverse
  end

  def convertir_a_palabra n
    case n
      when 0 then "cero"
      when 1 then "uno"
      when 2 then "dos"
      when 3 then "tres"
      when 4 then "cuatro"
      when 5 then "cinco"
      when 6 then "seis"
      when 7 then "siete"
      when 8 then "ocho"
      when 9 then "nueve"
      else raise "no es un numero!"

    end
  end


end