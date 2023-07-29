require 'administrate/base_dashboard'

class ResourceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    content: Field::BelongsTo,
    file: Field::ActiveStorage,
    # file_attachment: Field::HasOne,
    # file_blob: Field::HasOne,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    content
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    content
    name
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    content
    file
    name
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
