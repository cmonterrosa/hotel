class ReservacionesController < ApplicationController
  def index
  
  end


  def list
    @reservaciones = Reservacion.find(:all)
  end


  def new_or_edit
    @reservacion = Reservacion.new
  end

  def save
    @reservacion = Reservacion.new(params[:reservacion])
    if @reservacion.save
      @reservacion.generar_folio_reservacion!
      flash[:notice] = "Reservación guardada correctamente con folio: #{@reservacion.numero_folio}"
      redirect_to :controller => "home"
    end
  end

  def show
    @reservacion = Reservacion.find(params[:id])
    @detalles = @reservacion.detalle_reservacions
  end



  def calendario
     @reservacion = Reservacion.new
     #@sesiones = Sesion.find(:all, :select=> ["s.*"], :joins => "s, horarios h", :conditions => ["s.horario_id=h.id"], :order => "s.fecha, h.hora,h.minutos")
     @reservaciones = DetalleReservacion.find(:all)
     @date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
     @title = "Reservaciones"
  end

  

  def daily_show
    if params[:year] =~ /^\d{4}$/ && params[:month] =~ /^\d{1,2}$/ && params[:day] =~ /^\d{1,2}$/
       @fecha = DateTime.parse("#{params[:year]}-#{params[:month]}-#{params[:day]}")
       @before = @fecha.yesterday
       @after = @fecha.tomorrow
       #@salas = Sala.find(:all, :order => "descripcion")
       #@horarios = Horario.find(:all, :group => "hora,minutos")
       @habitaciones = Habitacion.find(:all)
    else
      flash[:notice] = "Error"
      redirect_to :action => "home"
    end
  end

end
