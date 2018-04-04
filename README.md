# todo-angular-practice

this repository is made for practice to create a simple todo application with angular.

before you start to practice, you need to install docker.

my example is in `front-example`.

detail process for practice is [here](https://github.com/kentana/todo-angular-practice/wiki/Guide).
Japanese guide is [here](https://github.com/kentana/todo-angular-practice/wiki/Guide.ja).

---

* Versions

  - Ruby: `2.5.1`
  - Rails: `5.1.6`
  - Angular: `5.2.9`

* How to build environment.

  1. fork this repository.
  2. clone your forked repository.
  3. execute docker build script.   
    `$ ./script/docker-build.sh`
  4. execute docker up script.   
    `$ ./script/docker-up.sh`
  5. you can access api in `localhost:3000` and example anuglar app in `localhost:4200`.

* How to build front example.

`this commands needs to change Dockerfile.`

  1. build front example.   
    `$ ./script/ng-build-example.sh`
  2. you can access front example in `http://localhost:3000/front-example/index.html`

* API docs

  API doc is [here](http://localhost:3000/swagger-ui/dist/index.html#/todo/CreateTodo).
  This doc needs api server. So before you read this doc, execute docker run script.

  ```
  $ ./script/docker-up.sh
  ```
