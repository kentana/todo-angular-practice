import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
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

  @Output() todoUpdate = new EventEmitter();

  constructor(
    private todoService: TodoService,
  ) { }

  ngOnInit() {
  }

  /**
   * delete given todo.
   * @param  {Todo} todo
   */
  deleteTodo(todo: Todo) {
    this.todoService.deleteTodo(todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * star given todo.
   * @param  {Todo} todo
   */
  starTodo(todo: Todo) {
    this.todoService.starTodo(todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * unstar given todo.
   * @param  {Todo} todo
   */
  unstarTodo(todo: Todo) {
    this.todoService.unstarTodo(todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * done given todo.
   * @param  {Todo} todo
   */
  doneTodo(todo: Todo) {
    console.log('done todo');
    this.todoService.doneTodo(todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * undone given todo.
   * @param  {Todo} todo
   */
  undoneTodo(todo: Todo) {
    this.todoService.undoneTodo(todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }
}
