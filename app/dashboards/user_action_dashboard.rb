require "administrate/base_dashboard"

class UserActionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    challenge_step: Field::BelongsTo,
    approval: Field::HasOne,
    id: Field::Number,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    active: Field::Boolean,
    proof: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :challenge_step,
    :approval,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :challenge_step,
    :approval,
    :id,
    :start_date,
    :end_date,
    :active,
    :proof,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :challenge_step,
    :approval,
    :start_date,
    :end_date,
    :active,
    :proof,
  ].freeze

  # Overwrite this method to customize how user actions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user_action)
  #   "UserAction ##{user_action.id}"
  # end
end
