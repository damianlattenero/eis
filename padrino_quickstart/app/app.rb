#require_relative 'algunmodelo?'

module Ejemplo
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get '' do
      @operaciones ||= session[:operaciones] || 0
      render 'calculadora'
    end

    post '' do
      @operaciones = session[:operaciones] = (session[:operaciones] || 0) + 1
      @operando_1 = params[:operando_1].to_i
      @operando_2 = params[:operando_2].to_i
      @resultado = calcular(@operando_1, @operando_2)
      render 'calculadora'
    end

    post 'resetear_operaciones' do
      @operaciones = session[:operaciones] = 0
      redirect_to '/'
    end

    private

    def calcular n, m
      @operacion = params[:operacion].to_sym
      Calculadora.send(@operacion, n, m)
    end

    get 'hola' do
      'hey! hola'
    end
    
    get 'saludo' do
      render 'saludo'
    end

    post 'saludo' do
      session[:nombre] = params[:nombre]
      @nombre = session[:nombre]
      render 'saludo'
    end



  end
end