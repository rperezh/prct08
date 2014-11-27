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

  # Metodo para invertir el order de las preguntas sin programacion funcional
  def invertir_manual
    q_inv = List.new
    @questions.each do |p|
      q_inv.ins_inicio(p)
    end
    @questions = q_inv
  end

  # Metodo para invertir el order de las preguntas siguiendo programacion funcional
  def invertir
    q_inv = List.new
    @questions.map { |n| q_inv.ins_inicio(n) }
    @questions = q_inv
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

if __FILE__ == $0
  @l1 = List.new
  @l1.ins_inicio(Exam::Pregunta.new('Cual es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots',['#<Xyz:0xa000208>','nil','0', 'Ninguna de las anteriores'], 1, 0))
  @l1.ins_final(Exam::Pregunta.new('La siguiente definicion de un hash en Ruby es validad: hash_raro = { [1, 2, 3] => Object.new(), Hash.new => :toto }',['Cierto', 'Falso'], 0, 1))
  @l1.ins_final(Exam::Pregunta.new('Cual es la salida del siguiente codigo Ruby? class Array def say_hi "HEY!" end end p [1, "bob"].say_hi',['1', 'bob', 'HEY!', 'Ninguna de las anteriores'],2,2))
#@l1.ins_final(Exam::Pregunta.new('Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto end',['Una instancia de la clase Class', 'Una constante', 'Un objeto', 'Ninguna de las anteriores'],0,3))
#@l1.ins_final(Exam::Pregunta_VF.new('Es apropiado que una clase Tablero herede de una clase Juego',0,4))
  @q1 = Quiz.new("Examen LPP", @l1)
  #@q1.run
  puts @q1
  #@q1.check([1])
  #@q1.check([1,0])
  #@q2 = InterfazQuiz.new("Prueba", @l1)
  #@q2.run
#@q1.invertir
#@q2 = Quiz.new("Examen LPP invertido", @q1.invertir)
  @q2 = @q1
  @q2.invertir
  puts @q2
end
