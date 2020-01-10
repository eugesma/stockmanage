class Client < ApplicationRecord
  include PgSearch::Model
  
  # Relations
  belongs_to :store

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
    against: [:fullname],
    :using => { :tsearch => {:prefix => true} }, # Buscar coincidencia desde las primeras letras.
    :ignoring => :accents # Ignorar tildes.

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/s
      # Ordenamiento por fecha de creación
      order("clients.created_at #{ direction }")
    else
      # Si no existe la opcion de ordenamiento se levanta la excepcion
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
end
