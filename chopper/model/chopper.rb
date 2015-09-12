class Chopper

  def chop n, list
    list.length - 1
  end


  def sum list

    digitos_en_palabras = ''

    if list.empty?
      return 'vacio'
    else
      sumar_todo = list.reduce(0) { |a, r| a+r }
      digitos_en_numeros = self.lista_digitos(sumar_todo)

      digitos_en_numeros.each { |digito|
        digitos_en_palabras << self.convertir_a_palabra(digito) << ','
      }
    end

    digitos_en_palabras.chop
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
      when 1 then "uno"
      when 2 then "dos"
      when 3 then "tres"
      when 8 then "ocho"
      when 4 then "cuatro"
      else n.to_s

    end
  end


end