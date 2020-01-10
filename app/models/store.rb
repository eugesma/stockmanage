class Store < ApplicationRecord
  include PgSearch::Model
  
  # Relations
  belongs_to :store_type
  has_many :store_users, inverse_of: :store
  has_many :users, :through => :store_users

  # Validations
  validates_presence_of :name, :cuit, :address

  # Delegations
  delegate :name, to: :store_type, prefix: true

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [ 
      :sorted_by,
      :search
    ]
  )
  
  # Scopes
  pg_search_scope :search,
    against: [:name],
    :using => { :tsearch => {:prefix => true} }, # Buscar coincidencia desde las primeras letras.
    :ignoring => :accents # Ignorar tildes.

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/s
      # Ordenamiento por fecha de creación
      order("stores.created_at #{ direction }")
    else
      # Si no existe la opcion de ordenamiento se levanta la excepcion
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_status
    [
      ['Todos', '', 'secondary'],
      ['Pendiente', 0, 'warning'],
      ['En proceso', 1, 'info'],
      ['Terminado', 2, 'primary'],
      ['Entregado', 3, 'success'],
    ]
  end
end
