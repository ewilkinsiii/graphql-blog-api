class Types::ArticleType < Types::BaseObject

  description "one article"
  field :id, ID, null: false
  field :title, String, null: false
  field :body, String, null: false
  field :status, Types::StatusType, null: false
  field :read, Int, null: true
  field :category, Types::CategoryType, null: false
  field :author, Types::UserType, null: false

  def author
    context[:current_user]
  end

  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
  end
end

class Types::ArticleInputType < GraphQL::Schema::InputObject
    graphql_name "ArticleInput"
    description "All the attributes needed to create/update an article"

    argument :id, ID, required: false
    argument :title, String, required: false
    argument :body, String, required: false
    argument :status, Types::StatusType, required: false
    argument :read, Int, required: false
    argument :category_id, ID, required: true
end

