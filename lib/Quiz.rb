require_relative 'List'  
require_relative 'exam'

# = Quiz.rb
#
# Autor:: Dailos Sabina Rodriguez
# Autor:: Raul Perez Hernandez
#
#
# === Clase Quiz
# Definicion de la clase Quiz que permite representar un examen por pantalla mediante los siguientes metodos y tambien comprobar el resultado del examen
# * metodo initialize
# * metodo to_s
# * metodo check
#

class Quiz
  # Atributo name que guarda el titulo del examen
  # Atributo questions que guarda las diferentes respuestas del examen

  attr_accessor :name, :questions

  # Metodo para inicializar la clase
  def initialize(name, questions)
    @aciertos = 0
    @name = name
    @questions = questions
  end

  # Metodo para mostrar el examen por pantalla
  def to_s
    q = "#{@name}" + "\n"
    @questions.each do |p|
      q << p.to_s + "\n"
    end
    q
  end
  
  # Metodo para comprobar las respuestas dadas del examen
  def check(resp)
    r = 0
    @questions.each do |q|
      if q.num_c == resp[r]
        @aciertos += 1
      end
      r +=1
    end
    @aciertos
  end
end

# === Clase InterfazQuiz
# Definición de la clase InterfazQuiz que es hija de Quiz permite representar un examen por pantalla y mediante una interfaz de usuario obtener el resultado dell examen. Posee los siguientes metodos
# * metodo run
#

class InterfazQuiz < Quiz

  # Metodo para realizar examen por pantalla
  def run
    puts @name
    @questions.each do |q|
      puts q
      print "Su respuesta: "
      resp = gets.chomp.to_i
      if q.num_c == resp - 1
        puts "Correcto!"
        @aciertos += 1
      else
        puts "Fallo, la respuesta correcta era #{q.num_c+1}"
      end
      puts
    end
    puts "Has acertado #{@aciertos} preguntas"
  end
end
