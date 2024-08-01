# Sports-Hub Application Back-End

## Project Description

This is a draft pet project for testing Generative AI on different software engineering tasks. It is planned to evolve and grow over time. Specifically, this repo will be a Ruby on Rails playground. As for now, we only have the React.js application as a front-end, but in the future, we plan to extend it to other technologies. The application's legend is based on the sports-hub application description from the following repo: [Sports-Hub](https://github.com/dark-side/sports-hub).

## Available Front-End applications
- [React.js](https://github.com/rtriska/reactjs_fe_genai_plgrnd)

## Dependencies

- Docker
- Docker Compose

The mentioned dependencies can be installed using the official documentation [here](https://docs.docker.com/compose/install/).

## Setup and Running the Application

### Clone the Repositories

To run the web application with the React front-end, clone the following repositories within the same folder:

```sh
git clone git@github.com:rtriska/ruby_be_genai_plgrnd.git
git clone git@github.com:rtriska/reactjs_fe_genai_plgrnd.git
```

### Run Docker Compose

Navigate to the back-end application directory and run:

```sh
docker compose up
```

### Attach to the Backend Container

Run `docker ps` and copy the `backend` application container ID. Then, connect to the container with the following command:

```sh
docker exec -ti <CONTAINER ID> /bin/bash
```

### Reset the Database

Inside the `backend` application container, run the following command to reset the database:

```sh
bundle exec rails db:reset
```

### Accessing the Application
To access the application in a browser locally, open the following URL - `http://localhost:3000/`

## License

Licensed under either of

- [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
- [MIT license](http://opensource.org/licenses/MIT)

Just to let you know, at your option.

## Contribution
Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in your work, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.

**Should you have any suggestions, please create an Issue for this repository**
