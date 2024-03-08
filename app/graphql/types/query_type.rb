# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :login, String, null: true, description: "Login a user" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.find_by(email: email)&.authenticate(password)
         user.sessions.create.token
      end
    end

    field :current_user,  Types::UserType, null: true, description: "The currently logged in user"

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: true, description: "Logout the current user"

    def logout
      Session.find(context[:session_id]).destroy
    end

    field :article, Types::ArticleType, null: true, description: "Returns an article" do
      argument :id, ID, required: true, description: "ID of the article"
    end

    def article(id:)
      Article.find_by(id: id)
    end

    field :articles, [Types::ArticleType], null: false, description: "Returns a list of articles" 

    def articles
      Article.all.order(created_at: :desc)
    end

    field :article_by_category, [Types::ArticleType], null: true, description: "Returns all of the articles for a category" do
      argument :category_id, ID, required: true, description: "ID of the category"
    end

    def article_by_category(category_id:)
      Article.where(category_id: category_id, status: 'published').order(created_at: :desc)
    end

    field :my_articles, [Types::ArticleType], null: true, description: "Returns all of the articles for the current user"

    def my_articles()
      user = context[:current_user]
      Article.where(user_id: user.id).order(created_at: :desc)
    end

    field :categories, [Types::CategoryType], null: true, description: "Returns a category"

    def categories
      Category.all
    end
  end
end


