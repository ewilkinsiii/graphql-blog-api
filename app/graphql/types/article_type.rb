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
end

class Types::ArticleInputType < GraphQL::Schema::InputObject
    graphql_name "ArticleInput"
    description "All the attributes for an article"

    argument :title, String, required: false
    argument :body, String, required: false
    argument :status, Types::StatusType, required: false
    argument :read, Int, required: false
    argument :category_id, ID, required: true
end

