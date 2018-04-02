import { Component, OnInit } from '@angular/core';

import { TodoService } from '../todo.service';
import { Todo } from '../todo';

@Component({
  selector: 'app-todos',
  templateUrl: './todos.component.html',
  styleUrls: ['./todos.component.css']
})
export class TodosComponent implements OnInit {
  todos: Todo[] = [];

  constructor(
    private todoService: TodoService,
  ) { }

  ngOnInit() {
    this.getTodos();
  }

  /**
   * get todos from api.
   * @returns void
   */
  getTodos(): void {
    this.todoService.getTodoes()
      .subscribe(todos => this.todos = todos);
  }

  /**
   * return undone todos.
   * @returns Todo
   */
  undoneTodos(): Todo[] {
    return this.todos.filter(i => !i.done);
  }

  /**
   * return starred undone todos.
   * @returns Todo
   */
  starrdTodos(): Todo[] {
    return this.undoneTodos().filter(i => i.star);
  }

  /**
   * return done todos.
   * @returns Todo
   */
  doneTodos(): Todo[] {
    return this.todos.filter(i => i.done);
  }

  /**
   * add an empty todo.
   * @returns void
   */
  addTodo(): void {
    this.todoService.addTodo(new Todo()).subscribe((res) => {
      this.getTodos();
    });
  }
}
