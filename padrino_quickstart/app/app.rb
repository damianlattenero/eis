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
      @operando_1 = 1
      @operando_2 = 2
      @resultado = 3
      render 'calculadora'
    end

    post 'resetear_operaciones' do
      @operaciones = session[:operaciones] = 0
      redirect_to '/'
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