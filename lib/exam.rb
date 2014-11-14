require "exam/version"

module Exam
  # Your code goes here...
  class Pregunta
    include Comparable
    attr_accessor :answers, :title, :num_c, :level
    
    def <=> (anOther)
      @level <=> anOther.level
    end

    def == (other)
      @level == other.level && @title == other.title
    end
    
    # Metodo para obtener el titulo de la pregunta mediante una introducción por pantalla
    def self.obtener_pregunta
      puts 'Introduzca la pregunta'
      title = gets.chomp
      return title
    end
    
    def self.obtener_level
      puts 'Introduzca nivel de dificultad de la pregunta, 0 minimo y 10 maximo'
      @level = gets.chomp.to_i
    end

    # Metodo para obtener las diferentes respuestas a la pregunta, manteniendo la suposición de que el numero de respuestas será el que nos proporcionen
    def self.obtener_respuestas
      puts "Introduzca numero de respuestas a la pregunta"
      num = gets.chomp.to_i
      c = []
      while num != 0
        c = c + obtener_respuesta(c.length + 1)
        num -= 1
      end
      @answers = c
    end

    # Metodo para saber dentro de la clase Pregunta cual de las respuestas es la correcta, mediante un indice que apunta a un array
    def self.obtener_correcta
      puts "Introduzca el numero de la respuesta correcta"
      @num_c = gets.chomp.to_i
    end

    # Metodo para obtener una respuesta simple a una pregunta
    def self.obtener_respuesta(num)
      puts "Introduzca la respuesta #{num}"
      ans = [gets.chomp]
      return ans
    end

    # Metodo para inicializar la clase
    def initialize(title = obtener_pregunta, answers = obtener_respuestas, num_c = obtener_correcta, level = obtener_level)
      raise ArgumentError,
        "Title has to be a String, got #{title.class}" unless title.is_a? String
      @title = title
      @answers = answers
      @num_c = num_c
      @level = level
    end

    # Metodo para mostrar por pantalla la pregunta y las posibles respuestas
    def to_s
      out = "# #{@title}" + "\n"
      i = 1
      answers.each do |a|
        out << " #{i}.- #{a}\n"
        i += 1
      end
      out
    end
  end

  # Clase para representar la clase de preguntas de Verdadero y Falso
  class Pregunta_VF < Pregunta
 
    # Metodo para inicializar haciendo overriding
    def initialize(title = obtener_pregunta, num_c = obtener_correcta, level = obtener_level)
      raise ArgumenError, "Title has to be a String, got #{title.class}" unless title.is_a? String
      @title = title
      @answers = ["Cierto", "Falso"]
      @num_c = num_c
      @level = level
    end
  
    # Metodo para obtener la respuesta correcta haciendo overriding
    def self.obtener_correcta
      puts "Si la respuesta es correcta teclee 0, en caso contrario teclee 1"
      @num_c = gets.chomp.to_i
    end
  end
end
