require_relative 'List'
require_relative 'exam'
require_relative 'Quiz'

# = quiz_dsl.rb
#
# Autor:: Dailos Sabina Rodriguez
# Autor:: Raul Perez Hernandez
#
#
# === Clase QuizDSL
# Definicion de la clase Quiz que permite representar un examen por pantalla mediante los siguientes metodos y tambien comprobar el resultado del examen, para ello hemos definido la clase como DSL
# * metodo initialize
# * metodo question
# * metodo right
# * metodo wrong
#

class QuizDSL < InterfazQuiz

  # Metodo para inicializar la clase
  def initialize(name = "", &block)
    @aciertos = 0
    @name = name
    @questions = List.new
    @wr = 0

    if block_given?
      if block.arity == 1
        yield
      else
        instance_eval &block
      end
    end
  end

  # Metodo para cargar una pregunta haciendo uso de DSL
  def question(title, answers = {})
    resp = []
    a = 0
    num_c = 0
    correcta = answers[:right] if answers[:right]
    answers.map do |key,r|
      resp << r
      num_c = a if r == correcta
      a += 1
    end
    @questions.ins_final(Exam::Pregunta.new(title, resp, num_c, 0))
  end

  # Metodo para cargar la respuesta correcta
  def right
    :right
  end

  # Metodo para cargar la/s respuesta/s errónea/s
  def wrong
    @wr += 1
    ("wr"+@wr.to_s).intern
  end
end

if __FILE__ == $0
  quiz = QuizDSL.new("Cuestionario de LPP 05/12/2014") do
    question '¿Cuantos argumentos de tipo bloque puede recibir un metodo?',
      right => '1',
      wrong => '2',
      wrong => 'muchos',
      wrong => 'los que defina el usuario'

    question "En Ruby los bloque son objetos que contienen codigo",
      wrong =>'Cierto',
      right =>'Falso'
    
    question "Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto end",
      wrong => 'Una constante',
      wrong => 'Un objeto',
      right => 'Una instancia de la clase Class',
      wrong => 'Ninguna de las anteriores'
  end
  
  #quiz.invertir
  quiz.run
end
