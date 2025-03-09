Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "http://localhost:3000", "http://127.0.0.1:3000",
              "http://localhost:3001", "http://localhost:3002",
              "http://0.0.0.0:3001", "http://0.0.0.0:3002", 
              "http://0.0.0.0:4200", "http://localhost:4200",
              "http://127.0.0.1:4200"

  
      resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end