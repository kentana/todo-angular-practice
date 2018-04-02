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
  private _editing = false;

  get todo(): Todo { return this._todo; }
  get editing(): boolean { return this._editing; }

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
   * delete todo.
   */
  deleteTodo() {
    this.todoService.deleteTodo(this.todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * star todo.
   */
  starTodo() {
    this.todoService.starTodo(this.todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * unstar todo.
   */
  unstarTodo() {
    this.todoService.unstarTodo(this.todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * done todo.
   */
  doneTodo() {
    console.log('done todo');
    this.todoService.doneTodo(this.todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * undone todo.
   */
  undoneTodo() {
    this.todoService.undoneTodo(this.todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }

  /**
   * edit todo.
   */
  editTodo() {
    this._editing = true;
  }

  /**
  * save todo.
  */
  saveTodo() {
    this._editing = false;
    this.todoService.updateTodo(this.todo).subscribe((res) => {
      this.todoUpdate.emit();
    });
  }
}
