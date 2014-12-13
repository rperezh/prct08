#Practica numero 12 sobre programacion concurrente y en paralelo para la asignatura de LPP
  require 'thread'
  Thread.abort_on_exception = true
 
  # = Naranjero.rb
  #
  # Autor:: Dailos Sabina Rodriguez
  # Autor:: Raul Perez Hernandez
  #
  #
  # === Clase Naranjero
  # Definicion de la clase Naranjero que permite representar un arbol que crece, produce frutos y muere
  # * metodo initialize
  # * metodo crecimiento_anual
  # * metodo recolectar_una
  #
  class Naranjero
    # Crecimiento anual tasado en 1 año por vez
    CRECIMIENTO_ANUAL = 1
    # El arbol empieza a producir a los 3 años de edad
    EDAD_COMIENZO_PRODUCCION = 3
    # El arbol se muere a los 10 años
    EDAD_MUERTE = 10
    # Valor para hacer una cuenta relativa
    CUENTA_NARANJAS_RELATIVAS_EDAD = 50
    # Atributo altura para saber la altura del arbol
    # Atributo edad para conocer su edad
    attr_reader :altura, :edad
    
    #Metodo para inicializar la clase
    def initialize
      @altura = 0
      @edad = 0
      @contador = 0
    end
    #Metodo para devolver la edad del arbol
    def dev_edad
      @edad
    end

    #Metodo para hacer que la edad del arbol aumente
    def uno_mas
      @edad += 1
      @altura += CRECIMIENTO_ANUAL
      @contador = rand(@edad..EDAD_MUERTE) * Math.log(@edad) * CUENTA_NARANJAS_RELATIVAS_EDAD
    end
    
    #Metodo para recolectar una naranja
    def recolectar_una
      if (@edad == EDAD_MUERTE)
        print "Lo siento, el arbol esta muerto\n"
      elsif (@contador > 0)
        @contador -= 1
        print "La naranja estaba deliciosa\n"
      else
        print "No hay naranjas para recolectar\n"
      end
    end
  end
  
  
  # === Clase Trabajador
  # Definición de la clase Trabajador que nos permite hacer todo el trabajo para que crezca y se recolecten naranjas
  # * metodo initialize
  # * metodo recolectar_naranjas
  #
  class Trabajador
    # Atributo Naranjero para llevar la cuenta
    attr_reader :naranjero
    # Metodo para inicializar la tarea de recolectar
    def initialize(mutex, cv, naranjero)
      @mutex = mutex
      @cv = cv
      @naranjero = naranjero
    end

    #Metodo para recolectar naranjas y llevar los hilos
    def recolectar_naranjas
      recolector = Thread.new do
        until (@naranjero.edad == Naranjero::EDAD_MUERTE)
          sleep_time = rand(0..5)
          print "El recolector se va a dormir por un tiempo de #{sleep_time}\n"
          sleep(sleep_time)
          print "El recolector se despierta despues de haber dormido #{sleep_time}\n"
          @mutex.synchronize do
            @naranjero.recolectar_una
            print "El recolector espera pacientemente...\n"
            if @naranjero.edad < Naranjero::EDAD_MUERTE
              @cv.wait(@mutex)
            end
          end
        end
        print "Hilo del recolector terminando\n"
      end
      crecer_arbol = Thread.new do
        until (@naranjero.edad == Naranjero::EDAD_MUERTE)
          sleep_time = rand(0..5)
          print "El incremento de la edad se va a dormir por #{sleep_time}\n"
          sleep(sleep_time)
          print "El incremento de la edad se despierta despues de #{sleep_time}\n"
          @mutex.synchronize do
            @naranjero.uno_mas
            print "El incremento de la edad ha tenido efecto\n"
            @cv.signal
          end
        end
        print "El hilo de incremento de la edad se termina\n"
      end
      [recolector, crecer_arbol]
    end
  end
  trabajador = Trabajador.new(Mutex.new, ConditionVariable.new, Naranjero.new)
  threads = trabajador.recolectar_naranjas
  threads.each {|t| t.join}
