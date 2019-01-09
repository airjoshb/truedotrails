require "administrate/base_dashboard"

class ChallengeStepDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    attachment: Field::ActiveStorage,
    content: Field::HasOne,
    challenge: Field::BelongsTo,
    user_actions: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :content,
    :attachment,
    :challenge,
    :user_actions,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :content,
    :attachment,
    :challenge,
    :user_actions,
    :id,
    :title,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :challenge,
    :title,
    :content,
    :attachment,

  ].freeze

  # Overwrite this method to customize how challenge steps are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(challenge_step)
    challenge_step.title
  end
end
