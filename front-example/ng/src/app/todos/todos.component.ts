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

  getTodos(): void {
    this.todoService.getTodoes()
      .subscribe(todos => this.todos = todos);
  }

  undoneTodos(): Todo[] {
    return this.todos.filter(i => !i.done);
  }

  starrdTodos(): Todo[] {
    return this.undoneTodos().filter(i => i.star);
  }

  doneTodos(): Todo[] {
    return this.todos.filter(i => i.done);
  }
}
