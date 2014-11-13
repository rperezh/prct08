Node = Struct.new(:value, :sig, :ant) do
  # Metodo para inicializar la clase
  def initialize (value, sig, ant)
    @value = value
    @sig = sig
    @ant = ant
  end

  # Metodo para mostrar por pantalla un nodo
  def to_s
    if @sig == nil && @ant == nil
      "#{@value} " 
    else 
      "#{@value} <-> " 
    end
  end
  
  # Funcion para obtener el valor de un nodo
  def dev_value
    return @value
  end

  # Funcion para obtener el puntero a siguiente de un nodo
  def dev_sig
    return @sig
  end

  # Funcion para obtener el puntero al anterior de un nodo
  def dev_ant
    return @ant
  end

  # Metodo para cambiar el puntero a siguiente de un nodo
  def mod_sig(sig)
    @sig = sig
  end

  # Metodo para cambiar el puntero al anterior de un nodo
  def mod_ant(ant)
    @ant = ant
  end
end

class List
  include Enumerable
  attr_accessor :head, :tail
  
  def each
    while @head != nil
      yield @head.dev_value
      @head = @head.dev_sig
    end  
  end

  # Metodo par inicializar la clase
  def initialize
    @head = nil
    @tail = nil
  end

  # Metodo para insertar un nodo al principio de la lista
  def ins_inicio(valor)
    if @head != nil && @head.dev_sig != nil
      n = @head
      @head = Node.new(valor, n, nil)
      n.mod_ant(@head)
    elsif @head != nil
      n = @head
      @head = Node.new(valor, n, nil)
      n.mod_ant(@head)
      @tail = n
    else
      @head = Node.new(valor, nil, nil)
      @tail = @head
    end
  end

  # Metodo para eliminar un nodo del principio de la lista
  def sup_inicio
    @head = @head.dev_sig
    if @head != nil
      @head.mod_ant(nil)
    end
  end
 
  # Metodo para insertar un nodo al final de la lista
  def ins_final(valor)
    if @tail != nil
      @tail = Node.new(valor, nil, @tail)
      n = @tail.dev_ant
      n.mod_sig(@tail)
    else
      @head = Node.new(valor, nil, nil)
      @tail = @head
    end
  end

  # Metodo para eliminar un nodo del final de la lista
  def sup_final
    @tail = @tail.dev_ant
    if @tail != nil
      @tail.mod_sig(nil)
    else
      @head = @tail
    end
  end
  
  # Metodo para representar por pantalla una lista enlazada
  def to_s
    s = "NIL <-> "
    if @head == nil
       s << "NIL"
    elsif @head.dev_sig == nil
      s << "#{@head.to_s}<-> NIL"
    else
      nodo = @head
      while nodo.dev_sig != nil 
        s << "#{nodo.to_s}"
        nodo = nodo.dev_sig
      end
      s << "#{nodo.to_s}"
      s << "NIL"
    end
    return s
  end

  # Metodo para obtener el numero de nodos de una lista
  def length 
    if @head == nil
      num = 0
    else
      n = @head
      num = 1
      while n.dev_sig != nil
        num += 1
        n = n.dev_sig
      end
    end
    num
  end
end 