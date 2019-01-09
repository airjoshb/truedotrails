require "administrate/base_dashboard"

class ApprovalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    approvable: Field::Polymorphic,
    user_action: Field::BelongsTo,
    id: Field::Number,
    approved_at: Field::DateTime,
    notes: Field::Text,
    rejected_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :approvable,
    :user_action,
    :id,
    :approved_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :approvable,
    :user_action,
    :id,
    :approved_at,
    :notes,
    :rejected_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :approvable,
    :user_action,
    :approved_at,
    :notes,
    :rejected_at,
  ].freeze

  # Overwrite this method to customize how approvals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(approval)
  #   "Approval ##{approval.id}"
  # end
end
