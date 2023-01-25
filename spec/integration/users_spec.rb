require 'swagger_helper'

describe 'Users' do
  path '/api/v1/users' do
    get 'List users' do
      tags 'Users'
      description 'List all users'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            email: { type: :string },
            password_digest: { type: :string },
            description: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          }
        run_test!
      end
    end
  end

  path '/api/v1/users' do
    post 'Create a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user,
        in: :body,
        description: 'Create a user',
        schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string },
            description: { type: :string }
          },
          required: %w[email password]
      }

      response '201', 'OK' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            email: { type: :string },
            password_digest: { type: :string },
            description: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          }
        run_test!
      end

      response '422', 'Unprocessable entity' do
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    get 'Show a user' do
      security [{ ApiKeyAuth: [] }]
      tags 'Users'
      description 'Show a user'
      produces 'application/json'

      parameter name: :id,
        in: :path,
        type: :integer,
        required: true,
        description: 'User identification'

      response '200', 'OK' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            email: { type: :string },
            password_digest: { type: :string },
            description: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          }
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end

      response '404', 'Not Found' do
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    put 'Updates a user' do
      security [{ ApiKeyAuth: [] }]
      tags 'Users'
      description 'Updates a user'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id,
        in: :path,
        type: :integer,
        required: true,
        description: 'User identification'

      parameter name: :user,
        in: :body,
        description: 'Updates a user',
        schema: {
          type: :object,
          properties: { 
            email: { type: :string },
            password: { type: :string },
            description: { type: :string }
          }
        }
      response '200', 'OK' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            email: { type: :string },
            password_digest: { type: :string },
            description: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          }
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end

      response '404', 'Not Found' do
        run_test!
      end

      response '422', 'Unprocessable entity' do
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    delete 'Delete a user' do
      security [{ ApiKeyAuth: [] }]
      tags 'Users'
      description 'Delete a user'
      produces 'application/json'

      parameter name: :id,
        in: :path,
        type: :integer,
        required: true,
        description: 'User identification'

      response '204', 'OK' do
        run_test!
      end

      response '404', 'Not Found' do
        run_test!
      end
    end
  end
end
