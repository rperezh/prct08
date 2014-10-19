#!/usr/bin/env ruby

  class Pregunta
    
    attr_accessor :answers, :title

    
     def obtener_pregunta
       puts "Introduzca la pregunta"
       title = gets.chomp
       return title
    end

    def obtener_respuestas
       puts "Introduzca numero de respuestas a la pregunta"
       num = gets.chomp.to_i
       c = []
       while num != 0 do 
         c = obtener_respuesta + c
         num = num - 1 
       end
       @answers = c
   end

    def obtener_respuesta
      puts "Introduzca la respuesta"
      ans = [gets.chomp]
      return ans
    end


    def initialize(title = obtener_pregunta, answers = obtener_respuestas)
      raise ArgumentError, "Title has to be a String, got #{title.class}" unless title.is_a? String
      @title = title
      @answers = answers
    end
  
    def to_s
      out = "# #{@title}" + "\n"
      i = 1
      answers.each do |a|
        out << " #{i}.- #{a}\n"
        i += 1
      end
      puts out
    end
 
 end

Pregunta.new().to_s
