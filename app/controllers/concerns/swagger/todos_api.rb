module Swagger::TodosApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/todos' do
      # index
      operation :get do
        key :summary, 'Gets all Todos.'
        key :description, 'Returns all todos.'
        key :operationId, :ListTodos
        key :tags, [
          'todo'
        ]

        # success response's definition.
        response 200 do
          key :description, 'todo list response.'
          schema type: :array do
            items do
              key :'$ref', :Todo
            end
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      # create
      operation :post do
        key :summary, 'Creates a Todo.'
        key :description, 'Creates a todo.'
        key :operationId, :CreateTodo
        key :tags, [
          'todo'
        ]

        # parameters.
        parameter do
          key :in, :body
          key :description, 'Todo to add to DB'
          key :required, true
          schema do
            key :'$ref', :Todo
          end
        end

        # success response's definition.
        response 200 do
          key :description, 'todo list response.'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end
    end

    swagger_path '/todos/{id}' do
      # show
      operation :get do
        key :summary, 'Find a Todo by ID'
        key :description, 'Returns a single todo.'
        key :operationId, :findTodoById
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID.'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response.'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      # update
      operation :put do
        key :summary, 'Updates the Todo.'
        key :description, 'Returns the updated todo.'
        key :operationId, :updateTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID.'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # parameters.
        parameter do
          key :in, :body
          key :description, 'Todo object.'
          key :required, true
          schema do
            key :'$ref', :Todo
          end
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response.'
          schema do
            key :'$ref', :Todo
          end
        end
        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      operation :patch do
        key :summary, 'Updates the Todo.'
        key :description, 'Returns the updated todo.'
        key :operationId, :updateTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID.'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # parameters.
        parameter do
          key :in, :body
          key :description, 'Todo object.'
          key :required, true
          schema do
            key :'$ref', :Todo
          end
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response.'
          schema do
            key :'$ref', :Todo
          end
        end
        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      # destroy
      operation :delete do
        key :summary, 'Delete the Todo.'
        key :description, 'return nothing.'
        key :operationId, :deleteTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end
        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end
    end

    # star
    swagger_path '/todos/{id}/star' do
      operation :put do
        key :summary, 'Stars the Todo.'
        key :description, 'Returns the starred todo.'
        key :operationId, :StarTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      operation :patch do
        key :summary, 'Stars the Todo.'
        key :description, 'Returns the starred todo.'
        key :operationId, :StarTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end
    end

    #unstar
    swagger_path '/todos/{id}/unstar' do
      operation :put do
        key :summary, 'Unstars the Todo.'
        key :description, 'Returns the unstarred todo.'
        key :operationId, :UnstarTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      operation :patch do
        key :summary, 'Unstars the Todo.'
        key :description, 'Returns the unstarred todos.'
        key :operationId, :UnstarTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end
    end

    # done
    swagger_path '/todos/{id}/done' do
      operation :put do
        key :summary, 'Done the Todo.'
        key :description, 'Returns the done todo.'
        key :operationId, :DoneTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      operation :patch do
        key :summary, 'Done the Todo.'
        key :description, 'Returns the done todo.'
        key :operationId, :DoneTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end
    end

    # undone
    swagger_path '/todos/{id}/undone' do
      operation :put do
        key :summary, 'Undone the Todo.'
        key :description, 'Returns the undone todo.'
        key :operationId, :UndoneTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end

      operation :patch do
        key :summary, 'Undone the Todo.'
        key :description, 'Returns the undone todos.'
        key :operationId, :UndoneTodo
        key :tags, [
          'todo'
        ]

        # id's definition.
        parameter name: :id do
          key :in, :path
          key :description, 'Todo ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # success response's definition.
        response 200 do
          key :description, 'todo response'
          schema do
            key :'$ref', :Todo
          end
        end

        # error response's definition
        response :error do
          key :description, 'return default rails error response.'
        end
      end
    end
  end
end