#Clase Quiz

require_relative 'List'  
require_relative 'exam'

  WRONG = false
  RIGHT = true
  
  class Quiz
    attr_accessor :name, :questions

    def initialize(name,questions)
      @counter = 0
      @aciertos = 0
      @name = name
      @questions = questions
    end

    def right
      :right
    end

    def run
      puts name
      questions.each do |q|
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

   # @l1 = List.new
   # @l1.ins_inicio(Exam::Pregunta.new('Cual es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots',['#<Xyz:0xa000208>','nil','0', 'Ninguna de las anteriores'],1,0))
   #@l1.ins_final(Exam::Pregunta.new('La siguiente definicion de un hash en Ruby es validad: hash_raro = { [1, 2, 3] => Object.new(), Hash.new => :toto }',['Cierto', 'Falso'],0,1))
    #@l1.ins_final(Exam::Pregunta.new('Cual es la salida del siguiente codigo Ruby? class Array def say_hi "HEY!" end end p [1, "bob"].say_hi',['1', 'bob', 'HEY!', 'Ninguna de las anteriores'],2,2))
    #@l1.ins_final(Exam::Pregunta.new('Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto end',['Una instancia de la clase Class', 'Una constante', 'Un objeto', 'Ninguna de las anteriores'],0,3))
    #@l1.ins_final(Exam::Pregunta_VF.new('Es apropiado que una clase Tablero herede de una clase Juego',0,4))
    #@q1 = Quiz.new("Examen LPP",@l1)
    #@q1.run
