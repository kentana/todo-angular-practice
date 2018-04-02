import { Component, OnInit, Input } from '@angular/core';
import { Todo } from '../todo';
import { TodoService } from '../todo.service';

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.css']
})
export class TodoComponent implements OnInit {
  private _todo: Todo;

  get todo(): Todo { return this._todo; }

  @Input()
  set todo(todo: Todo) {
    this._todo = todo;
  }

  constructor(
    private todoService: TodoService,
  ) { }

  ngOnInit() {
  }

  starTodo() { }
  unstarTodo() { }
  doneTodo() { }
  undoneTodo() { }
}
